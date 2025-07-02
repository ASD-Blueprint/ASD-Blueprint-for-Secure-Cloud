---
title: "OFFICIAL sensitivity label"
linkTitle: "OFFICIAL sensitivity label"
weight: 010
description: "This section describes the configuration of sensitivity labels within Microsoft Purview associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Purview portal at the following URL:

<https://purview.microsoft.com/informationprotection/informationprotectionlabels/sensitivitylabels>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

{{% alert title="Enable sensitivity labels for containers" color="info" %}}

Prior to configuring sensitivity labels for groups and sites, an additional one-time procedure is required to enable sensitivity labels for containers and to synchronise labels to Entra ID. Instructions for this procedure can be found [here](https://learn.microsoft.com/en-au/purview/sensitivity-labels-teams-groups-sites#how-to-enable-sensitivity-labels-for-containers-and-synchronize-labels).

{{% /alert %}}

### Label details

#### Provide basic details for this label

| Item                   |                                                                    Value |
| ---------------------- | -----------------------------------------------------------------------: |
| Name                   |                                                                 OFFICIAL |
| Display name           |                                                                 OFFICIAL |
| Label priority         |                                                                        1 |
| Description for users  | No or insignificant impact. This is the majority of routine information. |
| Description for admins |                                                                   *None* |
| Label color            |                                                          *None selected* |

### Scope

#### Define the scope for this label

| Item                                  |       Value |
| ------------------------------------- | ----------: |
| - Files & other data assets           |     Checked |
| - Emails                              |     Checked |
| - Meetings                            |     Checked |
| **Groups & sites**                    |     Checked |
| **Schematized data assets (preview)** | Not checked |

### Items

#### Choose protection settings for the types of items you selected

| Item                             |       Value |
| -------------------------------- | ----------: |
| Control access                   | Not checked |
| Apply content marking            |     Checked |
| Protect Teams meetings and chats | Not checked |

#### Content marking

| Item            |   Value |
| --------------- | ------: |
| Content marking | Enabled |

| Item                |       Value |
| ------------------- | ----------: |
| **Add a watermark** | Not checked |
| **Add a header**    |     Checked |
| - Header text       |    OFFICIAL |
| - Font size         |          12 |
| - Font color        |         Red |
| - Align text        |      Center |
| **Add a footer**    |     Checked |
| - Header text       |    OFFICIAL |
| - Font size         |          12 |
| - Font color        |         Red |
| - Align text        |      Center |

#### Auto-labeling for files and emails

| Item                               |       Value |
| ---------------------------------- | ----------: |
| Auto-labeling for files and emails | Not enabled |

### Groups & sites

#### Define protection settings for groups and sites

| Item                                                      |                Value |
| --------------------------------------------------------- | -------------------: |
| Privacy and external user access                          |          Not checked |
| External sharing and Conditional Access                   |          Not checked |
| Private teams discoverability and shared channel settings |          Not checked |
| Apply a label to channel meetings                         | OFFICIAL<sup>1</sup> |

1: This setting may only be available when editing the label after creation.

### Related information

#### Security & Governance

* None identified
  
#### Design

* [Azure Rights Management]({{<ref "design/shared-services/purview/azure-rights-management">}})
* [Labelling and classification]({{<ref "design/shared-services/purview/labelling-and-classification">}})
  
#### Configuration

* None identified

#### References

* [Sensitivity labels](https://learn.microsoft.com/en-gb/purview/sensitivity-labels)
