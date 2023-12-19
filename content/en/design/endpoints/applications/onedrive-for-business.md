---
title: "Microsoft OneDrive for Business"
weight: 20
description: "This section describes the design decisions associated with Microsoft OneDrive for Business."
---

Microsoft OneDrive for Business provides a robust cloud storage platform for government organisations. This OneDrive for Business section considers the client component only. The configuration of the server component of OneDrive for Business is contained in the Office 365 Solution Overview document.

OneDrive enables the secure sharing of files inside and outside an organisation, as well as on any compatible device. Compliance settings allow administrators to control the level of security within the application. OneDrive also facilitates collaboration between users. Co-authoring is available via Office web apps, Office mobile apps, and Office desktop apps, helping users maintain a single working version of any file and edit concurrently.

The OneDrive for Business client has access to two distinct primary rings and an additional preview ring:

* **Production Ring** – The Production ring provides new features and improvements as soon as they are released by Microsoft.
* **Enterprise Ring** – The enterprise ring rolls out changes after validated in the Production ring, reducing the risk of issues. This ring enables administrators to deploy updates from an internal network location and control the timing of the deployment (within a 60-day window). This is the recommended update ring for most large scale or high-risk organisations.
* **Insiders Ring** – Insider ring users will receive builds that let them preview new features coming to OneDrive.

The Windows Known Folder feature of OneDrive for Business enables administrators to easily move files in a users' Desktop, Documents and Pictures folders to OneDrive.

OneDrive Files On-Demand enables users to view, search for and interact with files stored in OneDrive from within File Explorer without downloading them all to the local device. The feature delivers a unified look and feel for both OneDrive and local files whilst saving on space normally taken up on the local hard drive.

OneDrive allows users to work on content that is stored online in the cloud as well as store and synchronise content locally through the OneDrive for Business client. Synchronising this content between the client device and OneDrive storage can consume a considerable amount of bandwidth especially if the internet connection is slow. The OneDrive for Business client provides the capability to shape upload and download rates for synchronising content hence reducing the impact on the network. If the internet connection is too slow the end user can continue to work on the content locally and the content will be automatically synchronised by OneDrive for Business client when the internet connection speed improves.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                      | Design Decision                               | Justification                                                                                                                                                                                            |
|-------------------------------------|-----------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| OneDrive for Business               | Enabled and silently configured               | OneDrive will be configured without user intervention on sign in.                                                                                                                                        |
| Sync Client Update Ring             | Enterprise                                    | As per Microsoft recommendations for large environments.                                                                                                                                                 |
| OneDrive Personal Account           | Disabled                                      | Personal accounts will be disabled. OneDrive for Business accounts will be used.                                                                                                                         |
| Default Location                    | `%userprofile%`                               | Default OneDrive folder location is suitable for the Windows SOE.                                                                                                                                        |
| Allow Changing Default Location     | Disabled                                      | As per Microsoft recommendation for shared devices users will be prevented from changing the default OneDrive folder location.                                                                           |
| Files On-Demand                     | Enabled                                       | Files On-Demand will be configured to save storage space on users' computers and minimise the network impact of sync.                                                                                    |
| Backup - Sync Windows Known Folders | Enabled                                       | Syncing Windows known folders to OneDrive for Business will be configured for the Windows SOE. This will enable the users Documents, Pictures and Desktop folders to be saved in OneDrive automatically. |
| Network settings – Upload           | Do not limit                                  | Allow dynamic network configuration to provide best performance.                                                                                                                                         |
| Network settings – Download         | Do not limit                                  | Allow dynamic network configuration to provide best performance.                                                                                                                                         |
| File Collaboration Policy           | Enabled                                       | File collaboration will be enabled to allow users to work collaboratively and increase productivity.                                                                                                     |
| Sync Conflict Policy                | Let me choose to merge changes or keep copies | The OneDrive sync conflict policy will be configured to allow the user to choose.                                                                                                                        |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* [Introduction to SharePoint and OneDrive in Microsoft 365 for administrators](https://learn.microsoft.com/sharepoint/introduction)