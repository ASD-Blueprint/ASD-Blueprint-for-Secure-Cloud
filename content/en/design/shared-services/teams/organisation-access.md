---
title: "Organisation Wide Configuration"
weight: 45
description: "This section describes the design decisions associated with Teams Organisation Wide Configuration for system(s) built using ASD's Blueprint for Secure Cloud."
---

Microsoft Teams is a collaboration platform that enables the organisation to work collaboratively with external organisations. This enables organisation users to collaborate internally, with trusted guest users and set up meetings with external users.

The Australian Signals Directorate (ASD) Blueprint for Secure Cloud (The Blueprint) considers the following configurations:

* External Access - configures allowable domains to connect to the organisation's instance of Microsoft Teams. This also configures Skype for Business integration.
* Guest Access – when an external user is invited to be a member of the team. Once a team owner has granted someone guest access, they can access that team's resources, share files, and join a group chat with other team members.
* Teams Settings – configure the default behaviour of all users in the Teams application.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point  | Design Decision                                    | Justification                                                                                                                                                                       |
| --------------- | -------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| External Access | Configured:<br>Allow <organisation>.gov.au         | Allow only <organisation>.gov.au and deny sharing to external users. This will prevent users from setting up meetings with users that are not setup as a Guest of the organisation. |
| Guest Access    | Configured:<br>Guest Access: Disabled              | Do not allow people outside of the organisation to access teams and channels.                                                                                                       |
| Teams Setting   | Configured<br>Disable all third-party file storage | This is to ensure departmental users do not save file outside of the Microsoft 365 tenant.                                                                                          |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* [Guest access]({{<ref "configuration/microsoft-teams/users/guest-access">}})
* [External access]({{<ref "configuration/microsoft-teams/users/external-access">}})


#### References

* None identified