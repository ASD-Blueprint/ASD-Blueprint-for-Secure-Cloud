---
Title: "Data Lifecycle Management: OneDrive accounts 7 year hold"
weight: 020
description: "This section describes the configuration of data lifecycle management retention policies within Microsoft Purview associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* for the Microsoft Purview portal blade at the following URL: 
 
https://compliance.microsoft.com/informationgovernance?viewid=retention
 
The settings described in these tables should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Name

| Item        |                                                               Value |
| ----------- | ------------------------------------------------------------------: |
| Name        |                                       OneDrive accounts 7 year hold |
| Description | Retains all information stored within OneDrive accounts for 7 years |

### Administrative Units

| Item        |          Value |
| ----------- | -------------: |
| Admin units | Full directory |

### Type 

| Item                                          |  Value |
| --------------------------------------------- | -----: |
| Choose the type of retention policy to create | Static |

#### Locations

| Item                                       |             Value |
| ------------------------------------------ | ----------------: |
| Exchange mailboxes                         |               Off |
| SharePoint classic and communication sites |               Off |
| OneDrive accounts                          |                On |
| - Included                                 | All user accounts |
| - Excluded                                 |              None |
| Microsoft 365 Group mailboxes & sites      |               Off |
| Skype for Business                         |               Off |
| Exchange public folders                    |               Off |
| Teams channel messages                     |               Off |
| Teams chats and Copilot interactions       |               Off |
| Teams private channel messages             |               Off |
| Yammer community messages                  |               Off |
| Yammer user messages                       |               Off |

### Retention settings

| Item                                                     |                              Value |
| -------------------------------------------------------- | ---------------------------------: |
| Decide if you want to retain content, delete it, or both | Retain items for a specific period |
| - Retain items for a specific period                     |                            7 years |
| - Start the retention period based on                    |      When items were last modified |
| - At the end of the retention period                     |                         Do nothing |

### Related information

#### Security & Governance

* None identified
  
#### Design

* None identified
  
#### Configuration

* None identified

#### References

* None identified