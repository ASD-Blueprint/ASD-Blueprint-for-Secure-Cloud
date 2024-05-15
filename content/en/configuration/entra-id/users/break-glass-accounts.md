---
title: "BreakGlass account setup"
linkTitle: "User Settings"
weight: 10
type: docs
description: "This page describes the configuration of BreakGlass accounts within Microsoft Entra ID associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Entra ID portal blade at the following URL:

https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/CreateUser.ReactView
 
The settings described in these tables should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

### BreakGlass first account

| Item            |                Value |
| --------------- | -------------------: |
| Display name    |        BreakGlass 1 |
| User type       |               Member |
| Account enabled |              Checked |
| Usage location  |            Australia |
| Assigned roles  | Global Administrator |
| Groups          |                      |

### BreakGlass second account

| Item            |                          Value |
| --------------- | -----------------------------: |
| Display name    |                  BreakGlass 2 |
| User type       |                         Member |
| Account enabled |                        Checked |
| Usage location  |                      Australia |
| Assigned roles  |           Global Administrator |
| Groups          | grp-Conditional_Access_Exclude |

### Related information

#### Security & Governance

* [Authentication Hardening]({{<ref "system-hardening-authentication">}})
* [Multi-factor Authentication]({{<ref "multi-factor-authentication">}})
* [Essential Eight - Restrict Administrative Privileges]({{<ref "security-and-governance/essential-eight/restrict-administrative-privileges.md">}})

#### Design

* [Emergency access admin accounts]({{<ref "design/platform/identity/users">}})

#### Configuration

* [Break Glass]({{<ref "configuration/entra-id/users/break-glass-accounts.md">}})

#### References

* [Create or delete users](https://learn.microsoft.com/entra/fundamentals/how-to-create-delete-users)
* [Emergency access accounts](https://learn.microsoft.com/entra/architecture/security-operations-privileged-accounts)
* [Securing privileged access](https://learn.microsoft.com/entra/identity/role-based-access-control/security-planning)
* [Manage emergency access accounts](https://learn.microsoft.com/entra/identity/role-based-access-control/security-emergency-access)