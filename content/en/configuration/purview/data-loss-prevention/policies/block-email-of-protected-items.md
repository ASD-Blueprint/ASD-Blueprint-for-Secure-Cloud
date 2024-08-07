---
title: "Data Loss Prevention: Block email of PROTECTED items"
weight: 020
description: "This section describes the configuration of Data Loss Prevention (DLP) policies within Microsoft Purview associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Purview portal at the following URL: 
 
https://compliance.microsoft.com/datalossprevention/policies
 
The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

{{% alert title="Note" color="info" %}}

PROTECTED emails can be sent from Exchange Online; however, additional configuration is required through implementation of the GovLINK TLS solution. Consumers wishing to leverage GovLINK TLS for sending of PROTECTED emails will need to direct enquires to [govlinkenquiries@finance.gov.au](mailto:govlinkenquiries@finance.gov.au).

{{% /alert %}}

### Name

| Item        |                                                                           Value |
| ----------- | ------------------------------------------------------------------------------: |
| Name        |                                                  Block email of PROTECTED items |
| Description | Blocks users from sending emails classified as PROTECTED to external recipients |

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

#### Block PROTECTED email to non-approved organisations

| Item        |                                               Value |
| ----------- | --------------------------------------------------: |
| Name        | Block PROTECTED email to non-approved organisations |
| Description |                                                     |

##### Conditions

| Item                                     |                               Value |
| ---------------------------------------- | ----------------------------------: |
| **Content is shared from Microsoft 365** | with people outside my organization |
| ***AND***                                |                                     |
| **Content contains**                     |                  Sensitivity labels |
| Group name                               |                             Default |
| Group operator                           |                        Any of these |
| Sensitivity labels                       |                All PROTECTED labels |
| ***AND***                                |                                     |
| **Condition Group**                      |                                     |
| ***NOT***                                |                                     |
| Recipient domain is                      |          *List of approved domains* |
| ***OR***                                 |                                     |
| Recipient is a member of                 |              `grp-PROTECTED-Guests` |

##### Actions

| Item                                                              |                                                                                                                                       Value |
| ----------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------: |
| Restrict access or encrypt the content in Microsoft 365 locations | Block users from receiving email or accessing shared SharePoint, OneDrive, and Teams files<br>- Block only people outside your organization |

##### User notifications 

| Item                                                                                             |                                                                                                                                                                                                                                                          Value |
| ------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                                                                                                                                                                                                             On |
| Email notifications                                                                              |                                                                                                                             Checked<br>- Notify the user who sent, shared, or last modified the content<br>- Attach matching email message to the notification |
| Policy tips                                                                                      |                                                                                                                                                                                                                                                        Checked |
| Customize the policy tip text                                                                    | A recipient of this email is from an organisation which has not been configured as authorised for receipt of PROTECTED information. Transmission will be blocked to these addresses. If this is incorrect, please contact support to discuss your requirement. |

##### User overrides

| Item                               |       Value |
| ---------------------------------- | ----------: |
| Allow overrides from M365 services | Not checked |

##### Incident reports

| Item                                                                |  Value |
| ------------------------------------------------------------------- | -----: |
| Use this severity level in admin alerts and reports                 | Medium |
| Send an alert to admins when a rule match occurs                    |     On |
| Use email incident reports to notify you when a policy match occurs |    Off |

##### Additional options

| Item                                                                                |       Value |
| ----------------------------------------------------------------------------------- | ----------: |
| If there's a match for this rule, stop processing additional DLP policies and rules | Not checked |
| Priority                                                                            |           0 |

#### Block PROTECTED email to non-cleared internal users

| Item        |                                               Value |
| ----------- | --------------------------------------------------: |
| Name        | Block PROTECTED email to non-cleared internal users |
| Description |                                                     |

##### Conditions

| Item                                     |                                           Value |
| ---------------------------------------- | ----------------------------------------------: |
| **Content is shared from Microsoft 365** |         only with people inside my organization |
| ***AND***                                |                                                 |
| **Content contains**                     |                              Sensitivity labels |
| Group name                               |                                         Default |
| Group operator                           |                                    Any of these |
| Sensitivity labels                       |                            All PROTECTED labels |
| ***AND***                                |                                                 |
| **Condition Group**                      |                                                 |
| ***NOT***                                |                                                 |
| Recipient is a member of                 | `grp-PROTECTED-Users`<br>`grp-PROTECTED-Guests` |


