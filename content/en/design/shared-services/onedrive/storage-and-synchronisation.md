---
title: "Storage and Synchronisation"
weight: 40
description: "This section describes the design decisions associated with One Drive Storage and Synchronisation for system(s) built using ASD's Blueprint for Secure Cloud."
---

OneDrive and SharePoint can synchronise content locally through the OneDrive for Business client. Content can be "pinned" for offline use, ensuring that specific content is available offline, and changes are merged later. The Sync Administration screen provides control Synchronising of File in OneDrive and SharePoint. The sync client is required to provide the ability for end users to work offline from Microsoft Office 365.

{{% alert title="Design decisions" color="warning" %}}

| Decision point         | Design decision | Justification                                                                                                   |
|------------------------|-----------------|-----------------------------------------------------------------------------------------------------------------|
| Synchronisation client | Configured      | The organisation must use the OneDrive sync client to provide an offline file capability.                       |
| Storage Limitations    | Configured      | To assist the organisation in managing user data specific storage and retention limitations will be configured. |

{{% /alert %}}

Storage and Synchronisation Configuration Choices:

| Configuration                                                  | Value     | Description                                                                                                                                                  |
| -------------------------------------------------------------- | --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Show the Sync button on the OneDrive Website                   | Checked   | The synchronise button enables OneDrive files to be synced locally through the OneDrive for Business client.                                                 |
| Allow syncing only on PC joined to specific domains            | Checked   | OneDrive synchronisation is controlled via Conditional Access for Entra joined devices (only). Domain GUIDs for Active Directory domains should be provided. |
| Block syncing of specific file type                            | Unchecked | File type synchronisation is not restricted. Microsoft Defender for Office 365 provides additional protection against malicious files.                       |
| Days to retain files after user account is marked for deletion | 365 days  | Must align with the organisation internal record keeping policies.                                                                                           |
| Limit OneDrive user Capacity                                   | 1024GB    | Default setting.                                                                                                                                             |

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* [Settings]({{<ref "configuration/sharepoint-online/settings">}})

#### References

* [Content Synchronisation](https://docs.microsoft.com/onedrive/sync-process)