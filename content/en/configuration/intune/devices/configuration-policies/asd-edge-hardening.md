---
title: "ASD Edge hardening"
weight: 005
description: "This section describes the settings for device configuration policies within Microsoft Intune associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the _as built_ configuration for ASD's _Blueprint for Secure Cloud_ (the Blueprint) for the Microsoft Intune portal at the following URL:

<https://intune.microsoft.com/#view/Microsoft_Intune_DeviceSettings/DevicesMenu/~/configuration>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

{{% alert title="Importing policies" color="info" %}}

This configuration policy can be imported.

Download the {{% download file="/content/files/intune-config-policies/AsdEdgeHardening.txt" %}} ASD Edge Hardening {{% /download %}} _.txt_ file and change the extension to _.json_, then select **Create > Import Policy**.

{{% /alert %}}

{{% alert title="Security baselines, policy layering and scope" color="info" %}}

This policy supplements the [Security Baseline for Microsoft Edge](/configuration/intune/endpoint-security/security-baselines/security-baseline-for-microsoft-edge) and does not replicate settings within that baseline.

The settings on this page follow the section order of the [Microsoft Edge for Business](/design/endpoints/applications/microsoft-edge-for-business) design guidance so that each design decision can be traced to its implementing setting. The settings may be separated into other policy contexts to optimise targeting and compliance reporting.

The settings documented on this page represent the baseline configuration for regular users. Privileged users (such as administrators, developers and business-privileged users) require a hardened configuration with stricter controls for session persistence, downloads, extensions and synchronisation.

{{% /alert %}}

### Basics

| Item        |                Value |
| ----------- | -------------------: |
| Name        |   ASD Edge hardening |
| Description |               _None_ |
| Platform    | Windows 10 and later |

### Assignments

#### Included groups

| Item   |       Value |
| ------ | ----------: |
| Groups | All devices |

#### Excluded groups

| Item   |              Value |
| ------ | -----------------: |
| Groups | No groups selected |

### Scope tags

| Item       |   Value |
| ---------- | ------: |
| Scope tags | Default |

### Configuration settings

#### Deployment and updates

| Item                                                                                           | Value                                                                                |
| :--------------------------------------------------------------------------------------------- | :----------------------------------------------------------------------------------- |
| Allow installation                                                                             | Enabled                                                                              |
| - Install Policy (Device)                                                                      | Force Installs (Machine-Wide)                                                        |
| Allow users in the Windows Insider Program to be enrolled in Edge Preview                      | Disabled                                                                             |
| Auto-update check period override                                                              | Enabled                                                                              |
| - Minutes between update checks (Device)                                                       | 60                                                                                   |
| Control updater's communication with the Experimentation and Configuration Service             | Enabled                                                                              |
| - Control updater's communication with the Experimentation and Configuration Service (Device)  | Disable communication with the Experimentation and Configuration Service             |
| Let users update on metered connections                                                        | Enabled                                                                              |
| - Let users update on metered connections (Device)                                             | Metered Updates Allowed                                                              |
| Notify a user that a browser restart is recommended or required for pending updates            | Enabled                                                                              |
| - Notify a user that a browser restart is recommended or required for pending updates (Device) | Required - Show a recurring prompt to the user indicating that a restart is required |
| Relaunch browser quickly when the current version is outdated                                  | Enabled                                                                              |
| - Relaunch browser quickly when the current version is outdated (Device)                       | 7                                                                                    |
| Set the time period for update notifications                                                   | Enabled                                                                              |
| - Set the time period for update notifications (Device)                                        | 86400000                                                                             |
| Target Channel override                                                                        | Enabled                                                                              |
| - Target Channel (Device)                                                                      | Stable                                                                               |
| Update policy override                                                                         | Enabled                                                                              |
| - Policy (Device)                                                                              | Automatic silent updates only                                                        |

#### Developer and debugging controls

| Item                                                                     | Value                                                       |
| :----------------------------------------------------------------------- | :---------------------------------------------------------- |
| Allow remote debugging                                                   | Disabled                                                    |
| Control the availability of developer mode on extensions page            | Enabled                                                     |
| - Control the availability of developer mode on extensions page (Device) | Do not allow the usage of developer mode on extensions page |
| Control where developer tools can be used                                | Enabled                                                     |
| - Control where developer tools can be used (Device)                     | Don't allow using the developer tools                       |

#### Browser integrity protections

