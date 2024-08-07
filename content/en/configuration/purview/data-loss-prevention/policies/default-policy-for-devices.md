---
title: "Data Loss Prevention: Default policy for devices"
weight: 070
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

| Item        |                                                                                                                                                                                                                                                                                                                       Value |
| ----------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| Name        |                                                                                                                                                                                                                                                                                                  Default policy for devices |
| Description | This policy detects the presence of credit card numbers in files on devices when users perform specific activities (such as printing a file). When detected, the activity is only audited (not blocked). Admins will receive an alert, but policy tips won't be displayed to users. You can edit these actions at any time. |

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
| Teams chat and channel messages |                      |
| Devices                         | All users and groups |
| Instances                       |                      |
| On-premises repositories        |                      |
| Power BI workspaces             |                      |

### Advanced DLP rules

#### Default Endpoint DLP Policy Rule - Low Volume

| Item        |                                                                                                                                                                                                                                             Value |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| Name        |                                                                                                                                                                                                     Default Endpoint DLP Policy Rule - Low Volume |
| Description | This rule is matched if 1 to 9 credit card numbers are detected in a file when a user performs certain device-related activities. When detected within a 24-hour period, the activity is only audited (not blocked). Admins won't receive alerts. |
|             |                                                                                                                                                                                                                                                   |
##### Conditions

**Content contains**

| Item                 |                                         Value |
| -------------------- | --------------------------------------------: |
| Group name           |                                       Default |
| Group operator       |                                  Any of these |
| Sensitive info types |                                               |
| - Credit Card Number | High confidence<br>Instance count: `1` to `9` |

##### Actions

**Audit or restrict activities on devices**

| Item                                                                             |                 Value |
| -------------------------------------------------------------------------------- | --------------------: |
| **Service domain and browser activities**                                        |                       |
| Upload to a restricted cloud service domain or access from an unallowed browsers | Checked<br>Audit only |
| Paste to supported browsers                                                      |                       |
| **File activities for all apps**                                                 |                       |
| Apply restrictions to specific activity                                          |               Checked |
| Copy to Clipboard                                                                | Checked<br>Audit only |
| Copy to removable USB device                                                     | Checked<br>Audit only |
| Copy to a network share                                                          | Checked<br>Audit only |
| Print                                                                            | Checked<br>Audit only |
| Copy or move using unallowed Bluetooth app                                       | Checked<br>Audit only |
| Copy or move using RDP                                                           | Checked<br>Audit only |
| **Restricted app activities**                                                    |                       |
| Access by restricted apps                                                        | Checked<br>Audit only |

##### User notifications 

| Item                                                                                             | Value |
| ------------------------------------------------------------------------------------------------ | ----: |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |   Off |

##### User overrides

| Item                               |       Value |
| ---------------------------------- | ----------: |
| Allow overrides from M365 services | Not checked |
| Business justification             | Not checked |

##### Incident reports

| Item                                                | Value |
| --------------------------------------------------- | ----: |
| Use this severity level in admin alerts and reports |   Low |
| Send an alert to admins when a rule match occurs    |   Off |

##### Additional options

| Item                                                                                |       Value |
| ----------------------------------------------------------------------------------- | ----------: |
| If there's a match for this rule, stop processing additional DLP policies and rules | Not checked |
| Priority                                                                            |           0 |

#### Default Endpoint DLP Policy Rule - High Volume

| Item        |                                                                                                                                                                                                                                                         Value |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| Name        |                                                                                                                                                                                                                Default Endpoint DLP Policy Rule - High Volume |
| Description | This rule is matched if 10 or more credit card numbers are detected in a file when a user performs certain device-related activities. When detected within a 24-hour period, the activity is only audited (not blocked), and admins will be alerted in email. |
|             |                                                                                                                                                                                                                                                               |
##### Conditions

**Content contains**

| Item                 |                                            Value |
| -------------------- | -----------------------------------------------: |
| Group name           |                                          Default |
| Group operator       |                                     Any of these |
| Sensitive info types |                                                  |
| - Credit Card Number | High confidence<br>Instance count: `10` to `Any` |

##### Actions

**Audit or restrict activities on devices**

| Item                                                                             |                 Value |
| -------------------------------------------------------------------------------- | --------------------: |
| **Service domain and browser activities**                                        |                       |
| Upload to a restricted cloud service domain or access from an unallowed browsers | Checked<br>Audit only |
| Paste to supported browsers                                                      |                       |
| **File activities for all apps**                                                 |                       |
| Apply restrictions to specific activity                                          |               Checked |
| Copy to Clipboard                                                                | Checked<br>Audit only |
| Copy to removable USB device                                                     | Checked<br>Audit only |
| Copy to a network share                                                          | Checked<br>Audit only |
| Print                                                                            | Checked<br>Audit only |
| Copy or move using unallowed Bluetooth app                                       | Checked<br>Audit only |
| Copy or move using RDP                                                           | Checked<br>Audit only |
| **Restricted app activities**                                                    |                       |
| Access by restricted apps                                                        | Checked<br>Audit only |

##### User notifications 

| Item                                                                                             | Value |
| ------------------------------------------------------------------------------------------------ | ----: |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |   Off |


##### User overrides

| Item                               |       Value |
| ---------------------------------- | ----------: |
| Allow overrides from M365 services | Not checked |
| Business justification             | Not checked |

##### Incident reports

| Item                                                |  Value |
| --------------------------------------------------- | -----: |
| Use this severity level in admin alerts and reports | Medium |
| Send an alert to admins when a rule match occurs    |    Off |

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