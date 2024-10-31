---
title: "USR - G - Require strong auth"
linkTitle: "USR - G - Require strong auth"
weight: 10
type: docs
description: "This page describes the configuration of policies for Conditional Access within Microsoft Entra ID associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Entra admin portal at the following URL:

<https://entra.microsoft.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade/~/Policies>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

{{% alert title="Caution" color="warning" %}}

In order to meet ASD Essential Eight Maturity Level 2 requirements, this policy has been updated to use an Authentication Strength that enforces the use of phishing-resistant MFA methods. This excludes the use of number matching push notifications in Microsoft Authenticator as was previously documented.

The use of [passkeys with Microsoft Authenticator](https://learn.microsoft.com/en-us/entra/identity/authentication/how-to-enable-authenticator-passkey) is in public preview.

Before implementing these settings, organisations should continue to ensure that any settings meet their operational and security requirements.

{{% /alert %}}

### Name

| Item |                         Value |
| ---- | ----------------------------: |
| Name | USR - G - Require strong auth |

### Assignments

#### Users

| Item                    |                                                Value |
| ----------------------- | ---------------------------------------------------: |
| **Include**             |                                            All users |
| **Exclude**             |                                                      |
| Guest or external users |                                          Not checked |
| Directory roles         |                                          Not checked |
| Users and groups        |                                              Checked |
|                         | `<CA exclude group - USR - G - Require strong auth>` |

#### Target Resources

| Item                               |                                     Value |
| ---------------------------------- | ----------------------------------------: |
| Select what this policy applies to |           Resources (formerly cloud apps) |
| **Include**                        | All resources (formerly 'All cloud apps') |
| **Exclude**                        |                                      None |

#### Network

| Item      | Value |
| --------- | ----: |
| Configure |    No |

#### Conditions

| Item                               |          Value |
| ---------------------------------- | -------------: |
| **User risk**                      | Not configured |
| **Sign-in risk**                   | Not configured |
| **Insider risk**                   | Not configured |
| **Device platforms**               | Not configured |
| **Locations**                      | Not configured |
| **Client apps**                    | Not configured |
| **Filter for devices**             | Not configured |
| **Authentication flows (Preview)** | Not configured |

### Access Controls

#### Grant

[Authentication strengths]({{<ref "configuration/entra-id/protection/conditional-access/authentication-strengths">}}) will need to be configured prior to setting this access control.

| Item                                                |                                Value |
| --------------------------------------------------- | -----------------------------------: |
| Control access enforcement to block or grant access |                         Grant access |
| Require multifactor authentication                  |                          Not checked |
| Require authentication strength                     |   Phishing-resistant MFA:<br>Checked |
| Require device to be marked as compliant            |                          Not checked |
| Require Microsoft Entra hybrid joined device        |                          Not checked |
| Require approved client app                         |                          Not checked |
| Require app protection policy                       |                          Not checked |
| Require password change                             |                          Not checked |
| Terms                                               |                          Not checked |
| For multiple controls                               | Require one of the selected controls |

#### Session

| Item                                                    |       Value |
| ------------------------------------------------------- | ----------: |
| Use app enforced restrictions                           | Not checked |
| Use Conditional Access App Control                      | Not checked |
| Sign-in frequency                                       | Not checked |
| Persistent browser session                              | Not checked |
| Customize continuous access evaluation                  | Not checked |
| Disable resilience defaults                             | Not checked |
| Require token protection for sign-in sessions (Preview) | Not checked |
| Use Global Secure Access security profile               | Not checked |

### Enable policy

| Item          | Value |
| ------------- | ----: |
| Enable policy |    On |

### Related information

#### Security & Governance

* [Multi-factor Authentication]({{<ref "multi-factor-authentication">}})
* [Authentication Hardening]({{<ref "system-hardening-authentication">}})
* [Essential Eight - Restrict Administrative Privileges]({{<ref "security-and-governance/essential-eight/restrict-administrative-privileges.md">}})
* [Essential Eight: Restrict Microsoft Office Macros]({{<ref "restrict-microsoft-office-macros.md">}})

#### Design

* [Conditional access]({{<ref "design/platform/identity/conditional-access">}})

#### Configuration

* [Authentication strengths]({{<ref "configuration/entra-id/protection/conditional-access/authentication-strengths">}})
* [Intune Endpoint Security]({{<ref "configuration/intune/endpoint-security">}})
* [Entra ID Protection]({{<ref "configuration/entra-id/protection">}})

#### References

* [Configure Microsoft Entra multifactor authentication settings](https://learn.microsoft.comentra/identity/authentication/howto-mfa-mfasettings)
* [System-preferred multifactor authentication - Authentication methods policy](https://learn.microsoft.com/entra/identity/authentication/concept-system-preferred-multifactor-authentication)
* [Protecting authentication methods in Microsoft Entra ID](https://learn.microsoft.com/entra/identity/authentication/concept-authentication-default-enablement)
* [Conditional Access authentication strength](https://learn.microsoft.com/entra/identity/authentication/concept-authentication-strengths)
  