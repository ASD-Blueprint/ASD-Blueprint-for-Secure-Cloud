---
title: "Teams"
linkTitle: "Teams"
weight: 10
description: "This section describes the configuration of team settings within Microsoft Teams associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Teams admin portal at the following URL:

<https://admin.teams.microsoft.com/one-policy/settings/teams-channels>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Teams settings

| Item                                     | Value |
| ---------------------------------------- | ----: |
| Discover private teams                   |   Off |
| Create private channels                  |    On |
| Create shared channels                   |    On |
| Invite external users to shared channels |   Off |
| Join external shared channels            |   Off |

### Notifications and feeds

| Item                                                | Value |
| --------------------------------------------------- | ----: |
| Suggested feed can appear in a user's activity feed |    On |

### Tagging

| Item                                       |               Value |
| ------------------------------------------ | ------------------: |
| Who can manage tags                        |         Team owners |
| Team owners can change who can manage tags |                  On |
| Suggested tags                             | *Organisation tags* |
| Custom tags                                |                  On |
| Shifts app can apply tags                  |                  On |

### Email integration

| Item                                             |                                        Value |
| ------------------------------------------------ | -------------------------------------------: |
| Users can send emails to a channel email address |                                           On |
| Accept channel email from these SMTP domains     | *Your organisation's domains used for email* |

### Files

| Item         | Value |
| ------------ | ----: |
| Citrix files |   Off |
| DropBox      |   Off |
| Box          |   Off |
| Google Drive |   Off |
| Egnyte       |   Off |

### Organization

| Item                            | Value |
| ------------------------------- | ----: |
| Show Organization tab for users |    On |

### Devices

| Item                                                                 |                                  Value |
| -------------------------------------------------------------------- | -------------------------------------: |
| Require a secondary form of authentication to access meeting content |                              No access |
| Set content PIN                                                      | Required for outside scheduled meeting |
| Surface Hub accounts can send emails                                 |                                     On |

### Search by name

| Item                                                         | Value |
| ------------------------------------------------------------ | ----: |
| Scope directory search using an Exchange address book policy |    On |
| Show additional work details in people search suggestions    |   Off |

### Safety and communications

| Item                        | Value |
| --------------------------- | ----: |
| Role-based chat permissions |   Off |

### Shared channels

| Item                                      | Value |
| ----------------------------------------- | ----: |
| Provide a link to my support request page |   Off |

### Related information

#### Security & Governance

* None identified
  
#### Design

* [Teams]({{<ref "design/shared-services/teams">}})
  
#### Configuration

* None identified

#### References

* [Manage channel policies in Microsoft Teams](https://learn.microsoft.com/en-au/microsoftteams/teams-policies)
* [Manage teams in the Microsoft Teams admin center](https://learn.microsoft.com/en-au/microsoftteams/manage-teams-in-modern-portal)
* [Teams settings and policies reference](https://learn.microsoft.com/en-au/microsoftteams/settings-policies-reference)
  