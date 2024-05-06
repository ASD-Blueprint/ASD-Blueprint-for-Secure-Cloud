---
title: "Authentication contexts"
linkTitle: "Authentication contexts"
weight: 15
type: docs
description: "This page describes the configuration of authentication contexts within Microsoft Entra ID associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Entra ID portal blade at the following URL:

https://entra.microsoft.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade/~/AuthenticationContext/fromNav/
 
The settings described in these tables should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

| Item                                                   | Value   |
|--------------------------------------------------------|--------:|
| **Official Sensitive Locations - Managed Device Only** |         |
| Publish to apps                                        | Checked |
| **Protected Location Access**                          |         |
| Publish to apps                                        | Checked |
| **Official Sensitive Location Access**                 |         |
| Publish to apps                                        | Checked |

### Related information

#### Security & Governance

* [Authentication Hardening]({{<ref "system-hardening-authentication">}})
* [Essential Eight: Restrict Microsoft Office Macros]({{<ref "restrict-microsoft-office-macros.md">}})
* [Multi-factor Authentication]({{<ref "multi-factor-authentication">}})

#### Design

* [Conditional access]({{<ref "design/platform/identity/conditional-access">}})
* [Purview labels]({{<ref "design/shared-services/purview/classification-labels">}})

#### Configuration

* [Password protection]({{<ref "password-protection.md">}})

#### References

* [Conditional Access: Target resources](https://learn.microsoft.com/entra/identity/conditional-access/concept-conditional-access-cloud-apps#authentication-context)

