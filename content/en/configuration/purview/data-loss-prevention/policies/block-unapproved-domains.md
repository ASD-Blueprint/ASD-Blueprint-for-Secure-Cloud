---
title: "Block PROTECTED emails except for approved domains"
linkTitle: "Block PROTECTED emails except for approved domains"
weight: 015
description: "This section describes the configuration of Data Loss Prevention policies within Microsoft Purview associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Purview portal at the following URL:

<https://purview.microsoft.com/datalossprevention/policies>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Name

#### Name your DLP policy

| Item        |                                                                                                                                            Value |
| ----------- | -----------------------------------------------------------------------------------------------------------------------------------------------: |
| Name        |                                                                                               Block PROTECTED emails except for approved domains |
| Description | Block emails with PROTECTED labels (including SH and IMM variants) if either the sending or the receiving domain has not been explicitly allowed |

### Admin units

#### Assign admin units

| Item        |          Value |
| ----------- | -------------: |
| Admin units | Full directory |

### Locations

#### Choose where to apply the policy

| Item                            |       Value |
| ------------------------------- | ----------: |
| Exchange email                  |  All groups |
| SharePoint sites                | Not checked |
| OneDrive accounts               | Not checked |
| Teams chat and channel messages | Not checked |
| Devices                         | Not checked |
| Instances                       | Not checked |
| On-premises repositories        | Not checked |
| Fabric and Power BI workspaces  | Not checked |
| Microsoft 365 Copilot (preview) | Not checked |

### Policy settings

| Item                   |                                  Value |
| ---------------------- | -------------------------------------: |
| Define policy settings | Create or customize advanced DLP rules |

#### Advanced DLP rules

##### Block unapproved recipient domains

| Item                                                                                                                                |                                                                                                                                                    Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                                                                                       Block unapproved recipient domains |
| Description                                                                                                                         |                                                                                                                                                   *None* |
| **Conditions**                                                                                                                      |                                                                                                                                                          |
| Content contains                                                                                                                    |                                                                                                                                                          |
| - Group name                                                                                                                        |                                                                                                                                                  Default |
| - Group operator                                                                                                                    |                                                                                                                                             Any of these |
| - Sensitivity labels                                                                                                                |                                                                                                                            *Select all PROTECTED labels* |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                                                                                                    Message or attachment |
| Condition group **AND**                                                                                                             |                                                                                                                                                          |
| **NOT**                                                                                                                             |                                                                                                                                                          |
| **Conditions**                                                                                                                      |                                                                                                                                                          |
| Recipient domain is                                                                                                                 |                                                     `<external organisation's domains used for email>`<br>`<your organisation's domains used for email>` |
| **Actions**                                                                                                                         |                                                                                                                                                          |
| Restrict access or encrypt the content in Microsoft 365 locations                                                                   |                                         Block users from receiving email, or accessing shared SharePoint, OneDrive, and Teams files, and Power BI items. |
|                                                                                                                                     |                                                                                                                                          Block everyone. |
| **User notifications**                                                                                                              |                                                                                                                                                       On |
| Email notifications                                                                                                                 |                                                                                                                                                  Checked |
| - Notify the user who sent, shared, or last modified the content.                                                                   |                                                                                                                                                 Selected |
| - Attach matching email message to the notification (applies only to Exchange)                                                      |                                                                                                                                                  Checked |
| Policy tips                                                                                                                         |                                                                                                                                                  Checked |
| - Customize the policy tip text                                                                                                     | Checked<br>Your attempt to email PROTECTED information will be blocked. If you believe this is in error, please contact `<support@organisation.gov.au>`. |
| - Show the policy tip as a dialog for the end user before send (available for Exchange workload only)                               |                                                                                                                                                  Checked |
| - Upload a JSON file containing custom content that will be used in the pop-up dialog                                               |                                                                                                                                              Not checked |
| - Provide a compliance URL for the end user to learn more about your organization's policies (available for Exchange workload only) |                                                                                                                                              Not checked |
| **User overrides**                                                                                                                  |                                                                                                                                                          |
| Allow overrides from M365 services                                                                                                  |                                                                                                                                              Not checked |
| **Incident reports**                                                                                                                |                                                                                                                                                          |
| Use this severity level in admin alerts and reports                                                                                 |                                                                                                                                                   Medium |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                                                                                                       On |
| Send alert every time an activity matches the rule                                                                                  |                                                                                                                                                 Selected |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                                                                                                      Off |
| **Additional options**                                                                                                              |                                                                                                                                                          |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                                                                                              Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                                                                                                      Off |
| Priority                                                                                                                            |                                                                                                                                                        0 |

