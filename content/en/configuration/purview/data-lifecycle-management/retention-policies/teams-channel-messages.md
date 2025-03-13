---
title: "Teams channel messages 7 year hold"
linkTitle: "Teams channel messages 7 year hold"
weight: 030
description: "This section describes the configuration of Data Lifecycle Management retention policies within Microsoft Purview associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Purview portal at the following URL:

<https://purview.microsoft.com/datalifecyclemanagement/retention>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

{{% alert title="Retention policy state" color="info" %}}

Retention policies are enabled by default after creation. Administrators should be aware of the potential for some references to Microsoft 365 groups to remain following deletion as described [here](https://learn.microsoft.com/en-us/purview/retention-settings#what-happens-if-a-microsoft-365-group-is-deleted-after-a-policy-is-applied).

{{% /alert %}}

### Name

| Item        |                                                                    Value |
| ----------- | -----------------------------------------------------------------------: |
| Name        |                                       Teams channel messages 7 year hold |
| Description | Retains all information stored within Teams channel messages for 7 years |

### Administrative Units

| Item        |          Value |
| ----------- | -------------: |
| Admin units | Full directory |

### Type

| Item                                          |  Value |
| --------------------------------------------- | -----: |
| Choose the type of retention policy to create | Static |

#### Locations

| Item                                       |     Value |
| ------------------------------------------ | --------: |
| Exchange mailboxes                         |       Off |
| SharePoint classic and communication sites |       Off |
| OneDrive accounts                          |       Off |
| Microsoft 365 Group mailboxes & sites      |       Off |
| Skype for Business                         |       Off |
| Exchange public folders                    |       Off |
| Teams channel messages                     |        On |
| - Included                                 | All teams |
| - Excluded                                 |      None |
| Teams chats and Copilot interactions       |       Off |
| Teams private channel messages             |       Off |
| Yammer community messages                  |       Off |
| Yammer user messages                       |       Off |

### Retention settings

| Item                                                     |                              Value |
| -------------------------------------------------------- | ---------------------------------: |
| Decide if you want to retain content, delete it, or both | Retain items for a specific period |
| - Retain items for a specific period                     |                            7 years |
| - Start the retention period based on                    |      When items were last modified |
| - At the end of the retention period                     |                         Do nothing |
| Retain items forever                                     |                       Not selected |
| Only delete items when they reach a certain age          |                       Not selected |

### Related information

#### Security & Governance

* None identified
  
#### Design

* [Backup and Operational Management]({{<ref "design/platform/backup">}})
* [Data Lifecycle Management]({{<ref "design/shared-services/purview/data-lifecycle-management">}})
  
#### Configuration

* None identified

#### References

* [Learn about data lifecycle management](https://learn.microsoft.com/en-us/purview/data-lifecycle-management)
* [Create and configure retention policies](https://learn.microsoft.com/en-us/purview/create-retention-policies?tabs=teams-retention)