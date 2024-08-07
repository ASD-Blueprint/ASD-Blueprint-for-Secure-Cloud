---
title: "Conditional Access policies"
linkTitle: "Conditional Access policies"
weight: 10
type: docs
description: "This page describes the configuration of Conditional Access policies within Microsoft Entra ID associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Entra admin portal at the following URL:

<https://entra.microsoft.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade/~/Policies>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

An existing security group must be specified to act as a Conditional Access exclusion group.

All Conditional Access policies in the DSC are set to either report only or disabled, and will need to be enabled manually.

Microsoft-managed policies may be created as a result of other Entra ID settings and identified by a *MICROSOFT-MANAGED* tag. These policies can be disabled as they're superseded by Blueprint policies.

| Item          |                                                                   Value |
| ------------- | ----------------------------------------------------------------------: |
| Name          | Multifactor authentication for admins accessing Microsoft Admin Portals |
| Enable policy |                                                                     Off |

| Item          |                                                                    Value |
| ------------- | -----------------------------------------------------------------------: |
| Name          | Multifactor authentication for per-user multifactor authentication users |
| Enable policy |                                                                      Off |

| Item          |                                                              Value |
| ------------- | -----------------------------------------------------------------: |
| Name          | Multifactor authentication and reauthentication for risky sign-ins |
| Enable policy |                                                                Off |

| Item          |                       Value |
| ------------- | --------------------------: |
| Name          | Block legacy authentication |
| Enable policy |                         Off |

| Item          |                                                   Value |
| ------------- | ------------------------------------------------------: |
| Name          | Require multifactor authentication for Azure management |
| Enable policy |                                                     Off |

| Item          |                                         Value |
| ------------- | --------------------------------------------: |
| Name          | Require multifactor authentication for admins |
| Enable policy |                                           Off |

| Item          |                                            Value |
| ------------- | -----------------------------------------------: |
| Name          | Require multifactor authentication for all users |
| Enable policy |                                              Off |

Refer to the [Microsoft-managed policies](https://learn.microsoft.com/en-us/entra/identity/conditional-access/managed-policies) article for additional information.
