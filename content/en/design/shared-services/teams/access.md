---
title: "Access"
weight: 45
description: "This section describes the design decisions associated with Teams Access for system(s) built using ASD's Blueprint for Secure Cloud."
---

Access to a Team is controlled using Microsoft Office 365 Groups located in Microsoft Entra ID. When a Team is created, a Microsoft 365 group will be created. Owners of the group are delegated to perform administrative actions across the team, while members can participate in the team but not undertake any administrative actions. ASD's *Blueprint for Secure Cloud* (the Blueprint) considers permissions, roles and responsibility to administer, manage team owners and members within the team.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                                  | Design Decision                         | Justification                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
|-------------------------------------------------|-----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Team creation permission                        | All authenticated / licensed users      | Teams can be created by all organisational users that are licensed with Microsoft 365 and specific Microsoft Teams licensing. This open approach enables users to easily set up new Teams based collaboration spaces, without the bottlenecks of seeking IT approvals.<br><br>**Note:** There remains the ability to configure Microsoft 365 so that Microsoft 365 group creation is restricted which only allows administrators to create 365 groups, and therefore Teams. |
| Administrative action over Teams after creation | Team Owners                             | The initial Team Owner is the user who created the new Microsoft Team (and therefore the underlying Microsoft 365 Group) - the Team Owner can subsequently add more Team Owners and Team members.                                                                                                                                                                                                                                                                                   |
| Team membership allocation                      | Manual by administrators or Team Owners | Team membership will be allocated manually initially with dynamic group allocation investigated in a future project phase when the logic for group membership is developed.                                                                                                                                                                                                                                                                                                         |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* None identified