---
title: "Multifactor authentication registration policy"
linkTitle: "Multifactor authentication registration policy"
weight: 30
type: docs
description: "This page describes the configuration of a multifactor authentication policy within Microsoft Entra ID associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Entra admin portal at the following URL:

<https://entra.microsoft.com/#view/Microsoft_AAD_IAM/IdentityProtectionMenuBlade/~/MfaPolicy>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Multifactor authentication registration policy

| Item                                                               |                                   Value |
| ------------------------------------------------------------------ | --------------------------------------: |
| Users                                                              |                      Include: All users |
|                                                                    | Exclude: grp-Conditional_Access_Exclude |
| Require Microsoft Entra ID multifactor authentication registration |                                 Checked |
| Policy enforcement                                                 |                                 Enabled |

### Related information

#### Security & Governance

* [Multi-factor Authentication]({{<ref "multi-factor-authentication">}})
* [Authentication Hardening]({{<ref "system-hardening-authentication">}})

#### Design

* [Identity protection]({{<ref "design/platform/identity/protection">}})

#### Configuration

* [Microsoft Intune - profile configurations]({{<ref "configuration/intune/devices/configuration-profiles">}})
* [Entra ID protection]({{<ref "configuration/entra-id/protection">}})
* [Cloud app Settings]({{<ref "configuration/defender/settings/cloud-apps/settings.md">}})

#### References

* [Configure the Microsoft Entra multifactor authentication registration policy](https://learn.microsoft.com/entra/id-protection/howto-identity-protection-configure-mfa-policy)
