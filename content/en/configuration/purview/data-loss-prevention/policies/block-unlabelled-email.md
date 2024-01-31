---
Title: "Data Loss Prevention: Block un-labelled email"
weight: 010
description: "This section describes the configuration of Data Loss Prevention (DLP) policies within Microsoft Purview associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* for the Microsoft Purview portal blade at the following URL: 
 
https://compliance.microsoft.com/datalossprevention/policies

The settings described on these pages should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Name

| Item        |                                                                 Value |
| ----------- | --------------------------------------------------------------------: |
| Name        |                                               Block un-labelled email |
| Description | Blocks sending of emails which do not have an assigned classification |

### Admin units

| Item        |          Value |
| ----------- | -------------: |
| Admin units | Full directory |

### Locations 

| Item                            |      Value |
| ------------------------------- | ---------: |
| Exchange email                  | All groups |
| SharePoint sites                |            |
| OneDrive accounts               |            |
| Teams chat and channel messages |            |
| Devices                         |            |
| On-premises repositories        |            |
| Power BI workspaces             |            |

### Advanced DLP rules

#### Block outgoing email un-labelled email

| Item        |                                  Value |
| ----------- | -------------------------------------: |
| Name        | Block outgoing email un-labelled email |
| Description |                                        |

##### Conditions

| Item                                 |                               Value |
| ------------------------------------ | ----------------------------------: |
| Content is shared from Microsoft 365 | with people outside my organization |
| ***AND***                            |                                     |
| **Condition Group**                  |                                     |
| ***NOT***                            |                                     |
| Group name                           |                             Default |
| Group operator                       |                        Any of these |
| Content contains                     |          Sensitivity labels:<br>All |

##### Actions

| Item                                                              |                                                                                                          Value |
| ----------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------: |
| Restrict access or encrypt the content in Microsoft 365 locations | Block users from receiving email or accessing shared SharePoint, OneDrive, and Teams files<br>- Block everyone |

##### User notifications 

| Item                                                                                             | Value |
| ------------------------------------------------------------------------------------------------ | ----: |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |   Off |

##### User overrides

| Item                               |       Value |
| ---------------------------------- | ----------: |
| Allow overrides from M365 services | Not checked |

##### Incident reports

| Item                                                                | Value |
| ------------------------------------------------------------------- | ----: |
| Use this severity level in admin alerts and reports                 |   Low |
| Send an alert to admins when a rule match occurs                    |   Off |
| Use email incident reports to notify you when a policy match occurs |   Off |

##### Additional options

| Item                                                                                |       Value |
| ----------------------------------------------------------------------------------- | ----------: |
| If there's a match for this rule, stop processing additional DLP policies and rules | Not checked |
| Priority                                                                            |           0 |

### Policy mode

| Item        |                          Value |
| ----------- | -----------------------------: |
| Policy mode | Turn the policy on immediately |

### Related information

#### Security & Governance

* None identified
  
#### Design

* None identified
  
#### Configuration

* None identified

#### References

* None identified