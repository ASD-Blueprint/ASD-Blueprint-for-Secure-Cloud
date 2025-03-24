---
title: "Identity Providers"
weight: 25
description: "This section describes the design decisions associated with identity providers for Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

The identity providers section considers the different methods of logging on to the Windows 10 and 11 device. The local administrator account is addressed in a separate section.
Windows 10 and 11 provides various user account types or identity providers. This section outlines the identity providers that can be implemented for a Windows 10 and 11 device.

* **Local Accounts** - A local account is an account on a single Windows system. Local accounts are not replicated and cannot access corporate resources. They enable access to local storage only. It may be desirable to disable, rename and scramble the passwords for the in-built local accounts.
* **Active Directory Domain** - Domain identities are used to grant access to corporate resources and are implemented using Active Directory Domain Services. Administrators manage domain identities and ensure that users have access to the appropriate resources when group policies or any profile management solution is applied to the account. Domain identities are recommended if personalisation data will be stored in a corporate datacentre and will be synchronised to multiple corporate devices.
* **Microsoft Entra ID** - Microsoft Entra ID is Microsoft's cloud directory and identity management service. Microsoft Entra ID includes a full suite of identity management capabilities. Microsoft Entra ID is a prerequisite for Microsoft Intune mobile device management including Conditional Access.
* **Microsoft Account** - A Microsoft Account is an email address issued by or linked to a Microsoft authentication service. A Microsoft Account is a public version of a Microsoft Entra ID account. If this account is disabled certain features such as Windows Store cannot function.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                                  | Design decision       | Justification                                                                                                                      |
|-------------------------------------------------|-----------------------|------------------------------------------------------------------------------------------------------------------------------------|
| Guest Account (Local)                           | Disabled              | To align with ASD's [*Hardening Microsoft Windows 10 version 21H1 Workstations*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/hardening-microsoft-windows-10-version-21h1-workstations) guidance.                                                                                 |
| Guest Account Name                              | Renamed               | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                                 |
| Microsoft Accounts                              | Disabled              | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                                 |
| Windows Hello for Business                      | Organisation decision | As per ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance, organisations may consider if Windows Hello for Business is suitable for their environment. |
| Windows Hello for Business Configuration Method | Organisation decision | As per ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance, organisations may consider if Windows Hello for Business is suitable for their environment. |

{{% /alert %}}

### Cloud native deployments

{{% alert title="Design decisions" color="warning" %}}

| Decision point                  | Design decision | Justification                               |
|---------------------------------|-----------------|---------------------------------------------|
| Azure Active Directory Accounts | Enabled         | Machines will be Microsoft Entra ID Joined. |
| Domain Accounts                 | Disabled        | Machine will be Microsoft Entra ID Joined.  |

{{% /alert %}}

### Hybrid deployments

{{% alert title="Design decisions" color="warning" %}}

| Decision point                  | Design decision | Justification                                                                                                                                       |
|---------------------------------|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| Azure Active Directory Accounts | Enabled         | Machines will be Hybrid Microsoft Entra ID Joined.                                                                                                  |
| Domain Accounts                 | Enabled         | Users will log onto devices using credentials which originate in an on-premises domain.<br>Machines will also be joined to the organisation domain. |

{{% /alert %}}

### Related information

#### Security & Governance

* [Application Control]({{<ref "security-and-governance/essential-eight/application-control.md">}})
* [Essential Eight: Restrict Microsoft Office Macros]({{<ref "restrict-microsoft-office-macros.md">}})

#### Design

* [Identity Synchronisation]({{<ref "design/platform/identity/synchronisation.md">}})

#### Configuration

* [ASD Windows Hardening Guidelines]({{<ref "configuration/intune/devices/configuration-policies/asd-windows-hardening-guidelines.md">}})

#### References

* None identified