##### Actions

| Item                                                              |                                                                                                    Value |
| ----------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------: |
| Restrict access or encrypt the content in Microsoft 365 locations | Block users from receiving email or accessing shared SharePoint, OneDrive, and Teams files<br>- everyone |

##### User notifications 

| Item                                                                                             |                                                                                                                              Value |
| ------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------: |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                                                                                 On |
| Email notifications                                                                              | Checked<br>- Notify the user who sent, shared, or last modified the content<br>- Attach matching email message to the notification |
| Policy tips                                                                                      |                                                                                                                            Checked |
| Customize the policy tip text                                                                    |              A recipient of this email is not cleared for receipt of PROTECTED items. Transmission of the message will be blocked. |

##### User overrides

| Item                               |       Value |
| ---------------------------------- | ----------: |
| Allow overrides from M365 services | Not checked |

##### Incident reports

| Item                                                                | Value |
| ------------------------------------------------------------------- | ----: |
| Use this severity level in admin alerts and reports                 |   Low |
| Send an alert to admins when a rule match occurs                    |    On |
| Use email incident reports to notify you when a policy match occurs |   Off |

##### Additional options

| Item                                                                                |       Value |
| ----------------------------------------------------------------------------------- | ----------: |
| If there's a match for this rule, stop processing additional DLP policies and rules | Not checked |
| Priority                                                                            |           1 |

#### Limit sending of internal PROTECTED email

| Item        |                                     Value |
| ----------- | ----------------------------------------: |
| Name        | Limit sending of internal PROTECTED email |
| Description |                                           |

##### Conditions

| Item                                     |                                   Value |
| ---------------------------------------- | --------------------------------------: |
| **Content is shared from Microsoft 365** | only with people inside my organization |
| ***AND***                                |                                         |
| **Content contains**                     |                      Sensitivity labels |
| Group name                               |                                 Default |
| Group operator                           |                            Any of these |
| Sensitivity labels                       |                    All PROTECTED labels |
| ***AND***                                |                                         |
| **Condition Group**                      |                                         |
| ***NOT***                                |                                         |
| Sender is a member of                    |                   `grp-PROTECTED-Users` |

##### Actions

| Item                                                              |                                                                                                          Value |
| ----------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------: |
| Restrict access or encrypt the content in Microsoft 365 locations | Block users from receiving email or accessing shared SharePoint, OneDrive, and Teams files<br>- Block everyone |

##### User notifications 

| Item                                                                                             |                                                                                                                              Value |
| ------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------: |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                                                                                 On |
| Email notifications                                                                              | Checked<br>- Notify the user who sent, shared, or last modified the content<br>- Attach matching email message to the notification |
| Policy tips                                                                                      |                                                                                                                            Checked |

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
| Priority                                                                            |           2 |

#### Limit sending of external PROTECTED email

| Item        |                                     Value |
| ----------- | ----------------------------------------: |
| Name        | Limit sending of external PROTECTED email |
| Description |                                           |

##### Conditions

| Item                                     |                                       Value |
| ---------------------------------------- | ------------------------------------------: |
| **Content is shared from Microsoft 365** | only with people outside of my organization |
| ***AND***                                |                                             |
| **Content contains**                     |                          Sensitivity labels |
| Group name                               |                                     Default |
| Group operator                           |                                Any of these |
| Sensitivity labels                       |                        All PROTECTED labels |
| ***AND***                                |                                             |
| **Condition Group**                      |                                             |
| ***NOT***                                |                                             |
| Sender is a member of                    |                       `grp-PROTECTED-Users` |

##### Actions

| Item                                                              |                                                                                                          Value |
| ----------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------: |
| Restrict access or encrypt the content in Microsoft 365 locations | Block users from receiving email or accessing shared SharePoint, OneDrive, and Teams files<br>- Block everyone |

##### User notifications 

| Item                                                                                             |                                                                                                                              Value |
| ------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------: |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                                                                                 On |
| Email notifications                                                                              | Checked<br>- Notify the user who sent, shared, or last modified the content<br>- Attach matching email message to the notification |
| Policy tips                                                                                      |                                                                                                                            Checked |

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
| Priority                                                                            |           3 |

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