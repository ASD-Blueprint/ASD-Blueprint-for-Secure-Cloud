---
title: "Microsoft Defender"
weight: 5
description: "This section describes the design decisions associated with Microsoft Defender on Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

Microsoft delivers several threat protection and mitigation capabilities in Windows Enterprise devices delivered through Microsoft Defender. These capabilities do not require additional agents and are manageable via Intune Endpoint Protection Profiles. The following details the Microsoft Defender capabilities:

* **Microsoft Defender Antivirus** – Provides anti-malware and spyware protection including always-on scanning, dedicated protection updates and cloud-delivered protection. Integration with Internet Explorer and Microsoft Edge browsers enable real time scanning of files as they are downloaded to detect malicious software.
* **Microsoft Defender Exploit Guard** – Provides Host-based Intrusion Protection System (HIPS) capabilities and replaces the Microsoft Enhanced Mitigation Experience Toolkit (EMET).
* **Microsoft Defender Credential Guard** – Provides virtualisation-based security to isolate credentials to protect against identity theft attacks. Much like Device Guard, Credential Guard uses Virtual Secure Mode (VSM) to isolate processes, in this case the Local Security Authority (LSA). The LSA performs various security operations, including the storage and management of user and system credentials. Unauthorised access to the LSA can lead to credential theft attacks, such as Pass-the-Hash or Pass-The-Ticket.
* **Microsoft Defender Remote Credential Guard** – Provides protection of credentials used over a Remote Desktop connection by redirecting the Kerberos authentication request back to the device requesting the remote connection. Remote Credential Guard cannot be used when connecting to remote desktops that are are not joined to the same Active Directory Domain Services domain as the client, or where there is no trust relationship between the client device and the remote desktop.
* **Microsoft Defender Firewall** – Provides stateful packet inspection and blocking of network traffic. Windows Defender Firewall blocks unauthorized network traffic flowing into and out of the client endpoint reducing the attack surface of the device.
* **Microsoft Defender SmartScreen** – Provides malware and phishing website protection including downloaded files. SmartScreen protects users by performing the following.
  * Analysing webpages for signs of distrustful behaviour and shows a warning page if it identifies suspicious activity.
  * Validates sites against a dynamic list of known phishing and malicious software sites and shows a warning page if it identifies page.
  * Validates downloaded files against a list of known software sites and programs and shows a warning page if it identifies the site or program may be malicious.
  * Validates downloaded files against a list of files that are known and used by a large number of windows users. If not found on the list SmartScreen shows a warning.

Microsoft Defender Exploit guard comprises of the below features:

* **Exploit protection** – Exploit protection applies exploit mitigation mechanisms to applications. Works with third-party antivirus solutions and Windows Defender Antivirus.
* **Attack surface reduction** – Attack Surface Reduction (ASR) rules reduce the attack surface of applications with rules that stop the vectors used by Office, script, and mail-based malware.
* **Network protection** – Network protection extends the malware and social engineering protection offered by Microsoft Defender SmartScreen in Microsoft Edge to cover network traffic and connectivity on organisation devices.
* **Controlled Folder Access** – Controlled folder access protects files in key system folders from changes made by malicious and suspicious apps.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                                       | Design Decision                                                                                                                                                                                                                                                                                                                       | Justification                                                                                                                             |
|------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| Microsoft Defender                                   | Enabled                                                                                                                                                                                                                                                                                                                               | Microsoft Defender will be enabled to align with ASD's [*Hardening Microsoft Windows 10 version 21H1 Workstations*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/hardening-microsoft-windows-10-version-21h1-workstations) guidance.                                                                             |
| Microsoft Defender Capabilities Enabled in the SOE   | Components:<br>Microsoft Defender Antivirus<br>Microsoft Defender Exploit Guard<br>Microsoft Defender Application Control<br>Microsoft Defender SmartScreen<br>Microsoft Defender Credential Guard<br>Microsoft Defender Remote Credential Guard (hybrid only)<br>Microsoft Defender Firewall | Provides required security controls for the SOE.                                                                                          |
| Microsoft Defender Antivirus Exclusions              | Enabled and configured                                                                                                                                                                                                                                                                                                                | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                                        |
| Microsoft Defender Exploit Guard Configuration       | Enabled and configured                                                                                                                                                                                                                                                                                                                | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                                        |
| Microsoft Defender Application Control Configuration | Enabled and configured                                                                                                                                                                                                                                                                                                                | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                                        |
| Microsoft Defender Smart Screen Configuration        | Enabled and configured                                                                                                                                                                                                                                                                                                                | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                                        |
| Microsoft Defender Credential Guard Configuration    | Enabled and configured                                                                                                                                                                                                                                                                                                                | Aligns with security and compliance requirements. Enabled without lock allows Microsoft Defender Credential Guard to be managed remotely. |
| Microsoft Defender Firewall Configuration            | Enabled and configured                                                                                                                                                                                                                                                                                                                | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                                        |

{{% /alert %}}

### Related information

#### Security & Governance

* [Application Control]({{<ref "security-and-governance/essential-eight/application-control.md">}})
* [Essential Eight: Restrict Microsoft Office Macros]({{<ref "restrict-microsoft-office-macros.md">}})

#### Design

* None identified

#### Configuration

* [Microsoft defender settings]({{<ref "configuration/defender/settings">}})
* [Endpoint security policies]({{<ref "configuration/defender/endpoints/configuration-management/endpoint-security-policies.md">}})
* [ASD Windows Hardening Guidelines]({{<ref "configuration/intune/devices/configuration-policies/asd-windows-hardening-guidelines.md">}})

#### References

* None identified