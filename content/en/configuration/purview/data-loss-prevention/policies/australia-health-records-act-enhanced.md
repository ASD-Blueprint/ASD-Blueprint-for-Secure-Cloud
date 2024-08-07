---
title: "Data Loss Prevention: Australia Health Records Act (HRIP Act) Enhanced"
weight: 050
description: "This section describes the configuration of data loss prevention policies within Microsoft Purview associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Purview portal at the following URL: 
 
https://compliance.microsoft.com/datalossprevention/policies
 
The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

### Name

| Item        |                                                                                                                                                                                                                                                                                                                                                 Value |
| ----------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| Name        |                                                                                                                                                                                                                                                                                    Australia Health Records Act (HRIP Act) Enhanced (Policy Template) |
| Description | Helps detect the presence of information commonly considered to be subject to the Health Records and Information Privacy (HRIP) act in Australia, like medical account number and tax file number. This enhanced template extends the original by also detecting people's full names, medical terms and conditions, and Australia physical addresses. |

### Admin units

| Item        |          Value |
| ----------- | -------------: |
| Admin units | Full directory |

### Locations 

| Item                            |                Value |
| ------------------------------- | -------------------: |
| Exchange email                  |           All groups |
| SharePoint sites                |            All sites |
| OneDrive accounts               | All users and groups |
| Teams chat and channel messages | All users and groups |
| Devices                         | All users and groups |
| On-premises repositories        |     All repositories |
| Power BI workspaces             |                      |

### Advanced DLP rules

#### Low volume of content detected Australia HRIP Enhanced

| Item        |                                                  Value |
| ----------- | -----------------------------------------------------: |
| Name        | Low volume of content detected Australia HRIP Enhanced |
| Description |                                                        |

##### Conditions

**Content contains**

| Item                               |                                           Value |
| ---------------------------------- | ----------------------------------------------: |
| **Group name**                     |                                         Default |
| - Group operator                   |                                    Any of these |
| Sensitive info types               |                                                 |
| - Australia Tax File Number        |   High confidence<br>Instance count: `1` to `9` |
| - Australia Medical Account Number |   High confidence<br>Instance count: `1` to `9` |
| - Australia Physical Addresses     | Medium confidence<br>Instance count: `1` to `9` |
| ***AND***                          |                                                 |
| **Group name**                     |                                           Names |
| - Group operator                   |                                    All of these |
| Sensitive info types               |                                                 |
| - All Full Names                   | Medium confidence<br>Instance count: `1` to `9` |
| ***AND***                          |                                                 |
| **Group name**                     |                  All medical terms & conditions |
| - Group operator                   |                                    All of these |
| Sensitive info types               |                                                 |
| - All Medical Terms And Conditions |   High confidence<br>Instance count: `1` to `9` |

##### User notifications 

| Item                                                                                             |               Value |
| ------------------------------------------------------------------------------------------------ | ------------------: |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                  On |
| **Endpoint devices**                                                                             |                     |
| Show users a policy tip notification when an activity is restricted.                             |         Not checked |
| **Microsoft 365 services**                                                                       |                     |
| Notify users in Office 365 service with a policy tip                                             |             Checked |
| **Email notifications**                                                                          | Notify these people |
| - The person who sent, shared, or last modified the content                                      |             Checked |
| - Owner of the SharePoint site or OneDrive account                                               |             Checked |
| - Owner of the SharePoint or OneDrive content                                                    |             Checked |
| Attach matching email message to the notification                                                |             Checked |
| Customize the policy tip text                                                                    |         Not checked |
| Show the policy tip as a dialog for the end user before send                                     |         Not checked |
| Provide a compliance URL for the end user to learn more about your organization's policies       |         Not checked |

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

| Item                                                                                |     Value |
| ----------------------------------------------------------------------------------- | --------: |
| If there's a match for this rule, stop processing additional DLP policies and rules | Unchecked |
| Priority                                                                            |         0 |

#### High volume of content detected Australia HRIP Enhanced

| Item        |                                                   Value |
| ----------- | ------------------------------------------------------: |
| Name        | High volume of content detected Australia HRIP Enhanced |
| Description |                                                         |

##### Conditions

**Content contains**

| Item                               |                                              Value |
| ---------------------------------- | -------------------------------------------------: |
| **Group name**                     |                                            Default |
| - Group operator                   |                                       Any of these |
| Sensitive info types               |                                                    |
| - Australia Tax File Number        |    High confidencebr>Instance count: `10` to `Any` |
| - Australia Medical Account Number |    High confidencebr>Instance count: `10` to `Any` |
| - Australia Physical Addresses     | Medium confidence<br>Instance count: `10` to `Any` |
| ***AND***                          |                                                    |
| **Group name**                     |                                              Names |
| - Group operator                   |                                       All of these |
| Sensitive info types               |                                                    |
| - All Full Names                   |  Medium confidencebr>Instance count: `10` to `Any` |
| ***AND***                          |                                                    |
| **Group name**                     |                     All medical terms & conditions |
| - Group operator                   |                                       All of these |
| Sensitive info types               |                                                    |
| - All Medical Terms And Conditions |    High confidencebr>Instance count: `10` to `Any` |

##### User notifications 

| Item                                                                                             |               Value |
| ------------------------------------------------------------------------------------------------ | ------------------: |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                  On |
| **Endpoint devices**                                                                             |                     |
| Show users a policy tip notification when an activity is restricted.                             |         Not checked |
| **Microsoft 365 services**                                                                       |                     |
| Notify users in Office 365 service with a policy tip                                             |             Checked |
| **Email notifications**                                                                          | Notify these people |
| - The person who sent, shared, or last modified the content                                      |             Checked |
| - Owner of the SharePoint site or OneDrive account                                               |             Checked |
| - Owner of the SharePoint or OneDrive content                                                    |             Checked |
| Attach matching email message to the notification                                                |             Checked |
| Customize the policy tip text                                                                    |         Not checked |
| Show the policy tip as a dialog for the end user before send                                     |         Not checked |
| Provide a compliance URL for the end user to learn more about your organization's policies       |         Not checked |

##### User overrides

| Item                               |       Value |
| ---------------------------------- | ----------: |
| Allow overrides from M365 services | Not checked |

##### Incident reports

| Item                                                                           |                                              Value |
| ------------------------------------------------------------------------------ | -------------------------------------------------: |
| Use this severity level in admin alerts and reports                            |                                               High |
| Send an alert to admins when a rule match occurs                               |                                                 On |
| Send email alerts to these people (optional)                                   |                                                    |
| Collect original file as evidence for all selected file activities on Endpoint |                                        Not checked |
| Send alert                                                                     | Send alert every time an activity matches the rule |
| Use email incident reports to notify you when a policy matches                 |                                                 On |
| Send notifications to these people                                             |                                          SiteAdmin |
| **You can also include the following information in the report:**              |                                                    |
| The name of the person who last modified the content                           |                                            Checked |
| The types of sensitive content that matched the rule                           |                                            Checked |
| The rule's severity level                                                      |                                            Checked |
| The content that matched the rule, including the surrounding text              |                                            Checked |
| The item containing the content that matched the rule                          |                                            Checked |

##### Additional options

| Item                                                                                |       Value |
| ----------------------------------------------------------------------------------- | ----------: |
| If there's a match for this rule, stop processing additional DLP policies and rules | Not checked |
| Priority                                                                            |           1 |

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