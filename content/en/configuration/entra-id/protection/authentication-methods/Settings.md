---
title: "Settings"
linkTitle: "Settings"
weight: 40
type: docs
description: "This page describes the configuration of authentication method settings of Microsoft Entra ID associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Entra admin portal at the following URL:

<https://entra.microsoft.com/#view/Microsoft_AAD_IAM/AuthenticationMethodsMenuBlade/~/AuthMethodsSettings>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Report suspicious activity

| Item           |             Value |
| -------------- | ----------------: |
| State          | Microsoft managed |
| Target         |         All users |
| Reporting code |                 0 |

### System-preferred multifactor authentication

| Item   |             Value |
| ------ | ----------------: |
| State  | Microsoft managed |
| Target |         All users |

### Related information

#### Security & Governance

* [Multi-factor Authentication]({{<ref "multi-factor-authentication">}})
* [Authentication Hardening]({{<ref "system-hardening-authentication">}})
* [System Management]({{<ref "system-management.md">}})
* [Essential Eight: Restrict Microsoft Office Macros]({{<ref "restrict-microsoft-office-macros.md">}})

#### Design

* [Authentication]({{<ref "authentication">}})

#### Configuration

* [Microsoft Intune - Profile Configurations]({{<ref "configuration/intune/devices/configuration-policies">}})
* [Entra ID Protection]({{<ref "configuration/entra-id/protection">}})
* [Endpoint security policies]({{<ref "configuration/defender/endpoints/configuration-management/endpoint-security-policies.md">}})
* [Cloud app Settings]({{<ref "configuration/defender/settings/cloud-apps/settings.md">}})

#### References

* [Configure Microsoft Entra multifactor authentication settings](https://learn.microsoft.com/entra/identity/authentication/howto-mfa-mfasettings)
* [System-preferred multifactor authentication - Authentication methods policy](https://learn.microsoft.com/entra/identity/authentication/concept-system-preferred-multifactor-authentication)
* [Protecting authentication methods in Microsoft Entra ID](https://learn.microsoft.com/entra/identity/authentication/concept-authentication-default-enablement)
