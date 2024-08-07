---
title: ASD Windows Hardening Guidelines-Attack Surface Reduction
weight: 10
description: "This section describes the configuration of attack surface reduction within Microsoft Intune associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Intune portal at the following URL:

https://intune.microsoft.com/#view/Microsoft_Intune_Workflows/SecurityManagementMenu/~/asr

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Basics

| Item        |                                                     Value |
| ----------- | --------------------------------------------------------: |
| Name        | ASD Windows Hardening Guidelines-Attack Surface Reduction |
| Description |                                                           |
| Platform    |                                      Windows 10 and later |

### Assignments

| Item            |       Value |
| --------------- | ----------: |
| Included groups | All Devices |
| Excluded groups |             |

### Configuration settings

#### Attack Surface Reduction Rules

| Item                                                                                              |          Value |
| ------------------------------------------------------------------------------------------------- | -------------: |
| Block Adobe Reader from creating child processes                                                  |          Block |
| - ASR Only Per Rule Exclusions                                                                    | Not configured |
| Block execution of potentially obfuscated scripts                                                 |          Block |
| - ASR Only Per Rule Exclusions                                                                    | Not configured |
| Block Win32 API calls from Office macros                                                          |          Block |
| - ASR Only Per Rule Exclusions                                                                    | Not configured |
| Block credential stealing from the Windows local security authority subsystem                     |          Block |
| - ASR Only Per Rule Exclusions                                                                    | Not configured |
| Block executable files from running unless they meet a prevalence, age, or trusted list criterion |          Block |
| - ASR Only Per Rule Exclusions                                                                    | Not configured |
| Block JavaScript or VBScript from launching downloaded executable content                         |          Block |
| - ASR Only Per Rule Exclusions                                                                    | Not configured |
| Block Office communication application from creating child processes                              |          Block |
| - ASR Only Per Rule Exclusions                                                                    | Not configured |
| Block all Office applications from creating child processes                                       |          Block |
| - ASR Only Per Rule Exclusions                                                                    | Not configured |
| Block untrusted and unsigned processes that run from USB                                          |          Block |
| - ASR Only Per Rule Exclusions                                                                    | Not configured |
| Block process creations originating from PSExec and WMI commands                                  |          Block |
| - ASR Only Per Rule Exclusions                                                                    | Not configured |
| Block persistence through WMI event subscription                                                  |          Block |
| Block Office applications from creating executable content                                        |          Block |
| - ASR Only Per Rule Exclusions                                                                    | Not configured |
| Block Office applications from injecting code into other processes                                |          Block |
| - ASR Only Per Rule Exclusions                                                                    | Not configured |
| Use advanced protection against ransomware                                                        |          Block |
| - ASR Only Per Rule Exclusions                                                                    | Not configured |
| Block executable content from email client and webmail                                            |          Block |
| - ASR Only Per Rule Exclusions                                                                    | Not configured |




### Related information

#### Security & Governance

* [Authentication Hardening]({{<ref "system-hardening-authentication">}}) 
* [Enterprise Mobility]({{<ref "security-and-governance/system-security-plan/enterprise-mobility.md">}})
* [Essential Eight: Restrict Microsoft Office Macros]({{<ref "restrict-microsoft-office-macros.md">}})

  
#### Design

* None identified
  
#### Configuration

* None identified

#### References

* None identified
