---
title: "Data Loss Prevention: Default policy for Teams"
weight: 075
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

| Item        |                                                                                                                                                                                                                                                Value |
| ----------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| Name        |                                                                                                                                                                                                                             Default policy for Teams |
| Description | This policy detects the presence of credit card numbers in Teams chats and channel messages. When this sensitive info is detected, admins will receive an alert but policy tips won't be displayed to users. You can edit these actions at any time. |

### Admin units

| Item        |          Value |
| ----------- | -------------: |
| Admin units | Full directory |

### Locations 

| Item                            |                Value |
| ------------------------------- | -------------------: |
| Exchange email                  |                      |
| SharePoint sites                |                      |
| OneDrive accounts               |                      |
| Teams chat and channel messages | All users and groups |
| Devices                         |                      |
| Instances                       |                      |
| On-premises repositories        |                      |
| Power BI workspaces             |                      |

### Advanced DLP rules

#### Default Teams DLP policy rule

| Item        |                                                                                                                                                                            Value |
| ----------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| Name        |                                                                                                                                                    Default Teams DLP policy rule |
| Description | This rule detects the presence of one or more credit card numbers. Admins will be alerted in email when 10 or more instances are detected within a 24-hour period for all users. |

##### Conditions

**Content contains**

| Item                     |                                           Value |
| ------------------------ | ----------------------------------------------: |
| Group name               |                                         Default |
| Group operator           |                                    Any of these |
| **Sensitive info types** |                                                 |
| Credit Card Number       | High confidence<br>Instance count: `1` to `Any` |

##### Actions

None

##### User notifications 

| Item                                                                                             | Value |
| ------------------------------------------------------------------------------------------------ | ----: |
| Use notifications to inform your users and help educate them on the proper use of sensitive info | False |

##### User overrides

| Item                               | Value |
| ---------------------------------- | ----: |
| Allow overrides from M365 services | False |

##### Incident reports

| Item                                                                |       Value |
| ------------------------------------------------------------------- | ----------: |
| Use this severity level in admin alerts and reports                 |         Low |
| Send an alter to admins when a rule match occurs                    |             |
| Use email incident reports to notify you when a policy match occurs |     Checked |
| Send notifications to these people                                  |   SiteAdmin |
| **You can also include the following information in the report:**   |             |
| The name of the person who last modified the content                |     Checked |
| The types of sensitive content that matched the rule                |     Checked |
| The rule's severity level                                           |     Checked |
| The content that matched the rule, including the surrounding text   | Not checked |
| The item containing the content that matched the rule               | Not checked |

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