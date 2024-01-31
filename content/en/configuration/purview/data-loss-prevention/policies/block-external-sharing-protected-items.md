---
Title: "Data Loss Prevention: Block external sharing of PROTECTED items"
weight: 025
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

| Item        |                                                                                Value |
| ----------- | -----------------------------------------------------------------------------------: |
| Name        |                                            Block external sharing of PROTECTED items |
| Description | Blocks users from sharing information classified as PROTECTED to external recipients |

### Admin units

| Item        |          Value |
| ----------- | -------------: |
| Admin units | Full directory |

### Locations 

| Item                            |              Value |
| ------------------------------- | -----------------: |
| Exchange email                  |                    |
| SharePoint sites                |          All sites |
| OneDrive accounts               | All users & groups |
| Teams chat and channel messages |                    |
| Devices                         |                    |
| On-premises repositories        |                    |
| Power BI workspaces             |                    |

### Advanced DLP rules

#### Block external sharing of PROTECTED items

| Item        |                                     Value |
| ----------- | ----------------------------------------: |
| Name        | Block external sharing of PROTECTED items |
| Description |                                           |

##### Conditions

| Item                                     |                               Value |
| ---------------------------------------- | ----------------------------------: |
| **Content is shared from Microsoft 365** | with people outside my organization |
| ***AND***                                |                                     |
| **Content contains**                     |                  Sensitivity labels |
| Group name                               |                             Default |
| Group operator                           |                        Any of these |
| Sensitivity labels                       |                All PROTECTED labels |

##### Actions

| Item                                                              |                                                                                                                                       Value |
| ----------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------: |
| Restrict access or encrypt the content in Microsoft 365 locations | Block users from receiving email or accessing shared SharePoint, OneDrive, and Teams files<br>- Block only people outside your organization |

##### User notifications 

| Item                                                                                             |                                                                                  Value |
| ------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------: |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                                     On |
| Notify users in Office 365 service with a policy tip                                             |            Checked<br>- Notify the user who sent, shared, or last modified the content |
| Policy tips                                                                                      |                                                                                Checked |
| Customize the policy tip text                                                                    | This item is classified as PROTECTED and cannot be shared outside of this environment. |

##### User overrides

| Item                               |       Value |
| ---------------------------------- | ----------: |
| Allow overrides from M365 services | Not checked |

##### Incident reports

| Item                                                                |    Value |
| ------------------------------------------------------------------- | -------: |
| Use this severity level in admin alerts and reports                 |      Low |
| Send an alert to admins when a rule match occurs                    |       On |
| Send an alert every time an activity matches the rule               | Selected |
| Use email incident reports to notify you when a policy match occurs |      Off |

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