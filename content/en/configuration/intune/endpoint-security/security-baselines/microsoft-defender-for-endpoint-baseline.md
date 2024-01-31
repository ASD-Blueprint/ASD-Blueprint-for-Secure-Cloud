---
Title: Microsoft Defender for Endpoint Baseline
weight: 20
description: "This section describes the configuration of security baselines within Microsoft Intune associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Intune portal blade at the following URL:

https://intune.microsoft.com/#view/Microsoft_Intune_Workflows/SecurityManagementMenu/~/securityBaselines
 
The settings described in these tables should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

### Basics

| Item        |                                    Value |
| ----------- | ---------------------------------------: |
| Name        | Microsoft Defender for Endpoint baseline |
| Description |                                          |
| Platform    |                     Windows 10 and later |

### Assignments

| Item            | Value |
| --------------- | ----: |
| Included groups |       |
| Excluded groups |       |

### Configuration settings

#### Attack Surface Reduction Rules

| Item                                                                                      |          Value |
| ----------------------------------------------------------------------------------------- | -------------: |
| Block Office communication apps from creating child processes                             | Not configured |
| Block Adobe Reader from creating child processes                                          | Not configured |
| Block Office applications from injecting code into other processes                        | Not configured |
| Block Office applications from creating executable content                                | Not configured |
| Block JavaScript or VBScript from launching downloaded executable content                 | Not configured |
| Enable network protection                                                                 | Not configured |
| Block untrusted and unsigned processes that run from USB                                  | Not configured |
| Block credential stealing from the Windows local security authority subsystem (lsass.exe) | Not configured |
| Block executable content download from email and webmail clients                          | Not configured |
| Block all Office applications from creating child processes                               | Not configured |
| Block execution of potentially obfuscated scripts (js/vbs/ps)                             | Not configured |
| Block Win32 API calls from Office macro                                                   | Not configured |

#### BitLocker

| Item                                                                        |          Value |
| --------------------------------------------------------------------------- | -------------: |
| BitLocker system drive policy                                               | Not configured |
| Standby states when sleeping while on battery                               | Not configured |
| Standby states when sleeping while plugged in                               | Not configured |
| Enable Full disk or Used Space only encryption for OS and fixed data drives | Not configured |
| BitLocker fixed drive policy                                                | Not configured |
| BitLocker removable drive policy                                            | Not configured |

#### Device Guard

| Item                     |                 Value |
| ------------------------ | --------------------: |
| Turn on Credential Guard | Enable with UEFI lock |

#### Device Installation

| Item                                                |          Value |
| --------------------------------------------------- | -------------: |
| Block hardware device installation by setup classes | Not configured |

#### DMA Guard

| Item                                                                    |          Value |
| ----------------------------------------------------------------------- | -------------: |
| Enumeration of external devices incompatible with Kernel DMA Protection | Not configured |

#### Firewall

| Item                                                                     |          Value |
| ------------------------------------------------------------------------ | -------------: |
| Stateful File Transfer Protocol (FTP)                                    |       Disabled |
| Number of seconds a security association can be idle before it's deleted |            300 |
| Preshared key encoding                                                   |           UTF8 |
| Certificate revocation list (CRL) verification                           | Not configured |
| Packet queuing                                                           | Not configured |
| Firewall profile private                                                 |      Configure |
| - Inbound connections blocked                                            |            Yes |
| - Unicast responses to multicast broadcasts required                     |            Yes |
| - Outbound connections required                                          | Not configured |
| - Inbound notifications blocked                                          | Not configured |
| - Global port rules from group policy merged                             | Not configured |
| - Firewall enabled                                                       |        Allowed |
| - Authorized application rules from group policy not merged              | Not configured |
| - Connection security rules from group policy not merged                 |            Yes |
| - Incoming traffic required                                              |            Yes |
| - Policy rules from group policy not merged                              |            Yes |
| Firewall profile public                                                  |      Configure |
| - Inbound connections blocked                                            |            Yes |
| - Unicast responses to multicast broadcasts required                     |            Yes |
| - Outbound connections required                                          | Not configured |
| - Authorized application rules from group policy merged                  | Not configured |
| - Inbound notifications blocked                                          | Not configured |
| - Global port rules from group policy merged                             | Not configured |
| - Firewall enabled                                                       |        Allowed |
| - Connection security rules from group policy not merged                 |            Yes |
| - Incoming traffic required                                              |            Yes |
| - Policy rules from group policy not merged                              |            Yes |
| Firewall profile domain                                                  | Not configured |

#### Microsoft Defender

| Item                                                                        |                           Value |
| --------------------------------------------------------------------------- | ------------------------------: |
| Turn on real-time protection                                                |                  Not configured |
| Additional amount of time (0-50 seconds) to extend cloud protection timeout |                              50 |
| Scan all downloaded files and attachments                                   |                  Not configured |
| Scan type                                                                   |                      Quick scan |
| Defender schedule scan day                                                  |                        Everyday |
| Scheduled scan start time                                                   |                  Not configured |
| Defender sample submission consent                                          | Send safe samples automatically |
| Cloud-delivered protection level                                            |                  Not configured |
| Scan removable drives during full scan                                      |                             Yes |
| Defender potentially unwanted app action                                    |                           Block |
| Turn on cloud-delivered protection                                          |                  Not configured |

#### Smart Screen

| Item                                                                         |          Value |
| ---------------------------------------------------------------------------- | -------------: |
| Block users from ignoring SmartScreen warnings                               | Not configured |
| Turn on Windows SmartScreen                                                  | Not configured |
| Require SmartScreen for Microsoft Edge Legacy                                | Not configured |
| Block malicious site access                                                  | Not configured |
| Block unverified file download                                               | Not configured |
| Configure Microsoft Defender SmartScreen                                     | Not configured |
| Prevent bypassing Microsoft Defender SmartScreen prompts for sites           | Not configured |
| Prevent bypassing of Microsoft Defender SmartScreen warnings about downloads | Not configured |
| Configure Microsoft Defender SmartScreen to block potentially unwanted apps  | Not configured |