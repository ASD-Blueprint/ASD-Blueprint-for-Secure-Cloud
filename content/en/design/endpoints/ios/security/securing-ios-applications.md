---
title: "Securing iOS applications"
weight: 10
description: "This section describes the design decisions associated with securing applications on iOS endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

Mobile Application Management (MAM) in Intune enables configuration of managed applications within an iOS device. Managed applications enclose organisation applications within an application bubble. This bubble prevents accidental data spillage by preventing cutting and pasting, as well as enabling data sharing within the application bubble.

MAM provides the capability to configure iOS device applications. These configurations include:

* **Managed Applications** – List of organisation business applications.
* **Managed Application configuration** – Configure and secure managed application configuration within the device. These configurations enable and isolate managed applications to reside next to unmanaged applications.
* **Per-app VPN** - Secure communication between applications on devices, and the Office 365 tenant. This will require the organisations VPN device setup to accept communication from the VPN connection from managed apps.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                                      | Design decision                                                                                                                                                                                                                                                                                                  | Justification                                                                                                         |
|-----------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------|
| Managed Applications                                | Microsoft Corporate Portal<br>Microsoft Azure Information Protection<br>Microsoft Word<br>Microsoft Excel<br>Microsoft Outlook<br>Microsoft PowerPoint<br>Microsoft Teams<br>Microsoft Edge<br>Adobe Reader<br>Microsoft OneDrive<br>Microsoft OneNote<br>Microsoft Whiteboard<br>Microsoft Planner<br>PowerApps | This is to meet the organisations requirement for managed applications.                                                    |
| Application VPN configuration                       | Configured for Managed Applications                                                                                                                                                                                                                                                                              | Managed applications will use VPN to secure its connection to the organisations Office 365 tenant.                         |
| Disable organisation data to be backed up to iCloud | Disable                                                                                                                                                                                                                                                                                                          | PROTECTED must be stored within the organisations environment / corporate data store.                                      |
| Encrypt organisation data in mobile device          | Configured                                                                                                                                                                                                                                                                                                       | To ensure encryption requirements are met based on ASD's hardening requirements.                                       |
| Send organisation data to unmanaged apps            | Policy managed apps with Open In/Share Filtering                                                                                                                                                                                                                                                                 | Prevents data to be shared between managed application stated above and other unmanaged application on the device.    |
| Save copies of organisation data                    | SharePoint and OneDrive for Business only                                                                                                                                                                                                                                                                        | Ensure all data is saved within the organisations tenant.                                                                  |
| Organisation data notification                      | Block organisation Data                                                                                                                                                                                                                                                                                          | Prevents organisation information being displayed on the lock screen.                                                 |
| Microsoft Edge Configuration                        | Configured.<br>Set Microsoft Edge proxy and homepage URL to organisations Intranet                                                                                                                                                                                                                                    | Configured so Microsoft Edge is able to access organisations internal websites.                                            |
| Microsoft Outlook                                   | Configured.<br>Ensure Contact list is added into Outlook Contact list rather than device                                                                                                                                                                                                                         | Configured so organisations contact list is maintained within managed application rather than the phone's contact details. |

{{% /alert %}}

### Related information

#### Security & Governance

* [Enterprise Mobility]({{<ref "security-and-governance/system-security-plan/enterprise-mobility.md">}})

#### Design

* [Securing iOS devices]({{<ref "securing-ios-devices.md">}})
* [Endpoint management]({{<ref "design/platform/client">}})

#### Configuration

* [iOS and iPadOS]({{<ref "configuration/intune/apps/by-platform/ios-ipados.md">}})
* [ASD iOS Hardening]({{<ref "configuration/intune/devices/apple-updates/asd-ios-hardening.md">}})

#### References

* None identified