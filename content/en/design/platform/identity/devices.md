---
title: Device Management
weight: 65
description: "This section describes the design decisions associated with device identities for system(s) built using ASD's Blueprint for Secure Cloud."
---

A device identity is an object within Microsoft Entra ID. This device object is similar to users, groups or applications. The device identity gives administrators information for use when making access or configuration decisions. Registering and joining devices to Entra ID gives users seamless sign-on to cloud-based resources.

There are three ways to get a device identity:

* Entra ID registration.
* Entra ID join.
* Hybrid Entra ID join.

Device identities are a prerequisite for scenarios such as device-based [Conditional Access]({{<ref "conditional-access">}}) policies and Mobile Device Management with Microsoft Intune.

Devices can be:

* **Deleted** - Prevents a device from accessing Entra ID resources. Removes all details that are attached to the device, for example, BitLocker keys for Windows devices.
* **Disabled** - Prevents a device from successfully authenticating with Entra ID, thereby preventing the device from accessing Entra ID resources that are protected by device-based Conditional Access or using Windows Hello for Business credentials.

Devices can also have their BitLocker keys viewed or copied.

The process of registering and joining devices can be controlled by configuring the following device settings:

* **Users may join devices to Entra ID** - This setting enables organisations to select the users who can register their devices as Entra ID joined devices.
* **Users may register their devices with Entra ID** - This setting may need to be configured to enable Windows personal, iOS, Android, and macOS devices to be registered with Entra ID.
    * Devices to be Entra ID joined or Entra ID registered require Multi-Factor Authentication (MFA). This should be set to No if using Conditional Access policy to require MFA.
* **Maximum number of devices** - This setting enables organisations to select the maximum number of Entra ID joined or Entra ID registered devices that a user can have in Entra ID.

A stale device is a device that has been registered with Entra ID, but has not been used to access any cloud apps for a specific time-frame. This can be used to identify inactive devices and retire them using Endpoint Manager, before disablement and deletion. Deleting an Entra ID device does not remove registration on the client. It will only prevent access to resources using the device as an identity (e.g. Conditional Access).

With Windows 10 and 11, Entra ID users gain the ability to securely synchronise their user settings and application settings data to the cloud. Enterprise State Roaming provides users with a unified experience across their Windows devices and reduces the time needed for configuring a new device.

{{% alert title="Design Decisions" color="warning" %}}
| Decision Point              | Design Decision                                           | Justification                                                                                                                              |
|-----------------------------|-----------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------|
| Device Capture              | AD join only                                              | Allow only organisation owned and managed devices access to the platform. Single Sign-on (SSO) enabled.                                    |
| Provisioning                | [Windows Autopilot]({{<ref "device-enrolment">}})         | Automated enrolment                                                                                                                        |
| Enterprise State Roaming    | None                                                      | Users issued a single device, roaming across devices not required                                                                          |
| Mobile Device Management    | [Microsoft Intune]({{<ref "client">}})                    | Automated management                                                                                                                       |
| MFA                         | No                                                        | MFA enforced through Conditional Access policy                                                                                             |
| Stale Devices               | Organisational decision                                     | Remove inactive devices.<br>When configuring this setting, organisations should take into account shutdown periods, annual leave, and risk |
| Local Device Administrators | None Configured - Cloud LAPS to be implemented on release | Device administration managed through Endpoint Manager                                                                                     |
| VM Integration              | Enforce                                                   | Reduce reliance on local administrator credentials                                                                                         |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* [Conditional Access]({{<ref "conditional-access">}})
* [Device Enrolment]({{<ref "device-enrolment">}})
* [Register the Device ID]({{<ref "device-enrolment#windows-autopilot-overview">}})

#### Configuration

* None identified

#### References

* [Device Management Overview](https://learn.microsoft.com/entra/identity/devices/overview)
* [Manage Devices](https://learn.microsoft.com/entra/identity/devices/manage-device-identities)
* [Stale Devices](https://learn.microsoft.com/entra/identity/devices/manage-stale-devices)
