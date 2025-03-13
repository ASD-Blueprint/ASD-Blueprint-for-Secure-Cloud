---
title: "Password protection"
linkTitle: "Password protection"
weight: 20
type: docs
description: "This page describes the configuration of password protection within Microsoft Entra ID associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Entra admin portal at the following URL:

<https://entra.microsoft.com/#view/Microsoft_AAD_IAM/AuthenticationMethodsMenuBlade/~/PasswordProtection/>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

| Item                                                          |                              Value |
| ------------------------------------------------------------- | ---------------------------------: |
| Lockout threshold                                             |                                  5 |
| Lockout duration in seconds                                   |                                 60 |
| Enforce custom list                                           |                                Yes |
| Custom banned password list                                   | *as per organisation requirements* |
| Enable password protection on Windows Server Active Directory |                                Yes |
| Mode                                                          |                           Enforced |

### Related information

#### Security & Governance

* [System Management]({{<ref "system-management.md">}})
* [Authentication Hardening]({{<ref "system-hardening-authentication">}})
* [Essential Eight - Restrict Administrative Privileges]({{<ref "security-and-governance/essential-eight/restrict-administrative-privileges.md">}})
* [Essential Eight: Multi-factor Authentication]({{<ref "security-and-governance/essential-eight/multi-factor-authentication.md">}})
* [Essential Eight: Restrict Microsoft Office Macros]({{<ref "restrict-microsoft-office-macros.md">}})

#### Design

* [Authentication]({{<ref "authentication">}})
* [Identity]({{<ref "design/platform/identity">}})
* [Identity security]({{<ref "identity-security">}})

#### Configuration

* [Entra ID Protection]({{<ref "configuration/entra-id/protection">}})
* [Intune Endpoint Security]({{<ref "configuration/intune/endpoint-security">}})
* [Microsoft Intune - Profile Configurations]({{<ref "configuration/intune/devices/configuration-policies">}})
* [Endpoint security policies]({{<ref "configuration/defender/endpoints/configuration-management/endpoint-security-policies.md">}})
* [Cloud app Settings]({{<ref "configuration/defender/settings/cloud-apps/settings.md">}})
* [Rules]({{<ref "configuration/defender/settings/endpoints/rules.md">}})

#### References

* [Password and account lockout policies](https://learn.microsoft.com/entra/identity/domain-services/password-policy)
