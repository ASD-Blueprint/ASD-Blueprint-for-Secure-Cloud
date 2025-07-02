---
title: "Events"
linkTitle: "Events"
weight: 60
description: "This section describes the configuration of event settings within Microsoft Teams associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Teams admin portal at the following URL:

<https://admin.teams.microsoft.com/one-policy/settings/events>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Events settings

| Item                                   |                          Value |
| -------------------------------------- | -----------------------------: |
| Webinars                               |                             On |
| Who can attend webinars                |                       Everyone |
| Town halls                             |                             On |
| Customise event emails                 |                             On |
| Webinar registration form questions    | Custom, standard, and required |
| Allowed webinar types for recordings   |                         Public |
| Allowed town hall types for recordings |                         Public |
| Use Microsoft ECDN                     |                             On |
| Town hall chat experience              |                      Optimized |

### Recording & transcription

| Item                        | Value |
| --------------------------- | ----: |
| Record a Town Hall          |    On |
| Record a Webinar            |    On |
| Transcription for Town Hall |   Off |
| Transcription for Webinar   |   Off |

### Related information

#### Security & Governance

* None identified
  
#### Design

* [Teams]({{<ref "design/shared-services/teams/">}})
  
#### Configuration

* None identified

#### References

* [Manage who can schedule and attend webinars in Microsoft Teams](https://learn.microsoft.com/en-au/microsoftteams/set-up-webinars)
* [Teams settings and policies reference](https://learn.microsoft.com/en-au/microsoftteams/settings-policies-reference)
