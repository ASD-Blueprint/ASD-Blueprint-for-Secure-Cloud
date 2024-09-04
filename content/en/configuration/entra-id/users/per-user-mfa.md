---
title: "Per-user MFA"
linkTitle: "Per-user MFA"
weight: 40
type: docs
description: "This page describes the configuration of per-user MFA within Microsoft Azure Active Directory associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for Azure Active Directory multi-factor authentication at the following URL:

<https://account.activedirectory.windowsazure.com/usermanagement/multifactorverification.aspx>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Service settings

| Item                                                                              |                                                                     Value |
| --------------------------------------------------------------------------------- | ------------------------------------------------------------------------: |
| app passwords                                                                     | Do not allow users to create app passwords to sign in to non-browser apps |
| Skip multi-factor authentication for requests from federated users on my intranet |                                                               Not checked |
| Methods available to users                                                        |                                           Notification through mobile app |
|                                                                                   |                       Verification code from mobile app or hardware token |
| Remember multi-factor authentication on trusted device                            |                                                               Not checked |

### Related information

#### Security & Governance

* [Multi-factor Authentication]({{<ref "multi-factor-authentication">}})
* [Authentication Hardening]({{<ref "system-hardening-authentication">}})
* [Essential Eight - Restrict Administrative Privileges]({{<ref "security-and-governance/essential-eight/restrict-administrative-privileges.md">}})

#### Design

* [Conditional Access]({{<ref "design/platform/identity/conditional-access.md">}})
* [Authentication]({{<ref "design/platform/identity/authentication.md">}})

#### Configuration

* [MFA registration]({{<ref "configuration/entra-id/protection/conditional-access/policies/grant-mfa-registration.md">}})

#### References

* [Microsoft Entra multifactor authentication](https://learn.microsoft.com/entra/identity/authentication/concept-mfa-howitworks)
* [Secure user sign-in events](https://learn.microsoft.com/entra/identity/authentication/tutorial-enable-azure-mfa)
