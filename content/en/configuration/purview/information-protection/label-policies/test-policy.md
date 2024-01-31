---
Title: Information protection label policies - Test policy
weight: 010
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

| Item        |                                                                                                                                                                                     Value |
| ----------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| Name        |                                                                                                                                                                               Test policy |
| Description | This policy is intended for testing the impact of policy setting changes and would not typically differ from the standard all user policy except for during the testing of policy changes |
| Priority    |                                                                                                                                                                                         1 |

### Sensitivity labels to publish

* All sensitivity labels

### Admin Units

| Item        |          Value |
| ----------- | -------------: |
| Admin units | Full directory |

### Users and groups

| Item             |                                       Value |
| ---------------- | ------------------------------------------: |
| Users and groups | Specific users and groups: `grp-Test-Users` |

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