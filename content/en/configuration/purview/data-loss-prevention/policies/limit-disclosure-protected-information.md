---
Title: "Data Loss Prevention: Limit disclosure of potentially PROTECTED information"
weight: 060
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

| Item        |                                                                                             Value |
| ----------- | ------------------------------------------------------------------------------------------------: |
| Name        |                                             Limit disclosure of potentially PROTECTED information |
| Description | Limit distribution and provide a warning notification to users distributing PROTECTED information |

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

#### Warn users sending information relating to PROTECTED information

| Item        |                                                            Value |
| ----------- | ---------------------------------------------------------------: |
| Name        | Warn users sending information relating to PROTECTED information |
| Description |                                                                  |

##### Conditions

| Item                                                   |                                             Value |
| ------------------------------------------------------ | ------------------------------------------------: |
| **Content is shared from Microsoft 365**               |               with people outside my organization |
| ***AND***                                              |                                                   |
| **Content contains**                                   |                                                   |
| Group name                                             |                                           Default |
| Group operator                                         |                                      Any of these |
| Sensitivity info types                                 |                                                   |
| - PROTECTED classified information                     | Medium confidence<br>Instance count: `1` to `Any` |
| - PROTECTED Personal-Privacy classified information    | Medium confidence<br>Instance count: `1` to `Any` |
| - PROTECTED Legal-Privilege classified information     | Medium confidence<br>Instance count: `1` to `Any` |
| - PROTECTED Legislative-Secrecy classified information | Medium confidence<br>Instance count: `1` to `Any` |
| - PROTECTED NATIONAL-CABINET classified information    | Medium confidence<br>Instance count: `1` to `Any` |
| - PROTECTED CABINET classified information             | Medium confidence<br>Instance count: `1` to `Any` |

##### Actions

| Item                                                              |                                                                                                                                       Value |
| ----------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------: |
| Restrict access or encrypt the content in Microsoft 365 locations | Block users from receiving email or accessing shared SharePoint, OneDrive, and Teams files<br>- Block only people outside your organization |

##### User notifications 

| Item                                                                                             |                                                                                                                                            Value |
| ------------------------------------------------------------------------------------------------ | -----------------------------------------------------------------------------------------------------------------------------------------------: |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                                                                                               On |
| Notify users in Office 365 service with a policy tip                                             |                                                                      Checked<br>- Notify the user who sent, shared, or last modified the content |
| Customize the policy tip text                                                                    | This PROTECTED item requires limited dissemination. Please be aware of this and ensure that it is only distributed to users with need for access |
| Show the policy tip as a dialog for the end user before send                                     |                                                                                                                                          Checked |

##### User overrides

| Item                                                                  |   Value |
| --------------------------------------------------------------------- | ------: |
| Allow overrides from M365 services                                    | Checked |
| Require a business justification to override                          | Checked |
| Override the rule automatically if they report it as a false positive | Checked |
| Require the end user to explicitly acknowledge the override           | Checked |

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