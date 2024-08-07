---
title: "Endpoint security policies"
linkTitle: "Endpoint security policies"
weight: 10
description: "This section describes the configuration of endpoint security policies within Microsoft Defender associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Defender portal at the following URL:

<https://security.microsoft.com/policy-inventory>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Windows policies

{{% alert title="Note" color="info" %}}

The below guidance on configuration to enforce security policies on endpoints. While organisations may choose to initially implement policies in audit mode, we recommend organisations aim to progress these policies into enforcement mode where possible.

{{% /alert %}}

#### ASD Windows Hardening Guidelines - Antivirus

##### Policy details

| Item     |                                     Value |
| -------- | ----------------------------------------: |
| Platform | Windows 10, Windows 11 and Windows Server |
| Template |              Microsoft Defender Antivirus |

##### Policy setting values

| Item                                                   |                                                                                              Value |
| ------------------------------------------------------ | -------------------------------------------------------------------------------------------------: |
| Allow Archive Scanning                                 |                                                                  Allowed. Scans the archive files. |
| Allow Behavior Monitoring                              |                                                   Allowed. Turns on real-time behavior monitoring. |
| Allow Cloud Protection                                 |                                                                Allowed. Turns on Cloud Protection. |
| Allow Email Scanning                                   |                                                             Not allowed. Turns off email scanning. |
| Allow Full Scan On Mapped Network Drives               |                                                                                   *Not configured* |
| Allow Full Scan Removable Drive Scanning               |                                                                   Allowed. Scans removable drives. |
| [Deprecated] Allow Intrusion Prevention System         |                                                                                           Allowed. |
| Allow scanning of all downloaded files and attachments |                                                                                           Allowed. |
| Allow Realtime Monitoring                              |                                       Allowed. Turns on and runs the real-time monitoring service. |
| Allow Scanning Network Files                           |                                                                      Allowed. Scans network files. |
| Allow Script Scanning                                  |                                                                                           Allowed. |
| Allow User UI Access                                   |                                                     Not allowed. Prevents users from accessing UI. |
| Avg CPU Load Factor                                    |                                                                                                 50 |
| Archive Max Depth                                      |                                                                                   *Not Configured* |
| Archive Max Size                                       |                                                                                   *Not Configured* |
| Check For Signatures Before Running Scan               |                                                                                            Enabled |
| Cloud Block Level                                      |                                                                                               High |
| Cloud Extended Timeout                                 |                                                                                   *Not Configured* |
| Days To Retain Cleaned Malware                         |                                                                                   *Not Configured* |
| Disable Catchup Full Scan                              |                                                                                            Enabled |
| Disable Catchup Quick Scan                             |                                                                                            Enabled |
| Enable Low CPU Priority                                |                                                                                            Enabled |
| Enable Network Protection                              |                                                                               Enabled (block mode) |
| Excluded Extensions                                    |                                                                                   *Not configured* |
| Excluded Paths                                         |                                                                                   *Not configured* |
| Excluded Processes                                     |                                                                                   *Not configured* |
| PUA Protection                                         | PUA Protection on. Detected items are blocked. They will show in history along with other threats. |
| Real Time Scan Direction                               |                                                                Monitor all files (bi-directional). |
| Scan Parameter                                         |                                                                                         Quick scan |
| Schedule Quick Scan Time                               |                                                                                                120 |
| Schedule Scan Day                                      |                                                                                          Every day |
| Schedule Scan Time                                     |                                                                                                120 |
| Signature Update Fallback Order                        |                                                                                   *Not configured* |
| Signature Update File Shares Sources                   |                                                                                   *Not configured* |
| Signature Update Interval                              |                                                                                                  4 |
| Submit Samples Consent                                 |                                                                   Send safe samples automatically. |
| Disable Local Admin Merge                              |                                                                                   *Not configured* |
| Allow On Access Protection                             |                                                                                           Allowed. |
| Remediation action for High severity threats           |                                                                                   *Not configured* |
| Remediation action for Severe threats                  |                                                                      Block. Blocks file execution. |
| Remediation action for Low severity threats            |                                        Clean. Service tries to recover files and try to disinfect. |
| Remediation action for Moderate severity threats       |                                                             Quarantine. Moves files to quarantine. |
| Allow Network Protection Down Level                    |                                                                                   *Not configured* |
| Allow Datagram Processing On Win Server                |                                                                                   *Not configured* |
| Disable Dns Over Tcp Parsing                           |                                                                                   *Not configured* |
| Disable Http Parsing                                   |                                                                                   *Not configured* |
| Disable Ssh Parsing                                    |                                                                                   *Not configured* |
| Disable Tls Parsing                                    |                                                                                   *Not configured* |
| [Deprecated] Enable Dns Sinkhole                       |                                                                                   *Not configured* |
| Engine Updates Channel                                 |                                                                                   *Not configured* |
| Metered Connection Updates                             |                                                                                   *Not configured* |
| Platform Updates Channel                               |                                                                                   *Not configured* |
| Security Intelligence Updates Channel                  |                                                                                   *Not configured* |
| Randomize Schedule Task Times                          |                                                                                   *Not Configured* |
| Scheduler Randomization Time                           |                                                                                   *Not Configured* |
| Archive Max Size                                       |                                                                                   *Not Configured* |
| Disable Core Service ECS Integration                   |                                                                                   *Not configured* |
| Disable Core Service Telemetry                         |                                                                                   *Not configured* |

