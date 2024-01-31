---
title: Device Enrolment
weight: 10
description: "This section describes the design decisions associated with Device Enrolment for system(s) built using ASD's Blueprint for Secure Cloud."
---

Device enrolment registers the Windows 10 and iOS devices into the corporate device management solution and ensures the device is then able to be managed by administrators.

Microsoft Intune provides a mechanism for enrolling devices into Entra ID. Once registered the device is populated into Intune policy groups using dynamic membership. This ensures that the device meets the compliance policy, is monitored and secured to an organisation's security requirements.

Microsoft Intune provides three separate experiences to enrol iOS devices into Entra ID:

1. **Device Enrolment Program (DEP)** - This experience provides a managed device enrolment process. The device serial number is registered with Apple Business Manager which then allows Microsoft Intune to bypass assisted setup by preconfigured device settings. The user's account will be assigned to the device and the device will be marked as a `supervised` device.
2. **Device Enrolment Manager (DEM)** - The DEM experience assigns a single Entra ID account as the owner of the device. End users cannot administer or purchase any apps on the device.
3. **User Enrolment** - The user enrolment process requires users to setup an iOS device and manually install the Company Portal app. This registers the device as a Microsoft Intune enrolled device. The device will be marked as a Bring Your Own Device object.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point           | Design Decision                             | Justification                                                                                                                                                                                                                                                        |
| ------------------------ | ------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Windows Enrolment Method | Automated Enrolment using Windows Autopilot | Windows 10/11 devices must be enrolled in Microsoft Intune prior to management of the device. Devices are reset to Factory Defaults, the device is associated to a user and the users cannot un-enrol the device (i.e. remove the Mobile Device Management (MDM) profile). |
| iOS Enrolment            | Configured                                  | iOS devices must be enrolled in Microsoft Intune prior to management of the device.                                                                                                                                                                                  |

{{% /alert %}}

### Windows Autopilot Overview

Windows Autopilot provides the ability to set up and pre-configure new devices. It is also possible to use Windows Autopilot to reset, repurpose and recover devices.

Windows Autopilot provides the ability to:

* **Automatically join devices** - Entra ID
* **Auto-enrol devices** - Auto-enrol MDM services, such as Microsoft Intune
* **Restrict the Administrator** - Restrict administrator account creation
* **Create and auto-assign devices** - Auto assign to configuration groups based on a device profile

Autopilot can be deployed based on a number of scenarios:

* **User-Driven** - Deploy and configure devices so that an end user can set it up for themselves.
* **Self Deploying** - Deploy devices to be automatically configured for shared use, as a kiosk, or as a digital signage device.
* **Autopilot reset** - Redeploy a device in a business-ready state when assigning a previously used device to another user.
* **Pre-provisioning** (White Glove) - This splits the autopilot process into two separate parts in order to reduce the time to set up for end users by performing the first half of the setup prior to the user receiving the device. In this scenario either the Original Equipment Manufacturer (OEM), partner, or an organisation's IT department can pre-provision device apps, settings, and policies. When the user receives the device the process will finish the autopilot configuration applying the user applications, settings, and policies.

### Windows build image

Where organisations wish to build from a "trusted image" rather than a manufacturers base/recovery image, which often contains unwanted "bloatware", the organisation will need to build a base image using the [Microsoft Deployment Toolkit (MDT)](https://learn.microsoft.com/windows/deployment/deploy-windows-mdt/get-started-with-the-microsoft-deployment-toolkit). This method will additionally enable fine grained control over installed drivers. Devices from the factory must be re-imaged using this process before the autopilot pre-provisioning process is kicked off.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                           | Design Decision | Justification                                                                                                                                                                                                                                                                                          |
| ---------------------------------------- | --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Automatically Join Devices               | Entra ID        | Devices will automatically join organisation Entra ID                                                                                                                                                                                                                                                  |
| Auto-enrol devices                       | Configured      | Enrolled automatically into Microsoft Intune                                                                                                                                                                                                                                                           |
| Restrict the Local Administrator Account | Configured      | Aligns with the ASD's [*Hardening Microsoft Windows 10 version 21H1 Workstations*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/hardening-microsoft-windows-10-version-21h1-workstations) guidance. |
| Create and auto-assign devices           | Configured      | For ease of management and enrolment of devices within the organisation                                                                                                                                                                                                                               |
| Deployment profile                       | Configured      | Deployment profile will ensure that all workstations are configured in accordance with an organisation's standards with no user intervention                                                                                                                                                            |

{{% /alert %}}

### Access requirements for autopilot enrolment

In order to pre-provision a device a user needs specific rights to enrol the device. Organisations will need to create a privileged group within Entra ID and assign administrator accounts as eligible for elevation to this group, requiring them to activate these rights through Privileged Identity Manager (PIM). The privileged group must be assigned to a Microsoft Intune role which has the `Enrolment Program` permission to provide least privileged access for the accounts to Microsoft Intune.

The privileged group should also be excluded from the [Conditional Access policies]({{<ref "design/platform/identity/conditional-access#conditional-access-policies">}}) `Allow access from compliant iOS devices`, `Allow access from compliant Windows devices`, `Block non-trusted IPs` and `Block privileged user access from non-SAW` to allow device registration from a non organisation managed devices. Devices are considered as non-organisation managed devices until they are enrolled.

Finally, the group should be assigned as a user to the `Microsoft Graph PowerShell` application. This will enable the relevant enrolment script to access Microsoft Graph as part of the manual enrolment process. Platform Administrators will need to grant consent to users for the Graph permission. Granting consent is a one off operation that will be required the first time a user enrols a device. Users can "request consent" which then triggers an approval process for a Platform Administrator to action and approve via the Enterprise Applications Admin Consent Requests portal.

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* [Device Enrolment Overview](https://docs.microsoft.com/mem/intune/enrollment/device-enrollment)
* [Autopilot Overview](https://docs.microsoft.com/mem/autopilot/windows-autopilot)
* [Autopilot Pre-provisioning](https://docs.microsoft.com/mem/autopilot/pre-provision)
* [Autopilot Deployment Process](https://docs.microsoft.com/mem/autopilot/deployment-process)
