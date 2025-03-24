---
title: "Policies & Settings"
weight: 45
description: "This section describes the design decisions associated with Teams Policies & Settings for system(s) built using ASD's Blueprint for Secure Cloud."
---

Microsoft Teams provides ability to create policies around messaging, meetings, calling, video and guest access. These settings can be configured in policies and assigned to individual users within the organisation.

The below highlights the policies that can be configured with in teams:

* **Teams Policies** – Teams policies defines the policy for users to discover private teams and create private channels.
* **Meeting Policies** – Meeting policies define creations of meetings, audio and video, content sharing, and participant and guest permissions to meetings in Teams.
* **Live events Policies** – Live events policies is used to globally broadcast departmental meeting via Teams
* **Messaging Policies** – Messaging policies defines behaviour of messages in Teams. The policy defines user capability in sending, editing, deleting, voice messages, and using Giphy, stickers, URL preview and translator.
* **Teams App** – Teams apps policy defines the list of apps that can be used in Teams. Microsoft Teams provides Microsoft published apps and third-party apps that can be used in Microsoft Teams. The organisation can control creation of custom apps in Teams.

{{% alert title="Design decisions" color="warning" %}}

| Decision point       | Design decision                                                                                                                                    | Justification                                                                                                                                                                                                                                                       |
| -------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Teams Policy         | Configured<br>Enable private channels and shared channels for internal usage. <br>Disable private channels and shared channels for external usage. | Enable users to utilise this collaboration functionality internally, without having the ability to share externally.                                                                                                                                                 |
| Meeting Policies     | Configured<br>Global policy:<br>Automatically admit people – Everyone in the organisation<br>Cloud Recording – Enabled with automatic deletion     | Meeting policy dictates how audio, videos and applications that are used in a team meeting.<br>Require external participants to be admitted to a meeting to prevent unauthorised entrance.<br>Enables meetings to be recorded while reducing storage consumption.   |
| Live events Policies | Configured<br>Who can join live events:<br>Everyone in Organisation                                                                                | Live events is configured to prevent users outside of the organisation (guest and external users) attending these meetings.                                                                                                                                      |
| Messaging Policy     | Configured                                                                                                                                         | Messaging policy dictates how messaging is used in Teams. These include usage of Giphy, Memes and stickers in messages.                                                                                                                                             |
| Teams apps           | Configured<br>Global Policy:<br>Allow all Microsoft apps<br>Block all third-party apps<br>Block all custom apps                                    | All third-party apps are blocked by the Blueprint by default. The use of third-party apps should be risk assessed by organisations individually.<br>Custom apps are custom developed applications created by the organisation. These should be enabled as required. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* [Teams policies]({{<ref "configuration/microsoft-teams/teams/policies">}})
* [Meeting policies]({{<ref "configuration/microsoft-teams/meetings/meeting-policies">}})
* [Live event policies]({{<ref "configuration/microsoft-teams/meetings/live-events-policies">}})
* [Messaging policies]({{<ref "configuration/microsoft-teams/messaging/messaging-policies">}})
* [Permission policies]({{<ref "configuration/microsoft-teams/apps/permission-policies">}})

#### References

* None identified
