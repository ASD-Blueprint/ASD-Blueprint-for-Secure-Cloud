---
Title: "OFFICIAL: Sensitive Group"
weight: 015
description: "This section describes the configuration of labels within Microsoft Purview associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* for the Microsoft Purview portal blade at the following URL: 
 
https://compliance.microsoft.com/informationprotection/labels
 
The settings described on these pages should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

### Label Details

| Item                  |                                                                                                                Value |
| --------------------- | -------------------------------------------------------------------------------------------------------------------: |
| Name                  |                                                                                                             OS Group |
| Display Name          |                                                                                             OFFICIAL Sensitive Group |
| Label Priority        |                                                                                                                    2 |
| Description for Users | Low to medium business impact. Limited damage to an individual, organisation or government generally if compromised. |

### Scope

| Item               |   Value |
| ------------------ | ------: |
| **Items**          |         |
| - Files            | Checked |
| - Emails           | Checked |
| - Meetings         |         |
| **Groups & Sites** | Checked |

### Items

#### Choose protection settings for labeled items

| Item                             |   Value |
| -------------------------------- | ------: |
| Apply or remove encryption       |         |
| Apply content marking            | Checked |
| Protect Teams meetings and chats |         |

#### Content marking

##### Watermark

| Item    |       Value |
| ------- | ----------: |
| Enabled | Not checked |

##### Header

| Item        |               Value |
| ----------- | ------------------: |
| Enabled     |             Checked |
| Header Text | OFFICIAL: Sensitive |
| Font size   |                  12 |
| Font color  |                 Red |
| Align text  |              Center |

##### Footer

| Item        |               Value |
| ----------- | ------------------: |
| Enabled     |             Checked |
| Header Text | OFFICIAL: Sensitive |
| Font size   |                  12 |
| Font color  |                 Red |
| Align text  |              Center |

#### Auto-labeling for files and emails

| Item    |       Value |
| ------- | ----------: |
| Enabled | Not checked |

### Groups & Sites

| Item                                    | Value |
| --------------------------------------- | ----: |
| Privacy and external user access        |       |
| External sharing and Conditional Access |       |
| Apply a label to channel meetings       |  None |

### Related information

#### Security & Governance

* None identified
  
#### Design

* None identified
  
#### Configuration

* None identified

#### References

* None identified