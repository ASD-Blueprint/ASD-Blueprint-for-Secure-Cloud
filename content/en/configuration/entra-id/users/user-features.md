---
title: "User features"
linkTitle: "User features"
weight: 30
type: docs
description: "This page describes the configuration of user features within Microsoft Entra ID associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Entra admin portal at the following URL:

<https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/UserSettings/menuId/UserSettings>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### User features

| Item                                      | Value |
| ----------------------------------------- | ----: |
| User can use preview features for My Apps |  None |
| Administrators can access My Staff        |  None |

### Related information

#### Security & Governance

* [Multi-factor Authentication]({{<ref "multi-factor-authentication">}})
* [Authentication Hardening]({{<ref "system-hardening-authentication">}})
* [Essential Eight - Restrict Administrative Privileges]({{<ref "security-and-governance/essential-eight/restrict-administrative-privileges.md">}})

#### Design

* [User default permissions (user settings)]({{<ref "tenant">}})
* [Roles]({{<ref "design/platform/identity/roles">}})
* [Identity]({{<ref "design/platform/identity">}})
* [Identity security]({{<ref "identity-security">}})
* [Authentication]({{<ref "authentication">}})

#### Configuration

* [External Identities]({{<ref "configuration/entra-id/external-identities">}})

#### References

* [Enterprise user management documentation](https://learn.microsoft.com/entra/identity/users/)
* [Restrict member users' default permissions](https://learn.microsoft.com/entra/fundamentals/users-default-permissions#restrict-member-users-default-permissions)
