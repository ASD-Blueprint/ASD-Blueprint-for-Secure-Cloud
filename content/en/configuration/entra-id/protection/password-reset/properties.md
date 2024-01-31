---
title: "Properties"
linkTitle: "Properties"
weight: 10
type: docs
description: "This page describes the configuration of password rest within Microsoft Entra ID associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Entra ID portal blade at the following URL:

https://entra.microsoft.com/#view/Microsoft_AAD_IAM/PasswordResetMenuBlade/~/Properties
 
The settings described in these tables should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

| Item                                |           Value |
| ----------------------------------- | --------------: |
| Self service password reset enabled |        Selected |
| Select group                        | rol-<org>-users |


### Related information

#### Security & Governance

* [Authentication Hardening]({{<ref "system-hardening-authentication">}})
  
#### Design

* [Authentication]({{<ref "design/platform/identity/authentication">}})
  
#### Configuration

* None identified

#### References

* [Password policies and account restrictions](https://learn.microsoft.com/entra/identity/authentication/concept-sspr-policy#administrator-password-policy-differences)