##### Assignments

| Item  |                        Value |
| ----- | ---------------------------: |
| Group | *Organisation group name(s)* |

#### ASD Windows Hardening Guidelines - Attack Surface Reduction

##### Policy details

| Item     |                                     Value |
| -------- | ----------------------------------------: |
| Platform | Windows 10, Windows 11 and Windows Server |
| Template |            Attack Surface Reduction Rules |

##### Policy setting values

| Item                                                                                              |            Value |
| ------------------------------------------------------------------------------------------------- | ---------------: |
| Block execution of potentially obfuscated scripts                                                 |            Block |
| Block Win32 API calls from Office macros                                                          |            Block |
| Block executable files from running unless they meet a prevalence, age, or trusted list criterion |            Block |
| Block Office communication application from creating child processes                              |            Block |
| Block all Office applications from creating child processes                                       |            Block |
| Block Adobe Reader from creating child processes                                                  |            Block |
| Block credential stealing from the Windows local security authority subsystem                     |            Block |
| Block JavaScript or VBScript from launching downloaded executable content                         |            Block |
| Block Webshell creation for Servers                                                               |            Block |
| Block untrusted and unsigned processes that run from USB                                          |            Block |
| Block persistence through WMI event subscription                                                  |            Block |
| [PREVIEW] Block use of copied or impersonated system tools                                        |            Block |
| Block abuse of exploited vulnerable signed drivers (Device)                                       |            Block |
| Block process creations originating from PSExec and WMI commands                                  |            Block |
| Block Office applications from creating executable content                                        |            Block |
| Block Office applications from injecting code into other processes                                |            Block |
| [PREVIEW] Block rebooting machine in Safe Mode                                                    |            Block |
| Use advanced protection against ransomware                                                        |            Block |
| Block executable content from email client and webmail                                            |            Block |
| Enable Controlled Folder Access                                                                   | *Not configured* |

##### Assignments

| Item  |                        Value |
| ----- | ---------------------------: |
| Group | *Organisation group name(s)* |

#### ASD Windows Hardening Guidelines - Endpoint Detection and Response

##### Policy details

| Item     |                                     Value |
| -------- | ----------------------------------------: |
| Platform | Windows 10, Windows 11 and Windows Server |
| Template |           Endpoint Detection and Response |

##### Policy setting values

| Item                                                              |          Value |
| ----------------------------------------------------------------- | -------------: |
| Microsoft Defender for Endpoint client configuration package type | Not configured |
| Sample Sharing                                                    |           None |
| [Deprecated] Telemetry Reporting Frequency                        |       Expedite |

##### Assignments

| Item  |                        Value |
| ----- | ---------------------------: |
| Group | *Organisation group name(s)* |

### Mac policies

`Not configured`

### Linux policies

`Not configured`

### Related information

#### Security & Governance

* [Operating System Hardening]({{<ref "security-and-governance/system-security-plan/system-hardening-os.md">}})
* [Patch Operating System]({{<ref "security-and-governance/essential-eight/patch-os.md">}})
* [Essential Eight: Multi-factor-Authentication]({{<ref "multi-factor-authentication.md" >}})
* [Authentication Hardening]({{<ref "system-hardening-authentication.md">}})
* [System Management]({{<ref "system-management.md">}})
* [System Monitoring]({{<ref "system-monitoring.md">}})

#### Design

* [Devices]({{<ref "design/platform/security/endpoint-security">}})
* [Devices]({{<ref "design/endpoints">}})
  
#### Configuration

* [Microsoft Intune - Devices]({{< ref "configuration/intune/devices">}})
* [Microsoft Entra ID - Devices]({{< ref "configuration/entra-id/devices">}})
* [iOS and iPadOS]({{< ref "configuration/intune/apps/by-platform/ios-ipados.md">}})
* [Entra ID Protection]({{<ref "configuration/entra-id/protection">}})

#### References

* [Defender for Endpoint](https://learn.microsoft.com/microsoft-365/security/defender-endpoint)
