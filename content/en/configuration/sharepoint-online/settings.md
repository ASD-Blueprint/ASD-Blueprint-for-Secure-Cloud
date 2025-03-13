---
title: "Settings"
linkTitle: "Settings"
weight: 040
description: "This section describes the configuration of SharePoint associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the SharePoint admin portal at the following URL:

<https://`<TENANT-NAME>`-admin.sharepoint.com/>

`Home` > `Settings`

These settings should be used to provide reference of a baseline implementation for a system configured using the blueprint. Any implementation implied by the below should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### SharePoint

#### Notifications

| Item                |   Value |
| ------------------- | ------: |
| Allow notifications | Checked |

#### Pages

| Item                               |   Value |
| ---------------------------------- | ------: |
| Allow users to create modern pages | Checked |
| Allow commenting on modern pages   | Checked |

#### Site creation

| Item                              |                                   Value |
| --------------------------------- | --------------------------------------: |
| Users can create SharePoint sites |                               Unchecked |
| Create team sites under           |                                 /sites/ |
| Default time zone                 | (UTC+10:00 Canberra, Melbourne, Sydney) |

#### Site storage limits

| Item      |    Value |
| --------- | -------: |
| Automatic | Selected |

### OneDrive

#### Notification

| Item                |   Value |
| ------------------- | ------: |
| Allow notifications | Checked |

#### Retention

| Item                                     | Value |
| ---------------------------------------- | ----: |
| Days to retain a deleted user's OneDrive |   365 |

#### Storage limit

| Item                  |   Value |
| --------------------- | ------: |
| Default storage limit | 1024 GB |

#### Sync

| Item                                                          |     Value |
| ------------------------------------------------------------- | --------: |
| Show the Sync button on the OneDrive website                  |   Checked |
| Allow syncing only on computers joined to specific domains    |   Checked |
| - Enter each Active Directory domain as a GUID on a new line. |  `<GUID>` |
| Block upload of specific file types                           | Unchecked |

### Related information

#### Security & Governance

* None identified
  
#### Design

* [SharePoint]({{<ref "design/shared-services/sharepoint-online">}})
* [Entra ID Protection]({{<ref "design/platform/identity/protection.md">}})
* [Notifications]({{<ref "design/shared-services/onedrive/notifications">}})
* [Storage and Synchronisation]({{<ref "design/shared-services/onedrive/storage-and-synchronisation">}})
  
#### Configuration

* [Microsoft Intune - profile configurations]({{<ref "configuration/intune/devices/configuration-policies">}})

#### References

* None identified
