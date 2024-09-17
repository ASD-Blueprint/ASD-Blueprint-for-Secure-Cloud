---
title: "Account lockout"
linkTitle: "Account lockout"
weight: 10
type: docs
description: "This page describes the configuration of multifactor authentication within Microsoft Entra ID associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Entra admin portal at the following URL:

<https://entra.microsoft.com/#view/Microsoft_AAD_IAM/MultifactorAuthenticationMenuBlade/~/AccountLockout>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

| Item                                                                    | Value |
| ----------------------------------------------------------------------- | ----: |
| Number of multifactor authentication denials to trigger account lockout |     3 |
| Minutes until account lockout counter is reset                          |   300 |
| Minutes until account is automatically unblocked                        |  1440 |

### Related information

#### Security & Governance

* [Authentication Hardening]({{<ref "system-hardening-authentication">}})
* [Multi-factor Authentication]({{<ref "multi-factor-authentication">}})
* [Essential Eight - Restrict Administrative Privileges]({{<ref "security-and-governance/essential-eight/restrict-administrative-privileges.md">}})

#### Design

* [Authentication]({{<ref "authentication">}})
* [Identity]({{<ref "design/platform/identity">}})
* [Identity security]({{<ref "identity-security">}})

#### Configuration

* [Sign-in risk policy]({{<ref "sign-in-risk-policy.md">}})
* [MFA for Risky Sign-ins]({{<ref "configuration/entra-id/protection/conditional-access/policies/reauthentication-for-risky-sign-ins.md">}})

#### References

* [Password and account lockout policies](https://learn.microsoft.com/entra/identity/domain-services/password-policy)
