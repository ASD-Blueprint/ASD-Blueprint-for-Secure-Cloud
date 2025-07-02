---
title: "Live events"
linkTitle: "Live events"
weight: 40
description: "This section describes the configuration of live event settings within Microsoft Teams associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Teams admin portal at the following URL:

<https://admin.teams.microsoft.com/one-policy/settings/broadcasts>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Live events settings

| Item                               |                        Value |
| ---------------------------------- | ---------------------------: |
| Live events scheduling             |                           On |
| Transcription for attendees        |                          Off |
| Who can join scheduled live events | Everyone in the organization |
| Record an event                    |                Always record |

### Support URL

| Item               |                      Value |
| ------------------ | -------------------------: |
| Custom support URL | *Organisation support URL* |

### Video distribution providers

| Item                        | Value |
| --------------------------- | ----: |
| Video distribution provider |   Off |

### Related information

#### Security & Governance

* None identified
  
#### Design

* [Teams]({{<ref "design/shared-services/teams">}})
  
#### Configuration

* None identified

#### References

* [Set up for live events in Microsoft Teams](https://learn.microsoft.com/en-au/microsoftteams/teams-live-events/set-up-for-teams-live-events)
* [Teams settings and policies reference](https://learn.microsoft.com/en-au/microsoftteams/settings-policies-reference)
