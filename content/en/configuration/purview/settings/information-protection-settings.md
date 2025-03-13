---
title: "Information Protection settings"
linkTitle: "Information Protection settings"
weight: 10
description: "This section describes the configuration of Information Protection settings within Microsoft Purview associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Purview portal at the following URL:

<https://purview.microsoft.com/settings/application-settings/informationprotection>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

When using automated configuration files, organisations should note they will configure the relevant settings in a Microsoft 365 tenancy exactly as outlined in the Configuration pages of the Blueprint. Organisations should ensure they customise configuration of their Microsoft 365 tenancies in accordance with their own design decisions and requirements, deviating from the Blueprint (including automated configuration files) where appropriate.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

{{% alert title="Co-authoring" color="info"%}}

It is recommended that co-authoring for files with sensitivity labels is enabled. However, organisations should be aware of the prerequisites and limitations before doing so, details of which can be found [here](https://learn.microsoft.com/en-au/purview/sensitivity-labels-coauthoring).

{{% /alert %}}

### Co-authoring for files with sensitivity labels

| Item                                                   |    Value |
| ------------------------------------------------------ | -------: |
| Turn on co-authoring for files with sensitivity labels | Selected |

### Related information

#### Security & Governance

- None identified
  
#### Design

- None identified
  
#### Configuration

- None identified

#### References

- [Co-authoring for files encrypted with sensitivity labels](https://learn.microsoft.com/en-au/purview/sensitivity-labels-coauthoring)
