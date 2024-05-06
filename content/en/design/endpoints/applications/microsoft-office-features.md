---
title: "Microsoft Office Features"
weight: 10
description: "This section describes the design decisions associated with installation of Microsoft Office features."
---

The Microsoft 365 Apps for Enterprise - formerly Office 365 ProPlus - features include the application set that will be provided to the users. The Microsoft Office feature section includes the details of the following components:

* Microsoft Access
* Microsoft Excel
* Microsoft Teams
* Microsoft Office OneNote
* Microsoft Outlook
* Microsoft Publisher
* Microsoft PowerPoint
* Microsoft Word
* Microsoft OneDrive Desktop

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point              | Design Decision | Justification                         |
|-----------------------------|-----------------|---------------------------------------|
| Microsoft Office Word       | Enabled         | Required to enable user productivity. |
| Microsoft Office Excel      | Enabled         | Required to enable user productivity. |
| Microsoft Office Outlook    | Enabled         | Required to enable user productivity. |
| Microsoft Office PowerPoint | Enabled         | Required to enable user productivity. |
| Microsoft Office OneNote    | Enabled         | Required to enable user productivity. |
| Microsoft Office Publisher  | Enabled         | Required to enable user productivity. |
| Microsoft Teams             | Enabled         | Required to enable user productivity. |
| Microsoft Office Access     | Disabled        | Not installed by default.             |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* [Endpoint security policies]({{<ref "configuration/defender/endpoints/configuration-management/endpoint-security-policies.md">}})

#### References

* [Add Microsoft 365 Apps to Windows 10/11 devices with Microsoft Intune](https://learn.microsoft.com/mem/intune/apps/apps-add-office365)