| Item                                                                             | Value                                                                                    |
| :------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------- |
| Allow import of data from other browsers on each Microsoft Edge launch           | Disabled                                                                                 |
| Allow importing of autofill form data                                            | Disabled                                                                                 |
| Allow importing of Cookies                                                       | Disabled                                                                                 |
| Allow importing of extensions                                                    | Disabled                                                                                 |
| Allow importing of payment info                                                  | Disabled                                                                                 |
| Allow importing of saved passwords<sup>1</sup>                                   | Disabled                                                                                 |
| Automatically import another browser's data and settings at first run            | Enabled                                                                                  |
| - Automatically import another browser's data and settings at first run (Device) | Disables automatic import, and the import section of the first-run experience is skipped |
| Block access to a list of URLs                                                   | Enabled                                                                                  |
| - Block access to a list of URLs (Device)                                        | `edge://inspect`, `edge://net-export`, `edge://tracing`                                  |
| Configure users ability to override feature flags                                | Enabled                                                                                  |
| - Configure users ability to override feature flags (Device)                     | Prevent users from overriding feature flags                                              |

#### Enhanced Security Mode

| Item                                                                                             | Value                 |
| :----------------------------------------------------------------------------------------------- | :-------------------- |
| Allow users to bypass Enhanced Security Mode                                                     | Disabled              |
| Configure the list of domains for which enhance security mode will always be enforced            | Enabled               |
| - Configure the list of domains for which enhance security mode will always be enforced (Device) | `<high-risk-domains>` |
| Configure the list of domains for which enhance security mode will not be enforced               | Enabled               |
| - Configure the list of domains for which enhance security mode will not be enforced (Device)    | `<trusted-domains>`   |
| Enhance the security state in Microsoft Edge                                                     | Enabled               |
| - Enhance the security state in Microsoft Edge (Device)                                          | Balanced mode         |

#### Microsoft Defender SmartScreen

| Item                                                                                                     | Value               |
| :------------------------------------------------------------------------------------------------------- | :------------------ |
| Configure the list of domains for which Microsoft Defender SmartScreen won't trigger warnings            | Enabled             |
| - Configure the list of domains for which Microsoft Defender SmartScreen won't trigger warnings (Device) | `<trusted-domains>` |
| Enable Microsoft Defender SmartScreen DNS requests                                                       | Enabled             |
| Force Microsoft Defender SmartScreen checks on downloads from trusted sources                            | Enabled             |
| Prevent bypassing Edge Website Typo Protection prompts for sites                                         | Enabled             |

##### Scareware Blocker

| Item                                                                                                                         | Value   |
| :--------------------------------------------------------------------------------------------------------------------------- | :------ |
| Configure Edge Scareware blocker protection<sup>1</sup>                                                                      | Enabled |
| Configure Edge scareware blocker to block sites detected as potential tech scams<sup>1</sup>                                 | Enabled |
| Configure Edge Scareware blocker to share URLs of sites detected as potential tech scams with Microsoft Defender SmartScreen | Enabled |

##### Download security

| Item                              | Value                                                                      |
| :-------------------------------- | :------------------------------------------------------------------------- |
| Allow download restrictions       | Enabled                                                                    |
| - Download restrictions (Device)  | Block potentially dangerous or unwanted downloads and dangerous file types |
| Enable insecure download warnings | Enabled                                                                    |

#### Network and transport security

| Item                                                  | Value                                                                               |
| :---------------------------------------------------- | :---------------------------------------------------------------------------------- |
| Control the mode of DNS-over-HTTPS                    | Enabled                                                                             |
| - Control the mode of DNS-over-HTTPS (Device)         | Disable DNS-over-HTTPS                                                              |
| Control use of insecure content exceptions            | Enabled                                                                             |
| - Control use of insecure content exceptions (Device) | Don't allow any site to load mixed content                                          |
| Intranet Redirection Behavior                         | Enabled                                                                             |
| - Intranet Redirection Behavior (Device)              | Disable DNS interception checks; allow did-you-mean "http://intranetsite/" infobars |

#### Local Network Access restrictions

| Item                                                                            | Value               |
| :------------------------------------------------------------------------------ | :------------------ |
| Allow sites to make network requests to local network endpoints.                | Enabled             |
| - Allow sites to make network requests to local network endpoints. (Device)     | `<allowed-origins>` |
| Allow sites to make network requests to the local device.                       | Enabled             |
| - Allow sites to make network requests to the local device. (Device)            | `<allowed-origins>` |
| Block sites from making network requests to local network endpoints.            | Enabled             |
| - Block sites from making network requests to local network endpoints. (Device) | `*`                 |
| Block sites from making network requests to the local device.                   | Enabled             |
| - Block sites from making network requests to the local device. (Device)        | `*`                 |

