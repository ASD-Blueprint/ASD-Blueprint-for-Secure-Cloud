---
title: "DEV - G - Intune enrolment with strong auth"
linkTitle: "DEV - G - Intune enrolment with strong auth"
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

### Name

| Item |                                       Value |
| ---- | ------------------------------------------: |
| Name | DEV - G - Intune enrolment with strong auth |

### Assignments

#### Users

| Item                    |                                                              Value |
| ----------------------- | -----------------------------------------------------------------: |
| **Include**             |                                                          All users |
| **Exclude**             |                                                                    |
| Guest or external users |                                                        Not checked |
| Directory roles         |                                                        Not checked |
| Users and groups        |                                                            Checked |
|                         | `<CA exclude group - DEV - G - Intune enrolment with strong auth>` |

#### Target Resources

| Item                               |                                          Value |
| ---------------------------------- | ---------------------------------------------: |
| Select what this policy applies to |                Resources (formerly cloud apps) |
| **Include**                        |                                    Select apps |
| Select                             | Microsoft Intune<br>Microsoft Intune Enrolment |
| **Exclude**                        |                                           None |

{{% alert title="Intune apps" color="info" %}}

The Microsoft Intune Enrolment app is not created by default in new tenants, see the [require multifactor authentication for Intune device enrollments](https://learn.microsoft.com/en-au/mem/intune/enrollment/multi-factor-authentication#configure-intune-to-require-multifactor-authentication-at-device-enrollment) page for instructions to create it.

{{% /alert %}}

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
| Require authentication strength                     |   Checked:<br>Phishing-resistant MFA |
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
* [Essential Eight: Restrict Microsoft Office Macros]({{<ref "restrict-microsoft-office-macros.md">}})

#### Design

* [Conditional access]({{<ref "design/platform/identity/conditional-access">}})

#### Configuration

* [Entra ID Protection]({{<ref "configuration/entra-id/protection">}})
* [Intune Endpoint Security]({{<ref "configuration/intune/endpoint-security">}})

#### References

* [Configure Microsoft Entra multifactor authentication settings](https://learn.microsoft.comentra/identity/authentication/howto-mfa-mfasettings)
* [System-preferred multifactor authentication - Authentication methods policy](https://learn.microsoft.com/entra/identity/authentication/concept-system-preferred-multifactor-authentication)
* [Protecting authentication methods in Microsoft Entra ID](https://learn.microsoft.com/entra/identity/authentication/concept-authentication-default-enablement)
* [Require multifactor authentication for Intune device enrollments](https://learn.microsoft.com/en-au/mem/intune/enrollment/multi-factor-authentication#configure-intune-to-require-multifactor-authentication-at-device-enrollment)
