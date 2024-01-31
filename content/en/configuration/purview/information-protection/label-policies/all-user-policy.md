---
Title: Information protection label policies - All user policy
weight: 005
description: "This section describes the configuration of label policies within Microsoft Purview associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* for the Microsoft Purview portal blade at the following URL: 
 
https://compliance.microsoft.com/informationprotection/labelpolicies
 
The settings described on these pages should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

### Name

| Item        |                                                                    Value |
| ----------- | -----------------------------------------------------------------------: |
| Name        |                                                          All User Policy |
| Description | Publishes labels up to OFFICIAL Sensitive to All Users within the tenant |
| Priority    |                                                               0 - lowest |

### Sensitivity labels to publish

* UNOFFICIAL
* OFFICIAL
* OFFICIAL Sensitive
* OFFICIAL Sensitive/OFFICIAL Sensitive
* OFFICIAL Sensitive/Legal-Privilege
* OFFICIAL Sensitive/Legislative Secrecy
* OFFICIAL Sensitive/Personal-Privacy
* OFFICIAL Sensitive/NATIONAL CABINET
* OFFICIAL Sensitive/NATIONAL CABINET - Legal-Privilege
* OFFICIAL Sensitive/NATIONAL CABINET - Legislative-Secrecy
* OFFICIAL Sensitive/NATIONAL CABINET - Personal-Privacy

### Admin Units

| Item        |          Value |
| ----------- | -------------: |
| Admin units | Full directory |

### Users and groups

| Item             |              Value |
| ---------------- | -----------------: |
| Users and groups | All users & groups |

### Policy Settings

| Item                                                                             |   Value |
| -------------------------------------------------------------------------------- | ------: |
| Users must provide a justification to remove a label or lower its classification | Checked |
| Require users to apply a label to their emails and documents                     | Checked |
| Require users to apply a label to their Fabric and Power BI content              | Checked |
|                                                                                  |         |
| **Default settings for documents**                                               |         |
| Apply a default label to documents                                               |    None |
| **Default settings for emails**                                                  |         |
| Apply a default label to emails                                                  |    None |
| Require users to apply a label to their emails                                   | Checked |
| **Default settings for meetings and calendar events**                            |         |
| Apply a default label to meetings and calendar events                            |    None |
| Require users to apply a label to their meetings and calendar events             | Checked |
| **Default settings for sites and groups**                                        |         |
| Apply a default label to sites and groups                                        |    None |
| Require users to apply a label to their groups or sites                          | Checked |
| **Default settings for Fabric and Power BI content**                             |         |
| Apply a default label to Fabric and Power BI content                             |    None |

### Related information

#### Security & Governance

* None identified
  
#### Design

* None identified
  
#### Configuration

* None identified

#### References

* None identified