##### Block unapproved sender domains

| Item                                                                                                                                |                                                                                                                                                    Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                                                                                          Block unapproved sender domains |
| Description                                                                                                                         |                                                                                                                                                   *None* |
| **Conditions**                                                                                                                      |                                                                                                                                                          |
| Content contains                                                                                                                    |                                                                                                                                                          |
| - Group name                                                                                                                        |                                                                                                                                                  Default |
| - Group operator                                                                                                                    |                                                                                                                                             Any of these |
| - Sensitivity labels                                                                                                                |                                                                                                                            *Select all PROTECTED labels* |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                                                                                                    Message or attachment |
| Condition group **AND**                                                                                                             |                                                                                                                                                          |
| **NOT**                                                                                                                             |                                                                                                                                                          |
| **Conditions**                                                                                                                      |                                                                                                                                                          |
| Sender domain is                                                                                                                    |                                                     `<external organisation's domains used for email>`<br>`<your organisation's domains used for email>` |
| **Actions**                                                                                                                         |                                                                                                                                                          |
| Restrict access or encrypt the content in Microsoft 365 locations                                                                   |                                         Block users from receiving email, or accessing shared SharePoint, OneDrive, and Teams files, and Power BI items. |
|                                                                                                                                     |                                                                                                                                          Block everyone. |
| **User notifications**                                                                                                              |                                                                                                                                                       On |
| Email notifications                                                                                                                 |                                                                                                                                                  Checked |
| - Notify the user who sent, shared, or last modified the content.                                                                   |                                                                                                                                                 Selected |
| - Attach matching email message to the notification (applies only to Exchange)                                                      |                                                                                                                                                  Checked |
| Policy tips                                                                                                                         |                                                                                                                                                  Checked |
| - Customize the policy tip text                                                                                                     | Checked<br>Your attempt to email PROTECTED information will be blocked. If you believe this is in error, please contact `<support@organisation.gov.au>`. |
| - Show the policy tip as a dialog for the end user before send (available for Exchange workload only)                               |                                                                                                                                                  Checked |
| - Upload a JSON file containing custom content that will be used in the pop-up dialog                                               |                                                                                                                                              Not checked |
| - Provide a compliance URL for the end user to learn more about your organization's policies (available for Exchange workload only) |                                                                                                                                              Not checked |
| **User overrides**                                                                                                                  |                                                                                                                                                          |
| Allow overrides from M365 services                                                                                                  |                                                                                                                                              Not checked |
| **Incident reports**                                                                                                                |                                                                                                                                                          |
| Use this severity level in admin alerts and reports                                                                                 |                                                                                                                                                   Medium |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                                                                                                       On |
| Send alert every time an activity matches the rule                                                                                  |                                                                                                                                                 Selected |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                                                                                                      Off |
| **Additional options**                                                                                                              |                                                                                                                                                          |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                                                                                              Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                                                                                                      Off |
| Priority                                                                                                                            |                                                                                                                                                        1 |

### Policy mode

| Item        |                          Value |
| ----------- | -----------------------------: |
| Policy mode | Turn the policy on immediately |

### Related information

#### Security & Governance

* None identified
  
#### Design

* [Data Loss Prevention]({{<ref "design/shared-services/purview/data-loss-prevention">}})
  
#### Configuration

* None identified

#### References

* [Data Loss Prevention policy reference](https://learn.microsoft.com/en-au/purview/dlp-policy-reference)
