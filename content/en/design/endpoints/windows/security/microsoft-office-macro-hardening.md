---
title: "Microsoft Office Macro Hardening"
weight: 45
description: "This section describes the design decisions associated with Microsoft Office macros on Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

Microsoft Office files can include Visual Basic for Applications (VBA) programming code (macro) embedded into the document.

A macro can comprise of several repeatable actions that can be coded or recorded and rerun later to automate repetitive tasks. Macros are powerful tools that can be easily created by novice users to greatly improve their productivity. However, an adversary can also create macros to perform a variety of malicious activities, such as assisting in the compromise of workstations to exfiltrate or deny access to sensitive information.

ASD's provides guidelines in securing systems against malicious macros and recommend they are implemented in all Windows environments. ASD's recommends that one of the following approaches is implemented:

* All macros are disabled.
* Only macros from trusted locations or sandboxed environment are enabled.
* Only macros digitally signed by trusted publishers are enabled.

Where trusted locations are used, ASD's recommends that when using trusted locations, only privileged users that are responsible for validating that the macros are free from malicious code can write to and modify contents within the trusted location. 

Microsoft Office products can log macro execution attempts (both successful and failures) by enabling the Trust Center logging feature. This provides valuable information for incident response and digital forensics activities. The Trust Center logs are not written to the Windows Event Log but instead as an individual file per Microsoft Office product to the C:\Users\USERNAME\AppData\Local\Microsoft\Office\TCDiag directory.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point          | Design Decision                                                 | Justification                                                                                                                                        |
|-------------------------|-----------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| Implementation approach | Only macros digitally signed by a trusted publisher are enabled | To align with ASD's [*Restricting Microsoft Office Macros*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/restricting-microsoft-office-macros) guidance and enable organisations to leverage macros securely with the least business impact. |
| Macro execution logging | Enabled via Trust Center logging                                | To align with ASD's [*Essential Eight*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/essential-eight) and provide detailed logs in the event of an incident.                                                             |
| Configuration method    | Organisation preference                                         | Macro hardening (including ASR rules) can be configured via either Group Policies or Intune.                                                         |
| Specific configuration  | See below                                                       | To align with the ASD's *Restricting Microsoft Office Macros* guidance.                                                                                     |


* Microsoft Office Security Settings
  * Automation Security: Enabled (Use application macro security level)
  * Disable all Trust Bar notifications for security issues: Enabled
  * Disable VBA for Office applications: Disabled
  * Macro Runtime Scan Scope: Enable for all documents
  * Allow mix of policy and user locations: Disabled
* Microsoft Access 
  * Turn off trusted documents: Enabled
  * Turn off Trusted Documents on the network: Enabled
  * VBA Macro Notification Settings: Enabled (Disable all except digitally signed macros)
  * Allow Trusted Locations on the network: Disabled
  * Disable all trusted locations: Enabled
  * Disable commands: Enabled (19092)
* Microsoft Excel 
  * Disable commands: Enabled (19092)
  * Scan encrypted macros in Excel Open XML workbooks: Scan encrypted macros (default)
  * Block macros from running in Office files from the Internet: Enabled
  * Trust access to Visual Basic Project: Disabled
  * Turn off trusted documents: Enabled
  * Turn off Trusted Documents on the network: Enabled
  * VBA Macro Notification Settings: Enabled (Disable all except digitally signed macros)
  * Allow Trusted Locations on the network: Disabled
  * Disable all trusted locations: Enabled
* Microsoft Outlook 
  * Disable commands: Enabled (19092)
  * Apply macro security settings to macros, add-ins and additional actions: Enabled
  * Security settings for macros: Enabled (Security Level: Warn for signed, disable unsigned)
* Microsoft PowerPoint 
  * Disable commands: Enabled (19092)
  * Scan encrypted macros in PowerPoint Open XML presentations: Scan encrypted macros (default)
  * Block macros from running in Office files from the Internet: Enabled
  * Trust access to Visual Basic Project: Disabled
  * Turn off trusted documents: Enabled
  * Turn off Trusted Documents on the network: Enabled
  * VBA Macro Notification Settings: Enabled (Disable all except digitally signed macros)
  * Allow Trusted Locations on the network: Disabled
  * Disable all trusted locations: Enabled
* Microsoft Project 
  * Allow Trusted Locations on the network: Disabled
  * Disable all trusted locations: Enabled
  * VBA Macro Notification Settings: Enabled (Disable all except digitally signed macros)
* Microsoft Publisher 
  * Disable commands: Enabled (19092)
  * Publisher Automation Security Level: Enabled (By UI (prompted))
  * VBA Macro Notification Settings: Enabled (Disable all except digitally signed macros)
* Microsoft Visio 
  * Disable commands: Enabled (19092)
  * Enable Microsoft Visual Basic for Applications project creation: Disabled
  * Load Microsoft Visual Basic for Applications projects from text: Disabled
  * Allow Trusted Locations on the network: Disabled
  * Block macros from running in Office files from the Internet: Enabled
  * Disable all trusted locations: Enabled
  * Turn off trusted documents: Enabled
  * Turn off Trusted Documents on the network: Enabled
  * VBA Macro Notification Settings: Enabled (Disable all except digitally signed macros)
* Microsoft Word 
  * Disable commands: Enabled (19092)
  * Scan encrypted macros in Word Open XML documents: Scan encrypted macros (default)
  * Block macros from running in Office files from the Internet: Enabled
  * Trust access to Visual Basic Project: Disabled
  * Turn off trusted documents: Enabled
  * Turn off Trusted Documents on the network: Enabled
  * VBA Macro Notification Settings: Enabled (Disable all except digitally signed macros)
  * Allow Trusted Locations on the network: Disabled
  * Disable all trusted locations: Enabled

  {{% /alert %}}

### Related information

#### Security & Governance

* [Microsoft Office Macro Hardening]({{<ref "security-and-governance/essential-eight/restrict-microsoft-office-macros.md">}})
* [Application Control]({{<ref "security-and-governance/essential-eight/application-control.md">}})
* [User Application Hardening]({{<ref "system-hardening-user-apps.md">}})
* [Essential Eight: Restrict Microsoft Office Macros]({{<ref "restrict-microsoft-office-macros.md">}})

#### Design

* None identified

#### Configuration

* [Microsoft Office Macro Hardening]({{<ref "design/endpoints/windows/security/microsoft-office-macro-hardening.md">}})
* [Attack Surface Reduction]({{<ref "configuration/intune/endpoint-security/attack-surface-reduction/asd-windows-hardening-asr.md">}})

#### References

* None identified