#### Extension policy

| Item                                                       | Value                                                                              |
| :--------------------------------------------------------- | :--------------------------------------------------------------------------------- |
| Allow specific extensions to be installed                  | Enabled                                                                            |
| - Allow specific extensions to be installed (Device)       | `<approved-extension-ids>`                                                         |
| Blocklist for extension install types                      | Enabled                                                                            |
| - Blocklist for extension install types (Device)           | `command_line`, `sideload`                                                         |
| Blocks external extensions from being installed            | Enabled                                                                            |
| Configure allowed extension types                          | Enabled                                                                            |
| - Configure allowed extension types (Device)               | `extension`, `theme`                                                               |
| Configure extension management settings                    | Enabled                                                                            |
| - Configure extension management settings (Device)         | `<extension-settings.json>`                                                        |
| Control Manifest v2 extension availability                 | Enabled                                                                            |
| - Control Manifest v2 extension availability (Device)      | Manifest v2 is enabled for forced extensions only                                  |
| Control which extensions are installed silently            | Enabled                                                                            |
| - Control which extensions are installed silently (Device) | `<mandatory-extension-id>;https://edge.microsoft.com/extensionwebstorebase/v1/crx` |

#### Profiles and profile sign-in

| Item                                                                                                            | Value                       |
| :-------------------------------------------------------------------------------------------------------------- | :-------------------------- |
| Browser sign-in settings                                                                                        | Enabled                     |
| - Browser sign-in settings (Device)                                                                             | Enable browser sign-in      |
| Configure whether a user always has a default profile automatically signed in with their work or school account | Enabled                     |
| Enable implicit sign-in                                                                                         | Enabled                     |
| Enable sign-in to Microsoft Edge using non-Microsoft accounts                                                   | Disabled                    |
| Restrict which accounts can be used to sign in to Microsoft Edge                                                | Enabled                     |
| - Restrict which accounts can be used to sign in to Microsoft Edge (Device)                                     | `.*@<organisation.gov.au>$` |

#### Enterprise sync

| Item                                                                          | Value                                                                    |
| :---------------------------------------------------------------------------- | :----------------------------------------------------------------------- |
| Configure the list of types that are excluded from synchronization            | Enabled                                                                  |
| - Configure the list of types that are excluded from synchronization (Device) | `passwords`, `autofill`, `payments`, `history`, `openTabs`, `extensions` |

#### Guest mode and InPrivate browsing

| Item                                                                                     | Value            |
| :--------------------------------------------------------------------------------------- | :--------------- |
| Enable guest mode                                                                        | Disabled         |
| Specify extensions users must allow in order to navigate using InPrivate mode            | Enabled          |
| - Specify extensions users must allow in order to navigate using InPrivate mode (Device) | `<extension-ids>` |

#### Session persistence and exit behaviour

| Item                                                                     | Value                           |
| :----------------------------------------------------------------------- | :------------------------------ |
| Browsing Data Lifetime Settings                                          | Enabled                         |
| - Browsing Data Lifetime Settings (Device)                               | `<browsing-data-lifetime.json>` |
| Clear cached images and files when Microsoft Edge closes<sup>1</sup>     | Disabled                        |
| Continue running background apps after Microsoft Edge closes<sup>1</sup> | Disabled                        |
| Enable startup boost                                                     | Disabled                        |

#### Edge password manager and passkeys

Where a dedicated enterprise password management solution is deployed:

| Item                                                                                         | Value    |
| :------------------------------------------------------------------------------------------- | :------- |
| Allow users to be alerted if their passwords are found to be unsafe                          | Disabled |
| Allow users to get a strong password suggestion whenever they are creating an account online | Disabled |
| Enable AutoFill for addresses                                                                | Disabled |
| Enable AutoFill for payment instruments                                                      | Disabled |
| Enable exporting saved passwords from Password Manager                                       | Disabled |
| Enable saving passkeys to the password manager                                               | Disabled |
| Enable saving passwords to the password manager                                              | Disabled |

Where the Edge password manager is permitted:

