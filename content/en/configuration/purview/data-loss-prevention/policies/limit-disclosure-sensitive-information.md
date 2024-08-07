---
title: "Data Loss Prevention: Limit disclosure of sensitive information"
weight: 065
description: "This section describes the configuration of Data Loss Prevention (DLP) policies within Microsoft Purview associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Purview portal at the following URL: 
 
https://compliance.microsoft.com/datalossprevention/policies
 
The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

### Name

| Item        |                                                             Value |
| ----------- | ----------------------------------------------------------------: |
| Name        |                         Limit disclosure of sensitive information |
| Description | Warn users when they send information that is sensitive in nature |

### Admin units

| Item        |          Value |
| ----------- | -------------: |
| Admin units | Full directory |

### Locations 

| Item                            |              Value |
| ------------------------------- | -----------------: |
| Exchange email                  |         All groups |
| SharePoint sites                |          All sites |
| OneDrive accounts               | All users & groups |
| Teams chat and channel messages | All users & groups |
| Devices                         |                    |
| On-premises repositories        |                    |
| Power BI workspaces             |                    |

### Advanced DLP rules

#### Warn users sending information that is sensitive in nature

| Item        |                                                      Value |
| ----------- | ---------------------------------------------------------: |
| Name        | Warn users sending information that is sensitive in nature |
| Description |                                                            |

##### Conditions

| Item                                                            |                                                                                                                   Value |
| --------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------: |
| **Content is shared from Microsoft 365**                        |                                                                                     with people outside my organization |
| ***AND***                                                       |                                                                                                                         |
| **Content contains**                                            |                                                                                              Sensitive information type |
| Group name                                                      |                                                                                                                 Default |
| Group operator                                                  |                                                                                                            Any of these |
| Sensitivity info types                                          |                                                                                                                         |
| - OFFICIAL Sensitive classified information                     |                                                                       Medium confidence<br>Instance count: `1` to `Any` |
| - OFFICIAL Sensitive Personal-Privacy classified information    |                                                                       Medium confidence<br>Instance count: `1` to `Any` |
| - OFFICIAL: Sensitive Legal-Privilege classified information    |                                                                       Medium confidence<br>Instance count: `1` to `Any` |
| - OFFICIAL Sensitive Legislative-Secrecy classified information |                                                                       Medium confidence<br>Instance count: `1` to `Any` |
| - OFFICIAL Sensitive NATIONAL-CABINET classified information    |                                                                       Medium confidence<br>Instance count: `1` to `Any` |
| - All Credential Types                                          |                                                                       Medium confidence<br>Instance count: `1` to `Any` |
| Trainable classifiers                                           | Non disclosure agreement<br>Loan agreements and offer letters<br>Health/Medical forms<br>Personal Financial Information |

##### Actions 

None

##### User notifications 

| Item                                                                                             |                                                                                                                                                                                                                                                            Value |
| ------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                                                                                                                                                                                                               On |
| **Microsoft 365 services**                                                                       |                                                                                                                                                                                                                                                                  |
| - Notify users in Office 365 service with a policy tip                                           |                                                                                                                                                                                                                                                          Checked |
| Email notifications                                                                              |                                                                                                                                                                                                   Notify the user who sent, shared, or last modified the content |
| - Attach matching email message to the notification                                              |                                                                                                                                                                                                                                                      Not checked |
| - Customize the policy tip text                                                                  | Checked<br>This item appears to contain Classified or otherwise sensitive information. Disclosure of this information may result in harm to the Australian Government or individuals. Please be sure you understand your obligations to protect this information |
| - Show the policy tip as a dialog for the end user before send                                   |                                                                                                                                                                                                                                                          Checked |
| - Provide a compliance URL for the end user to learn more about your organization's policies     |                                                                                                                                                                                                                                                      Not checked |

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