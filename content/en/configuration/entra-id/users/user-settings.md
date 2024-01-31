---
title: "User Settings"
linkTitle: "User Settings"
weight: 10
type: docs
description: This page describes the As Built As Configured for Users - User settings in Entra ID portal.
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* for the Entra ID portal blade at the following URL:

https://entra.microsoft.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/UserSettings

The settings described in these tables should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Default user role permissions

| Item                                           | Value |
| ---------------------------------------------- | ----: |
| User can register application                  |    No |
| Restrict non-admin users from creating tenants |   Yes |
| Users can create security groups               |    No |

### Guest user access

| Item                           |                                                                                                          Value |
| ------------------------------ | -------------------------------------------------------------------------------------------------------------: |
| Guest user access restrictions | Guest user access is restricted to properties and memberships of their own directory objects (most restrictive) |

### Administration centre

| Item                                            | Value |
| ----------------------------------------------- | ----: |
| Restrict access to Microsoft Entra admin centre |   Yes |

### LinkedIn account connections

| Item                                                              | Value |
| ----------------------------------------------------------------- | ----: |
| Allow users to connect their work or school account with LinkedIn |    No |

### Show keep user signed in

| Item                     | Value |
| ------------------------ | ----: |
| Show keep user signed in |   Yes |

### External collaboration settings

#### Guest user access

| Item                           |                                                                                                           Value |
| ------------------------------ | --------------------------------------------------------------------------------------------------------------: |
| Guest user access restrictions | Guest user access is restricted to properties and memberships of their own directory objects (most restrictive) |

#### Guest invite settings

| Item                                             |                                                                                 Value |
| ------------------------------------------------ | ------------------------------------------------------------------------------------: |
| Guest invite restrictions                        | No one in the organization can invite guest users including admins (most restrictive) |
| Enable guest self-service sign up via user flows |                                                                                    No |

#### External user leave settings

| Item                                                                           | Value |
| ------------------------------------------------------------------------------ | ----: |
| Allow external users to remove themselves from your organization (recommended) |   Yes |

#### Collaboration restrictions

| Item                       |                                                       Value |
| -------------------------- | ----------------------------------------------------------: |
| Collaboration restrictions | Allow invitations to be sent to any domain (most inclusive) |

### User features

#### Manage user feature settings

| Item                                      | Value |
| ----------------------------------------- | ----: |
| User can use preview features for My Apps |  None |
| Administrators can access My Staff        |  None |

### Related information

#### Security & Governance

* None identified

#### Design

* [User default permissions (user settings)]({{<ref "tenant">}})
* [Roles]({{<ref "design/platform/identity/roles">}})
* [Identity]({{<ref "design/platform/identity">}})
* [Identity security]({{<ref "identity-security">}})

#### Configuration

* None identified

#### References

* [Enterprise user management documentation](https://learn.microsoft.com/entra/identity/users/)
* [Restrict member users' default permissions](https://learn.microsoft.com/entra/fundamentals/users-default-permissions#restrict-member-users-default-permissions)