| Item                                                                                                         | Value                         |
| :----------------------------------------------------------------------------------------------------------- | :---------------------------- |
| Allow users to be alerted if their passwords are found to be unsafe                                          | Enabled                       |
| Allow users to get a strong password suggestion whenever they are creating an account online<sup>1</sup>     | Enabled                       |
| Configure the list of domains for which the password manager UI (Save and Fill) will be disabled             | Enabled                       |
| - Configure the list of domains for which the password manager UI (Save and Fill) will be disabled (Device)  | `<privileged-portal-domains>` |
| Configures a setting that asks users to enter their device password while using password autofill            | Enabled                       |
| - Configures a setting that asks users to enter their device password while using password autofill (Device) | With device password          |
| Enable AutoFill for addresses<sup>1</sup>                                                                    | Enabled                       |
| Enable AutoFill for payment instruments                                                                      | Disabled                      |
| Enable exporting saved passwords from Password Manager                                                       | Disabled                      |
| Enable saving passkeys to the password manager                                                               | Disabled                      |
| Enable saving passwords to the password manager<sup>1</sup>                                                  | Enabled                       |

#### User experience and compatibility

| Item                                                          | Value                                                                                                                      |
| :------------------------------------------------------------ | :------------------------------------------------------------------------------------------------------------------------- |
| Action to take on Microsoft Edge startup                      | Enabled                                                                                                                    |
| - Action to take on Microsoft Edge startup (Device)           | Open a list of URLs                                                                                                        |
| Block third party cookies                                     | Enabled                                                                                                                    |
| Block tracking of users' web-browsing activity<sup>1</sup>    | Enabled                                                                                                                    |
| - Block tracking of users' web-browsing activity (Device)     | Balanced (blocks harmful trackers and trackers from sites user has not visited; content and ads will be less personalized) |
| Configure Internet Explorer integration                       | Enabled                                                                                                                    |
| - Configure Internet Explorer integration (Device)            | Internet Explorer mode                                                                                                     |
| Configure the Enterprise Mode Cloud Site List                 | Enabled                                                                                                                    |
| - Configure the Enterprise Mode Cloud Site List (Device)      | `<site-list-guid>`                                                                                                         |
| Configure the home page URL                                   | Enabled                                                                                                                    |
| - Configure the home page URL (Device)                        | `https://<intranet>`                                                                                                       |
| Default search provider name                                  | Enabled                                                                                                                    |
| - Default search provider name (Device)                       | `<search-provider-name>`                                                                                                   |
| Default search provider search URL                            | Enabled                                                                                                                    |
| - Default search provider search URL (Device)                 | `<search-provider-url>`                                                                                                    |
| Enable clipboard suggestions in the address bar               | Disabled                                                                                                                   |
| Enable Microsoft Bing trending suggestions in the address bar | Disabled                                                                                                                   |
| Enable search suggestions                                     | Disabled                                                                                                                   |
| Enable the default search provider                            | Enabled                                                                                                                    |
| Restrict exposure of local IP address by WebRTC               | Enabled                                                                                                                    |
| - Restrict exposure of local IP address by WebRTC (Device)    | Allow public interface over http default route. This doesn't expose the local IP address                                   |
| Set the new tab page as the home page                         | Disabled                                                                                                                   |
| Sites to open when the browser starts                         | Enabled                                                                                                                    |
| - Sites to open when the browser starts (Device)              | `https://<intranet>`                                                                                                       |

#### The Edge sidebar

| Item                     | Value    |
| :----------------------- | :------- |
| Enable open in sidebar   | Disabled |
| Enable sidebar customize | Disabled |
| Show Hubs Sidebar        | Disabled |

#### Feature minimisation and interface reduction

| Item                                                                                                                                | Value                                 |
| :---------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------ |
| Ads setting for sites with intrusive ads<sup>1</sup>                                                                                | Enabled                               |
| - Ads setting for sites with intrusive ads (Device)                                                                                 | Block ads on sites with intrusive ads |
| Allow feature recommendations and browser assistance notifications from Microsoft Edge                                              | Disabled                              |
| Allow Microsoft content on the new tab page                                                                                         | Disabled                              |
| Allow websites to query for available payment methods                                                                               | Disabled                              |
| Choose whether users can receive customized background images and text, suggestions, notifications, and tips for Microsoft services | Disabled                              |
| Configure if the ads transparency feature is enabled                                                                                | Disabled                              |
| Configure the background types allowed for the new tab page layout                                                                  | Enabled                               |
| - Configure the background types allowed for the new tab page layout (Device)                                                       | Disable all background image types    |
| Enable Google Cast                                                                                                                  | Disabled                              |
| Enable tab organization suggestions                                                                                                 | Disabled                              |
| Enable upload files from mobile in Microsoft Edge desktop                                                                           | Disabled                              |
| Enable Workspaces                                                                                                                   | Disabled                              |
| Enables default browser settings campaigns                                                                                          | Disabled                              |
| Enables Microsoft Edge mini menu                                                                                                    | Disabled                              |
| Hide App Launcher on Microsoft Edge new tab page                                                                                    | Disabled                              |
| Hide the default top sites from the new tab page                                                                                    | Enabled                               |
| Shopping in Microsoft Edge Enabled                                                                                                  | Disabled                              |
| Show Microsoft Rewards experiences                                                                                                  | Disabled                              |
| Visual search enabled                                                                                                               | Disabled                              |

