---
title: Microsoft Defender Application Control
description: "This section describes the configuration of WDAC within Microsoft Intune associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *Perspective* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Intune portal at the following URL:

*Insert Correct Url Here*
 
The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<SHA1>` and '<SHA2 Authenticode/PE>' should be replaced with the relevant details as required.
 
{{% /alert %}}

### Basics

| Item        |                                    Value |
| ----------- | ---------------------------------------: |
| Name        | WDAC baseline                            |
| Description |                                          |
| Platform    |                     Windows 10 and later |

### Assignments

| Item            | Value |
| --------------- | ----: |
| Included groups |       |
| Excluded groups |       |

### Configuration settings

#### Managed Installer

| Item                                                                                      |          Value |
| ----------------------------------------------------------------------------------------- | -------------: |
| Managed Insatller - Intune Management Extension                                           | Enabled        |

#### Configuration settings

| Item                                                                     |          Value |
| ------------------------------------------------------------------------ | -------------: |
| Enter XML Data                                                           | Not Configured |
| Import XML                                                               |            XML |

### App Control Policy Wizard
*[https://aka.ms/wdacwizard](https://aka.ms/wdacwizard)*

Policy Creator -> Single Policy Format -> Allow Microsoft Mode

#### Configure Policy Template

| Item                                                                     |          Value |
| ------------------------------------------------------------------------ | -------------: |
| Advanced Boot Options Menu                                               |        Enabled |
| Allow Supplemental Policies                                              |        Enabled |
| Disable Script Enforcement                                               |        Enabled |
| Enforce Store Applications                                               |        Enabled |
| Hypervisor-protected Code Integrity                                      |       Optional |
| Intelligent Security Graph                                               | Not Configured |
| Managed Installer                                                        |        Enabled |
| Require WHQL                                                             |        Enabled |
| Update Policy without Rebooting                                          |        Enabled |
| Unsigned System Integrity Policy                                         |        Enabled |
| User Mode Code Integrity                                                 |        Enabled |
| Treat Revoked as Unsigned                                                |        Enabled |
| Audit Mode                                                               |       Optional |

#### File Rules/Add Custom
Allow Enterprise applications to run 

| Item                                                                     |          Value |
| ------------------------------------------------------------------------ | -------------: |
| Rule Scope                                                               |  Usermode Rule |
| Rule Action                                                              |          Allow |
| Rule type                                                                |      File hash |
| Use Custom Hash Values                                                   |        Enabled |
| Insert Hash                                                        | SHA1 ,SHA2 Authenticode/PE |

### Related information

#### Security & Governance

* [Application Control]({{<ref "security-and-governance/essential-eight/application-control.md">}})
  
#### Design

* None identified
  
#### Configuration

* None identified

#### References

* None identified
