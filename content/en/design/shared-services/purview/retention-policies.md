---
title: "Retention Policies"
weight: 60
description: "This section describes the design decisions associated with Retention Policies Microsoft 365 security features for system(s) built using ASD's Blueprint for Secure Cloud."
---

Business information is required to be managed in order to comply with industry and government regulations and internal policies that require data to be retained for a certain period.

Microsoft 365 retention policies assist with meeting these requirements by providing the following features:

* Configure policies to proactively decide whether to retain content, delete content, or both retain and then delete the content
* Apply a single policy to the entire organisation or just to specific locations or users
* Apply a policy to all content or just content meeting certain conditions, such as content containing specific keywords or specific types of sensitive information

When information is subject to a retention policy, end-users can continue to edit and work with the content as if nothing has changed because the content is retained in place, in its original location. But if someone edits or deletes content that is subject to the policy, a copy is saved to a secure location where it's retained while the policy is in effect.

{{% alert title="Note" color="info" %}}

The use of Microsoft 365 retention policies (including litigation or preservation holds) does not replace the need for regular backups and the ability to recover that important data. Organisations should determine their own requirements for backup and recovery in accordance with their business continuity requirements.

{{% /alert %}}

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point     | Design Decision | Justification                                                                                                                               |
|--------------------|-----------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| Retention Policies | Configured      | To ensure that legislative data retention requirements are met. This is to ensure that the organisation holds the data for fraud detection. |

{{% /alert %}}

{{% alert title="Note" color="info" %}}

Microsoft 365 is not a records keeping system. Australian Government entities should consider the information on this page along side their obligations under the Archives Act 1983 and their existing corporate policies on record keeping. For further information consult the [National Archives of Australia (NAA)](https://www.naa.gov.au/)

{{% /alert %}}

The following retention configuration are considered a basic approach to data retention. Organisations should investigate implementation of a maturity model to accommodate varying types of data. The Blueprint will update this section at a later date, but a high-level approach for organisations may include:

1. Definition of a default policy to protect data from deletion
2. Assignment of (adaptive) scopes
3. Reduce default retention policies and deploy retention labels and records management process for granular control.

### Cloud native deployments

Retention Policies configuration applicable to organisations leveraging a cloud native implementation.

| Configuration                                 | Value                                                                                        | Description                                       |
|-----------------------------------------------|----------------------------------------------------------------------------------------------|---------------------------------------------------|
| **Name: Exchange 7 Years Hold**               |                                                                                              |                                                   |
| Retention configuration                       | Retain the data "7 years"                                                                    | How long the data is to be held by the policy.    |
| Location                                      | Exchange email – All users included<br>Exchange public folders - All public folders included | The Office 365 location where the policy applies. |
| **Name: SharePoint 7 Years Hold**             |                                                                                              |                                                   |
| Retention configuration                       | Retain the data "7 years"                                                                    | How long the data is to be held by the policy.    |
| Location                                      | SharePoint Sites – All Sites                                                                 | The Office 365 location where the policy applies. |
| **Name: OneDrive 7 Years Hold**               |                                                                                              |                                                   |
| Retention configuration                       | Retain the data "7 years"                                                                    | How long the data is to be held by the policy.    |
| Location                                      | OneDrive Accounts – All Accounts                                                             | The Office 365 location where the policy applies. |
| **Name: Microsoft 365 groups 7 Years Hold**   |                                                                                              |                                                   |
| Retention configuration                       | Retain the data "7 years"                                                                    | How long the data is to be held by the policy.    |
| Location                                      | Microsoft 365 groups – All Groups                                                            | The Office 365 location where the policy applies. |
| **Name: Teams Channel Messages 7 Years Hold** |                                                                                              |                                                   |
| Retention configuration                       | Retain the data "7 years"                                                                    | How long the data is to be held by the policy.    |
| Location                                      | Teams channel messages – All teams included                                                  | The Office 365 location where the policy applies. |
| **Name: Teams chats 7 Years Hold**            |                                                                                              |                                                   |
| Retention configuration                       | Retain the data "7 years"                                                                    | How long the data is to be held by the policy.    |
| Location                                      | Teams chats messages – All users included                                                    | The Office 365 location where the policy applies. |

### Hybrid deployments

Retention Policy Configuration applicable to organisations leveraging a hybrid implementation

| Configuration                                 | Value                                       | Description                                       |
|-----------------------------------------------|---------------------------------------------|---------------------------------------------------|
| **Name: Exchange 3 Years Hold**               |                                             |                                                   |
| Retention configuration                       | Retain the data for 3 years                 | How long the data is to be held by the policy.    |
| Location                                      | Exchange email – All users included         | The Office 365 location where the policy applies. |
| **Name: SharePoint 3 Years Hold**             |                                             |                                                   |
| Retention configuration                       | Retain the data for 3 years                 | How long the data is to be held by the policy.    |
| Location                                      | SharePoint Sites – All Sites                | The Office 365 location where the policy applies. |
| **Name: OneDrive 3 Years Hold**               |                                             |                                                   |
| Retention configuration                       | Retain the data for 3 years                 | How long the data is to be held by the policy.    |
| Location                                      | OneDrive Accounts – All Accounts            | The Office 365 location where the policy applies. |
| **Name: Microsoft 365 groups 3 Years Hold**   |                                             |                                                   |
| Retention configuration                       | Retain the data for 3 years                 | How long the data is to be held by the policy.    |
| Location                                      | Microsoft 365 groups – All Groups           | The Office 365 location where the policy applies. |
| **Name: Teams Channel Messages 3 Years Hold** |                                             |                                                   |
| Retention configuration                       | Retain the data for 3 years                 | How long the data is to be held by the policy.    |
| Location                                      | Teams channel messages – All teams included | The Office 365 location where the policy applies. |
| **Name: Teams chats 3 Years Hold**            |                                             |                                                   |
| Retention configuration                       | Retain the data for 3 years.                | How long the data is to be held by the policy.    |
| Location                                      | Teams chats messages – All users included   | The Office 365 location where the policy applies. |

### Retention costs

Retention is included within E5 storage allocations. There are no additional charges for retention.

{{% alert title="Note" color="info" %}}

OneDrive **IS NOT** retained when the user license is removed. In this scenario, data should be moved to SharePoint Online or Azure, or alternatively the user account should be allocated a lower licence. 
Exchange Online data is retained after the user departs and for as long as the retention on the mailbox specifies.

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* [Learn about retention policies and retention labels](https://docs.microsoft.com/microsoft-365/compliance/retention?view=o365-worldwide)
