---
title: "Microsoft 365 Groups"
weight: 30
description: "This section describes the design decisions associated with Microsoft 365 groups for system(s) built using ASD's Blueprint for Secure Cloud."
---

Microsoft 365 Groups are an extension on the traditional mail distribution lists, Mail-enabled Security groups and Shared Mailboxes.

Microsoft 365 Groups enable members to collaborate with a group email, shared a workspace for conversations, files, calendar events, and a Planner. Unlike Shared Mailboxes, Microsoft 365 groups can be accessed via mobile applications. Microsoft 365 groups are also integrated with Microsoft Teams and are created when a Team is created.

Membership of an Microsoft 365 Group can be dynamically updated using user attributes available in Microsoft 365. This removes some of the management overhead involved with managing the traditional group structures.

Management of Microsoft 365 Groups can be streamlined through the enforcement of a Naming Policy, Microsoft 365 group expiry, and creation restrictions. An Microsoft 365 Group Naming Policy enables the enforcement of a consistent naming strategy across Microsoft 365 Groups. It consists of two parts:

* **Prefix-Suffix Naming Policy** – Setting of prefixes or suffixes for groups names. The prefixes/suffixes can be either fixed strings or user attributes; and
* **Custom Blocked Words** – Blocking of words in the name based on a custom list.

Within Microsoft 365 applications, group names can display as a prefix or suffix, such as a Microsoft Teams team name. While naming policies for Microsoft 365 groups can assist with governance of group resources, it is therefore also important to select a naming standard that is meaningful to the user group.

In order to create an effective Microsoft 365 group naming strategy, consider adopting a naming standard that assists users with identifying the group purpose or function. Dynamic attributes such as the user who created the group, or group department or office locations can also be substituted, for example:

* `<Team Name> - Human Resources Dept`
* `Organisation - <Project Name> - Sydney`

Microsoft 365 groups can also be given expiration dates which assists with unused group clean-up activities. The expiration period commences from group creation and can be renewed at the end of the period. The owner, or contact for groups with no owners, has 30 days to renew the group. When a group expires, it is soft deleted for 30 days. Retention policies will however hold the data for the period defined by the retention policy. An expiration policy can be applied globally to all groups or to specific groups.

Microsoft 365 Groups, by default can be created by any user. This can be restricted to Administrators and members of a security group. This restriction prevents the needless creation of groups. It is advisable to develop a workflow to control the provisioning process.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                            | Design Decision                                                                                | Justification                                                                                                                                                                               |
|-------------------------------------------|------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Microsoft 365 Group creation restrictions | Configured <br>Only administrators and select users can create/configure Microsoft 365 groups. | This will ensure that groups are approved before being created, ensuring all groups have a purpose.<br>This setting also affects Exchange, SharePoint and Teams.                            |
| Naming Policy                             | Organisation to determine                                                                      | Naming can align to organisational team structure and help identify the working group or a project. The organisation should determine what naming policy meets their business requirements. |
| Group Expiration                          | Microsoft 365 groups - 90 days of inactivity                                                   | Group Expiration is required to simplify the management overhead associated with groups and to limit Entra ID clutter.                                                                      |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* [Groups]({{<ref "design/platform/identity/groups">}})

#### Configuration

* None identified

#### References

* [Configure the expiration policy for Microsoft 365 groups](https://learn.microsoft.com/entra/identity/users/groups-lifecycle)
