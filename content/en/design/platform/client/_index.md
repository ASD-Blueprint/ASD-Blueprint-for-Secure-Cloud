---
title: Endpoint Management
weight: 20
description: "This section describes the design decisions associated with device enrolment, configuration, application management, security and updates for system(s) built using ASD's Blueprint for Secure Cloud."
---

Microsoft Intune is a Microsoft 365 service that provides Mobile Device Management (MDM) and Mobile Application Management (MAM) capabilities for Apple iOS/iPadOS and macOS, Chrome OS, Android, Linux, and Microsoft Windows devices to enhance security and protection. It is a component of Endpoint Management and Security (EMS) and natively integrates with other EMS components such as Entra ID and Microsoft Purview Information Protection (MPIP). Intune enables management of device security including data access and sharing, and provides enforcement of device configuration to ensure continuous assessment of device protection controls and does this via:

* **Device Enrolment Profiles** - Prior to managing devices in Intune they must be enrolled as either Personal or Corporate devices. These can either be self-enrolled or automatically enrolled.
* **Device Compliance Policies** - Device Compliance Policies are rules, such as device PIN length or encryption requirements, that can be applied to devices. These rules must be met before a device is considered compliant. Device Compliance can then be used by services such as Conditional Access.
* **Device Configuration Profiles** - Device Configuration Profiles provide the ability to control settings and features on supported endpoints. These include device and user settings, browser settings and hardware settings. Device Configuration Profiles can be deployed to specific users or devices in Entra ID groups.
* **Device Security Baselines** - Device Security Baselines are pre-configured groups of Windows settings that are recommended by Microsoft security teams. The security baselines are templates that are used to create a profile that is specific to the environment for deployment.
* **Client Applications** - Client Applications can be delivered to devices registered in Intune based on device type and group membership. Application types that can be distributed include store apps, Microsoft Office suite, Microsoft Edge browser, web links, line of business and Win32 applications. Monitoring of application distribution is provided.
* **Software Updates** - Software Update policies store the configuration of updates without the updates themselves. This prevents the need to approve individual updates enabling a faster turnaround time. Individual policies can be created and targeted to different groups of devices.

When devices are enrolled into Intune, authorised administrators are able to view:
* Hardware details 
* Device usage (how the device is being used)
* Current compliance levels for:
    * Device software
    * Hardware
    * Operating system

Through customisation of the Company Portal, administrators can give end users the ability to install pre-approved applications and launch selected websites. This enables granular visibility of all endpoints within the Enterprise Mobility Management sphere and simplifies the approach for management.

To complement this visibility, an Intune Data Warehouse can be deployed to capture and create custom reports from Intune data using a reporting service. This can help provide insights into operating system and device breakdowns, which users are using Intune, what licences are being used and compliance trends. The Data Warehouse also has the capability to export directly to Power BI and create interactive and dynamic reports.

Clients managed by Microsoft Intune are configured to refresh their status on an 8-hour interval. During this refresh, policy compliance, configuration profile and app assignments are checked. If the client is recently enrolled then the compliance, non-compliance and configuration check-in runs more frequently.

### Cloud native deployments

{{% alert title="Design decisions" color="warning" %}}

| Decision point                                                  | Design decision                                                                                                                                       | Justification                                                                                                                                                                  |
| --------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Co-Management                                                   | Disabled                                                                                                                                              | Co-Management is disabled as this is not a function that is used in a cloud only solution.                                                                                     |
| Enrolled Device Types                                           | Windows 10: 21H2 / 10.0.19044.100 (minimum)<br>iOS: 16 (minimum)<br><br>The following platforms will be prevented from enrolling:<br>macOS<br>Android | As per the Client Devices design.                                                                                                                                              |
| Device Compliance                                               | Enabled                                                                                                                                               | Device Compliance is enabled. All devices will be Intune enrolled and have a custom set of compliance policies applied.                                                        |
| Device Enrolment                                                | Enabled                                                                                                                                               | All users must be enrolled to ensure device compliance.                                                                                                                        |
| Company Portal                                                  | Enabled                                                                                                                                               | The Company Portal is enabled for application deployment. Applications to be deployed will be set by requirements.                                                             |
| Conditional Access                                              | Enabled                                                                                                                                               | Conditional Access is enabled. It will leverage device and user compliance to allow or disallow access to the corporate environment.                                           |
| Mobile Device Management                                        | Enabled                                                                                                                                               | MDM will be used to control what a user can and cannot do on their mobile device defined by policies set by administrators.                                                    |
| Mobile Application Management                                   | Enabled                                                                                                                                               | MAM will be used to ensure that users have access to the apps they need to do their work.                                                                                      |
| Windows Information Protection mode                             | Configured                                                                                                                                            | Default settings prevent copying and pasting of data between 'work' locations and other 'personal' locations.                                                                  |
| Network Boundaries                                              | Cloud resources                                                                                                                                       | Network boundaries create a list of resources that are considered to be on the enterprise network. These boundaries are used to apply policies that reside in these locations. |
| Cloud Resources Protected via Network Boundaries                | SharePoint<br>Office 365                                                                                                                              | Different policies will be created depending on the network location of the client.                                                                                            |
| Intune Data Warehouse                                           | Not enabled                                                                                                                                           | While this feature is available, the Blueprint does not currently provide guidance on the Intune Data Warehouse.                                                               |
| **Self Service Group Management**                               |                                                                                                                                                       |                                                                                                                                                                                |
| Owners can manage group membership requests in the Access Panel | No                                                                                                                                                    | Group creation and modification is to be locked down and controlled by authorised staff, such as service desk staff or Administrators.                                         |
| Restrict access to Groups in the Access Panel                   | No                                                                                                                                                    | Accessing groups is an Administrative function and has been locked down to Administrators.                                                                                     |
| **Security Groups**                                             |                                                                                                                                                       |                                                                                                                                                                                |
| Users can create security groups in Azure portals               | No                                                                                                                                                    | Group creation and modification is to be locked down and controlled by authorised staff, such as service desk staff or Administrators.                                         |
| **Microsoft 365 groups**                                        |                                                                                                                                                       |                                                                                                                                                                                |
| Users can create Microsoft 365 groups in the Azure portals      | No                                                                                                                                                    | Group creation and modification is to be locked down and controlled by authorised staff, such as service desk staff or Administrators.                                         |
| **Directory-wide Groups**                                       |                                                                                                                                                       |                                                                                                                                                                                |
| Enable an "All Users" group in the directory                    | No                                                                                                                                                    | This group is not required. All users to be a member of a controlled group.                                                                                                    |

