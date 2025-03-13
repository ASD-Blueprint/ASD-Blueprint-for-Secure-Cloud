---
title: "Messaging policies"
linkTitle: "Messaging policies"
weight: 00
description: "This section describes the configuration of messaging within Microsoft Teams associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Teams admin portal at the following URL:

<https://admin.teams.microsoft.com/policies/messaging>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Global (Org-wide default) policy

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
| Create voice messages                                           |          Allowed in chat and channels |
| On Mobile devices, display favorite channels above recent chats |                           Not enabled |
| Remove users from group chats                                   |                                    On |
| Text predictions                                                |                                    On |
| Suggested replies                                               |                                   Off |
| Chat permission role                                            |                Restricted permissions |
| Users with full chat permissions can delete any message         |                                   Off |
| Video messages                                                  |                                    On |

### Related information

#### Security & Governance

* None identified

#### Design

* [Organisation Wide Configuration]({{<ref "design/shared-services/teams/policies-and-settings">}})
* [Unified Communication]({{<ref "design/shared-services/teams/unified-communications">}})

#### Configuration

* None identified

#### References

* None identified
