---
Title: Endpoint security policies
weight: 10
description: "This section describes the configuration of endpoint security policies within Microsoft Defender associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* for Defender portal blade at the following URL: 

https://security.microsoft.com/policy-inventory
 
The settings described on these pages should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}


### Windows policies

#### ASD Windows Hardening Guidelines-Attack Surface Reduction

##### Policy details

| Item            | Value                          |
| --------------- | ------------------------------:|
| Policy type     | Attack Surface Reduction Rules |
| Policy category | Attack surface reduction       |
| Platform        | Windows 10                     |
| Target          | mdm,microsoftSense             |

##### Policy setting values

| Item                                                                                              | Value |
| ------------------------------------------------------------------------------------------------- | -----:|
| Block executable content from email client and webmail                                            | Audit |
| Block all Office applications from creating child processes                                       | Audit |
| Block Office applications from creating executable content                                        | Audit |
| Block Office applications from injecting code into other processes                                | Audit |
| Block JavaScript or VBScript from launching downloaded executable content                         | Audit |
| Block execution of potentially obfuscated scripts                                                 | Audit |
| Block Win32 API calls from Office macros                                                          | Audit |
| Block executable files from running unless they meet a prevalence, age, or trusted list criterion | Audit |
| Use advanced protection against ransomware                                                        | Audit |
| Block credential stealing from the Windows local security authority subsystem                     | Audit |
| Block process creations originating from PSExec and WMI commands                                  | Audit |
| Block untrusted and unsigned processes that run from USB                                          | Audit |
| Block Office communication application from creating child processes                              | Audit |
| Block Adobe Reader from creating child processes                                                  | Audit |
| Block persistence through WMI event subscription                                                  | Audit |

#### ASD Windows Hardening Guidelines-Antivirus

##### Policy details

| Item            | Value                        |
| --------------- | ----------------------------:|
| Policy type     | Microsoft Defender Antivirus |
| Policy category | Antivirus                    |
| Platform        | Windows 10                   |
| Target          | mdm,microsoftSense           |

##### Policy setting values



| Item                                                                            | Value                                                                                              |
| ------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------:|
| Allow Archive Scanning                                                          | Allowed. Scans the archive files.                                                                  |
| Allow Behavior Monitoring                                                       | Allowed. Turns on real-time behavior monitoring.                                                   |
| Allow Cloud Protection                                                          | Allowed. Turns on Cloud Protection.                                                                |
| Cloud Extended Timeout                                                          | 50                                                                                                 |
| Allow Email Scanning                                                            | Not allowed. Turns off email scanning.                                                             |
| Allow Full Scan Removable Drive Scanning                                        | Allowed. Scans removable drives.                                                                   |
| [Deprecated] Allow Intrusion Prevention System                                  | Allowed.                                                                                           |
| Allow scanning of all downloaded files and attachments                          | Allowed.                                                                                           |
| Allow Realtime Monitoring                                                       | Allowed. Turns on and runs the real-time monitoring service.                                       |
| Allow Scanning Network Files                                                    | Allowed. Scans network files.                                                                      |
| Allow Script Scanning                                                           | Allowed.                                                                                           |
| Allow User UI Access                                                            | Not allowed. Prevents users from accessing UI.                                                     |
| Avg CPU Load Factor                                                             | 50                                                                                                 |
| Check For Signatures Before Running Scan                                        | Enabled                                                                                            |
| Cloud Block Level                                                               | High                                                                                               |
| Disable Catchup Full Scan                                                       | Enabled                                                                                            |
| Disable Catchup Quick Scan                                                      | Enabled                                                                                            |
| Enable Low CPU Priority                                                         | Enabled                                                                                            |
| Enable Network Protection                                                       | Enabled (block mode)                                                                               |
| PUA Protection                                                                  | PUA Protection on. Detected items are blocked. They will show in history along with other threats. |
| Real Time Scan Direction                                                        | Monitor all files (bi-directional).                                                                |
| Schedule Quick Scan Time                                                        | 120                                                                                                |
| Schedule Scan Day                                                               | Every day                                                                                          |
| Schedule Scan Time                                                              | 120                                                                                                |
| Signature Update Interval                                                       | 4                                                                                                  |
| Submit Samples Consent                                                          | Send safe samples automatically.                                                                   |
| Remediation action for Severe threats                                           | Block. Blocks file execution.                                                                      |
| Allow On Access Protection                                                      | Allowed.                                                                                           |
| Threat Severity Default Action Remediation action for Moderate severity threats | Quarantine. Moves files to quarantine.                                                             |
| Remediation action for Low severity threats                                     | Clean. Service tries to recover files and try to disinfect.                                        |

#### ASD Windows Hardening Guidelines-Endpoint Detection and Response

##### Policy details

| Item            | Value                           |
| --------------- | -------------------------------:|
| Policy type     | Endpoint detection and response |
| Policy category | Endpoint detection and response |
| Platform        | Windows 10                      |
| Target          | mdm,microsoftSense              |

##### Policy setting values

| Item                                       | Value    |
| ------------------------------------------ | --------:|
| Sample Sharing                             | None     |
| [Deprecated] Telemetry Reporting Frequency | Expedite |


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