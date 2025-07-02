---
title: "Users up to PROTECTED policy"
linkTitle: "Users up to PROTECTED policy"
weight: 010
description: "This section describes the configuration of label publishing policies within Microsoft Purview associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Purview portal at the following URL:

<https://purview.microsoft.com/informationprotection/labelpolicies>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Name

| Item        |                                                                     Value |
| ----------- | ------------------------------------------------------------------------: |
| Name        |                                                     Users up to PROTECTED |
| Description | Publishes labels for use with content up to PROTECTED to authorised users |
| Priority    |                                                               1 - highest |

### Labels to publish

#### Choose sensitivity labels to publish

| Item                          |                         Value |
| ----------------------------- | ----------------------------: |
| Sensitivity labels to publish | *Select all PROTECTED labels* |

### Admin units

#### Assign admin units

| Item        |          Value |
| ----------- | -------------: |
| Admin units | Full directory |

### Users and groups

#### Publish to users and groups

| Item             |                                                                              Value |
| ---------------- | ---------------------------------------------------------------------------------: |
| Users and groups | Specific users and groups: `<PROTECTED users group>`<br>`<PROTECTED guests group>` |

### Policy settings

| Item                                                                             |       Value |
| -------------------------------------------------------------------------------- | ----------: |
| Users must provide a justification to remove a label or lower its classification |     Checked |
| Require users to apply a label to their emails and documents                     |     Checked |
| Require users to apply a label to their Fabric and Power BI content              |     Checked |
| Provide users with a link to a custom help page                                  | Not checked |

#### Default settings for documents

| Item          | Value |
| ------------- | ----: |
| Default label |  None |

#### Default settings for emails

| Item                                                   |    Value |
| ------------------------------------------------------ | -------: |
| Default label                                          |     None |
| Require users to apply a label to their emails         |  Checked |
| Email inherits highest priority label from attachments |  Checked |
| Automatically apply label                              | Selected |

#### Default settings for meetings and calendar events

| Item                                                                 |    Value |
| -------------------------------------------------------------------- | -------: |
| Default label                                                        |     None |
| Require users to apply a label to their meetings and calendar events |  Checked |
| Meeting inherits highest priority label from shared file             |  Checked |
| Automatically apply label                                            | Selected |

#### Default settings for sites and groups

| Item                                                    |   Value |
| ------------------------------------------------------- | ------: |
| Default label                                           |    None |
| Require users to apply a label to their groups or sites | Checked |

#### Default settings for Fabric and Power BI content

| Item          | Value |
| ------------- | ----: |
| Default label |  None |

### Related information

#### Security & Governance

- None identified
  
#### Design

- [Labelling and classification]({{<ref "design/shared-services/purview/labelling-and-classification">}})
  
#### Configuration

- None identified

#### References

- [Publish sensitivity labels](https://learn.microsoft.com/en-au/purview/create-sensitivity-labels#publish-sensitivity-labels-by-creating-a-label-policy)