##### Browser-native AI features

| Item                                                                                                                                                                            | Value                 |
| :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | :-------------------- |
| Allow pages to use the built-in AI APIs.                                                                                                                                        | Disabled              |
| Automatically open Copilot side pane with contextual insights for links opened from Outlook                                                                                     | Disabled              |
| Compose is enabled for writing on the web                                                                                                                                       | Disabled              |
| Control access to AI-enhanced search in History                                                                                                                                 | Disabled              |
| Control Copilot access to Microsoft Edge page content, browsing history, and video transcript for Entra account user profiles when using Copilot in the Microsoft Edge sidepane | Disabled              |
| Control Copilot access to page context for Microsoft Entra ID profiles                                                                                                          | Disabled              |
| Control whether Microsoft 365 Copilot Chat shows in the Microsoft Edge for Business toolbar                                                                                     | Enabled               |
| Controls the availability of browsing with Copilot in Microsoft Edge.<sup>1</sup>                                                                                               | Disabled              |
| Enable Copilot address bar suggestions                                                                                                                                          | Disabled              |
| Enable the Copilot new tab page<sup>1</sup>                                                                                                                                     | Disabled              |
| Enables DALL-E themes generation                                                                                                                                                | Disabled              |
| Settings for GenAI local foundational model                                                                                                                                     | Enabled               |
| - Settings for GenAI local foundational model (Device)                                                                                                                          | Do not download model |

#### Diagnostic data and telemetry

| Item                                                                                   | Value                                                                    |
| :------------------------------------------------------------------------------------- | :----------------------------------------------------------------------- |
| Allow features to download assets from the Asset Delivery Service                      | Disabled                                                                 |
| Allow personalization of ads, search and news by sending browsing history to Microsoft | Disabled                                                                 |
| Allow user feedback                                                                    | Disabled                                                                 |
| Control communication with the Experimentation and Configuration Service               | Enabled                                                                  |
| - Control communication with the Experimentation and Configuration Service (Device)    | Disable communication with the Experimentation and Configuration Service |
| Edge 3P SERP Telemetry Enabled                                                         | Disabled                                                                 |
| Enable resolution of navigation errors using a web service                             | Disabled                                                                 |
| Enable Windows to search local Microsoft Edge browsing data                            | Disabled                                                                 |
| Send required and optional diagnostic data about browser usage                         | Enabled                                                                  |
| - Send required and optional diagnostic data about browser usage (Device)              | Off (Not recommended)                                                    |
| Suggest similar pages when a webpage can't be found                                    | Disabled                                                                 |
| URL reporting in Edge diagnostic data enabled                                          | Disabled                                                                 |

#### Edge WebView2

| Item                                                                                | Value                                                                    |
| :---------------------------------------------------------------------------------- | :----------------------------------------------------------------------- |
| Control communication with the Experimentation and Configuration Service            | Enabled                                                                  |
| - Control communication with the Experimentation and Configuration Service (Device) | Disable communication with the Experimentation and Configuration Service |
| Update policy override                                                              | Enabled                                                                  |
| - Update policy override (Device)                                                   | Always allow updates                                                     |

1: The setting matches the default (not configured) but removes the ability of a user to change it.

### Related information

#### Security and governance

- [User application hardening](/security-and-governance/system-security-plan/system-hardening-user-apps)
- [Enterprise mobility](/security-and-governance/system-security-plan/enterprise-mobility)
- [Essential Eight - Application control](/security-and-governance/essential-eight/application-control)
- [Essential Eight - Patch applications](/security-and-governance/essential-eight/patch-applications)
- [System management](/security-and-governance/system-security-plan/system-management)
- [System monitoring](/security-and-governance/system-security-plan/system-monitoring)

#### Design

- [Microsoft Edge for Business](/design/endpoints/applications/microsoft-edge-for-business)

#### Configuration

- [Security Baseline for Microsoft Edge](/configuration/intune/endpoint-security/security-baselines/security-baseline-for-microsoft-edge)

#### References

- [Microsoft Edge - Policies](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-policies)
- [Microsoft Edge - Update policies](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-update-policies)
- [Microsoft Edge WebView2 - Policies](https://learn.microsoft.com/en-au/deployedge/microsoft-edge-webview-policies)
