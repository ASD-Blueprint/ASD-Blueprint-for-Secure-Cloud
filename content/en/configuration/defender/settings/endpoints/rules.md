---
Title: Rules
weight: 30
description: "This section describes the configuration of rules within Microsoft Defender associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* for Defender portal blade at the following URL: 

https://security.microsoft.com/securitysettings/endpoints/alert_suppression
 
The settings described on these pages should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

### Indicators

`Not configured`

### Process Memory Indicators

`Not configured`

### Web Content Filtering

#### Adult Sites

| Item                          | Value       |
| ----------------------------- | -----------:|
| **General**                   |             |
| Policy Name                   | Adult Sites |
| **Blocked Categories**        |             |
| Cults                         | Enabled     |
| Gambling                      | Enabled     |
| Nudity                        | Enabled     |
| Pornography/Sexually Explicit | Enabled     |
| Sex Education                 | Enabled     |
| Tasteless                     | Enabled     |
| Violence                      | Enabled     |
| **Scope**                     |             |
| Machine Groups                | Select all  |

#### High Traffic Sites 

| Item                        | Value              |
| --------------------------- | ------------------:|
| **General**                 |                    |
| Policy Name                 | High Traffic Sites |
| **Blocked Categories**      |                    |
| Download Sites              | Enabled            |
| Image Sharing               | Enabled            |
| Peer-to-Peer                | Enabled            |
| Streaming Media & Downloads | Enabled            |
| **Scope**                   |                    |
| Machine Groups              | Select all         |

#### High Traffic Sites 

| Item                   | Value           |
| ---------------------- | ---------------:|
| **General**            |                 |
| Policy Name            | Legal Liability |
| **Blocked Categories** |                 |
| Child Abuse Images     | Enabled         |
| Criminal Activity      | Enabled         |
| Hacking                | Enabled         |
| Hat & Intolerance      | Enabled         |
| Illegal Drug           | Enabled         |
| Illegal Software       | Enabled         |
| School Cheating        | Enabled         |
| Self-Harm              | Enabled         |
| Weapons                | Enabled         |
| **Scope**              |                 |
| Machine Groups         | Select all      |

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

### Related information

#### Security & Governance

* None identified
  
#### Design

* [Devices]({{<ref "design/platform/security/endpoint-security">}})
* [Devices]({{<ref "design/endpoints">}})
  
#### Configuration

* None identified

#### References

* [Defender for Endpoint](https://learn.microsoft.com/microsoft-365/security/defender-endpoint)