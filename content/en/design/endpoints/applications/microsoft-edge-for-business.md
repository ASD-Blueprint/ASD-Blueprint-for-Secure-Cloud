---
title: "Microsoft Edge for Business"
weight: 05
description: "This section describes the design decisions associated with Microsoft Edge for Business according to guidance in ASD's Blueprint for Secure Cloud."
---

The web browser is a foundational component of the modern managed endpoint, serving as a primary interface for productivity, collaboration, and access to external content. As more applications transition to web-based models and installed apps embed browser engines for consistency and security, its role as a critical control plane for endpoint security continues to grow.

Microsoft Edge becomes [Edge for Business](https://learn.microsoft.com/en-au/deployedge) when a user signs in with an Entra ID account, enabling enterprise management, policy enforcement, and security capabilities within the standard browser. Effective governance in this state helps ensure a strong security posture, maintains operational health through timely updates, and delivers a consistent user experience.

For all corporate-managed devices, [Microsoft Intune](https://learn.microsoft.com/en-au/intune/intune-service/fundamentals/what-is-intune) serves as the authoritative platform for enforcing these standards, integrating browser management into a unified endpoint security strategy. This is complemented by the [Microsoft Edge management service](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-management-service), providing additional capabilities such as control over newer features, extension lifecycle management, and enhanced reporting.

{{% alert title="Secondary browsers" color="info" %}}

Installing multiple types of browsers in a corporate environment can sometimes unnecessarily increase the attack surface while complicating the consistent enforcement of security policies and patch management. Unless maintained as a deliberate, risk-assessed decision with equivalent hardening applied, secondary browsers often become the weakest link and the entry point for a security breach. This risk can be further amplified when these browsers are used by privileged users such as developers and administrators, creating a high-value entry point for attackers.

{{% /alert %}}

{{% alert title="Non-Windows platforms" color="info" %}}

This guidance targets Windows endpoints managed through Intune. Where policies referenced in this document are not supported on macOS, Android, or iOS, alternative controls or compensating measures may be required if those platforms are in scope.

{{% /alert %}}

**_Table of Contents_**

- [Deployment and updates](#deployment-and-updates)
  - [Update management](#update-management)
- [Policy assignment and enforcement](#policy-assignment-and-enforcement)
- [Security configurations and hardening](#security-configurations-and-hardening)
  - [Security baseline considerations](#security-baseline-considerations)
  - [Developer and debugging controls](#developer-and-debugging-controls)
  - [Browser integrity protections](#browser-integrity-protections)
  - [Enhanced Security Mode](#enhanced-security-mode)
    - [Dynamic code restrictions](#dynamic-code-restrictions)
  - [Microsoft Defender SmartScreen](#microsoft-defender-smartscreen)
    - [Scareware Blocker](#scareware-blocker)
    - [Download security](#download-security)
  - [Network and transport security](#network-and-transport-security)
    - [DNS Security](#dns-security)
  - [Local Network Access restrictions](#local-network-access-restrictions)
- [Extension policy](#extension-policy)
- [Profiles](#profiles)
  - [Profile sign-in](#profile-sign-in)
    - [Establishing a corporate profile](#establishing-a-corporate-profile)
    - [Restricting sign in](#restricting-sign-in)
    - [Sign-in policy controls reference](#sign-in-policy-controls-reference)
  - [Single sign-on (SSO)](#single-sign-on-sso)
    - [Web-session SSO](#web-session-sso)
    - [PRT-based SSO](#prt-based-sso)
- [Multi-tenant access](#multi-tenant-access)
  - [Tenant categories](#tenant-categories)
  - [Secondary tenant sign-in on a primary device](#secondary-tenant-sign-in-on-a-primary-device)
  - [Legitimate multi-tenant use cases](#legitimate-multi-tenant-use-cases)
  - [Isolation options](#isolation-options)
  - [Entra ID Tenant Restrictions v2 (TRv2)](#entra-id-tenant-restrictions-v2-trv2)
- [Enterprise sync](#enterprise-sync)
  - [Sync as an exfiltration risk](#sync-as-an-exfiltration-risk)
- [Guest mode and InPrivate browsing](#guest-mode-and-inprivate-browsing)
  - [Guest mode](#guest-mode)
  - [InPrivate browsing](#inprivate-browsing)
- [Session persistence and exit behaviour](#session-persistence-and-exit-behaviour)
- [Edge password manager](#edge-password-manager)
  - [Broader credential management considerations](#broader-credential-management-considerations)
  - [Passkey support](#passkey-support)
- [User experience and compatibility](#user-experience-and-compatibility)
- [The Edge sidebar](#the-edge-sidebar)
- [Feature minimisation and interface reduction](#feature-minimisation-and-interface-reduction)
- [Using the Edge management service](#using-the-edge-management-service)
  - [Management service policy coexistence with Intune](#management-service-policy-coexistence-with-intune)
- [Diagnostic data and telemetry](#diagnostic-data-and-telemetry)
- [Edge WebView2](#edge-webview2)
- [Privileged user considerations](#privileged-user-considerations)
- [Related information](#related-information)
  - [Security and governance](#security-and-governance)
  - [Design](#design)
  - [Configuration](#configuration)
  - [References](#references)

### Deployment and updates

A standardised deployment pattern and a regular update cadence are foundational to maintaining a secure and stable browser environment.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                                                                              | Design decision                                                                                                               | Justification                                                                              |
| :------------------------------------------------------------------------------------------ | :---------------------------------------------------------------------------------------------------------------------------- | :----------------------------------------------------------------------------------------- |
| Policy enforcement method                                                                   | Use Intune for all foundational configuration deployments                                                                     | Provides a central, scalable, and consistent method for policy enforcement                 |
| Default browser                                                                             | Enforce Edge as the default browser                                                                                           | Ensures all web traffic is handled by a centrally managed and secure browser               |
| Application deployment                                                                      | Deploy Edge as a required application via Intune                                                                              | Guarantees Edge is present on devices and helps remediate accidental removal or corruption |
| [Edge update channel](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-channels) | Use the _Stable Channel_, with a 2-week release cycle, or _Extended Stable Channel_<sup>1</sup>, with an 8-week release cycle | Balances the timely deployment of security patches with feature stability                  |

1: Where a documented risk acceptance against ISM-1467 exists.

{{% /alert %}}

#### Update management

An effective strategy for managing Edge updates is to use the native auto-update engine, which helps ensure security patches are applied promptly, aligning with [_Information Security Manual_](https://www.cyber.gov.au/business-government/asds-cyber-security-frameworks/ism) (ISM) guidance to mitigate vulnerabilities in a timeframe commensurate with their exploitation risk.

While immediate auto‑updates are fastest, alternative strategies may be used to manage operational risk:

- Update rings offer a controlled, automated alternative by using different release channels to create a phased rollout across user groups.
- For environments with strict stability requirements, such as those supporting legacy web applications, target version pinning locks clients to a specific, validated release. However, this approach significantly increases administrative overhead and can delay the deployment of security patches (affecting ISM-1467).

{{% alert title="Design decisions" color="warning" %}}

| Decision point      | Design decision                                                     | Justification                                                                                                             |
| :------------------ | :------------------------------------------------------------------ | :------------------------------------------------------------------------------------------------------------------------ |
| Update enforcement  | Configure automatic silent updates with an hourly check frequency   | Guarantees the timely mitigation of vulnerabilities by removing user dependencies and minimising the window of exposure   |
| Restart enforcement | Enforce a browser restart within 24 hours of an update being staged | Prevents indefinite deferral of browser restarts, guaranteeing that downloaded updates are deployed within a fixed window |

{{% /alert %}}

### Policy assignment and enforcement

Intune allows policies to be assigned to either user groups or device groups, while Edge management service configuration policies can only be assigned to user groups. For Edge, that choice affects whether a setting follows users across devices (user-scoped) or applies to the endpoint regardless of who's signed in (device-scoped). User-scoped policies apply to all Edge profiles for the targeted user on a device, which is distinct from per-profile policies delivered by the Edge management service that apply only to the signed-in profile.

To minimise bypass opportunities and maintain browser integrity on managed endpoints, security-critical Edge controls should be assigned to device groups wherever practical. This includes settings such as [Enhanced Security Mode](#enhanced-security-mode), [extension policy](#extension-policy), and [update enforcement](#update-management). User-scoped assignment is appropriate for personalisation and other settings where consistent endpoint protection is not dependent on the signed-in identity.

Where both device-scoped and user-scoped policies configure the same Edge setting differently, Intune does not apply the most restrictive setting. [Conflicts are reported for manual resolution](https://learn.microsoft.com/en-au/intune/device-configuration/troubleshoot-device-profiles#compliance-and-device-configuration-policies-that-conflict), and for Settings Catalog settings available in both scopes, [the user-scoped setting takes precedence](https://learn.microsoft.com/en-au/intune/device-configuration/settings-catalog#scope-assignment-behavior).

{{% alert title="Design decisions" color="warning" %}}

| Decision point        | Design decision                                                                                                         | Justification                                                                  |
| :-------------------- | :---------------------------------------------------------------------------------------------------------------------- | :----------------------------------------------------------------------------- |
| Security policy scope | Prioritise device-scoped enforcement for security-critical settings, while applying user-scoped controls where required | Ensures protections persist across all identity contexts, reducing bypass risk |

{{% /alert %}}

{{% alert title="Policy naming" color="info" %}}

Policy names in this guidance refer to canonical Microsoft policy names as used in [official policy references](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-policies). Display labels may differ between Intune and the Edge management service.

{{% /alert %}}

### Security configurations and hardening

Security for Edge is applied in layers, starting with the foundational [Intune security baseline for Microsoft Edge](/configuration/intune/endpoint-security/security-baselines/security-baseline-for-microsoft-edge). This baseline implements Microsoft's recommended security posture, which serves as a managed starting point for hardening. It is complemented by the [ASD Edge hardening configuration policy](/configuration/intune/devices/configuration-policies/asd-edge-hardening) for alignment with the principles of the [_ISM_](https://www.cyber.gov.au/business-government/asds-cyber-security-frameworks/ism).

In practice, this baseline can be adapted to operational needs and strengthened with additional settings that reflect specific risk contexts, as well as selected controls from globally recognised guidance such as the [CIS Benchmark for Microsoft Web Browsers](https://www.cisecurity.org/benchmark/microsoft_internet_explorer).

{{% alert title="Design decisions" color="warning" %}}

| Decision point            | Design decision                                                                                                                                                                                                                                     | Justification                                                                                                                                        |
| :------------------------ | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------- |
| Default security baseline | Apply the latest [Intune Security baseline for Microsoft Edge](/configuration/intune/endpoint-security/security-baselines/security-baseline-for-microsoft-edge) as the foundational configuration layer                                             | Establishes a supported secure state and ensures all core protection features are enabled by default                                                 |
| Augmented hardening       | Deploy the [ASD Edge hardening configuration policy](/configuration/intune/devices/configuration-policies/asd-edge-hardening) settings to all managed endpoints, ensuring both device-scoped and user-scoped settings are applied where appropriate | Enforces granular controls included in ASD hardening recommendations and other better practice configurations that are not addressed by the baseline |

{{% /alert %}}

#### Security baseline considerations

While the Intune security baselines provide a good foundation, they can be insufficient for comprehensive protection and are limited:

- The Intune baselines are updated less frequently than the browser itself, missing new security features.
- The Intune baselines only cover core security capabilities, omitting advanced and more nuanced configurations.

The [Intune Settings Catalog](https://learn.microsoft.com/en-au/intune/device-configuration/settings-catalog) is the primary method for applying Edge configuration policies on managed endpoints. For scenarios where Intune is not used or additional capabilities are required, see [Using the Edge management service](#using-the-edge-management-service).

The Microsoft Security Community Blog publishes [security baseline reviews](https://techcommunity.microsoft.com/category/security-baselines/blog/microsoft-security-baselines/) for each Edge release that can help identify and understand newly introduced or modified security configurations.

#### Developer and debugging controls

Browser developer tools and remote debugging interfaces expose internal browser state, including network traffic, local storage, DOM content, and JavaScript execution contexts. On managed endpoints for regular users, these capabilities represent an unnecessary attack surface.

{{% alert title="Design decisions" color="warning" %}}

| Decision point   | Design decision                           | Justification                                                                                                                                     |
| :--------------- | :---------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------ |
| Developer tools  | Disable developer tools for regular users | Prevents access to browser internals that could be used to inspect sensitive page content, extract session tokens, or bypass client-side controls |
| Remote debugging | Disable remote debugging                  | Prevents external processes from attaching to the browser to inspect or manipulate runtime state                                                  |

{{% /alert %}}

Privileged users such as developers may require access to developer tools. This should be managed through a separate, targeted policy with appropriate risk acceptance, consistent with the approach described in [Privileged user considerations](#privileged-user-considerations).

#### Browser integrity protections

Browser integrity can be undermined through user modification of experimental settings, capture of browsing data or debugger attachment through internal diagnostic pages, introduction of unmanaged browser data, or attempts by other processes to extract stored cookies or credentials.

{{% alert title="Design decisions" color="warning" %}}

| Decision point               | Design decision                                                                                                                                                                                                 | Justification                                                                                                 |
| :--------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------ |
| Configuration integrity      | Prevent users from overriding feature flags, and block the internal diagnostic pages that provide debugging and data capture capability                                                                         | Prevents users from modifying experimental settings, capturing browsing data to disk, or attaching a debugger |
| Application Bound Encryption | Enable [Application Bound Encryption](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-browser-policies/applicationboundencryptionenabled) for local data storage, including cookies and credentials | Prevents other processes from decrypting browser-stored secrets                                               |
| Browser data import          | Disable importing of cookies and saved passwords from other browsers                                                                                                                                            | Prevents unmanaged credentials and session data from being introduced into the corporate browser profile      |

{{% /alert %}}

#### Enhanced Security Mode

Edge's [Enhanced Security Mode (ESM)](https://microsoftedge.github.io/edgevr/posts/Introducing-Enhanced-Security-for-Microsoft-Edge) hardens Edge by changing core execution and mitigation settings to reduce exposure to common web-exploit techniques. It disables the Just-in-Time (JIT) JavaScript compiler and applies a more restrictive execution model that can also affect how high-performance web features (including WebAssembly) run, trading some compatibility and performance for a smaller attack surface. This enables ESM to turn on exploit mitigations that are otherwise difficult to combine with performance-oriented execution, including Arbitrary Code Guard (ACG) and hardware-enforced Control-flow Enforcement Technology (CET).

While this provides a significant security uplift, it can also degrade performance or compatibility for some modern interactive websites, including business-critical web applications.

ESM's _Balanced mode_ is an adaptive configuration, but may not be reliable on its own for corporate use. In Balanced mode, Edge [relaxes protections](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-security-browse-safer) for frequently visited sites, which effectively inverts the threat model, where the most frequently visited and potentially highest‑value sites are afforded the least protection.

An approach to manage this is to enable Balanced mode globally but augment it with granular exceptions: defining a _bypass list_ for trusted domains that require JIT compilation, and an _enforce list_ to enforce strict protections on specified high-risk domains.

Effective implementation typically requires formal governance over bypass lists, including documented risk acceptance, strict minimisation and regular review of entries, and prioritising mitigating controls for web applications subject to reduced security protections. This may include more frequent patching by the application owner and compensating endpoint protections.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                    | Design decision                                                                               | Justification                                                                                             |
| :-------------------------------- | :-------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------- |
| ESM setting                       | Enable ESM in Balanced mode for all users as the default                                      | Establishes a secure by default posture, hardening Edge against exploits on unknown or untrusted websites |
| ESM browser performance           | Maintain a bypass list of trusted web applications where ESM can be disabled                  | Guarantees that essential web applications are always performant and responsive                           |
| ESM and access to high-risk sites | Maintain an enforce list of high-risk web applications where ESM Strict mode will be enforced | Applies the strongest protection for access to the most sensitive web applications                        |

{{% /alert %}}

##### Dynamic code restrictions

Enhanced Security Mode applies Arbitrary Code Guard (ACG) to renderer processes and tabs, covering the primary attack surface for code injection. Extending ACG to the browser process provides a supplementary defence-in-depth measure, and the [Intune security baseline for Microsoft Edge](/configuration/intune/endpoint-security/security-baselines/security-baseline-for-microsoft-edge) applies this restriction by default.

[Microsoft Defender Exploit Protection](https://learn.microsoft.com/en-au/defender-endpoint/exploit-protection) can also apply ACG, but does so to every Edge process rather than the browser process alone, which is not compatible with the just-in-time compilation that renderer processes rely on outside ESM. It can provide some value via audit mode, which reports dynamic code allocation attempts without enforcing, alongside centralised administration of other exploit mitigations.

{{% alert title="Design decisions" color="warning" %}}

| Decision point            | Design decision                                                                                                        | Justification                                                                                                                                  |
| :------------------------ | :--------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------- |
| Dynamic code restrictions | Retain the security baseline's restriction on dynamic code and apply Exploit Protection ACG to Edge in audit mode only | Extends code-injection protection beyond renderer processes to the browser process, with audit visibility and without breaking JIT compilation |

{{% /alert %}}

#### Microsoft Defender SmartScreen

[Microsoft Defender SmartScreen](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-security-smartscreen) provides real-time, cloud-based reputation checking for sites and downloads within the browser. It draws on signals from the Microsoft Intelligent Security Graph to identify and block known phishing pages, malware distribution sites, and malicious or low-reputation downloads before they reach users.

Preventing users from bypassing SmartScreen warnings is important, as users can dismiss both site and download warnings by default, undermining SmartScreen’s protective value. Related protections, such as potentially unwanted application (PUA) blocking, should also be enabled, further extending SmartScreen’s coverage by intercepting downloads associated with adware, bundlers, and other unwanted software.

SmartScreen sends URL information and download metadata to Microsoft’s cloud reputation service. Where sensitive information is handled, internal domains may be assessed for exclusion, and existing network‑level web security controls considered to reduce the need for browser‑to‑cloud URL checks on internal traffic.

Where SmartScreen checks cause false positives or performance issues for trusted internal domains or web applications, a targeted exception can be defined rather than broadly weakening SmartScreen protections.

Note, on endpoints onboarded to Microsoft Defender for Endpoint, SmartScreen and typo protection exceptions are managed as URL and domain indicators in the Defender portal. The browser allowlist policy is [ignored on those endpoints](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-browser-policies/smartscreenallowlistdomains) and applies only to devices that are not onboarded.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                    | Design decision                                                                                       | Justification                                                                                                              |
| :-------------------------------- | :---------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------- |
| SmartScreen                       | Enable SmartScreen                                                                                    | Provides reputation checking for sites and downloads as a core layer of web threat protection                              |
| SmartScreen bypass for sites      | Prevent users from bypassing SmartScreen site warnings                                                | Reduces the risk of users dismissing legitimate warnings due to urgency, habit, or social engineering                      |
| SmartScreen bypass for downloads  | Prevent users from bypassing SmartScreen download warnings                                            | Prevents users from overriding download blocks for files with known malicious or low-reputation signatures                 |
| Potentially unwanted applications | Enable PUA blocking                                                                                   | Intercepts downloads matching patterns that are not classified as outright malware                                         |
| Downloads from trusted sources    | Require SmartScreen checks on downloads from trusted sources                                          | Ensures trusted sources are not exempt from reputation checks                                                              |
| SmartScreen domain exceptions     | Maintain an allowlist of trusted domains exempt from SmartScreen checks where operationally justified | Provides a controlled mechanism for trusted applications that trigger false positives, without broadly reducing protection |
| SmartScreen DNS requests          | Allow SmartScreen to perform its own DNS resolution                                                   | Enables SmartScreen's IP-based reputation checks                                                                           |
| Typosquatting protection          | Enable website typo protection                                                                        | Warns users when a URL closely resembles a legitimate site                                                                 |
| Typosquatting bypass              | Prevent users from bypassing website typo protection warnings                                         | Reduces the risk of users dismissing legitimate warnings due to urgency, habit, or social engineering                      |

{{% /alert %}}

##### Scareware Blocker

Edge's [Scareware Blocker](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-browser-policies/scarewareblockerprotectionenabled) uses a local machine learning model to detect and block tech support scam pages in real time. Scareware pages typically use the browser's fullscreen API to take over the display, mimicking system-scoped alerts to create panic. The on-device model analyses these fullscreen page characteristics to identify scareware patterns without sending page content to the cloud. When a scam is detected, Edge exits the attacker-initiated fullscreen, stops any audio playback, and alerts the user, with the option to report the site to SmartScreen for broader protection.

This complements SmartScreen's URL reputation system, which blocks known-bad sites reactively, while the Scareware Blocker provides behavioural detection of novel scam pages that have not yet been catalogued.

While detection runs on‑device with no data sent to Microsoft, automatic SmartScreen reporting transmits URL data for detected pages to Microsoft after detection, including false positives. Where sensitive internal web applications are involved, an allowlist of domains excluded from Scareware Blocker analysis prevents inadvertent disclosure of internal URL data.

{{% alert title="Design decisions" color="warning" %}}

| Decision point      | Design decision                                                            | Justification                                             |
| :------------------ | :------------------------------------------------------------------------- | :-------------------------------------------------------- |
| Scareware detection | Enable Scareware Blocker with automatic blocking and SmartScreen reporting | Provides behavioural detection of tech support scam pages |

{{% /alert %}}

##### Download security

Download controls extend SmartScreen by combining reputation-based blocking with file-type restrictions, addressing risks that reputation checks alone do not cover. Insecure download warnings operate independently, flagging potentially dangerous content delivered over unencrypted connections regardless of reputation outcome. Where installed applications or internal systems trigger downloads via the browser, narrowly scoped exceptions may be required.

{{% alert title="Design decisions" color="warning" %}}

| Decision point             | Design decision                                                                         | Justification                                                                                                                      |
| :------------------------- | :-------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------- |
| Download restrictions      | Block potentially dangerous or unwanted downloads and dangerous file types              | Blocks downloads flagged as malicious or potentially unwanted, and restricts dangerous file types regardless of reputation outcome |
| Insecure download warnings | Enable warnings for potentially dangerous downloads initiated over insecure connections | Warns when file integrity cannot be assured in transit                                                                             |

{{% /alert %}}

#### Network and transport security

Transport security settings define the minimum cryptographic standards used to protect data in transit and to preserve the integrity of browser‑mediated connections. Weak transport controls expose users to downgrade attacks, certificate misuse, and content injection, while habituation to certificate warnings undermines the value of encrypted sessions.

ISM‑1139 recommends the exclusive use of the latest TLS version, currently TLS 1.3. Edge negotiates TLS 1.3 by default wherever servers support it, with a fixed minimum of TLS 1.2 that cannot be modified.

Edge enables hybrid post-quantum key agreement by default, consistent with ISM-1996. A policy setting can preference stronger algorithms aligned with the US National Security Agency's [Commercial National Security Algorithm Suite (CNSA) 2.0](https://media.defense.gov/2025/May/30/2003728741/-1/-1/0/CSA_CNSA_2.0_ALGORITHMS.PDF) and the ISM's preference for ML-KEM-1024 for session key establishment (ISM-1995). However, enabling this setting may affect connection performance or compatibility with TLS inspection infrastructure and should be considered as part of a post-quantum cryptography transition plan (ISM-2073).

{{% alert title="Design decisions" color="warning" %}}

| Decision point             | Design decision                                              | Justification                                                                                                     |
| :------------------------- | :----------------------------------------------------------- | :---------------------------------------------------------------------------------------------------------------- |
| Post-quantum key agreement | Consider preferring quantum-safe algorithms                  | Reduces exposure to future cryptographic threats                                                                  |
| HTTPS warning bypass       | Prevent users from proceeding past certificate warning pages | Removes the ability for users to dismiss legitimate certificate errors                                            |
| Mixed content              | Block all blockable mixed content with no site exceptions    | Prevents insecure HTTP resources from loading within HTTPS pages, maintaining the integrity of encrypted sessions |

{{% /alert %}}

##### DNS Security

Name resolution is a related dependency for secure connectivity, but DNS security is typically managed at the operating system, VPN, or network layer rather than within the browser itself. Browser‑level DNS features, such as DNS-over-HTTPS (DoH), should therefore align with, and not bypass, corporate‑managed DNS configuration and monitoring.

By default, Edge tests for DNS hijacking by attempting to resolve and connect to non-existent hostnames at startup and on each DNS configuration change, to detect networks that redirect failed lookups. Corporate-managed DNS returns genuine responses for non-existent names, so this redirection does not occur and the probes serve no purpose. These lookups also resemble the domain lookups malware uses to reach its command-and-control servers and add noise to SIEM logs.

{{% alert title="Design decisions" color="warning" %}}

| Decision point          | Design decision                                                              | Justification                                                                       |
| :---------------------- | :--------------------------------------------------------------------------- | :---------------------------------------------------------------------------------- |
| DNS-over-HTTPS          | Disable DNS-over-HTTPS within the browser                                    | Ensures name resolution follows corporate-managed DNS                               |
| DNS interception checks | Disable DNS interception probes while retaining intranet address suggestions | Removes noisy probe traffic while retaining legitimate intranet address suggestions |

{{% /alert %}}

#### Local Network Access restrictions

[Local Network Access (LNA)](https://learn.microsoft.com/en-au/deployedge/ms-edge-local-network-access) restrictions prevent web content from initiating connections to endpoints on the local network (private and loopback address ranges, and `.local` names). This helps mitigate attacks where a malicious or compromised website uses the browser to obtain indirect access to internal services that are not directly internet‑accessible, effectively bypassing network segmentation.

By default LNA prompts the user to allow or deny a site's first local network request. Websites that legitimately require access to local endpoints, such as intranet applications that interact with on‑premises services or internal APIs, require the requesting site (origin) to be explicitly permitted.

Consistent with other Edge policy governance models, LNA uses an origin-based allow/deny lists to manage exceptions. `LocalNetworkAllowedForUrls` permits specified origins to access local network resources, while `LocalNetworkBlockedForUrls` provides explicit deny entries that take precedence. Loopback access is governed by a separate pair of allow and deny lists. These lists should be maintained under the same change control and risk acceptance processes applied to other browser exception lists, including documented justification, periodic review, and strict minimisation of entries.

{{% alert title="Design decisions" color="warning" %}}

| Decision point           | Design decision                                                              | Justification                                                                                                        |
| :----------------------- | :--------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------- |
| Local Network Access     | Block local network requests for all origins                                 | Helps prevent web content from accessing internal network services via the browser, reinforcing network segmentation |
| LNA exception governance | Maintain an allowlist of origins permitted to access local network endpoints | Ensures only approved web applications can reach internal services, with auditable risk acceptance                   |

{{% /alert %}}

### Extension policy

Extensions serve a dual role in browser security: while unvetted extensions are a recognised risk, mandated extensions (such as content filters, endpoint data loss prevention (DLP) agents, and security monitoring tools) form a core part of the Edge's security control surface.

A deny-all, permit-by-exception policy establishes a defensible and auditable model for [managing Edge's third-party add-ons](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-manage-extensions). Beyond controlling which extensions can be installed, `ExtensionSettings` can constrain the runtime permissions of approved extensions, such as restricting host access or blocking sensitive permission requests.

Intune deploys and enforces the extension policy (the allow, block, and force-install lists) on all managed devices. The Edge management service complements this by providing the extension request and approval workflow, the master inventory of vetted extensions, and reporting on installed extensions across managed profiles.

[InPrivate browsing](#inprivate-browsing) and [Guest mode](#guest-mode) each cover how extensions behave in those contexts.

{{% alert title="Design decisions" color="warning" %}}

| Decision point        | Design decision                                                                           | Justification                                                                                                          |
| :-------------------- | :---------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------- |
| Extension policy      | Block all extensions by default                                                           | Mitigates risks from unvetted third-party add-ons                                                                      |
| Approved extensions   | Maintain an explicit allowlist of approved extensions that users are permitted to install | Provides users with access to tools while ensuring third-party add-ons are vetted for security risks before deployment |
| Mandatory extensions  | Force-install essential extensions                                                        | Ensures consistent application of tools without relying on user action                                                 |
| Extension requests    | Enable extension request workflows for users to request new extensions                    | Provides a mechanism for users to request tools and for administrators to perform a risk assessment before approval    |
| Extension permissions | Scope runtime permissions of approved extensions using `ExtensionSettings`                | Limits the access granted to approved extensions, reducing the impact of a compromised or malicious update             |

{{% /alert %}}

### Profiles

An Edge profile is a logical container that isolates browser data to create distinct browsing contexts within a single browser installation. Each profile maintains its own cookies, cache, history, and other browsing data.

On devices where Edge uses the Windows sign-in for automatic browser sign-in, the corporate account typically becomes the default Edge profile. Users can then create additional profiles (_secondary profiles_) on the same device. Those profiles may be local-only, signed in with another corporate account in the same Entra ID tenant, or, if policy permits, signed in with an identity from a different tenant (a _secondary tenant identity_). Each profile choice affects sign-in behaviour, data separation, and which policies take effect.

A profile is an organisational boundary. It separates browsing data but does not provide strong isolation, so it should not be relied on as a security boundary. If an attacker breaks out of the browser's normal security boundaries, they may be able to access data from other profiles (or the broader endpoint and apps) running under the same Windows logon session. Choices about which profiles are allowed, and which identities may sign in to them, influence security outcomes as much as usability.

{{% alert title="Design decisions" color="warning" %}}

| Decision point   | Design decision                                                                                                      | Justification                                                                                                                                                             |
| :--------------- | :------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Profile creation | Permit secondary profile creation, governed by [sign-in](#profile-sign-in) and [sync](#enterprise-sync) restrictions | Allows users to maintain separate browsing contexts (for example, for [multi-tenant access](#multi-tenant-access)) while ensuring identity and data controls are enforced |

{{% /alert %}}

#### Profile sign-in

Signing in to an Edge profile binds an identity to that profile, enabling account-related services beyond simple website authentication. These include [Primary Refresh Token (PRT)-based single sign-on (SSO)](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-security-identity#browser-to-web-single-sign-on-sso), Conditional Access compliance signalling, enterprise sync eligibility, enterprise search scope, and Edge management service policy evaluation scoped to the signed-in account.

Profile sign-in and account eligibility are controlled through four Edge identity policies: ([`BrowserSignin`](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-browser-policies/browsersignin), [`ImplicitSignInEnabled`](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-browser-policies/implicitsigninenabled), [`NonRemovableProfileEnabled`](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-browser-policies/nonremovableprofileenabled), and [`RestrictSigninToPattern`](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-browser-policies/restrictsignintopattern)); these settings are device-scoped (not per-profile), so configuring them once applies uniformly across the primary profile and all secondary profiles on the device

##### Establishing a corporate profile

When multiple accounts are signed in across profiles, Edge management service policies are enforced based on the primary signed-in account in Edge, and only policies for that account are applied. Without policy constraints, the primary account may differ from a device’s corporate account.

On Entra ID-joined or hybrid-joined devices, `NonRemovableProfileEnabled` mitigates this by ensuring a signed-in corporate profile always exists. It creates a profile using the Windows sign-in account at first launch and prevents a user from signing out of or removing it, maintaining a persistent corporate profile even when additional profiles are added.

`NonRemovableProfileEnabled` depends on two pre-conditions:

- `BrowserSignin` is set to Enable (1) or Force (2). This policy controls whether users can sign in to Edge. If set to Disable (0), browser sign-in is blocked and `NonRemovableProfileEnabled` does not take effect.
- `ImplicitSignInEnabled` remains enabled (default). This policy controls whether Edge performs implicit sign-in from the Windows sign-in account. If disabled, implicit sign-in is blocked and no non-removable corporate profile is created automatically.

With `BrowserSignin` set to Enable (1), a user can sign in to Edge, and the non-removable profile anchors a persistent corporate profile that cannot be removed or signed out. `RestrictSigninToPattern` complements this by restricting sign-in to accounts whose User Principal Name (UPN) matches a case-sensitive regular expression.

{{% alert title="Design decisions" color="warning" %}}

| Decision point            | Design decision                                                                                                             | Justification                                                                    |
| :------------------------ | :-------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------- |
| Profile assurance         | Enable `NonRemovableProfileEnabled` to automatically create a persistent profile signed in with the Windows sign-in account | Ensures a signed-in corporate profile exists and cannot be removed or signed out |
| Corporate profile sign-in | Set `BrowserSignin` to Enable (1) and restrict allowed sign-ins to corporate UPN patterns using `RestrictSigninToPattern`   | Allows sign-in while restricting it to corporate accounts                        |

{{% /alert %}}

##### Restricting sign in

`RestrictSigninToPattern` is not per-profile, so a single pattern governs which accounts can sign in across all profiles on a device. The pattern should be written narrowly to match only approved corporate UPNs. For example:

```regex
.*@agency\.gov\.au$
```

A looser pattern can weaken this control by allowing secondary-tenant identities to sign in to an Edge profile on the primary device, undermining the intent of restricting Edge sign-in to approved, centrally managed corporate identities. Allowing non-corporate accounts (such as consumer Microsoft accounts, or accounts from unmanaged external tenants) increases the risk of:

- Non-corporate or secondary-tenant accounts influencing SSO, token caching, sync, and access decisions in the work browsing context.
- Users inadvertently performing work-like browsing under the wrong account, increasing the risk of data leakage, incorrect access, or policy bypass.
- Uncontrolled exposure to new Edge features. Microsoft regularly introduces features that use the signed-in identity context, and these features often default to enabled. If a non-corporate identity is signed in at activation, corporate data or browsing context may be exposed before evaluation and configuration.
- Local repositories of cookies, cache, history, and other browsing data accumulating under a non-corporate identity, becoming accessible to an attacker in the event of an endpoint compromise.

With `BrowserSignin` set to Enable (1), users can sign in to Edge and sign-in is restricted to accounts matching `RestrictSigninToPattern`. Setting `BrowserSignin` to Force (2) requires a user to sign in before the browser is usable, providing stronger assurance that browsing does not occur in an unauthenticated profile. This introduces recovery complexity, because if sign-in is blocked (for example, account lockout, multi-factor authentication (MFA) unavailability, or Conditional Access failure), Edge cannot be used on the device to reach web-based recovery or support entry points, and remediation may require out-of-band action such as temporary policy changes or profile removal. The use of `NonRemovableProfileEnabled` combined with `RestrictSigninToPattern` may provide sufficient identity assurance without the support overhead of forced sign-in.

{{% alert title="Unmanaged devices" color="info" %}}

As sign-in and hardening policies are device-scoped and do not extend to endpoints outside Intune management. Restricting corporate identity use on unmanaged devices requires platform-scoped controls:

- **[Conditional Access](https://learn.microsoft.com/en-au/entra/identity/conditional-access/overview) device compliance policies** to block or restrict sign-in from non-compliant devices
- **[Intune App Protection](https://learn.microsoft.com/en-au/mem/intune/apps/app-protection-policy) policies** to enforce data protection on Edge without full device enrolment
- **[Entra ID Tenant Restrictions v2 (TRv2)](#entra-id-tenant-restrictions-v2-trv2)** to limit which external tenants can be accessed from the corporate network via proxy or gateway enforcement

{{% /alert %}}

##### Sign-in policy controls reference

Four policies form the primary control for Edge profile sign-in and account eligibility.They are device-scoped (not per-profile) and apply across all profiles on a device. Listed here in operational order:

- `BrowserSignin`: Enables or blocks Edge profile sign-in, or forces sign-in before the browser can be used. If disabled, dependent sign-in behaviours do not take effect.
- `ImplicitSignInEnabled`: Controls whether Edge performs implicit sign-in based on the Windows sign-in account. If disabled, automatic sign-in behaviour does not occur.
- `NonRemovableProfileEnabled`: Ensures a corporate profile is created and remains signed in, and cannot be signed out or removed by a user when it matches the Windows sign-in account.
- `RestrictSigninToPattern`: Restricts which accounts can sign in to Edge by matching the UPN against a case-sensitive regular expression. Existing signed-in profiles that do not match are signed out when the policy takes effect.

Because these policies are device-scoped, sign-in restrictions cannot be targeted to individual profiles.

#### Single sign-on (SSO)

There are two forms of SSO relevant to Edge profiles. Understanding the distinction is important for determining whether a profile requires sign-in.

##### Web-session SSO

Web-session SSO relies on standard cookies and tokens within a browsing session. Once authenticated to a web application (for example, a portal sign-in), other applications sharing the same identity provider session can reuse that authentication within the same browser profile until the session expires. This does not require the profile to be signed in to Edge.

For most users accessing a small number of portals with infrequent session expiry, web-session SSO can provide adequate continuity without the risks associated with profile sign-in.

##### PRT-based SSO

The Primary Refresh Token (PRT) is a device-bound Entra ID token that enables SSO across applications on a device, eliminating repeated credential prompts. A PRT is issued for each tenant a device is joined or registered to. On a device joined exclusively to one tenant, only that tenant issues a PRT.

Edge presents a PRT to Entra ID only from a profile signed in with a corporate account. This enables authentication to primary tenant applications on an Entra ID-joined device without additional credential prompts. A local-only profile instead requires an initial interactive authentication and relies on the resulting web session for SSO.

PRT-based SSO is most valuable when users frequently switch between multiple web applications in the same tenant and repeated sign-in prompts are a measurable productivity problem.

### Multi-tenant access

A _primary device_ is a standard corporate endpoint joined or registered to the primary tenant and subject to Intune‑enforced configuration. In multi‑tenant scenarios, ambiguity can arise over which identity is allowed to become the signed‑in Edge identity. The appropriate configuration depends on tenant relationships, browser integration, and permitted access patterns.

#### Tenant categories

The tenant relationship determines how much browser integration is appropriate:

- _Primary tenant_: the main Entra ID tenant. The primary device is joined or registered to this tenant. This tenant supplies the default signed-in identity and is the source of Intune-delivered browser policies.
- _Managed secondary tenant_: a separate Entra ID tenant operated to an equivalent security standard, with comparable Conditional Access, monitoring, governance, and administrative controls.
- _Unmanaged or loosely coupled tenant_: a tenant without an equivalent governance relationship or security standard. Examples include consumer Microsoft accounts, personal tenants, billing-only tenants, unmanaged dev/test tenants, and partner tenants without comparable controls.

#### Secondary tenant sign-in on a primary device

On a primary device registered exclusively to the primary tenant, only that tenant issues a PRT. A secondary tenant identity signed in to an Edge profile does not receive a PRT unless the device is also registered to that tenant. This device binding directly affects the guarantees and controls available to each sign-in type:

- _Signed-in primary tenant identity_: PRT-based SSO, Conditional Access compliance signalling, sync eligibility, enterprise search scope, and Edge management service policy evaluation, all anchored to the primary tenant.
- _Signed-in secondary tenant identity_: no PRT-based SSO, relying instead on broker-mediated token flows that require initial interactive authentication. Sync eligibility, Conditional Access signalling, and Edge management service policy evaluation are sourced from the secondary tenant. Device compliance claims are not available to the secondary tenant by default and require cross-tenant access trust settings. This sign-in type also carries a policy override risk, as the secondary tenant's Edge management service can apply policies to the signed-in profile (as described in [Establishing a corporate profile](#establishing-a-corporate-profile).
- _Local-only profile (no sign-in)_: no PRT-based SSO, no sync, no enterprise search scope, and no Edge management service policy evaluation. Access to primary tenant web applications begins with an interactive sign-in and continues under web-session SSO. This removes the policy override risk.

For most secondary tenant access needs, [web-session SSO](#web-session-sso) in a local-only profile provides functional access without the policy override and sync risks associated with profile sign-in.

{{% alert title="Device registration and secondary tenant PRTs" color="info" %}}

Windows allows a device to be Entra ID joined to one tenant while also being registered to additional tenants unless restricted by policy. Registering a device to another tenant issues a PRT for that tenant, and signing in to an Edge profile with that tenant's identity enables PRT-based SSO to its web applications together with sync and Edge management service policy delivery. For access to secondary tenant web applications, [web-session SSO](#web-session-sso) in a local-only profile is typically sufficient.

Additional tenant registrations on primary devices can be prevented using the device‑scoped `BlockAADWorkplaceJoin` policy (`HKLM\SOFTWARE\Policies\Microsoft\Windows\WorkplaceJoin`), which blocks Entra ID workplace joins (registrations) without affecting the primary Entra ID‑joined state.

{{% /alert %}}

#### Legitimate multi-tenant use cases

Several scenarios can create an operational need for access to more than one tenant:

- _Pre-production or staging tenants_: identities held in both a production tenant and a separate tenant used for development or testing.
- _Cross-agency secondments_: identities held in both the home agency tenant and the host agency tenant.
- _Contractors and consultants_: identities held in both an employer's tenant and a client tenant.
- _Mergers or restructures_: two tenants coexisting temporarily, with staff needing access to both during the transition.

These scenarios are common and expected, but none likely justify signing in to an Edge profile on the primary device with a secondary tenant identity when [web-session SSO](#web-session-sso) provides functional access.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                  | Design decision                                                | Justification                                                                                                         |
| :------------------------------ | :------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------- |
| SSO model for secondary tenants | Default to web-session SSO via local-only profiles<sup>1</sup> | Preserves functional access to secondary tenant portals without granting Edge management service or sync capabilities |

1: Where signed-in access to a secondary tenant is required, [device isolation](#isolation-options) with an approved risk acceptance may be acceptable.

{{% /alert %}}

#### Isolation options

Secondary tenant access can be managed through two isolation models, ordered by the degree of browser integration each permits. Managed secondary tenants that require sign-in and sync need the strongest isolation to contain that integration safely. Unmanaged tenants that only need cookie-based web access are already constrained by the limited integration a local-only profile provides.

**Device isolation.** Secondary tenant access occurs only on dedicated workstations or virtual desktop sessions (Azure Virtual Desktop, Windows 365, or RemoteApp). The primary device never sees the secondary tenant identity context, so browser-level and OS-level cross-contamination attack surfaces addressed by the other models do not arise. Device isolation provides the strongest separation and is the default for managed secondary tenants.

**Profile isolation.** A local-only profile is created in the primary Edge installation but the user does not sign in with the secondary tenant identity. There is no Edge management service policy exposure, no sync, and no PRT-based SSO. [Web-session SSO](#web-session-sso) is the only authentication mechanism available. This removes the policy override and sync risks but still shares the browser process with the primary profile. Profile isolation suits scenarios where unmanaged or loosely coupled tenant web applications need to be accessed from a primary device.

In practice, isolation model selection aligns to the [tenant category](#tenant-categories):

| Tenant category                     | Default isolation model | Notes                                                                                      |
| :---------------------------------- | :---------------------- | :----------------------------------------------------------------------------------------- |
| Managed secondary tenant            | Device isolation        | Dedicated workstation or virtual desktop session                                           |
| Unmanaged or loosely coupled tenant | Profile isolation       | Web-session SSO only, the secondary identity is not promoted into Edge's signed-in context |

{{% alert title="Design decisions" color="warning" %}}

| Decision point                  | Design decision                                                                                                                                                                                   | Justification                                                                                                              |
| :------------------------------ | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | :------------------------------------------------------------------------------------------------------------------------- |
| Unmanaged tenant access         | Default to profile isolation (a local-only profile with no profile sign-in) for tenants not operated to an equivalent security standard                                                           | Prevents uncontrolled identities from influencing the browser's SSO, sync, and policy context                              |
| Managed secondary tenant access | Default to device isolation (a dedicated workstation or virtual desktop/app session)                                                                                                              | Prevents the secondary tenant from gaining any presence on the primary device                                              |
| Secondary tenant sign-in scope  | Sign-in by secondary-tenant identities within the primary Edge instance on a primary device is blocked by a narrowly scoped `RestrictSigninToPattern` regex that matches only primary-tenant UPNs | Prevents the secondary tenant's Edge management service from gaining a policy override in the primary browsing environment |

{{% /alert %}}

#### Entra ID Tenant Restrictions v2 (TRv2)

`RestrictSigninToPattern` controls which identities can become signed-in Edge profiles on a device, but it does not restrict which external tenants a user can authenticate to via web-based sign-in within the browser. A user browsing in a local-only profile can still authenticate to any external tenant's web applications through standard cookie-based SSO.

[Entra ID Tenant Restrictions v2 (TRv2)](https://learn.microsoft.com/en-au/entra/external-id/tenant-restrictions-v2) addresses this gap at the authentication layer. When enforced, TRv2 adds enforcement headers to Microsoft authentication traffic from managed devices, allowing Entra ID to block sign-in to unapproved external tenants and prevent access to Microsoft resources using tokens issued by those tenants. TRv2 authentication plane protection is generally available. Data plane protection, which addresses access methods that bypass authentication, is currently in preview.

Configuring both `RestrictSigninToPattern` and TRv2 provides a defence-in-depth pattern: `RestrictSigninToPattern` prevents secondary-tenant identities from gaining Edge management service policy override capability, while TRv2 prevents authentication to unapproved tenants even in local-only browsing contexts where `RestrictSigninToPattern` has no effect.

{{% alert title="TRv2 implementation" color="info" %}}

TRv2 can be enforced via GPO or Intune, although some settings may be in Preview. This enforcement method covers Edge, Office apps, and applications built on the Windows networking stack. Chrome, Firefox, and applications that bypass the Windows networking stack are not covered and should be blocked (for example, via App Control for Business or Windows Firewall). Proxy or gateway enforcement remains available where broader network-level coverage is required.

{{% /alert %}}

### Enterprise sync

[Enterprise sync](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-enterprise-sync) (sync) synchronises browser data (favourites, passwords, form-fill data, settings, extensions, open tabs, history, and feature usage data) across devices for a signed-in identity.

Sync is a separate control from authentication. Signing in to Edge does not automatically enable sync; a user must separately opt in. The `ForceSync` policy overrides this by enabling sync without user consent and removing the user's ability to turn it off, increasing exposure if an identity is compromised.

{{% alert title="Sync data storage and encryption" color="info" %}}

For Entra ID accounts, sync data is stored on Microsoft cloud servers associated with the account's tenant, encrypted in transit and at rest. Most data types are additionally encrypted client-side via Microsoft Purview Information Protection before leaving the device, with open tabs and history being the exceptions.

{{% /alert %}}

Sync data contents are not exposed to administrators through any management console. Limiting replicated data types to those with a clear productivity justification reduces unnecessary data replication and narrows the scope of data outside administrative visibility. `SyncTypesListDisabled` can be used to exclude data types that conflict with data classification requirements, and accepts values beyond the user-visible data types. Sync also overrides time-based data retention policies such as [`BrowsingDataLifetime`](#session-persistence-and-exit-behaviour), which does not execute deletion for actively synced data types.

{{% alert title="Design decisions" color="warning" %}}

| Decision point         | Design decision                                                                              | Justification                                                                                                              |
| :--------------------- | :------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------- |
| Enable Enterprise sync | Permit the use of enterprise sync for the corporate profile but do not configure `ForceSync` | Supports a consistent browsing experience across managed devices while reducing data exposed if an identity is compromised |

{{% /alert %}}

#### Sync as an exfiltration risk

When sync is enabled for a secondary tenant profile, data generated in that profile replicates to cloud storage governed by the secondary tenant. A user with access to both the corporate profile and a secondary signed-in profile can transfer data between them through normal browser actions: copying text, saving favourites, or opening tabs. Any data moved into the secondary profile in this way replicates to storage outside the primary tenant's control.

### Guest mode and InPrivate browsing

To ensure all web activity remains subject to corporate policy and identity protections, unmanaged browsing contexts should be strictly governed.

#### Guest mode

Guest mode creates a temporary profile that is deleted when all guest windows are closed. Policies bound to a signed-in profile do not apply, extensions do not load, and the session has no signed-in identity. Device-scoped policies still apply, but the session operates outside identity-based management controls, with no [PRT-based SSO](#prt-based-sso) and no identity-plane audit trail.

{{% alert title="Design decisions" color="warning" %}}

| Decision point | Design decision                                                                   | Justification                                                                                                  |
| :------------- | :-------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------- |
| Guest mode     | Disable Guest mode on managed endpoints unless a documented use case justifies it | Prevents browsing sessions that bypass per-profile policy, identity-based security controls, and audit logging |

{{% /alert %}}

#### InPrivate browsing

InPrivate sessions launch within an existing profile and inherit that profile's managed policies. [Extensions](#extension-policy) are disabled by default in InPrivate, including force-installed extensions deployed via `ExtensionInstallForcelist`. Browsing history, cookies, cache, passwords, and form data are deleted when all InPrivate windows close.

The [`RestrictSigninToPattern`](#restricting-sign-in) policy still applies, preventing users from signing in to an Edge profile with an unauthorised identity. However, InPrivate starts with no cookies, allowing users to authenticate to external web services through standard web authentication without the corporate profile's existing session state. The practical result is access to external services in a context where extension-based security controls (if any) are not active unless individually enabled for InPrivate.

Where InPrivate browsing is permitted, compensating controls include:

- Network-scoped inspection (proxy, Cloud Access Security Broker (CASB), Secure Web Gateway (SWG)) to capture HTTP/HTTPS traffic regardless of Edge mode
- Conditional Access session controls and device compliance requirements to restrict access to cloud resources regardless of Edge mode
- [Purview Endpoint DLP](https://learn.microsoft.com/en-au/purview/endpoint-dlp-learn-about), which operates at the OS level and restricts copy, print, upload, and paste operations involving sensitive content
- `MandatoryExtensionsForInPrivateNavigation` to block InPrivate navigation unless a user has enabled specified security extensions for InPrivate mode

{{% alert title="Design decisions" color="warning" %}}

| Decision point     | Design decision                                                                                                                                             | Justification                                                                                                  |
| :----------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------- |
| InPrivate browsing | Govern InPrivate availability based on risk and where permitted, use `MandatoryExtensionsForInPrivateNavigation` as required to ensure extension enablement | Reduces the risk of browsing sessions operating without extension-based security controls and local audit data |

{{% /alert %}}

### Session persistence and exit behaviour

Persistent browser sessions improve continuity across device restarts but increase the data exposed if an endpoint is compromised. Session exit controls limit the on-device data footprint after the browser closes, reducing the value of residual artefacts to an attacker.

Edge's local storage contains cookies, cache, history, and other browsing data that may support incident response triage but is not an authoritative audit trail and may be modified or deleted by an attacker. Retention increases the data exposed if a device is compromised, and is best balanced with compensating controls such as full-disk encryption, [Conditional Access session controls](https://learn.microsoft.com/en-au/entra/identity/conditional-access/concept-session-lifetime), and [Continuous Access Evaluation](https://learn.microsoft.com/en-au/entra/identity/conditional-access/concept-continuous-access-evaluation) protections.

Where more granular control is required, [`BrowsingDataLifetime`](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-browser-policies/browsingdatalifetime) enforces time-based retention for specific data types. Expired data is removed 15 seconds after browser startup and every hour during operation. This allows a balance between incident response needs and data minimisation: for example, retaining browsing history for 24 hours to support triage while ensuring automatic cleanup beyond that window. Note that this policy has no effect on data types that are [actively synced](#enterprise-sync).

By default, Edge can keep processes running after the last window closes to support Startup Boost and background mode. Disabling both `StartupBoostEnabled` and `BackgroundModeEnabled` ensures browser processes fully terminate on close, reducing the active process surface and preventing in-browser persistence.

{{% alert title="Design decisions" color="warning" %}}

| Decision point         | Design decision                                                                                                                                         | Justification                                                                                         |
| :--------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------ | :---------------------------------------------------------------------------------------------------- |
| Local data persistence | Retain local browser data on exit by default and where data minimisation is required, use `BrowsingDataLifetime` to enforce time-based retention limits | Supports incident response triage while enabling per-data-type retention                              |
| Background processing  | Disable both `BackgroundModeEnabled` and `StartupBoostEnabled`                                                                                          | Ensures browser processes fully terminate on close, reducing the potential for in-browser persistence |

{{% /alert %}}

{{% alert title="Progressive Web Apps" color="info" %}}

[Progressive Web Apps (PWAs)](https://learn.microsoft.com/en-au/microsoft-edge/progressive-web-apps) run within the Edge browser runtime and are subject to the same identity, extension, network, and endpoint controls as standard browser sessions. PWAs may retain content locally or operate offline via service workers, which can increase data persistence if those controls are not in place.

{{% /alert %}}

### Edge password manager

The [Edge password manager](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-security-password-manager-security) provides users with a convenient, integrated solution that can improve basic password hygiene compared to having no password management system. The decision to use it however, requires a deliberate risk assessment based on specific security requirements and risk tolerance.

Where its use is considered, features should be evaluated against security requirements, acknowledging the differences in administrative visibility and control compared to a dedicated Enterprise Password Management (EPM) solution.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                  | Design decision                                                                                                                                                                  | Justification                                                                                                                                                   |
| :------------------------------ | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Using the Edge password manager | Disable where a dedicated EPM solution is deployed. Permit where no alternative exists and the risk of unmanaged credential reuse outweighs the risk of browser-stored passwords | Ensures credential storage defaults to the most governed solution available, while preventing unmanaged password practices where no EPM alternative is in place |

{{% /alert %}}

{{% alert title="Password liability" color="info" %}}

Given their inherent vulnerability to theft, reuse, and human error, passwords are a legacy liability and should be phased out wherever a stronger authentication method is available.

{{% /alert %}}

#### Broader credential management considerations

While the Edge password manager can be a suitable tool for some use cases, it should be considered within a broader credential management strategy, especially in environments with sensitive or security classified information.

For these scenarios, a dedicated EPM solution offers centralised control and advanced security through features like enhanced auditing, granular access controls, automated credential rotation, offline access and secure emergency access procedures. Due to these capabilities, an EPM is a common implementation for managing credentials for privileged accounts, such as ICT administrators, users with access to critical business systems, and developers with production environment credentials. While outside the scope of browser configuration, this governance may extend to non‑human credentials as part of a broader credential management strategy.

{{% alert title="Design decisions" color="warning" %}}

| Decision point               | Design decision                                                                                                           | Justification                                                                              |
| :--------------------------- | :------------------------------------------------------------------------------------------------------------------------ | :----------------------------------------------------------------------------------------- |
| Credential management policy | Define a policy that specifies the required credential management solution based on credential sensitivity and risk level | Ensures that credentials are protected by controls commensurate with their associated risk |

{{% /alert %}}

{{% alert title="Privileged credentials" color="info" %}}

A guiding security principle is that a privileged credential should not be typed, stored, or have its session active on a device that is also used for high-risk activities like reading email and general web browsing. Where full separation of privileged and unprivileged accounts has not yet been achieved, the [Privileged user considerations](#privileged-user-considerations) section provides defence-in-depth hardening guidance.

{{% /alert %}}

#### Passkey support

Edge can act as an authenticator for FIDO2 passkeys on websites that support [WebAuthn](https://www.w3.org/TR/webauthn-3). When enabled, passkeys are stored in the [Edge password manager](https://blogs.windows.com/msedgedev/2025/11/03/microsoft-edge-introduces-passkey-saving-and-syncing-with-microsoft-password-manager/) and are scoped to website authentication only. This capability is separate from [Windows Hello for Business](https://learn.microsoft.com/en-au/windows/security/identity-protection/hello-for-business) and [Entra ID passkeys](https://learn.microsoft.com/en-au/entra/identity/authentication/how-to-enable-passkey-fido2), which govern Windows and Entra ID sign-ins.

Edge passkeys apply to websites that are not federated to Entra ID and sit outside Entra ID controls. Administrators have no control over them: they cannot be revoked through Entra, and offboarding does not remove passkeys that users registered directly with external websites.

{{% alert title="Design decisions" color="warning" %}}

| Decision point       | Design decision                                                              | Justification                                                                                     |
| :------------------- | :--------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------ |
| Edge passkey storage | Disable Edge passkey storage via the `PasswordManagerPasskeysEnabled` policy | Keeps passkeys out of a credential store that is not governed, visible, or revocable via Entra ID |

{{% /alert %}}

### User experience and compatibility

Managing the browser across its lifecycle standardises the user environment while constraining the risks inherent in legacy application support and unmanaged web navigation.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                                   | Design decision                                                                                                                 | Justification                                                                                              |
| :----------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------ | :--------------------------------------------------------------------------------------------------------- |
| Start-up and search                              | Enforce the corporate homepage and default search provider                                                                      | Provides a consistent start-up experience and directs search queries through a managed provider by default |
| IE mode                                          | Where legacy web applications require IE rendering, configure IE mode using cloud site list management in the M365 admin portal | Contains legacy rendering within Edge under centrally managed site list control                            |
| Privacy and tracking                             | Set tracking prevention to _Balanced_ and block third-party cookies                                                             | Reduces cross-site tracking while maintaining general website compatibility                                |
| Search suggestions                               | Disable search and site suggestions in the address bar                                                                          | Reduces query and URL data transmitted to external services during address bar input                       |
| Web Real-Time Communication (WebRTC) IP handling | Restrict WebRTC to the public interface only                                                                                    | Prevents WebRTC from exposing local IP addresses                                                           |

{{% /alert %}}

{{% alert title="Do Not Track" color="info" %}}

The Do Not Track header is a deprecated, voluntary signal that most websites ignore. It can also serve as a fingerprinting signal due to low adoption. Tracking prevention and third-party cookie blocking can be effective controls for reducing cross-site tracking.

{{% /alert %}}

### The Edge sidebar

The [Edge sidebar](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-sidebar) is a persistent pane that renders web content alongside the main browser window. For Entra ID profiles it hosts Microsoft 365 Copilot Chat and sidebar extensions, which are browser extensions built using the Sidebar API that display a panel in the sidebar. Sidebar extensions have full access to extension APIs, including the ability to read and modify the content of the active browser tab, and are subject to the deny-all, permit-by-exception model described in [Extension policy](#extension-policy).

The sidebar app list, through which users could pin web apps to the sidebar, has been retired for enterprise users.

Disabling the sidebar via `HubsSidebarEnabled` hides the pane but does not govern Copilot Chat, whose availability in the toolbar and sidebar is controlled separately through `Microsoft365CopilotChatIconEnabled`.

{{% alert title="Design decisions" color="warning" %}}

| Decision point    | Design decision                              | Justification                                                  |
| :---------------- | :------------------------------------------- | :------------------------------------------------------------- |
| Sidebar framework | Disable the sidebar via `HubsSidebarEnabled` | Ensures all web activity occurs within the main browser window |

{{% /alert %}}

{{% alert title="Agentic AI in the browser" color="info" %}}

Agentic AI capabilities in Edge for Business, such as [browsing with Copilot and Copilot Cowork](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-management-service-copilot-features), introduce a different risk profile from traditional browser-based AI features. An AI agent that can autonomously navigate, interact with web content, and execute actions within a browser session creates risks around prompt injection, session exposure, and data loss prevention bypass. Agentic AI features are evolving rapidly, and available policy controls may lag behind new capabilities.

{{% /alert %}}

### Feature minimisation and interface reduction

Edge includes native integrations intended for consumer use, such as shopping assistants, gaming overlays, and AI writing tools. In an enterprise context, these features expand the attack surface, can distract from productive use, and risk data exposure to unmanaged consumer services.

Applying a deny-by-default approach to non-essential browser integrations reduces the risk of new consumer features introduced in updates inheriting a permissive default.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                    | Design decision                                                                                               | Justification                                                                                                |
| :-------------------------------- | :------------------------------------------------------------------------------------------------------------ | :----------------------------------------------------------------------------------------------------------- |
| Feature reduction                 | Disable non-essential consumer integrations and suppress background activity for unused features              | Reduces attack surface and unnecessary background activity                                                   |
| Intrusive ad blocking<sup>1</sup> | Enforce blocking of intrusive ads via mandatory policy                                                        | Reduces exposure to intrusive advertising content                                                            |
| Browser-native AI                 | Disable browser-native consumer AI features (for example, personal Copilot, Compose, Image Creator)           | Limits data exposure to consumer AI services while retaining access to sanctioned enterprise AI capabilities |
| Agentic browsing                  | Disable browsing with Copilot and Copilot Cowork actions by default                                           | Prevents autonomous agent actions in the browser session unless explicitly approved                          |
| New Tab Page content              | Disable non-essential New Tab Page content (for example, news feed, sponsored quick links, promotional tiles) | Reduces exposure to unmanaged external content on the New Tab Page                                           |

1: This setting does not constitute comprehensive advertisement control as described in ISM-1485. A dedicated web content filtering solution is required for that purpose.

{{% /alert %}}

### Using the Edge management service

While Intune is the primary and authoritative policy source for corporate-managed devices, the [Edge management service](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-management-service) can serve a supplementary role for capabilities not available in Intune:

- Conflict handling via policy priority, where multiple management service policy configurations could apply to the same user
- Extension request and approval workflows
- Extension inventory and monitoring across managed profiles
- Copilot feature configuration, including the Copilot new tab page and browsing with Copilot
- Organisation branding

Cloud policies from the management service are evaluated against the [primary signed-in account](#establishing-a-corporate-profile) and apply only to that profile, not to other profiles in the same browser installation.

Where devices are not enrolled in Intune (for example, Windows Server hosts or unmanaged endpoints), the Edge management service can serve as the primary cloud-native tool for browser policy enforcement. In this scenario the "by exception" posture described below does not apply.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                    | Design decision                                                                                  | Justification                                                                                                     |
| :-------------------------------- | :----------------------------------------------------------------------------------------------- | :---------------------------------------------------------------------------------------------------------------- |
| Using the Edge management service | Use the Edge management service by exception only, for its unique features not present in Intune | Enables access to specific capabilities without creating policy management conflicts or administrative complexity |

{{% /alert %}}

#### Management service policy coexistence with Intune

By default, Edge management service cloud policies are overridden when they conflict with an existing Intune policy on the device. This behaviour can be inverted using the [`EdgeManagementPolicyOverridesPlatformPolicy`](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-browser-policies/edgemanagementpolicyoverridesplatformpolicy) policy. To avoid conflict, each setting can be configured in one source only.

Within the Edge management service itself, conflicts between multiple management service policies assigned to the same user are resolved by policy priority order, where the highest priority policy takes precedence. This priority mechanism applies only to cloud policies and does not extend to Intune configuration profiles.

### Diagnostic data and telemetry

[Edge collects diagnostic data](https://learn.microsoft.com/en-au/legal/microsoft-edge/privacy), including device identifiers, feature usage metrics, and crash reports containing URLs and page content fragments at the time of failure. The `DiagnosticData` policy can be set to off to suppress all required and optional telemetry. Broader Edge-related telemetry may still flow through the Windows Diagnostic Data pipeline depending on operating system configuration, and may be transmitted without the ability for review or interception.

{{% alert title="Design decisions" color="warning" %}}

| Decision point        | Design decision                                           | Justification                                                         |
| :-------------------- | :-------------------------------------------------------- | :-------------------------------------------------------------------- |
| Diagnostic data level | Suppresses all required and optional Edge diagnostic data | Minimises telemetry transmission to Microsoft, reducing data exposure |

{{% /alert %}}

### Edge WebView2

The [WebView2 Runtime](https://learn.microsoft.com/en-au/microsoft-edge/webview2/concepts/enterprise) is a separate component from the Edge browser. It is the embedded rendering engine for native Microsoft 365 applications, such as New Outlook and Microsoft Teams, enabling them to display web content within the application.

Because WebView2 uses the same Chromium rendering engine as Edge, it shares much of the same vulnerability surface. However, WebView2 does not inherit security policies configured for the Edge browser, with policies limited to a small set of loader, network, and runtime controls. Edge policies are not intended to be applied to WebView2.

WebView2 risks are primarily managed through:

- Timely runtime updates: WebView2 security updates are delivered through the same update mechanism as Edge but under separate per-application update policies. Blocking or delaying [Edge updates](#update-management) also blocks WebView2 patches.
- Host application governance: managing the applications that embed WebView2 via application control, allowlisting, and application-specific configuration.

For available WebView2 controls, refer to the [Microsoft Edge WebView2 Policy Reference](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-webview-policies).

{{% alert title="Design decisions" color="warning" %}}

| Decision point   | Design decision                                                 | Justification                                                                        |
| :--------------- | :-------------------------------------------------------------- | :----------------------------------------------------------------------------------- |
| WebView2 updates | Do not block or delay Edge Update services or network endpoints | Ensures WebView2 security updates can be delivered through the Edge update mechanism |

{{% /alert %}}

### Privileged user considerations

Privileged browser sessions commonly provide direct access to administrative portals and sensitive control planes. As a result, the browser represents a higher‑impact attack surface and benefits from a more restrictive configuration than standard user browsing.

Recommended hardening measures for privileged browser sessions include:

- Enforcing short data retention using `BrowsingDataLifetime`, optionally combined with clear‑on‑exit, to minimise the lifetime of cookies, cache, and session data. This reduces exposure from residual session artefacts without relying solely on a user closing the browser.
- Further restricting the extension allow‑list, or blocking extensions entirely, to minimise executable code within the browser context.
- Disabling [browser profile synchronisation](#enterprise-sync) to prevent privileged browsing data and session state from being replicated to other devices.
- Blocking downloads by default and permitting them only via an explicit allow‑list to reduce exposure to untrusted files and malware.
- Using a [dedicated browser profile or device](#isolation-options) for privileged access further isolates administrative sessions from standard browsing activity.

For broader guidance on protecting high‑value accounts and workstations, refer to the ACSC publications on [_Secure administration_](https://www.cyber.gov.au/business-government/protecting-devices-systems/system-administration/secure-administration) and the [_Guidelines for system hardening_](https://www.cyber.gov.au/business-government/asds-cyber-security-frameworks/ism/cyber-security-guidelines/guidelines-for-system-hardening).

### Related information

#### Security and governance

- None identified

#### Design

- None identified

#### Configuration

- [ASD Edge hardening](/configuration/intune/devices/configuration-policies/asd-edge-hardening)
- [Security Baseline for Microsoft Edge](/configuration/intune/endpoint-security/security-baselines/security-baseline-for-microsoft-edge)

#### References

- [Adapting your website for new Local Network Access restrictions in Microsoft Edge](https://learn.microsoft.com/en-au/deployedge/ms-edge-local-network-access)
- [App Protection Policies Overview](https://learn.microsoft.com/en-au/mem/intune/apps/app-protection-policy)
- [ApplicationBoundEncryptionEnabled](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-browser-policies/applicationboundencryptionenabled)
- [Browse more safely with Microsoft Edge](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-security-browse-safer)
- [BrowserSignin](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-browser-policies/browsersignin)
- [BrowsingDataLifetime](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-browser-policies/browsingdatalifetime)
- [CIS Benchmark for Microsoft Web Browsers](https://www.cisecurity.org/benchmark/microsoft_internet_explorer)
- [Commercial National Security Algorithm Suite (CNSA) 2.0](https://media.defense.gov/2025/May/30/2003728741/-1/-1/0/CSA_CNSA_2.0_ALGORITHMS.PDF)
- [Compliance and device configuration policies that conflict](https://learn.microsoft.com/en-au/intune/device-configuration/troubleshoot-device-profiles#compliance-and-device-configuration-policies-that-conflict)
- [Conditional Access adaptive session lifetime policies](https://learn.microsoft.com/en-au/entra/identity/conditional-access/concept-session-lifetime)
- [Configure Microsoft Edge enterprise sync](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-enterprise-sync)
- [Configuring Copilot Features](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-management-service-copilot-features)
- [Continuous Access Evaluation](https://learn.microsoft.com/en-au/entra/identity/conditional-access/concept-continuous-access-evaluation)
- [EdgeManagementPolicyOverridesPlatformPolicy](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-browser-policies/edgemanagementpolicyoverridesplatformpolicy)
- [Enable passkeys in Microsoft Entra ID](https://learn.microsoft.com/en-au/entra/identity/authentication/how-to-enable-passkey-fido2)
- [Enterprise management of WebView2 Runtimes](https://learn.microsoft.com/en-au/microsoft-edge/webview2/concepts/enterprise)
- [Get started with configuration policies](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-management-service)
- [_Guidelines for system hardening_](https://www.cyber.gov.au/business-government/asds-cyber-security-frameworks/ism/cyber-security-guidelines/guidelines-for-system-hardening)
- [ImplicitSignInEnabled](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-browser-policies/implicitsigninenabled)
- [_Information Security Manual_](https://www.cyber.gov.au/business-government/asds-cyber-security-frameworks/ism)
- [Introducing Enhanced Security for Microsoft Edge](https://microsoftedge.github.io/edgevr/posts/Introducing-Enhanced-Security-for-Microsoft-Edge)
- [Learn about Endpoint data loss prevention](https://learn.microsoft.com/en-au/purview/endpoint-dlp-learn-about)
- [Manage Microsoft Edge extensions in the enterprise](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-manage-extensions)
- [Manage the sidebar in Microsoft Edge](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-sidebar)
- [Microsoft Edge Enterprise documentation](https://learn.microsoft.com/en-us/deployedge)
- [Microsoft Edge for Business](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-for-business)
- [Microsoft Edge identity support and configuration](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-security-identity)
- [Microsoft Edge identity support and configuration: Browser-to-web single sign-on](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-security-identity#browser-to-web-single-sign-on-sso)
- [Microsoft Edge introduces passkey saving and syncing](https://blogs.windows.com/msedgedev/2025/11/03/microsoft-edge-introduces-passkey-saving-and-syncing-with-microsoft-password-manager/)
- [Microsoft Edge - Policies](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-policies)
- [Microsoft Edge password manager security](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-security-password-manager-security)
- [Microsoft Edge support for Microsoft Defender SmartScreen](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-security-smartscreen)
- [Microsoft Edge WebView2 Policy Reference](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-webview-policies)
- [Microsoft Security Baselines Blog](https://techcommunity.microsoft.com/category/security-baselines/blog/microsoft-security-baselines/)
- [NonRemovableProfileEnabled](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-browser-policies/nonremovableprofileenabled)
- [Overview of Progressive Web Apps (PWAs)](https://learn.microsoft.com/en-au/microsoft-edge/progressive-web-apps)
- [Overview of the Microsoft Edge channels](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-channels)
- [Protect devices from exploits](https://learn.microsoft.com/en-au/defender-endpoint/exploit-protection)
- [RestrictSigninToPattern](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-browser-policies/restrictsignintopattern)
- [ScarewareBlockerProtectionEnabled](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-browser-policies/scarewareblockerprotectionenabled)
- [Scope assignment behavior](https://learn.microsoft.com/en-au/intune/device-configuration/settings-catalog#scope-assignment-behavior)
- [_Secure administration_](https://www.cyber.gov.au/business-government/protecting-devices-systems/system-administration/secure-administration)
- [SmartScreenAllowListDomains](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-browser-policies/smartscreenallowlistdomains)
- [Tenant Restrictions v2](https://learn.microsoft.com/en-au/entra/external-id/tenant-restrictions-v2)
- [Use the Intune settings catalog to configure settings](https://learn.microsoft.com/en-au/intune/device-configuration/settings-catalog)
- [User data and privacy in Microsoft Edge](https://learn.microsoft.com/en-au/legal/microsoft-edge/privacy)
- [Web Authentication: An API for accessing Public Key Credentials](https://www.w3.org/TR/webauthn-3)
- [What is Conditional Access?](https://learn.microsoft.com/en-au/entra/identity/conditional-access/overview)
- [What is Microsoft Intune?](https://learn.microsoft.com/en-au/intune/intune-service/fundamentals/what-is-intune)
- [What is a Primary Refresh Token?](https://learn.microsoft.com/en-au/entra/identity/devices/concept-primary-refresh-token)
- [Windows Hello for Business](https://learn.microsoft.com/en-au/windows/security/identity-protection/hello-for-business)
