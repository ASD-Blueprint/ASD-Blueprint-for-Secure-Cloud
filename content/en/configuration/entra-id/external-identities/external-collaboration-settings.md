---
title: "External collaboration settings"
linkTitle: "External collaboration settings"
weight: 30
type: docs
description: "This page describes the configuration of external collaboration settings within Microsoft Entra ID associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Entra admin portal at the following URL:

<https://entra.microsoft.com/#view/Microsoft_AAD_IAM/CompanyRelationshipsMenuBlade/~/Settings>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Guest user access

| Item                           |                                                                                                           Value |
| ------------------------------ | --------------------------------------------------------------------------------------------------------------: |
| Guest user access restrictions | Guest user access is restricted to properties and memberships of their own directory objects (most restrictive) |
|                                |                                                                                                                 |

### Guest invite settings

| Item                                             |                                                                                 Value |
| ------------------------------------------------ | ------------------------------------------------------------------------------------: |
| Guest invite restrictions                        | No one in the organization can invite guest users including admins (most restrictive) |
| Enable guest self-service sign up via user flows |                                                                                    No |

### External user leave settings

| Item                                                                           | Value |
| ------------------------------------------------------------------------------ | ----: |
| Allow external users to remove themselves from your organization (recommended) |   Yes |

### Collaboration restrictions

| Item                       |                                                       Value |
| -------------------------- | ----------------------------------------------------------: |
| collaboration restrictions | Allow invitations to be sent to any domain (most inclusive) |

### Related information

#### Security & Governance

* [System Management]({{<ref "system-management.md">}})
  
#### Design

* [External Identities]({{<ref "design/platform/identity/external-identities">}})
* [Conditional Access]({{<ref "design/platform/identity/conditional-access.md">}})
  
#### Configuration

* None identified

#### References

* [External Identities](https://learn.microsoft.com/entra/external-id/index-b2b)
* [Configure external collaboration settings](https://learn.microsoft.com/entra/external-id/external-collaboration-settings-configure)