{{% /alert %}}

### Hybrid deployments

Organisations can integrate their existing Microsoft Endpoint Configuration Manager (MECM) solution with Microsoft Intune using a configuration known as [Co-Management](https://learn.microsoft.com/mem/configmgr/comanage/overview). For a deployment to be enabled for Co-Management, devices must be Entra ID hybrid joined, be enrolled in Microsoft Intune and have the MCM client installed. Once Co-Management is enabled, management tasks such as compliance policies, Windows Update policies, resource access policies, and endpoint protection can be moved from MECM management over to Intune as required.

Microsoft cloud-hosted services offer the benefit of maintaining cadence with the latest technology updates from Microsoft with reduced effort required by IT departments. Microsoft Intune and Microsoft's Co-Management strategy is constantly evolving with additional services published regularly.

Intune deploys and manages first-party Microsoft applications in a simple manner. However, does not allow for large scale customisations of update schedule, granular application deployment or application add-ons. Intune does not provide the ability to deploy and update third-party applications in a simple manner at time of writing.

Intune also provides a patching mechanism which simplifies the deployment of Microsoft first-party updates for applications and Windows 10, but does not allow granular control over patches.

The following figure provides an overview of Co-Management.

{{<figure src="https://learn.microsoft.com/mem/configmgr/comanage/media/co-management-overview.svg" title="Endpoint co-management overview">}}
*Figure reproduced from <https://learn.microsoft.com/mem/configmgr/comanage/overview>*

{{% alert title="Design decisions" color="warning" %}}

| Decision point                              | Design decision                             | Justification                                                                                                                                                                                      |
| ------------------------------------------- | ------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Co-management                               | Enabled                                     | The Microsoft co-management approach will enable the organisation to strategically move device management from on-premises to the cloud in a staged manner.                                        |
| Enrolled Device Types                       | Windows 10: 21H2 / 10.0.19044.100 (minimum) | As per the Client Devices design.<br>Note: iOS is permitted, but controlled by Intune only.                                                                                                         |
| Device Compliance                           | Enabled                                     | Device Compliance is enabled. All devices will be Intune enrolled and have a custom set of compliance policies applied.                                                                            |
| Company Portal                              | Enabled                                     | The Company Portal is enabled for application deployment. Applications to be deployed will be set by the organisation requirements.                                                                |
| Conditional Access                          | Enabled                                     | Conditional Access is enabled. It will leverage device and user compliance to allow or disallow access to the corporate environment.                                                                 |
| Mobile Device Management (MDM)              | Enabled                                     | MECM will be the MDM authority for the solution, with Intune inspecting compliance.                                                                                                                |
| Mobile Application Management (MAM)         | Disabled                                    | Not required as Group Policy will configure application controls.                                                                                                                                  |
| Compliance policies controlled by           | Intune preferred                            | Compliance and remediation policies to controlled via Intune. Staged migration to be completed from MECM if previously in use.                                                                     |
| Device Configuration policies controlled by | Intune preferred                            | Device configuration policies to be controlled via Intune. Staged migration to be completed from MECM if previously in use.                                                                        |
| Endpoint Protection policies controlled by  | Intune preferred                            | Endpoint protection, including the Windows Defender products and features are controlled via Intune policies. Staged migration to be completed from MECM if previously in use.                     |
| Resource Access policies controlled by      | Intune preferred                            | Resources in this instance refers to VPN profiles, Wi-Fi profiles, certificate profiles, etc. are controlled via Intune policies. Staged migration to be completed from MECM if previously in use. |
| Office Click-to-Run policies controlled by  | Intune preferred                            | Office Click-to-Run application deployment and updates to be managed through Intune. Staged migration to be completed from MECM if previously in use.                                              |
| Windows Update policies controlled by       | Intune preferred                            | Windows 10 updates will be managed via Intune update rings. Staged migration to be completed from MECM if previously in use.                                                                       |
| MECM minimum version                        | At least MECM update 1802                   | Compatible with co-management and determined by the organisation.                                                                                                                                  |
| User Enrolment                              | Enabled                                     | All users must be enrolled to ensure device compliance.                                                                                                                                            |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* [Supported operating systems and browsers in Intune](https://learn.microsoft.com/mem/intune/fundamentals/supported-devices-browsers)
* [What is co-management?](https://learn.microsoft.com/mem/configmgr/comanage/overview)
* [Tutorial: Enable co-management for existing Configuration Manager clients](https://learn.microsoft.com/mem/configmgr/comanage/tutorial-co-manage-clients)
