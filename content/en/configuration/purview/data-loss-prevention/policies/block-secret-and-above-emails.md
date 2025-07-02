---
title: "Block SECRET and TOP SECRET emails"
linkTitle: "Block SECRET and TOP SECRET emails"
weight: 005
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

| Item        |                                                                                   Value |
| ----------- | --------------------------------------------------------------------------------------: |
| Name        |                                                      Block SECRET and TOP SECRET emails |
| Description | Block emails with a SECRET or TOP SECRET X-Protective-Marking X-header or email subject |

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

##### Block SECRET emails

| Item                                                                                                                                |                                                                                                            Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                                                              Block SECRET emails |
| Description                                                                                                                         |                                                                                                           *None* |
| **Conditions**                                                                                                                      |                                                                                                                  |
| Header matches patterns                                                                                                             |                                                                             X-Protective-Marking<br>`SEC=SECRET` |
| **OR**                                                                                                                              |                                                                                                                  |
| Subject matches patterns                                                                                                            |                                                                                                   `\[SEC=SECRET` |
| **Actions**                                                                                                                         |                                                                                                                  |
| Restrict access or encrypt the content in Microsoft 365 locations                                                                   | Block users from receiving email, or accessing shared SharePoint, OneDrive, and Teams files, and Power BI items. |
|                                                                                                                                     |                                                                                                  Block everyone. |
| **User notifications**                                                                                                              |                                                                                                               On |
| Email notifications                                                                                                                 |                                                                                                          Checked |
| - Notify the user who sent, shared, or last modified the content.                                                                   |                                                                                                         Selected |
| - Attach matching email message to the notification (applies only to Exchange)                                                      |                                                                                                      Not checked |
| Policy tips                                                                                                                         |                                                                                                      Not checked |
| **User overrides**                                                                                                                  |                                                                                                                  |
| Allow overrides from M365 services                                                                                                  |                                                                                                      Not checked |
| **Incident reports**                                                                                                                |                                                                                                                  |
| Use this severity level in admin alerts and reports                                                                                 |                                                                                                           Medium |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                                                               On |
| Send alert every time an activity matches the rule                                                                                  |                                                                                                         Selected |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                                                              Off |
| **Additional options**                                                                                                              |                                                                                                                  |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                                                          Checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                                                              Off |
| Priority                                                                                                                            |                                                                                                                0 |

##### Block TOP SECRET emails

| Item                                                                                                                                |                                                                                                            Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                                                          Block TOP SECRET emails |
| Description                                                                                                                         |                                                                                                           *None* |
| **Conditions**                                                                                                                      |                                                                                                                  |
| Header matches patterns                                                                                                             |                                                                         X-Protective-Marking<br>`SEC=TOP SECRET` |
| **OR**                                                                                                                              |                                                                                                                  |
| Subject matches patterns                                                                                                            |                                                                                               `\[SEC=TOP SECRET` |
| **Actions**                                                                                                                         |                                                                                                                  |
| Restrict access or encrypt the content in Microsoft 365 locations                                                                   | Block users from receiving email, or accessing shared SharePoint, OneDrive, and Teams files, and Power BI items. |
|                                                                                                                                     |                                                                                                  Block everyone. |
| **User notifications**                                                                                                              |                                                                                                               On |
| Email notifications                                                                                                                 |                                                                                                          Checked |
| - Notify the user who sent, shared, or last modified the content.                                                                   |                                                                                                         Selected |
| - Attach matching email message to the notification (applies only to Exchange)                                                      |                                                                                                      Not checked |
| Policy tips                                                                                                                         |                                                                                                      Not checked |
| **User overrides**                                                                                                                  |                                                                                                                  |
| Allow overrides from M365 services                                                                                                  |                                                                                                      Not checked |
| **Incident reports**                                                                                                                |                                                                                                                  |
| Use this severity level in admin alerts and reports                                                                                 |                                                                                                           Medium |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                                                               On |
| Send alert every time an activity matches the rule                                                                                  |                                                                                                         Selected |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                                                              Off |
| **Additional options**                                                                                                              |                                                                                                                  |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                                                          Checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                                                              Off |
| Priority                                                                                                                            |                                                                                                                0 |

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
