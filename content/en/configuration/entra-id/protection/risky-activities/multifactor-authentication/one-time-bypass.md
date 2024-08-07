---
title: "One-time bypass"
linkTitle: "One-time bypass"
weight: 40
type: docs
description: "This page describes the configuration of multifactor authentication within Microsoft Entra ID associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Entra admin portal at the following URL:

<https://entra.microsoft.com/#view/Microsoft_AAD_IAM/MultifactorAuthenticationMenuBlade/~/OneTimeBypass>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

| Item                            | Value |
| ------------------------------- | ----: |
| Default one-time bypass seconds |   300 |

### Related information

#### Security & Governance

* [Authentication Hardening]({{<ref "system-hardening-authentication">}})
* [Multi-factor Authentication]({{<ref "multi-factor-authentication">}})
* [System Monitoring]({{<ref "system-monitoring">}})
* [Essential Eight - Restrict Administrative Privileges]({{<ref "security-and-governance/essential-eight/restrict-administrative-privileges.md">}})
  
#### Design

* [Conditional access]({{<ref "design/platform/identity/conditional-access">}})
* [Authentication]({{<ref "design/platform/identity/authentication.md">}})
  
#### Configuration

* None identified

#### References

* None identified
