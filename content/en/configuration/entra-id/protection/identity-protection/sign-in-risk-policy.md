---
title: "Sign-in risk policy"
linkTitle: "Sign-in risk policy"
weight: 20
type: docs
description: "This page describes the configuration of a sign-in risk policy within Microsoft Entra ID associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Entra admin portal at the following URL:

<https://entra.microsoft.com/#view/Microsoft_AAD_IAM/IdentityProtectionMenuBlade/~/SignInPolicy>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Sign-in risk remediation policy

| Item               |                              Value |
| ------------------ | ---------------------------------: |
| Users              |                 Include: All users |
|                    |    Exclude: *Break Glass accounts* |
| User risk          |                   Medium and above |
| Controls           | Require multifactor authentication |
| Policy enforcement |                            Enabled |

### Related information

#### Security & Governance

* [Essential Eight - Restrict Administrative Privileges]({{<ref "security-and-governance/essential-eight/restrict-administrative-privileges.md">}})
* [Authentication Hardening]({{<ref "system-hardening-authentication">}})
* [Essential Eight: Multi-factor Authentication]({{<ref "security-and-governance/essential-eight/multi-factor-authentication.md">}})
  
#### Design

* [Identity protection]({{<ref "design/platform/identity/protection">}})

#### Configuration

* [Entra ID Protection]({{<ref "configuration/entra-id/protection">}})
* [Break Glass]({{<ref "configuration/entra-id/users/break-glass-accounts.md">}})

#### References

* [Migrate risk policies from Identity Protection to Conditional Access](https://learn.microsoft.com/entra/id-protection/howto-identity-protection-configure-risk-policies#migrate-risk-policies-from-identity-protection-to-conditional-access)
* [What is identity protection](https://learn.microsoft.com/entra/id-protection/overview-identity-protection)
