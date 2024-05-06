---
title: Device Security
weight: 20
description: "This section describes the design decisions associated with Device Security for system(s) built using ASD's Blueprint for Secure Cloud."
---

Settings associated with Device Security can be implemented through:

* Device Configuration Profiles
* [Endpoint Security Profiles]({{<ref "#endpoint-security-profiles">}})
* [Security Baselines]({{<ref "#security-baselines">}})
* [Powershell Scripts and Remediations]({{<ref "#powershell-scripts-and-remediations">}})

When using endpoint security policies along side other policy types, like security baselines or endpoint protection templates from device configuration policies, it is important to develop a plan for using multiple policy types to minimise the risk of conflicting settings. Security baselines, device configuration policies, and endpoint security policies are all treated as equal sources of device configuration settings by Microsoft Intune. A settings conflict occurs when a device receives two different configurations for a setting from multiple sources. Multiple sources can include separate policy types and multiple instances of the same policy. When Microsoft Intune evaluates policies for a device and identifies conflicting configurations for a setting, the affected setting can be flagged for an error or conflict and fail to apply.

All Enterprise mobile device management settings for devices, regardless of where they are set (Security Baselines, Endpoint Security Profiles, or Configuration Profiles), are exposed via various [Configuration Service Providers (CSP)](https://docs.microsoft.com/windows/client-management/mdm/configuration-service-provider-reference). A Configuration Service Provider is an interface to read, set, modify or delete configuration settings on the device. These settings map to registry keys or files.

The [Policy Configuration Service Provider](https://docs.microsoft.com/windows/client-management/mdm/policy-configuration-service-provider) enables the enterprise to configure policies on Windows 10 and Windows 11. This configuration service provider is used to configure any company policies. Policy scope is the level at which a policy can be configured. Some policies can only be configured at the device level, meaning the policy will take effect regardless of who is logged into the device. Other policies can be configured at the user level, meaning the policy will only take effect for that user.

Within Microsoft Intune, a [Settings Catalogue](https://docs.microsoft.com/mem/intune/configuration/settings-catalog) configuration profile, provides a user interface for all the Policy CSP's that can configured in one location. This feature simplifies how policies are created by displaying all the available settings. More settings are continually being added. This is the preferred method for configuring settings at a granular level. This method enables improved troubleshooting of setting conflicts. These profiles also allow device filtering (unlike Security Baselines) which enables the testing and incremental deployment of policies.

{{% alert title="Note" color="info" %}}

Not all settings are available via the Setting Catalogue. See [policies not configured](https://github.com/microsoft/Intune-ACSC-Windows-Hardening-Guidelines/blob/main/docs/Policies%20not%20configured.md)

{{% /alert %}}

### Endpoint security profiles

Device configuration profiles and baselines include a large body of diverse settings outside of the scope of securing endpoints. In contrast, each endpoint security profile focuses on a specific subset of device settings intended to configure one aspect of device security.

Following are brief descriptions of each endpoint security policy type:

* **Antivirus** - Antivirus policies help security admins focus on managing the discrete group of antivirus settings for managed devices.
* **Disk encryption** - Endpoint security disk encryption profiles focus on the settings that are relevant for a device's built-in encryption method, like FileVault or BitLocker. This focus makes it easy for security admins to manage disk encryption settings without having to navigate a host of unrelated settings.
* **Firewall** - The endpoint security Firewall policy in Intune is used to configure a device's built-in firewall for devices that run macOS and Windows 10/11.
* **Endpoint detection and response** - Microsoft Defender for Endpoint Intune Integration uses the endpoint security policies for endpoint detection and response (EDR) to manage the EDR settings and onboard devices to Microsoft Defender for Endpoint.
* **Attack surface reduction** - When Defender antivirus is in use on Windows 10/11 devices, Intune endpoint security policies for attack surface reduction is used to manage those device settings.
* **Account protection** - Account protection policies help protect the identity and accounts of users. The account protection policy is focused on settings for Windows Hello and Credential Guard, which is part of Windows identity and access management.

The settings made here are implemented through Policy CSP's, which can also be set in a Settings Catalogue configuration profile.

### Security Baselines

[Security Baselines](https://learn.microsoft.com/mem/intune/protect/security-baselines) are pre-configured groups of Windows settings that are recommended by Microsoft. The security baselines are templates and are used to create a profile that is specific to the environment for deployment and applied to enrolled devices.

Within Microsoft Intune, pre-configured security baseline profiles can be associated to devices to align them with [Microsoft security best practices](https://learn.microsoft.com/mem/intune/protect/endpoint-security). They are designed to make it easier and faster for customers to secure devices by accepting the Microsoft best practice for settings rather than the customer needing to assess and implement each setting one by one. These profiles contain multiple device specific configuration profiles and control several security related settings such as, but not limited to:

* App Runtime
* Autoplay
* BitLocker

These baselines provide robust security guidelines and are generated by Microsoft

* [Windows 10 Security Baselines](https://docs.microsoft.com/mem/intune/protect/security-baseline-settings-mdm-all?pivots=november-2021)
* [Microsoft Defender ATP Baseline](https://docs.microsoft.com/mem/intune/protect/security-baseline-settings-defender-atp?pivots=atp-december-2020)
* [Microsoft Edge Security Baseline](https://docs.microsoft.com/mem/intune/protect/security-baseline-settings-edge?pivots=edge-october-2019)
* [Windows 365 Baseline Settings](https://docs.microsoft.com/mem/intune/protect/security-baseline-settings-windows-365)
* [Microsoft Compliance ACSC Essential Eight](https://learn.microsoft.com/compliance/essential-eight/e8-overview)

The settings made here are implemented through Policy CSP's, which can also be set in a Settings Catalogue configuration profile.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point        | Design Decision                                                               | Justification                                                                                                                                                      |
| --------------------- | ----------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Security Settings     | Adopt ASD's hardening guides as basis for security settings                    | Adheres to ASD's [*Hardening Microsoft Windows 10 version 21H1 Workstations*](https://www.cyber.gov.au/acsc/view-all-content/publications/hardening-microsoft-windows-10-version-21h1-workstations) guidance. |
| Setting Configuration | Apply through Configuration Profiles (Catalogue Settings) where ever possible | Easier conflict resolution and configuration documentation and automation.                                                                           |

{{% /alert %}}

{{% alert title="Note" color="info" %}}

Using Catalogue Settings as a substitute for Security Baselines requires a manual review of settings when a new security baseline is released. Some Security Settings are not available via the Settings Catalog. https://github.com/microsoft/Intune-ACSC-Windows-Hardening-Guidelines/blob/main/docs/Policies%20not%20configured.md

{{% /alert %}}

#### Hardening guide setting deviations

The following Settings are deviations from ASD's recommendations:

| Setting   | Value            | Justification                                                 |
| --------- | ---------------- | ------------------------------------------------------------- |
| Telemetry | Required (Basic) | [Requirement for Windows Update]({{<ref "device-updates">}}) |

### Powershell Scripts and Remediations

In some cases Microsoft Intune policies may not exist for a particular endpoint setting. In these cases Powershell Scripts can be deployed using Intune to run on the endpoints to update configuration and security settings. Powershell Scripted configuration is deployed through the Intune management extension agent either as [Configuration Scripts](https://learn.microsoft.com/mem/intune/apps/intune-management-extension) or [Remediations](https://learn.microsoft.com/mem/intune/fundamentals/remediations).

Configuration Scripts execute on the endpoint by default using administrator privileges. The Intune agent checks after every reboot for new scripts or changes to scripts specified in Intune and executes them locally on the endpoint. The success or failure of the script is reported back to Intune.

Remediations use separate detect and remediation scripts to identify the condition where the script should run if the conditions are met will run the remediation. Success or failure of the script is also reported back to Intune.

### Related information

#### Security & Governance

* [Enterprise Mobility]({{<ref "security-and-governance/system-security-plan/enterprise-mobility.md">}})

#### Design

* [Conditional Access policies]({{<ref "design/platform/identity/conditional-access#conditional-access-policies">}})

#### Configuration

* [Endpoint Security Profiles]({{<ref "#endpoint-security-profiles">}})
* [Security Baselines]({{<ref "#security-baselines">}})
* [Powershell Scripts and Remediations]({{<ref "#powershell-scripts-and-remediations">}})
* [ASD Windows Hardening Guidelines]({{<ref "configuration/intune/devices/configuration-profiles/asd-windows-hardening-guidelines.md">}})
* [Microsoft Intune - profile configurations]({{<ref "configuration/intune/devices/configuration-profiles">}})

#### References

* [Security Baselines Overview](https://docs.microsoft.com/mem/intune/protect/security-baselines)
* [Endpoint Security Policies](https://docs.microsoft.com/mem/intune/protect/endpoint-security-policy)
* [Windows MDM](https://docs.microsoft.com/windows/client-management/mdm/windows-mdm-enterprise-settings)
* [Policy CSP's](https://docs.microsoft.com/windows/client-management/mdm/policy-configuration-service-provider)
* [Settings Catalogue](https://docs.microsoft.com/mem/intune/configuration/settings-catalog)
* [Security Baseline Settings](https://docs.microsoft.com/mem/intune/protect/security-baseline-settings-mdm-all?pivots=november-2021)
* ASD's [*Hardening Microsoft Windows 10 version 21H1 Workstations*](https://www.cyber.gov.au/acsc/view-all-content/publications/hardening-microsoft-windows-10-version-21h1-workstations)
* [Intune Profiles for ACSC Hardening Guidelines](https://github.com/microsoft/Intune-ACSC-Windows-Hardening-Guidelines)
* [Configuration Scripts](https://learn.microsoft.com/mem/intune/apps/intune-management-extension)
* [Remediations](https://learn.microsoft.com/mem/intune/fundamentals/remediations)
* [Microsoft Compliance ACSC Essential Eight](https://learn.microsoft.com/compliance/essential-eight/e8-overview)
* [Microsoft Intune ACSC Windows Hardening Guidelines](https://github.com/microsoft/Intune-ACSC-Windows-Hardening-Guidelines)

