---
Title: Call policies
weight: 00
description: "This section describes the configuration of call policies within Microsoft Teams associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* for the Microsoft Exchange Online portal blade at the following URL:

<https://admin.teams.microsoft.com/policies/calling>

The settings described on these pages should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Global (Org-wide default) policy

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
| Music on hold for PSTN calls                                            |                   On |
| Busy on busy during calls                                               |                   On |
| Web PSTN calling                                                        |                  Off |
| Real-time captions in Teams calls                                       |                   On |
| Automatically answer incoming meeting invites                           |                  Off |
| Spam filtering                                                          |                   On |
| SIP devices can be used for calls                                       |                  Off |
| Open apps in browser for incoming PSTN call                             |                  Off |
