---
title: "Cross-tenant access settings"
linkTitle: "Cross-tenant access settings"
weight: 20
type: docs
description: "This page describes the configuration of cross-tenant access settings within Microsoft Entra ID associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Entra admin portal at the following URL:

<https://entra.microsoft.com/#view/Microsoft_AAD_IAM/CompanyRelationshipsMenuBlade/~/CrossTenantAccessSettings>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Default settings

#### Inbound access settings

| Type               | Applies to                | Status      |
| ------------------ | ------------------------- | -----------:|
| B2B collaboration  | External users and groups | All allowed |
| B2B collaboration  | Applications              | All allowed |
| B2B direct connect | External users and groups | All blocked |
| B2B direct connect | Applications              | All blocked |
| Trusted settings   | N/A                       | Disabled    |

#### Outbound access settings

| Type               | Applies to            | Status      |
| ------------------ | --------------------- | -----------:|
| B2B collaboration  | Users and groups      | All allowed |
| B2B collaboration  | External applications | All allowed |
| B2B direct connect | Users and groups      | All blocked |
| B2B direct connect | External applications | All blocked |

#### Tenant restrictions (Preview)

| Applies to                | Status      |
| ------------------------- | -----------:|
| External users and groups | All blocked |
| External applications     | All blocked |

### Default settings

#### Tenant restrictions (Preview)

| Applies to                                   | Status  |
| -------------------------------------------- | -------:|
| Microsoft Azure Government                   | Not set |
| Microsoft Azure China (operated by 21Vianet) | Not set |

### Related information

#### Security & Governance

* [System Management]({{<ref "system-management.md">}})
  
#### Design

* [External Identities]({{<ref "design/platform/identity/external-identities">}})
* [Conditional Access]({{<ref "design/platform/identity/conditional-access.md">}})
  
#### Configuration

* None identified

#### References

* [Overview: Cross-tenant access](https://learn.microsoft.com/entra/external-id/cross-tenant-access-overview#default-settings)
* [External Identities](https://learn.microsoft.com/entra/external-id/index-b2b)
* [Cross-tenant access activity workbook](https://learn.microsoft.com/entra/identity/monitoring-health/workbook-cross-tenant-access-activity)
