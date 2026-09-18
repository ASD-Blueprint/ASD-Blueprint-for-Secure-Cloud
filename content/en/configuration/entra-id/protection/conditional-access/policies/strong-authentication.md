---
title: "USR - G - Require strong auth"
weight: 10
type: docs
description: "This page describes the configuration of policies for Conditional Access within Microsoft Entra ID associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the _as built_ configuration for ASD's _Blueprint for Secure Cloud_ (the Blueprint) for the Microsoft Entra admin portal at the following URL:

<https://entra.microsoft.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade/~/Policies>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

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

[Authentication strengths](/configuration/entra-id/protection/conditional-access/authentication-strengths) will need to be configured prior to setting this access control.

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

#### Security and governance

- [Multi-factor authentication](/security-and-governance/essential-eight/multi-factor-authentication)
- [Authentication hardening](/security-and-governance/system-security-plan/system-hardening-authentication)
- [Essential Eight - Restrict administrative privileges](/security-and-governance/essential-eight/restrict-administrative-privileges)
- [Essential Eight - Restrict Microsoft Office macros](/security-and-governance/essential-eight/restrict-microsoft-office-macros)

#### Design

- [Conditional access](/design/platform/identity/conditional-access)

#### Configuration

- [Authentication strengths](/configuration/entra-id/protection/conditional-access/authentication-strengths)
- [Endpoint security](/configuration/intune/endpoint-security)
- [Entra ID Protection](/configuration/entra-id/protection)

#### References

- [Configure Microsoft Entra multifactor authentication settings](https://learn.microsoft.com/entra/identity/authentication/howto-mfa-mfasettings)
- [System-preferred multifactor authentication - Authentication methods policy](https://learn.microsoft.com/entra/identity/authentication/concept-system-preferred-multifactor-authentication)
- [Protecting authentication methods in Microsoft Entra ID](https://learn.microsoft.com/entra/identity/authentication/concept-authentication-default-enablement)
- [Conditional Access authentication strength](https://learn.microsoft.com/entra/identity/authentication/concept-authentication-strengths)
