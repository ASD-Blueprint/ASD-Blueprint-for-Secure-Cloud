---
title: Device Configuration
weight: 25
description: "This section describes the design decisions associated with Device Configuration for system(s) built using ASD's Blueprint for Secure Cloud."
---

Device Configuration Profiles provide the ability to control settings and features on supported endpoints. These include device and user settings, browser settings and hardware settings. Device Configuration Profiles can be deployed to specific users or devices by using Entra ID groups.

There are many supported platforms, each of which have several profile sub-types that they offer configuration for. The following platforms are supported:

* Android device administrator
* Android Enterprise
* iOS/iPadOS
* macOS
* Windows Phone 8.1
* Windows 8.1 and later
* Windows 10 and later

Within each platform there are number of profile types allowing many settings to be configured. The profile types and settings that are configurable vary depending on the platform.

In general terms configuration profiles either enable configuration of the device for use by a user, or to enable security of the device through application of controls.

Custom profiles can be created for a platform although this should be considered a last resort if the settings are not available in any other way.

In a co-managed state, these settings may be superfluous to existing Group Policies and Standard Operating Environment (SOE) settings.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point           | Design Decision         | Justification                                                                                  |
|--------------------------|-------------------------|------------------------------------------------------------------------------------------------|
| iOS policies             | Configured              | Microsoft Intune policies are applied easing management.                                       |
| Device security policies | Configured by exception | Security baselines as discussed below provide a better option when the settings are available. |

{{% /alert %}}

### Cloud native deployments

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                | Design Decision | Justification                                            |
|-------------------------------|-----------------|----------------------------------------------------------|
| Windows 10 and later policies | Configured      | Microsoft Intune policies are applied easing management. |

{{% /alert %}}

### Hybrid deployments

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point               | Design Decision | Justification                                                                     |
| ---------------------------- | --------------- | --------------------------------------------------------------------------------- |
| Windows 10 and later polices | Not Configured  | Management solution such as MECM and Group Policy are applied to manage settings. |

{{% /alert %}}

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                                           | Design Decision  | Justification                                                                                                                                                |
| -------------------------------------------------------- | ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Compliance policies controlled by                        | Microsoft Intune | Compliance and remediation policies to controlled via Endpoint Manager.                                                                                      |
| Device Configuration policies controlled by              | Microsoft Intune | Device configuration policies to be controlled via Endpoint Manager.                                                                                         |
| Endpoint Protection policies controlled by               | Microsoft Intune | Endpoint protection, including the Windows Defender products and features are controlled via Endpoint Manager policies.                                      |
| Resource Access policies controlled by                   | Microsoft Intune | Resources in this instance refers to VPN profiles, Wi-Fi profiles, certificate profiles, etc. These resources are  controlled via Endpoint Manager policies. |
| Office Click-to-Run policies controlled by               | Microsoft Intune | Office Click-to-Run application deployment and updates to be managed through Intune.                                                                         |
| Windows Update policies controlled by                    | Microsoft Intune | Windows 10 updates will be managed via Endpoint Manager update rings.                                                                                        |
| Microsoft Endpoint Configuration Manager minimum version | Not Configured   | Devices are not co-managed.                                                                                                                                  |
| Enrolled Device Types                                    | Windows 10 / 11  | The use of Windows 10/11 on designated hardware is mandatory.<br>The following platforms will be disabled:<br>macOS<br>Android<br>iOS                        |
| Device Compliance                                        | Configured       | Device Compliance is enabled. All devices will be Endpoint Manager enrolled and have a custom set of compliance policies applied.                            |
| User Enrolment                                           | Configured       | All users must be enrolled to ensure device compliance.                                                                                                      |
| Company Portal                                           | Configured       | The Company Portal is enabled for application deployment. Applications to be deployed will be set by organisation requirements.                              |
| Conditional Access                                       | Configured       | Conditional Access is enabled. It will leverage device and user compliance to allow or disallow access to the corporate environment.                         |
| Mobile Device Management (MDM)                           | Configured       | Microsoft Intune will be the MDM authority for the solution.                                                                                                 |
| Mobile Application Management (MAM)                      | Configured       | Microsoft Intune will be the MAM authority for the solution.                                                                                                 |

{{% /alert %}}

### Device configuration sets

Different sets of Microsoft Intune Configuration Profiles are used to configure device settings and features based on the security requirements of the activities being performed. These are aligned with the [access roles](/design/platform/identity/roles/):

* **Control Plane** - Highly privileged access for administering the platform.
* **Management Plane** - Privileged Access for deploying and managing workloads and data.
* **User / Application Plane** - Standard access to applications and websites.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point          | Design Decision                                                                                                                                                                                | Justification                                                                                                |
|-------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| `SAW` Configuration Set | Strongest Security - includes limitations on internet access, limited collaboration tools, etc.                                                                                                | Used for Privileged Access Administration where users have access to the highest impact assets and accounts. |
| `SOE` Configuration Set | Enhanced Security - additional limitations on collaboration tools - This profile supports compliance with the ACSC Devices Hardening Guide Recommendations and ISM PROTECTED Security Controls | Used for specialised use cases where users are managing or creating assets (Management Plane).               |

{{% /alert %}}

| Device Configuration Set | Access Roles                                                               |
| ------------------------ | -------------------------------------------------------------------------- |
| `SAW`                    | `Platform Administrators`                                                  |
| `SOE`                    | `Information Workers`, `Remote Developer`, `Local Developer`, `Researcher` |

{{% alert title="Note" color="info" %}}

Users who span different profiles require separate devices, i.e. a `Platform Administrator` would have both a SAW and SOE device.

{{% /alert %}}

### Device configuration set profiles

Endpoint Manager Configuration Profiles apply settings and features to devices. A collection of Configuration Profiles are assigned to devices as a Configuration Set depending on the machine usage. A naming convention is used to indicate which Configuration Profiles belong to which Configuration Set, the device components the settings relate to and the source for the setting.

Microsoft Intune applies settings through different types of Configuration Profiles, some due to legacy profiles (Administrative Templates, Custom Profiles), others due to group settings in other related settings (Microsoft Defender for Endpoint). Where available, Configuration Settings should use the modern `Setting Catalogue` profile type for applying settings. This allows for easier resolution of setting conflicts.

The deployment of the settings, including any conflicts caused by implementation of a setting, can be monitored within Microsoft Intune [Device Profile Monitor.](https://docs.microsoft.com/mem/intune/configuration/device-profile-monitor)

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* [Intune Device Configuration Profiles](https://docs.microsoft.com/mem/intune/configuration/device-profiles)
* [Monitor device configuration profiles in Microsoft Intune](https://docs.microsoft.com/mem/intune/configuration/device-profile-monitor)
