---
title: "Policies"
linkTitle: "Policies"
weight: 10
type: docs
description: "This page describes the configuration of policies within Microsoft Entra ID associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Entra ID portal blade at the following URL:

https://entra.microsoft.com/#view/Microsoft_AAD_IAM/AuthenticationMethodsMenuBlade/~/AdminAuthMethods
 
The settings described in these tables should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

| Method                           | Target                                            | Enabled |
| -------------------------------- | ------------------------------------------------- | ------: |
| FIDO2 security key               | All users, exclude grp-Conditional_Access_Exclude |     Yes |
| Microsoft Authenticator          | All users, exclude grp-Conditional_Access_Exclude |     Yes |
| SMS                              |                                                   |      No |
| Temporary Access Pass settings   | All users, exclude grp-Conditional_Access_Exclude |     Yes |
| Hardware OATH tokens (Preview)   |                                                   |      No |
| Third-party software OATH tokens |                                                   |      No |
| Voice call                       |                                                   |      No |
| Email OTP                        |                                                   |      No |
| Certificate-based authentication |                                                   |      No |

### FIDO2 security key settings

#### Enable and Target

| Item    |                          Value |
| ------- | -----------------------------: |
| Enabled |                            Yes |
| Target  |                      All users |
| Exclude | grp-Conditional_Access_Exclude |

#### Configure

| Item                      | Value |
| ------------------------- | ----: |
| Allow self-service set up |   Yes |
| Enforce attestation       |   Yes |
| Enforce key restrictions  |   Yes |
| Restrict specific keys    | Allow |

### Microsoft Authenticator settings

#### Enable and Target

| Item    |                          Value |
| ------- | -----------------------------: |
| Enabled |                            Yes |
| Target  |                      All users |
| Exclude | grp-Conditional_Access_Exclude |

#### Configure

| Item                                                                     |             Value |
| ------------------------------------------------------------------------ | ----------------: |
| Allow use of Microsoft Authenticator OTP                                 |                No |
| Require number matching for push notifications - Status                  |           Enabled |
| Require number matching for push notifications - Target                  |         All users |
| Show application name in push and passwordless notifications - Status    | Microsoft managed |
| Show application name in push and passwordless notifications - Target    |         All users |
| Show geographic location in push and passwordless notifications - Status | Microsoft managed |
| Show geographic location in push and passwordless notifications - Target |         All users |
| Microsoft Authenticator on companion applications - Status               | Microsoft managed |
| Microsoft Authenticator on companion applications - Target               |         All users |

### Temporary Access Pass settings

#### Enable and Target

| Item    |                          Value |
| ------- | -----------------------------: |
| Enabled |                            Yes |
| Target  |                      All users |
| Exclude | grp-Conditional_Access_Exclude |

#### Configure

| Item             |   Value |
| ---------------- | ------: |
| Minimum lifetime |  1 hour |
| Maximum lifetime | 8 hours |
| Default lifetime |  1 hour |
| One-time         |      14 |


### Related information

#### Security & Governance

* [Authentication Hardening]({{<ref "system-hardening-authentication">}})
* [System Management]({{<ref "system-management.md">}})
* [Essential Eight: Multi-factor Authentication]({{<ref "security-and-governance/essential-eight/multi-factor-authentication.md">}})
* [Essential Eight: Restrict Microsoft Office Macros]({{<ref "restrict-microsoft-office-macros.md">}})

#### Design

* [Authentication]({{<ref "authentication">}})
* [Identity]({{<ref "design/platform/identity">}})
* [Identity security]({{<ref "identity-security">}})

#### Configuration

* [Microsoft Intune - Profile Configurations]({{<ref "configuration/intune/devices/configuration-profiles">}})
* [Endpoint security policies]({{<ref "configuration/defender/endpoints/configuration-management/endpoint-security-policies.md">}})
* [Cloud app Settings]({{<ref "configuration/defender/settings/cloud-apps/settings.md">}})
* [Rules]({{<ref "configuration/defender/settings/endpoints/rules.md">}})

#### References

* [Authentication and verification methods](https://learn.microsoft.com/entra/identity/authentication/concept-authentication-methods)
* [Manage authentication methods](https://learn.microsoft.com/entra/identity/authentication/concept-authentication-methods-manage)