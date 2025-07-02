---
title: "Messaging"
linkTitle: "Messaging"
weight: 10
description: "This section describes the configuration of messaging settings within Microsoft Teams associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Teams admin portal at the following URL:

<https://admin.teams.microsoft.com/one-policy/settings/messaging>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Messaging settings

| Item                                                            |                                 Value |
| --------------------------------------------------------------- | ------------------------------------: |
| Owners can delete sent messages                                 |                                    On |
| Delete sent messages                                            |                                    On |
| Delete chat                                                     |                                    On |
| Edit sent messages                                              |                                    On |
| Read receipts                                                   |                       User controlled |
| Upload custom emojis                                            |                                    On |
| Delete custom emojis                                            |                                    On |
| Chat                                                            |                                    On |
| Chat with groups                                                |                                    On |
| Custom avatars for group chats                                  |                                    On |
| Giphy in conversations                                          |                                   Off |
| Giphy content rating                                            | G (based on the GIPHY Content Rating) |
| Memes in conversations                                          |                                   Off |
| Stickers in conversations                                       |                                   Off |
| URL previews                                                    |                                   Off |
| Report inappropriate content                                    |                                    On |
| Report a security concern                                       |                                    On |
| Translate messages                                              |                                   Off |
| Immersive reader for messages                                   |                                    On |
| Send urgent messages using priority notifications               |                                    On |
| Create voice messages                                           |         Allowed in chats and channels |
| On mobile devices, display favorite channels above recent chats |                           Not enabled |
| Remove users from group chats                                   |                                    On |
| Text predictions                                                |                                    On |
| Suggested replies                                               |                                   Off |
| Chat permission role                                            |                Restricted permissions |
| Users with full chat permission can delete any message          |                                   Off |
| Video messages                                                  |                                    On |
| Priority account chat control                                   |                                   Off |

### Advanced collaboration management

| Item                          | Value |
| ----------------------------- | ----: |
| Priority account chat control |   Off |

### Viva Engage

| Item                             | Value |
| -------------------------------- | ----: |
| Viva Engage experiences in Teams |    On |

### Custom emojis

| Item              | Value |
| ----------------- | ----: |
| Use custom emojis |    On |

### Related information

#### Security & Governance

* None identified
  
#### Design

* [Teams]({{<ref "design/shared-services/teams/">}})
  
#### Configuration

* None identified

#### References

* [Manage messaging policies in Teams](https://learn.microsoft.com/en-au/microsoftteams/messaging-policies-in-teams)
* [Teams settings and policies reference](https://learn.microsoft.com/en-au/microsoftteams/settings-policies-reference)
