---
title: "Operational Support"
weight: 100
description: "This section describes the design decisions associated with operational support for Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

Windows 10 and 11, and supporting management tools, offer various Standard Operating Environment (SOE) support features to allow support personnel to access a machine remotely or provide users with the option to perform automated repairs. The following support components are available to support Windows 10 and 11:

* **Intune** – Intune can remotely wipe, reset and remove a device from Microsoft Entra ID. These functions are controlled by role-based administration, permitting only certain administrators to control these settings.
* **Windows Remote Management (WinRM)** – WinRM is the Microsoft implementation of the WS-Management Protocol, a standard Simple Object Access Protocol (SOAP) based, firewall-friendly protocol that allows hardware and Operating Systems from different vendors to interoperate.
* **WS-Management protocol** - The WS-Management protocol specification provides a common way for systems to access and exchange management information across an IT infrastructure. WinRM and Intelligent Platform Management Interface (IPMI), along with the Event Collector are components of the Windows Hardware Management features.
* **Windows Remote Assistance** – Windows Remote Assistance in Windows uses the Remote Desktop Protocol (RDP) protocol to provide a Remote Desktop connection that is interactive between the locally logged on user and a remote user.
* **Remote Desktop** – Remote Desktop enables a user to remotely logon interactively to a workstation from another computer with a supported Remote Desktop client.
* **Remote Control** – Remote control options are limited to the following:
  * TeamViewer which is a paid service that fully integrates in Intune.
  * Remote Control within Microsoft Endpoint Configuration Manager (MECM) is this is configured in a hybrid deployment.
  * Microsoft Teams assuming the user can share the desktop.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point            | Design Decision | Justification                                                                                                                                                                                                 |
|---------------------------|-----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Intune                    | Enabled         | Intune management functions cannot be disabled when a device is enrolled in Intune and Microsoft Entra ID.                                                                                                    |
| WinRM                     | Enabled         | To meet operating support requirements for the organisation. Consideration should be made to harden the use of WinRM in the organisation environment to increase the security of Windows 10 and 11 endpoints. |
| Windows Remote Assistance | Disabled        | To align with ASD's [*Hardening Microsoft Windows 10 version 21H1 Workstations*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/hardening-microsoft-windows-10-version-21h1-workstations) guidance and reduce the attack surface.                                                                                                                           |
| Remote Desktop            | Disabled        | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance and reduce the risk of unauthorised access by a malicious actor.                                                                                                     |
| Remote Desktop Client     | Enabled         | The Remote Desktop Client will be enabled for Windows 10 and 11 devices to enable access to remote services (e.g., servers).                                                                                  |
| Remote Control via Teams  | Enabled         | Users can share the desktop within the Microsoft Teams application.                                                                                                                                           |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* None identified