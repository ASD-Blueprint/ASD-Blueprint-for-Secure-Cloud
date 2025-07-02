---
title: "Calling"
linkTitle: "Calling"
weight: 10
description: "This section describes the configuration of calling settings within Microsoft Teams associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Teams admin portal at the following URL:

<https://admin.teams.microsoft.com/one-policy/settings/calling>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### General

| Item                                                                    |                Value |
| ----------------------------------------------------------------------- | -------------------: |
| Make private calls                                                      |                   On |
| Cloud recording for calling                                             |                  Off |
| Transcription                                                           |                  Off |
| Routing for PSTN calls                                                  | Use default settings |
| Routing for federated calls                                             | Use default settings |
| Call forwarding and simultaneous ringing to people in your organization |                   On |
| Call forwarding and simultaneous ringing to external phone numbers      |                  Off |
| Voicemail for inbound calls                                             |                   On |
| Inbound calls can be routed to call groups                              |                   On |
| Delegation for inbound and outbound calls                               |                   On |
| Prevent toll bypass and send calls through the PSTN                     |                  Off |
| Music on hold for calls                                                 |                   On |
| Busy on busy during calls                                               |                   On |
| Web PSTN calling                                                        |                  Off |
| Real-time captions in Teams calls                                       |                   On |
| Real-time-text (RTT)                                                    |                   On |
| Automatically answer incoming meeting invites                           |                  Off |
| Spam filtering                                                          |                   On |
| SIP devices can be used for calls                                       |                  Off |
| Open apps in browser for incoming PSTN calls                            |                  Off |

### PSTN Spend limits

| Item                             | Value |
| -------------------------------- | ----: |
| Enable calling plans spend limit |   Off |

### Related information

#### Security & Governance

* None identified
  
#### Design

* [Teams]({{<ref "design/shared-services/teams/">}})
  
#### Configuration

* None identified

#### References

* [Calling policies in Teams](https://learn.microsoft.com/en-au/microsoftteams/teams-calling-policy)
* [Teams settings and policies reference](https://learn.microsoft.com/en-au/microsoftteams/settings-policies-reference)
