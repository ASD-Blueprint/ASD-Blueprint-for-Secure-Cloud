---
Title: Meeting policies
weight: 10
description: "This section describes the configuration of meeting policies within Microsoft Teams associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* for the Microsoft Exchange Online portal blade at the following URL:

<https://admin.teams.microsoft.com/policies/meetings>

The settings described on these pages should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Global (Org-wide default) policy

#### Meeting scheduling

| Item                             |           Value |
| -------------------------------- | --------------: |
| Private meeting scheduling       |              On |
| Meet now in private meetings     |              On |
| Channel meeting scheduling       |              On |
| Meet now in channel meetings     |              On |
| Outlook add-in                   |              On |
| Meeting registration             |              On |
| Who can register                 |        Everyone |
| Attendance and engagement report |              On |
| Include attendees in the report  |          Always |
| Attendee information             | Show everything |

#### Meeting join & lobby

| Item                                                    |                             Value |
| ------------------------------------------------------- | --------------------------------: |
| Anonymous users can join a meeting                      |                               Off |
| Anonymous users and dial-in callers can start a meeting |                               Off |
| Who can bypass the lobby                                | Only organizers and co-organizers |
| People dialling in can bypass the lobby                 |                               Off |

#### Meeting engagement

| Item                                              |                       Value |
| ------------------------------------------------- | --------------------------: |
| Who can present                                   | People in my org and guests |
| Screen sharing                                    |               Entire screen |
| Participants can give or request control          |                          On |
| External participants can give or request control |                         Off |
| Powerpoint Live                                   |                          On |
| Whiteboard                                        |                          On |
| Collaborative annotations                         |                          On |
| Live share                                        |                          On |
| Shared notes                                      |                          On |

#### Recording and transcription

| Item                                               |                                                  Value |
| -------------------------------------------------- | -----------------------------------------------------: |
| Meeting recording                                  |                                                     On |
| Require participant agreement for recording        |                                                    Off |
| Recordings automatically expire                    |                                                    Off |
| Store recordings outside of your country or region |                                                    Off |
| Transcription                                      |                                                     On |
| Live captions                                      | Off, but organizers and co-organizers can turn them on |
| Copilot                                            |                                     On with transcript |

#### Audio & video

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
| Allow streaming media input                    |                             *blank* |
