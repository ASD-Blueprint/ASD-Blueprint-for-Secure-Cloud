---
title: Groups
weight: 25
description: "This section describes the design decisions associated with groups and group naming conventions for system(s) built using ASD's Blueprint for Secure Cloud."
---

Groups can be three types:

* **Privileged** - Platform-owned administrative groups for access to the critical control and management security planes e.g. subscriptions.
* **Security** -  Resource Owner managed groups for access to data and workload security plane resources, e.g. applications.
* **Microsoft 365** - User managed grouping for more fluid and temporary assignment for collaboration purposes e.g. email groups, teams.

Users can be assigned to these groups in a number of ways:

| Type                                            | Description                                                                                                                               | Usage                                                                                                  |
| ----------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| Dynamically                                     | Based on a set of fixed rules, usually user metadata                                                                                      | Used by the platform owners for administrative purposes.                                               |
| Assigned Directly                               | The group's owner or those with User Management Roles can assign users directly to the group using the Entra Portal or Group Access Panel | Used by Team Leads for ad hoc assignments to organisational / project based groupings for Microsoft 365 Groups. |
| [Privileged Group]({{ ref . pim }}) Activation  | Specialised group where membership is activated for time-boxed periods using PIM                                                          | Used for privileged groups.                                                                            |
| [Entitlement Packages]({{ ref . governance }})  | Assigns users to groups through request and approval process using Access Packages                                                        | Used by Resource Owners to assign users to Security Groups.                                            |

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                                    | Design Decision                                                                                                                                                          | Justification                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| ------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Permission Assignment                             | Users should not be directly assigned to resources                                                                                                                       | Groups should be used to reduce administrative overhead.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| Administrator (Owner) Roles                       | Privileged Groups (PIM) must be used for all owner roles in the Control / Management / Workload / Data planes e.g. tenant, subscription, resource group, resource scopes | <li>Essential 8 Privileged access to systems and applications is automatically disabled after 45 days of inactivity. <li>Essential 8 Use of privileged access is centrally logged and protected from unauthorised modification and deletion, monitored for signs of compromise, and actioned when cyber security events are detected.<li>Essential 8 Changes to privileged accounts and groups are centrally logged and protected from unauthorised modification and deletion, monitored for signs of compromise, and actioned when cyber security events are detected. |
| Service / Workload Consumer (Resource User) Roles | Entitlement Management must be used for all consumers of resources in the Workload / Data planes e.g. application, service users                                         | Ensure access is based on business need and follows "need to know" principle.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| Ad Hoc Collaborative (Information Sharing) Roles  | Use of Microsoft 365 groups should be limited for partitioning access to information in resources rather than the resources themselves                                            | Provide flexibility and self management for ease of collaboration where appropriate.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |

{{% /alert %}}

### Microsoft 365 Groups

Microsoft 365 groups (as opposed to security groups) include a suite of linked resources that users can use for communication and collaboration. Groups always include a SharePoint site, a mailbox and calendar, and Stream. Depending on how the group is created other services such as Teams can be optionally added.

Microsoft 365 groups are designed to be user created, allowing them to choose the set of people with whom they wish to collaborate, and easily set up a collection of resources for those people to share. Groups can be created from multiple end-points including Outlook, SharePoint, Teams, and other environments. Adding members to the group automatically grants the needed permissions to all assets provided by the group.

Microsoft 365 Groups includes a variety of governance controls, including an expiration policy, naming conventions, and a blocked words policy, to help manage groups.

*Microsoft recommends self-service to empower group owners and help users get their work done more easily. Limiting group and team creation can slow users productivity because many Microsoft 365 services require that groups be created for the service to function.*

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point       | Design Decision                                   | Justification                                                                                                 |
| -------------------- | ------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| Group Creation       | Any user with acknowledgement of responsibilities | Encourage rather than block collaboration                                                                     |
| Group Expiry         | 180 day expiry                                    | Limit group sprawl by ensuring that groups that are no longer in use are deleted                              |
| Group Naming         | Unrestricted but with guidelines                  | Avoid fixed organisation based group naming conventions to avoid issues with changing organisation structures |
| Group Access Reviews | 6 Monthly                                         | Ensure group membership is reviewed periodically                                                              |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* [Identity Governance]({{<ref "governance">}})

#### References

* [Microsoft 365 Groups](https://learn.microsoft.com/microsoft-365/solutions/plan-organization-lifecycle-governance?view=o365-worldwide)


