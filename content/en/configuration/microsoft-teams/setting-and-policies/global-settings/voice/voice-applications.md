---
title: "Voice applications"
linkTitle: "Voice applications"
weight: 100
description: "This section describes the configuration of voice application settings within Microsoft Teams associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Teams admin portal at the following URL:

<https://admin.teams.microsoft.com/one-policy/settings/voiceapplications>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Auto attendants

#### Greetings

| Item                    | Value |
| ----------------------- | ----: |
| Business hours greeting |   Off |
| After hours greeting    |   Off |
| Holiday greeting        |   Off |

#### Generals

| Item                    | Value |
| ----------------------- | ----: |
| Time Zone               |   Off |
| Language                |   Off |
| business hours          |   Off |
| Holiday dates and hours |   Off |

#### Call flow routing

| Item                        | Value |
| --------------------------- | ----: |
| Business hours call routing |   Off |
| After hours call routing    |   Off |
| Holiday hours call routing  |   Off |

#### Reportings

| Item                               | Value |
| ---------------------------------- | ----: |
| Real-time auto attendant metrics   |   Off |
| Historical Auto Attendants Metrics |   Off |

### Call queues

#### Greeting

| Item                                        | Value |
| ------------------------------------------- | ----: |
| Welcome greeting                            |   Off |
| Music on Hold                               |   Off |
| Shared voicemail greeting for call overflow |   Off |
| Shared voicemail greeting for call timeout  |   Off |
| Shared voicemail greeting for no agents     |   Off |

#### General

| Item                          | Value |
| ----------------------------- | ----: |
| Language                      |   Off |
| Membership                    |   Off |
| conference mode               |   Off |
| Agent routing method          |   Off |
| Presence-based routing        |   Off |
| Opt out (queue configuration) |   Off |
| Opt agents in/out of queue    |   Off |

#### Exception handling

| Item                      | Value |
| ------------------------- | ----: |
| Routing for call overflow |   Off |
| Routing for call timeout  |   Off |
| Routing for no agents     |   Off |

#### Agent monitoring

| Item                            | Value |
| ------------------------------- | ----: |
| Agent monitor mode              |   Off |
| Agent monitor notification mode |   Off |

#### Reporting

| Item                          | Value |
| ----------------------------- | ----: |
| Real-time call queue metrics  |   Off |
| Real-time agent metrics       |   Off |
| Historical Call Queue Metrics |   Off |
| Historical Agent Metrics      |   Off |

### Related information

#### Security & Governance

* None identified
  
#### Design

* [Teams]({{<ref "design/shared-services/teams/">}})
  
#### Configuration

* None identified

#### References

* [Manage voice applications policies in Microsoft Teams](https://learn.microsoft.com/en-au/microsoftteams/manage-voice-applications-policies)
* [Teams settings and policies reference](https://learn.microsoft.com/en-au/microsoftteams/settings-policies-reference)
