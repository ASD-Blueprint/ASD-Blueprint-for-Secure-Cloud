---
title: "Groups"
linkTitle: "Groups"
weight: 25
description: "This section describes the design decisions associated with groups for system(s) built using ASD's Blueprint for Secure Cloud."
---

### Group types and membership

Groups are used to organise and manage users and devices.

There are two group types:

- **Security groups** - for managing user and device access to shared resources.
- **Microsoft 365 groups** - for managing collaboration with internal and external users via Microsoft 365 apps.

And there are three membership types:

- **Assigned** - user and device membership is static.
- **Dynamic user** - user membership is managed via rules and workflows.
- **Dynamic device** - device membership is managed via rules and workflows.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point      | Design Decision                                    | Justification                                |
| ------------------- | -------------------------------------------------- | -------------------------------------------- |
| Resource assignment | Users should not be assigned directly to resources | Using groups reduces administrative overhead |

{{% /alert %}}

#### Group ownership

Group owners have additional privileges over group members and have the ability to manage group membership as well as other unique permissions.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point  | Design Decision                                                 | Justification                                             |
| --------------- | --------------------------------------------------------------- | --------------------------------------------------------- |
| Group ownership | Conditional Access exclude groups should have designated owners | Group owners should review membership via access packages |

{{% /alert %}}

Group ownership and group membership are separate concepts, and are also implemented differently depending on the group type:

- for security groups, a group owner is not considered a group member
- for Microsoft 365 groups, a group owner is considered a group member

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                               | Design Decision                                                                          | Justification                                                            |
| -------------------------------------------- | ---------------------------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| Group ownership                              | Groups owners should be assigned where practical                                         | Group ownership facilitates group lifecycle management                   |
| Group ownership of security-sensitive groups | Conditional Access exclude group owners should not also be members of the exclude groups | Conditional Access exclude group membership should be tightly controlled |

{{% /alert %}}

#### Nested groups

Nested groups are a feature that allows groups to also be members of other groups, and have several limitations:

- they cannot be used with role assignments
- they cannot be used with group-based licensing
- they only apply to security groups

### Dynamic group membership

Dynamic groups simplify the management of group membership by using rules to automatically assign and remove group members based on their attributes.

While some of the attributes used by group members can be highly organisation-specific, there are several scenarios where dynamic group membership facilitates the implementation of Blueprint guidance:

- Identifying administrative users
- Identifying the devices used by administrative users

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                                                    | Design Decision                                                           | Justification                                                                                                               |
| ----------------------------------------------------------------- | ------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| Dynamic group membership                                          | Dynamic assignment of users and devices should be used where practical    | Using dynamic membership reduces administrative overhead                                                                    |
| Dynamic group membership for security-sensitive users and devices | Dynamic assignment of security-sensitive users and devices should be used | Using dynamic membership reduces administrative overhead and assists the management of security-sensitive users and devices |

{{% /alert %}}

Note, dynamic groups cannot be used with PIM.

### Groups and roles

#### Privileged Identity Management (PIM) for groups

PIM can be used for just-in-time membership and ownership of groups.

| Decision Point | Design Decision                                                 | Justification                                                            |
| -------------- | --------------------------------------------------------------- | ------------------------------------------------------------------------ |
| PIM for groups | Use PIM for adding members to Conditional Access exclude groups | Conditional Access exclude group membership should be tightly controlled |

#### Role assigned groups

Roles can be assigned to groups as well as users which can be useful for managing multiple users requiring the same permissions. Role assigned groups are also able to be used with PIM so group members don't need to have standing access to the role.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point       | Design Decision                                | Justification                                              |
| -------------------- | ---------------------------------------------- | ---------------------------------------------------------- |
| Role assigned groups | Users should not be assigned directly to roles | Using role assigned groups reduces administrative overhead |

{{% /alert %}}

### Microsoft 365 Groups

Microsoft 365 groups (as opposed to security groups) include a suite of linked resources that users can use for communication and collaboration. Groups always include a SharePoint site, a mailbox and calendar, and Stream. Depending on how the group is created other services such as Teams can be optionally added.

Microsoft 365 groups are designed to be user created, enabling them to choose the set of people with whom they wish to collaborate, and easily set up a collection of resources for those people to share. Groups can be created from multiple end-points including Outlook, SharePoint, Teams, and other environments. Adding members to the group automatically grants the needed permissions to all assets provided by the group.

Microsoft 365 Groups includes a variety of governance controls, including an expiration policy, naming conventions, and a blocked words policy, to help manage groups.

*Microsoft recommends self-service to empower group owners and help users get their work done more easily. Limiting group and team creation can slow users productivity because many Microsoft 365 services require that groups be created for the service to function.*

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point       | Design Decision                                   | Justification                                                                                                 |
| -------------------- | ------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| Group Creation       | Any user with acknowledgement of responsibilities | Encourage rather than block collaboration                                                                     |
| Group Expiry         | 180 day expiry                                    | Limit group sprawl by ensuring that groups that are no longer in use are deleted                              |
| Group Naming         | Unrestricted, but with guidelines                 | Avoid fixed organisation based group naming conventions to avoid issues with changing organisation structures |
| Group Access Reviews | 6 Monthly                                         | Ensure group membership is reviewed periodically                                                              |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* [Identity Governance]({{<ref "governance">}})
* [Microsoft 365 Groups]({{<ref "design/shared-services/microsoft-365/microsoft365-groups.md">}})

#### Configuration

* [Groups]({{<ref "configuration/entra-id/groups">}})
* [Expiration]({{<ref "configuration/entra-id/groups/expiration.md">}})

#### References

* [Microsoft 365 Groups](https://learn.microsoft.com/microsoft-365/solutions/plan-organization-lifecycle-governance?view=o365-worldwide)
