---
title: "Microsoft Planner"
weight: 55
description: "This section describes the design decisions associated with the Blueprint for Secure Cloud Platform, Endpoints and Shared Services for system(s) built using ASD's Blueprint for Secure Cloud."
---

Microsoft Planner is a task planning and assignment tool which can integrate with other Microsoft 365 services such as Microsoft Teams. Planner leverages iCalendar publishing to enable planner users to add tasks into their calendar. When tasks are published via iCalendar, they are available to all users with the iCalendar URL. The users can be both internal and external to the organisation.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                    | Design decision | Justification                                                            |
|-----------------------------------|-----------------|--------------------------------------------------------------------------|
| Publishing through iCalendar feed | Disabled        | To prevent users from sharing sensitive information via iCalendar feeds. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* [Services]({{<ref "configuration/microsoft-365/settings/services">}})

#### References

* None identified