---
title: "PROTECTED//CABINET"
weight: 050
description: "This section describes the configuration of labels within Microsoft Purview associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Purview portal at the following URL: 
 
https://compliance.microsoft.com/informationprotection/labels
 
The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

### Label Details

| Item                  |                                                                                Value |
| --------------------- | -----------------------------------------------------------------------------------: |
| Name                  |                                                                                  P C |
| Display Name          |                                                                              CABINET |
| Label Priority        |                                                                                   20 |
| Description for Users | High business impact. Damage to the national interest, organisations or individuals. |

### Scope

| Item               |   Value |
| ------------------ | ------: |
| **Items**          |         |
| - Files            | Checked |
| - Emails           | Checked |
| - Meetings         | Checked |
| **Groups & Sites** | Checked |

### Items

#### Choose protection settings for labeled items

| Item                             |   Value |
| -------------------------------- | ------: |
| Apply or remove encryption       | Checked |
| Apply content marking            | Checked |
| Protect Teams meetings and chats |         |

#### Encryption

| Item                                                        | Value                                                                                                            |
| ----------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| Configure encryption settings                               | Checked                                                                                                          |
| Assign permissions now or let users decide                  | Assign permissions now                                                                                           |
| User access to content expires                              | Never                                                                                                            |
| Allow offline access                                        | Only for a number of days                                                                                        |
| Users have offline access to the content for this many days | 3                                                                                                                |
| Users and groups                                            | Group: grp-Protected-Users<br>Permissions: Co-Author<br><br>Group: grp-Protected-Guests<br>Permissions: Reviewer |

#### Content marking

##### Watermark

| Item    |       Value |
| ------- | ----------: |
| Enabled | Not checked |

##### Header

| Item        |              Value |
| ----------- | -----------------: |
| Enabled     |            Checked |
| Header Text | PROTECTED//CABINET |
| Font size   |                 12 |
| Font color  |                Red |
| Align text  |             Center |

##### Footer

| Item        |              Value |
| ----------- | -----------------: |
| Enabled     |            Checked |
| Header Text | PROTECTED//CABINET |
| Font size   |                 12 |
| Font color  |                Red |
| Align text  |             Center |

#### Auto-labeling for files and emails

| Item    |       Value |
| ------- | ----------: |
| Enabled | Not checked |

### Groups & Sites

| Item                                    |   Value |
| --------------------------------------- | ------: |
| Privacy and external user access        | Checked |
| External sharing and Conditional Access | Checked |
| Apply a label to channel meetings       |    None |


### Privacy and external user access settings

| Item    |   Value |
| ------- | ------: |
| Privacy | Private |

### External sharing & conditional access

| Item                                                                         |                                  Value |
| ---------------------------------------------------------------------------- | -------------------------------------: |
| Control external sharing from labeled SharePoint sites                       |                                Checked |
| Content can be shared with                                                   |       Only people in your organization |
| Use Microsoft Entra Conditional Access to protected labeled SharePoint sites |                                Checked |
| Choose an existing authentication context                                    | Checked<br>- Protected Location Access |

### Related information

#### Security & Governance

* None identified
  
#### Design

* None identified
  
#### Configuration

* None identified

#### References

* None identified