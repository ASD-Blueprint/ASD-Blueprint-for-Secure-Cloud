---
title: "Data Lifecycle Management settings"
linkTitle: "Data Lifecycle Management settings"
weight: 10
description: "This section describes the configuration of Data Lifecycle Management settings within Microsoft Purview associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Purview portal at the following URL:

<https://purview.microsoft.com/settings/application-settings/datalifecyclemanagement>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

When using automated configuration files, organisations should note they will configure the relevant settings in a Microsoft 365 tenancy exactly as outlined in the Configuration pages of the Blueprint. Organisations should ensure they customise configuration of their Microsoft 365 tenancies in accordance with their own design decisions and requirements, deviating from the Blueprint (including automated configuration files) where appropriate.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Adaptive protection

| Item                                                       | Value |
| ---------------------------------------------------------- | ----: |
| Adaptive protection in Data Lifecycle Management (preview) |   Off |

### Exchange (legacy)

| Item                                   |                                 Value |
| -------------------------------------- | ------------------------------------: |
| Send undeliverable journal reports to: | `<Data Lifecycle Management mailbox>` |

### Related information

#### Security & Governance

- None identified
  
#### Design

- None identified
  
#### Configuration

- None identified

#### References

- [Data Lifecycle Management](https://learn.microsoft.com/en-us/purview/data-lifecycle-management)
