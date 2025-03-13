---
title: "Compliance Manager assessments"
linkTitle: "Compliance Manager assessments"
weight: 10
description: "This section describes the configuration of Compliance Manager assessments within Microsoft Purview associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables configuration outlines the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Purview portal at the following URL:

<https://purview.microsoft.com/compliancemanager/assessmentspage>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Assessments

#### Australian Information Security Registered Assessor Program (IRAP) with ISM - Protected

| Item             |                                                                                              Value |
| ---------------- | -------------------------------------------------------------------------------------------------: |
| Assessment name  | Australian Information Security Registered Assessor Program (IRAP) with ISM - Protected Assessment |
| Assessment group |                                                                                      Default Group |
| Select Services  |                                                                                      Microsoft 365 |

#### ASD Essential 8 Maturity Level 2

| Item             |                                       Value |
| ---------------- | ------------------------------------------: |
| Assessment name  | ASD Essential 8 Maturity Level 2 Assessment |
| Assessment group |                               Default Group |
| Select Services  |                               Microsoft 365 |

### Related information

#### Security & Governance

- None identified

#### Design

- [Compliance Manager]({{<ref "design/shared-services/purview/compliance-manager">}})

#### Configuration

- None identified

#### References

- [Build and manage assessments in Compliance Manager](https://learn.microsoft.com/purview/compliance-manager-assessments)
