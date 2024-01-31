---
title: "User risk policy"
linkTitle: "User risk policy"
weight: 10
type: docs
description: "This page describes the configuration of a user risk policy within Microsoft Entra ID associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Entra ID portal blade at the following URL:

https://entra.microsoft.com/#view/Microsoft_AAD_IAM/IdentityProtectionMenuBlade/~/UserPolicy
 
The settings described in these tables should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

### User risk remediation policy

| Item               |                           Value |
| ------------------ | ------------------------------: |
| Users              |              Include: All users |
|                    | Exclude: *BreakGlass accounts* |
| User risk          |                Medium and above |
| Controls           |         Require password change |
| Policy enforcement |                         Enabled |

### Related information

#### Security & Governance

* None identified
  
#### Design

* [Identity protection]({{<ref "design/platform/identity/protection">}})

#### Configuration

* None identified

#### References

* [Migrate risk policies from Identity Protection to Conditional Access](https://learn.microsoft.com/entra/id-protection/howto-identity-protection-configure-risk-policies#migrate-risk-policies-from-identity-protection-to-conditional-access)
* [What is identity protection](https://learn.microsoft.com/entra/id-protection/overview-identity-protection)


