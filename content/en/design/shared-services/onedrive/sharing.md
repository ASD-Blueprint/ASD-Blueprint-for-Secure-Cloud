---
title: "Sharing"
weight: 40
description: "This section describes the design decisions associated with One Drive Sharing for system(s) built using ASD's Blueprint for Secure Cloud."
---

The OneDrive sharing administration screen provides granular configuration. Controlling OneDrive sharing ensures that data is shared internally and externally in a secure manner. OneDrive provides end users the ability to securely store their personal data in Office 365. The design considers that OneDrive is used for personal storage and sharing within the organisation.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point   | Design Decision | Justification                                                                                       |
|------------------|-----------------|-----------------------------------------------------------------------------------------------------|
| External Sharing | Disabled        | Sharing to external users will be disabled. Collaboration and sharing will be achieved using Teams. |

{{% /alert %}}

OneDrive sharing configuration choices:

| Configuration                                                                                          | Value                                     | Description                                                                                                                      |
| ------------------------------------------------------------------------------------------------------ | ----------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| **Links**                                                                                              |                                           |                                                                                                                                  |
| Default Link Type                                                                                      | Internal: Only people in the organisation | No sharing is permitted outside the organisation.                                                                                |
| **External Sharing**                                                                                   |                                           |                                                                                                                                  |
| SharePoint                                                                                             | Only people in the organisation           | No external sharing allowed.                                                                                                     |
| OneDrive                                                                                               | Only people in the organisation           | No external sharing allowed.                                                                                                     |
| **Advanced settings for external sharing**                                                             |                                           |                                                                                                                                  |
| Allow or block sharing with people on specific domains                                                 | Unchecked                                 | Specific domains are not defined, meaning that content is permitted to be shared with all users within the directory (internal). |
| External users must accept sharing invitation using the same account that the invitations were sent to | Checked                                   | Required to ensure users are authenticated before accepting sharing invitation.                                                  |
| Let external users share items they don't own                                                          | Unchecked                                 | Restricts external users (guests) from re-sharing content.                                                                       |
| **Other settings**                                                                                     |                                           |                                                                                                                                  |
| Display to owner the names of people who viewed their files                                            | Checked                                   | Ensure owner is aware of who it has been shared.                                                                                 |

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* None identified

#### References

* [Content Sharing](https://docs.microsoft.com/onedrive/manage-sharing)