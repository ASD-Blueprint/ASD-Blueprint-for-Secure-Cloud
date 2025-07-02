---
title: "Meetings"
linkTitle: "Meetings"
weight: 20
description: "This section describes the configuration of meeting settings within Microsoft Teams associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Teams admin portal at the following URL:

<https://admin.teams.microsoft.com/one-policy/settings/meeting>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Meeting scheduling

| Item                             |                              Value |
| -------------------------------- | ---------------------------------: |
| Private meeting scheduling       |                                 On |
| Meet now in private meetings     |                                 On |
| Channel meeting scheduling       |                                 On |
| Meet now in channel meetings     |                                 On |
| Outlook add-in                   |                                 On |
| Meeting registration             |                                 On |
| Who can register                 |                           Everyone |
| Attendance and engagement report | On, but organizers can turn it off |
| Include attendees in the report  |                             Always |
| Attendee information             |                    Show everything |

### Meeting join & lobby

| Item                                                    |                                                   Value |
| ------------------------------------------------------- | ------------------------------------------------------: |
| Anonymous users can join a meeting unverified           |                                                     Off |
| Anonymous users can join a meeting after verifying      |                                           By email code |
| Anonymous users and dial-in callers can start a meeting |                                                     Off |
| Who can bypass the lobby                                |                       Only organizers and co-organizers |
| Who can admit from the lobby                            |               Organizers, co-organizers, and presenters |
| People dialing in can bypass the lobby                  |                                                     Off |
| People can join external meetings hosted by             |                                                  Anyone |
| Require a verification check from                       | Anonymous users and people from untrusted organizations |

### Meeting engagement

| Item                  |           Value |
| --------------------- | --------------: |
| Meeting chat          | On for everyone |
| External meeting chat |              On |
| Q&A                   |              On |
| Reactions             |              On |

### Content sharing

| Item                                                                                 |                       Value |
| ------------------------------------------------------------------------------------ | --------------------------: |
| Who can present                                                                      | People in my org and guests |
| Screen sharing                                                                       |               Entire screen |
| Participants can give or request control                                             |                          On |
| External participants can give or request control                                    |                         Off |
| PowerPoint Live                                                                      |                          On |
| Whiteboard                                                                           |                          On |
| Collaborative annotations                                                            |                          On |
| Live share                                                                           |                          On |
| Shared notes                                                                         |                          On |
| Organizer can restrict participants from copying or forwarding meeting chat messages |                          On |
| Participants can share content in external meetings hosted by                        |     Trusted orgs and guests |

### Content protection

| Item                          |      Value |
| ----------------------------- | ---------: |
| Watermark videos              |         On |
| Watermark shared content      |         On |
| Watermark for anonymous users | Audio only |

### Recording & transcription

| Item                                                                    |                             Value |
| ----------------------------------------------------------------------- | --------------------------------: |
| Meeting recording                                                       |                                On |
| Require participant agreement for recording, transcription, and Copilot |                               Off |
| Store recordings outside of yur country or region                       |                               Off |
| Transcription                                                           |                               Off |
| Recordings and transcriptions automatically expire                      |                               Off |
| Live captions                                                           | Not enabled, but users can enable |
| Real-time-text (RTT)                                                    |                                On |
| Copilot                                                                 | On with saved transcript required |

### Audio & video

| Item                                           |                               Value |
| ---------------------------------------------- | ----------------------------------: |
| Mode for IP audio                              | Outgoing and incoming audio enabled |
| Mode for IP video                              | Outgoing and incoming video enabled |
| Video conferencing                             |                                  On |
| Broadcast production with NDI and SDI hardware |                                 Off |
| Media bit rate (Kbps)                          |                               50000 |
| Network configuration lookup                   |                                 Off |
| Participants can use video effects             |                   All video effects |
| Live streaming                                 |                                 Off |
| Allow streaming media input                    |                             *Blank* |

### Participants

| Item                                               | Value |
| -------------------------------------------------- | ----: |
| Anonymous users can join a meeting                 |   Off |
| Anonymous users can interact with apps in meetings |   Off |

### Cross-cloud meetings

| Item                       | Value |
| -------------------------- | ----: |
| Microsoft Azure Government |   Off |
| Microsoft Azure China      |   Off |

### Email invitation

| Item                     |                                   Value |
| ------------------------ | --------------------------------------: |
| Logo URL                 |                 *Organisation logo URL* |
| Privacy and security URL | *Organisation privacy and security URL* |
| Help URL                 |                 *Organisation help URL* |
| Footer                   |              *Organisation footer text* |

### Network

| Item                                                                |               Value |
| ------------------------------------------------------------------- | ------------------: |
| Insert Quality of Service (QoS) markers for real-time media traffic |                 Off |
| Select a prot range for each type of real-time media traffic        | Specify port ranges |

| Media traffic type | Starting port | Ending port | Total ports |
| ------------------ | ------------: | ----------- | ----------- |
| Audio              |         50000 | 50019       | 20          |
| Video              |         50020 | 50039       | 20          |
| Screen Sharing     |         50040 | 50059       | 20          |

### Related information

#### Security & Governance

* None identified
  
#### Design

* [Teams]({{<ref "design/shared-services/teams">}})
  
#### Configuration

* None identified

#### References

* [Manage meeting and event policies in Microsoft Teams](https://learn.microsoft.com/en-au/microsoftteams/meeting-policies-overview)
* [Teams settings and policies reference](https://learn.microsoft.com/en-au/microsoftteams/settings-policies-reference)
