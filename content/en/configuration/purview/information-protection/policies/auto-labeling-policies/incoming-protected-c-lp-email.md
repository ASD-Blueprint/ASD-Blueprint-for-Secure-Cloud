---
title: "Label incoming PROTECTED CABINET Legal Privilege email"
linkTitle: "Label incoming PROTECTED CABINET Legal Privilege email"
weight: 105
description: "This section describes the configuration of auto-labeling policies within Microsoft Purview associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Purview portal at the following URL:

<https://purview.microsoft.com/informationprotection/autolabeling>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

{{% alert title="Turning on auto-labeling policies" color="info" %}}

Auto-labeling polices are in simulation mode by default and must be individually turned on post-configuration.

{{% /alert %}}

### Name

#### Name your auto-labeling policy

| Item        |                                                                                                            Value |
| ----------- | ---------------------------------------------------------------------------------------------------------------: |
| Name        |                                                           Label incoming PROTECTED CABINET Legal Privilege email |
| Description | Applies the PROTECTED CABINET Legal Privilege label to incoming emails based on either the header or the subject |

### Label

#### Choose a label to auto-apply

| Item                |                                     Value |
| ------------------- | ----------------------------------------: |
| Label to auto-apply | PROTECTED CABINET (group)/Legal Privilege |

### Admin units

#### Assign admin units

| Item        |          Value |
| ----------- | -------------: |
| Admin units | Full directory |

### Locations

#### Choose locations where you want to apply the label

| Item              |                Value |
| ----------------- | -------------------: |
| Exchange email    | All users and groups |
| SharePoint sites  |          Not checked |
| OneDrive accounts |          Not checked |

### Policy rules

#### Set up common or advanced rules

| Item           |    Value |
| -------------- | -------: |
| Advanced rules | Selected |

#### Exchange rules

| Item               |                                                        Value |
| ------------------ | -----------------------------------------------------------: |
| Name               |         Check for PROTECTED CABINET Legal Privilege X-header |
| Description        |                                                       *None* |
| Conditions         |                                      Header matches patterns |
| Header name        |                                         X-Protective-Marking |
| Regular expression | `SEC=PROTECTED, CAVEAT=SH:CABINET.*, ACCESS=Legal-Privilege` |

| Item               |                                                            Value |
| ------------------ | ---------------------------------------------------------------: |
| Name               |              Check for PROTECTED CABINET Legal Privilege subject |
| Description        |                                                           *None* |
| Conditions         |                                         Subject matches patterns |
| Regular expression | `\[SEC=PROTECTED, CAVEAT=SH:CABINET.*, ACCESS=Legal-Privilege\]` |

### Additional settings for email

| Item                                                                       |                               Value |
| -------------------------------------------------------------------------- | ----------------------------------: |
| Automatically replace existing labels that have the same or lower priority |                             Checked |
| Apply encryption to email received from outside your organization          |                             Checked |
| - Assign a Rights Management owner                                         | `<Rights Management Owner account>` |

### Policy mode

| Item                                                                    |                         Value |
| ----------------------------------------------------------------------- | ----------------------------: |
| Decide if you want to test out the policy now or later                  | Run policy in simulation mode |
| Automatically turn on policy if not modified after 7 days in simulation |                   Not checked |

### Related information

#### Security & Governance

- None identified
  
#### Design

- [Azure Rights Management]({{<ref "design/shared-services/purview/azure-rights-management">}})
- [Email flow]({{<ref "design/shared-services/purview/email-handling">}})
- [Labelling and classification]({{<ref "design/shared-services/purview/labelling-and-classification">}})
  
#### Configuration

- None identified

#### References

- [Apply a sensitivity label to content automatically](https://learn.microsoft.com/en-au/purview/apply-sensitivity-label-automatically)
- [Regular expression quick reference](https://learn.microsoft.com/en-au/dotnet/standard/base-types/regular-expression-language-quick-reference)
