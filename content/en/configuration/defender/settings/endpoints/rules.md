---
title: "Rules"
linkTitle: "Rules"
weight: 30
description: "This section describes the configuration of rules within Microsoft Defender associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Defender portal at the following URL:

<https://security.microsoft.com/securitysettings/endpoints/alert_suppression>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Alert suppression

`Not configured`

### Indicators

`Not configured`

### Process Memory Indicators

`Not configured`

### Web Content Filtering

| Item                   |                                                                      Value |
| ---------------------- | -------------------------------------------------------------------------: |
| **General**            |                                                                            |
| Policy Name            |                                                                Blocked content |
| **Blocked Categories** |                                                                            |
| Adult content          |                                                                 Select all |
| High Bandwidth         |                                                                 Select all |
| Legal Liability        |                                                                 Select all |
| Leisure                | Chat<br>Games<br>Instant Messaging<br>Web-based Email<br>Social Networking |
| Uncategorized          |                                                                 Select all |
| **Scope**              |                                                                            |
| Machine Groups         |                                                                 Select all |

### Automation uploads

| Item                        |                                                                                                                       Value |
| --------------------------- | --------------------------------------------------------------------------------------------------------------------------: |
| **File Content Analysis**   |                                                                                                                             |
| Content analysis            |                                                                                                                          On |
| File extension names        | air,elf,gadget,msi,vbe,url,cmd,js,reg,ws,pl,'',rgs,bat,vbs,inf,cpl,vb,ps1,job,ko.gz,exe,wsf,dll,py,rb,sh,scr,ko,com,tcl,sys |
| **Memory Content Analysis** |                                                                                                                             |
| Enabled                     |                                                                                                                          On |

### Automation folder exclusions

`Not configured`

### Asset rule management

`Not configured`

### Related information

#### Security & Governance

* None identified
  
#### Design

* [Endpoint Security - Devices]({{<ref "design/platform/security/endpoint-security">}})

#### Configuration

* [Entra ID Protection]({{<ref "configuration/entra-id/protection">}})
* [Intune Endpoint Security]({{<ref "configuration/intune/endpoint-security">}})
* [Microsoft Intune - Profile Configurations]({{<ref "configuration/intune/devices/configuration-profiles">}})

#### References

* [Defender for Endpoint](https://learn.microsoft.com/microsoft-365/security/defender-endpoint)
