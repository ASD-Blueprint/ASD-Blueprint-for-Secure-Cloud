---
title: "Notifications"
weight: 40
description: "This section describes the design decisions associated with One Drive Notifications for system(s) built using ASD's Blueprint for Secure Cloud."
---

Notifications provide OneDrive users with information about how OneDrive is operating. The notification administration screen provides notification control to OneDrive owners. The design considers notification and alerting of users, and so all shared documents in the organisation and their users, are aware of the status of shared documents. Users can be notified by email when:

* Other users invite additional users.
* External users accept invitations.
* An anonymous access link is created or changed.

{{% alert title="Design decisions" color="warning" %}}

| Decision point     | Design decision | Justification                                                                |
|--------------------|-----------------|------------------------------------------------------------------------------|
| User notifications | Configured      | Notifications will be configured to provide users with relevant information. |

{{% /alert %}}

### Configuration Choices

OneDrive for Business Notification Configuration:

| Configuration                                                                 | Value   | Description                                                                             |
|-------------------------------------------------------------------------------|---------|-----------------------------------------------------------------------------------------|
| Display device notification to users when OneDrive files are shared with them | Checked | OneDrive will notify users when new files are shared with them.                          |
| **E-mail OneDrive owners when**                                               |         |                                                                                         |
| Other users invite additional external users to shared files                  | Checked | OneDrive will notify users when a user re-shares a document to an external user (guest). |
| External users accept invitations to access files                             | Checked | OneDrive will notify users when external users accept an invitation to access files.    |
| An anonymous access link is created                                           | Checked | OneDrive will notify users when an anonymous access link is created.                     |

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* [Settings]({{<ref "configuration/sharepoint-online/settings">}})

#### References

* [One Drive Notifications](https://docs.microsoft.com/onedrive/turn-on-external-sharing-notifications)