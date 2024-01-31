---
title: "Per-user MFA"
linkTitle: "Per-user MFA"
weight: 20
type: docs
description: "This page describes the configuration of users within Microsoft Entra ID associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* for the Entra ID portal blade at the following URL: 

https://account.activedirectory.windowsazure.com/usermanagement/multifactorverification.aspx

The settings described in these tables should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

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

* None identified

#### Design

* None identified

#### Configuration

* None identified

#### References

* [Microsoft Entra multifactor authentication](https://learn.microsoft.com/entra/identity/authentication/concept-mfa-howitworks)
* [Secure user sign-in events](https://learn.microsoft.com/entra/identity/authentication/tutorial-enable-azure-mfa)