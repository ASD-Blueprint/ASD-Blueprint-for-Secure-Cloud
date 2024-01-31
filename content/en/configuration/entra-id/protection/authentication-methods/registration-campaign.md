---
title: "Registration campaign"
linkTitle: "Registration campaign"
weight: 30
type: docs
description: "This page describes the configuration of registration campaigns within Microsoft Entra ID associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Entra ID portal blade at the following URL:

https://entra.microsoft.com/#view/Microsoft_AAD_IAM/AuthenticationMethodsMenuBlade/~/RegistrationCampaign
 
The settings described in these tables should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

### Settings

| Item                       |                          Value |
| -------------------------- | -----------------------------: |
| State                      |                        Enabled |
| Days allowed to snooze     |                        14 days |
| Limited number of snoozes  |                        Enabled |
| excluded users and groups  | grp-Conditional_Access_Exclude |

### Authentication method

| Item                    |     Value |
| ----------------------- | --------: |
| Microsoft Authenticator | All users |


### Related information

#### Security & Governance

* [Multi-factor Authentication]({{<ref "multi-factor-authentication">}})
* [Authentication Hardening]({{<ref "system-hardening-authentication">}})

#### Design

* [Authentication]({{<ref "authentication">}})

#### Configuration

* None identified

#### References

* [Registration campaign](https://learn.microsoft.com/entra/identity/authentication/how-to-mfa-registration-campaign)