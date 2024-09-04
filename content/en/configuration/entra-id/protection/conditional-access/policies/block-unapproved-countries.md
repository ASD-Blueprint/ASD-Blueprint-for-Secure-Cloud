---
title: "LOC - B - Block access from unapproved countries"
linkTitle: "LOC - B - Block access from unapproved countries"
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

| Item |                                            Value |
| ---- | -----------------------------------------------: |
| Name | LOC - B - Block access from unapproved countries |

### Assignments

#### Users

| Item                    |                                                                   Value |
| ----------------------- | ----------------------------------------------------------------------: |
| **Include**             |                                                               All users |
| **Exclude**             |                                                                         |
| Guest or external users |                                                             Not checked |
| Directory roles         |                                                             Not checked |
| Users and groups        |                                                                 Checked |
|                         | `<CA exclude group - LOC - B - Block access from unapproved countries>` |

#### Target Resources

| Item                               |          Value |
| ---------------------------------- | -------------: |
| Select what this policy applies to |     Cloud apps |
| **Include**                        | All cloud apps |
| **Exclude**                        |           None |

#### Network

| Item        |                                                 Value |
| ----------- | ----------------------------------------------------: |
| Configure   |                                                   Yes |
| **Include** |                               Any network or location |
| **Exclude** | Selected networks and locations:<br>Allowed Countries |

{{% alert title="Menu change" color="info"%}}

Updates or changes to the Network assignment are also reflected in the Locations condition.

{{% /alert %}}

#### Conditions

| Item                               |                                                 Value |
| ---------------------------------- | ----------------------------------------------------: |
| **User risk**                      |                                        Not configured |
| **Sign-in risk**                   |                                        Not configured |
| **Insider risk**                   |                                        Not configured |
| **Device platforms**               |                                        Not configured |
| **Locations**                      |                                                   Yes |
| Include                            |                               Any network or location |
| Exclude                            | Selected networks and locations:<br>Allowed Countries |
| **Client apps**                    |                                        Not configured |
| **Filter for devices**             |                                        Not configured |
| **Authentication flows (Preview)** |                                        Not configured |

### Access Controls

#### Grant

| Item                                                |        Value |
| --------------------------------------------------- | -----------: |
| Control access enforcement to block or grant access | Block access |

#### Session

| Item                                      |       Value |
| ----------------------------------------- | ----------: |
| Use app enforced restrictions             | Not checked |
| Use Conditional Access App Control        | Not checked |
| Sign-in frequency                         | Not checked |
| Persistent browser session                | Not checked |
| Customize continuous access evaluation    | Not checked |
| Disable resilience defaults               | Not checked |
| Use Global Secure Access security profile | Not checked |

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

* [Microsoft Intune - Profile Configurations]({{<ref "configuration/intune/devices/configuration-profiles">}})
* [Entra ID Protection]({{<ref "configuration/entra-id/protection">}})
* [Endpoint security policies]({{<ref "configuration/defender/endpoints/configuration-management/endpoint-security-policies.md">}})

#### References

* [Configure Microsoft Entra multifactor authentication settings](https://learn.microsoft.comentra/identity/authentication/howto-mfa-mfasettings)
* [System-preferred multifactor authentication - Authentication methods policy](https://learn.microsoft.com/entra/identity/authentication/concept-system-preferred-multifactor-authentication)
* [Protecting authentication methods in Microsoft Entra ID](https://learn.microsoft.com/entra/identity/authentication/concept-authentication-default-enablement)
* [Conditional Access: Network assignment](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-assignment-network)
