---
title: "Notifications"
linkTitle: "Notifications"
weight: 40
type: docs
description: "This page describes the configuration of notifications for password resets within Microsoft Entra ID associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Entra ID portal blade at the following URL:

https://entra.microsoft.com/#view/Microsoft_AAD_IAM/PasswordResetMenuBlade/~/Notifications
 
The settings described in these tables should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

| Item                             | Value |
| -------------------------------- | ----: |
| Notify users on password resets? |   Yes |

| Item                                                      | Value |
| --------------------------------------------------------- | ----: |
| Notify all admins when other admins reset their password? |   Yes |


### Related information

#### Security & Governance

* [Authentication Hardening]({{<ref "system-hardening-authentication">}})
* [System Monitoring]({{<ref "system-monitoring">}})
* [Essential Eight: Multi-factor Authentication]({{<ref "security-and-governance/essential-eight/multi-factor-authentication.md">}})
* [Essential Eight - Restrict Administrative Privileges]({{<ref "security-and-governance/essential-eight/restrict-administrative-privileges.md">}})
  
#### Design

* None identified
  
#### Configuration

* [Notifications]({{<ref "notifications.md">}})

#### References

* None identified

