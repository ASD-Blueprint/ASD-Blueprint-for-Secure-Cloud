---
title: "Backup and Operational Management"
weight: 40
description: "This section describes the design decisions associated backup and operational management configuration for system(s) built using ASD's Blueprint for Secure Cloud."
---

### RTO, RPO, and Retention

As with an on-premises environment, backups play an important part of an overall cloud solution capability. It is important that critical information is backed up to enable recovery for scenarios such as accidental deletion or corruption.

To ensure a successful backup, configuration of the following items should be taken into consideration:

* **What to backup** - understanding what configuration data, files, and mailboxes need to be backed up is important. If only a partial configuration is backed up, successful restoration may not be possible.
* **Restoration destination** - where will backed up data be restored. An Exchange Online mailbox, for example, may not be easily restored to an Exchange Server given differences in the underlying code bases.
* **Recovery Point Objective (RPO)** - RPO defines an acceptable loss of data (in time) for a data type in a data-loss event. RPOs are expressed in hours / days and directly influence the backup approach, and how backups are performed with sufficient frequency to meet the defined RPO. For example, if an RPO of 12 hours was defined for a given data type, backups of this data type could not be scheduled further than 12 hours apart.
* **Recovery Time Objective (RTO)** - RTO is used to define the acceptable level of service interruption (in time) between a data loss event and the recovery of the data to a point at which normal service is resumed. When determining RTOs for a given data type, consideration must also be given to any additional recovery process that are undertaken after the restoration of data. The RTO directly influences the type of backups performed and may dictate additional protection mechanisms outside of the backup platform for data types where a very short RTO is defined.
* **Legislative Requirements** – The Essential Eight details that backups of important information, software and configuration settings are performed. More detail on these controls are listed in the Department of Home Affairs' [*Protective Security Policy Framework*](https://www.protectivesecurity.gov.au/sites/default/files/2019-11/pspf-infosec-10-safeguarding-information-cyber-threats.pdf) and ASD's [Essential Eight Maturity Model](https://www.cyber.gov.au/acsc/view-all-content/publications/essential-eight-maturity-model).

It is important that prior to defining the backup and restore policies, RTO and RPO objectives for each data type hosted within the environment are defined in line with business requirements and Service Level Agreements (SLA).

There are several enterprise backup solutions which can backup data whether it is located on-premises or in the cloud. Depending on the organisations requirements, a backup solution may need to cover the following scenarios:

* Backup local data directly to on-premises infrastructure from on-premises.
* Backup local data to on-premises infrastructure and to the Azure storage blob from on-premises.
* Backup cloud data directly from the cloud.

{{% alert title="Note" color="info" %}}

[Microsoft recently announced](https://techcommunity.microsoft.com/t5/microsoft-365-blog/microsoft-365-backup-and-microsoft-365-backup-storage-at-ignite/ba-p/3981049) a paid backup solution for Microsoft 365 which is scheduled for release in 2024. Implementation details on this solution will be included in this backup section when available. 

{{% /alert %}}

Using the native Microsoft 365 tools only, in combination with recycle bins, the following data recovery options and retention periods are available:

* What to backup - understanding what configuration, files and mailboxes that need to be backed up is important. If only a partial configuration is backed up, successful restoration may not be possible.
* Documents, Desktops and Pictures for each user is redirected from the Windows client device to OneDrive using Windows Known Folders providing a backup of data to the cloud.
* OneDrive includes recycle bins allowing recovery of data for up to 93 days.
* SharePoint Online data includes recycle bins allowing recovery of data for up to 93 days.
* Teams chat, channel and files data retained indefinitely by default unless retention policies have been implemented.
* Exchange Online has a recover deleted items from server option allowing recovery of data for up to 30 days.

The Blueprint [defines retention policies]({{<ref "design/shared-services/purview/retention-policies">}}), which can be modified to ensure that data is retained for longer than the defined seven years:

* Exchange
* SharePoint
* OneDrive
* Microsoft 365 groups
* Skype for Business
* Exchange Public Folders
* Teams channel messages
* Teams chats

{{% alert title="Note" color="info" %}}

Retention policies offer some protection against data loss and associated risks, but they are not considered a complete backup solution.

{{% /alert %}}

Workstation configuration is stored within Microsoft Intune (Autopilot rebuild).

Organisations should review native Microsoft 365 capabilities and determine whether they meet data preservation requirements, or whether a third-party backup solution is required.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                 | Design Decision                                                    | Justification                                                                                                                                                                  |
|--------------------------------|--------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Exchange Online mailboxes      | RPO – 24 hours from backup or better<br>RTO - < 48 hours or better | RPO and RTO in relation to cloud backups is for guidance only. Organisations are required to measure these against the business, application, regulatory and security requirements. |
| Exchange Online mail items     | RPO – 24 hours from backup or better<br>RTO - < 48 hours or better | RPO and RTO in relation to cloud backups is for guidance only. Organisations are required to measure these against the business, application, regulatory and security requirements. |
| SharePoint Online Sites        | RPO – 24 hours from backup or better<br>RTO - < 48 hours or better | RPO and RTO in relation to cloud backups is for guidance only. Organisations are required to measure these against the business, application, regulatory and security requirements. |
| OneDrive for Business accounts | RPO – 24 hours from backup or better<br>RTO - < 48 hours or better | RPO and RTO in relation to cloud backups is for guidance only. Organisations are required to measure these against the business, application, regulatory and security requirements. |
| Microsoft 365 Groups           | RPO – 24 hours from backup or better<br>RTO - < 48 hours or better | RPO and RTO in relation to cloud backups is for guidance only. Organisations are required to measure these against the business, application, regulatory and security requirements. |
| Teams chat messages            | RPO – 24 hours from backup or better<br>RTO - < 48 hours or better | RPO and RTO in relation to cloud backups is for guidance only. Organisations are required to measure these against the business, application, regulatory and security requirements. |
| Teams channel messages         | RPO – 24 hours from backup or better<br>RTO - < 48 hours or better | RPO and RTO in relation to cloud backups is for guidance only. Organisations are required to measure these against the business, application, regulatory and security requirements. |
| Teams private channel messages | RPO – 24 hours from backup or better<br>RTO - < 48 hours or better | RPO and RTO in relation to cloud backups is for guidance only. Organisations are required to measure these against the business, application, regulatory and security requirements. |

{{% /alert %}}

#### Cloud native deployments

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point     | Design Decision                                                                                          | Justification                                                                                                                                                 |
|--------------------|----------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Restoration tools  | Microsoft backup and restoration tools (when no backup product selected)                                 | The organisation will leverage Microsoft Office 365 native tools in the first instance to recover user data, where no third-party backup toolset is deployed. |
| Items to Backup    | Exchange Online<br>SharePoint Online<br>Microsoft Teams<br>OneDrive for Business<br>Microsoft 365 groups | Backups must cover the Microsoft suite of tools at a minimum.                                                                                                 |
| Retention Policies | Up to maximum allowable days per Microsoft Office 365 application                                        | For guidance only. organisations are required to measure these against the business, application, regulatory and security requirements.                            |

{{% /alert %}}

#### Hybrid deployments

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point     | Design Decision                                                                                                                                            | Justification                                                                                                                                                                                                      |
|--------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Restoration tools  | Third party backup and restoration tools                                                                                                                   | Organisations should investigate third-party backup tools to backup and restore data on-premises and within the cloud.                                                                                                  |
| Items to Backup    | Exchange Online<br>SharePoint Online<br>Microsoft Teams<br>OneDrive for Business<br>Microsoft 365 groups<br>On-premises Exchange<br>On-premises SharePoint | Backups must cover the Microsoft suite of tools at a minimum.                                                                                                                                                      |
| Retention Policies | At discretion of organisation                                                                                                                              | Retention policies for the backups should be determined by the organisation and measured against the business, application, regulatory (including the organisation's records authority) and security requirements. |

{{% /alert %}}

### Data availability

Microsoft Azure services are available globally and provides geographical, regional, data centre, virtual infrastructure, and application resiliency. This enables the Microsoft Azure platform and Microsoft 365 to combat and minimise potential disasters such as customers loss of connectivity to data or loss of data.

The cloud-based services of Microsoft 365 replicate and store organisation's data in multiple data centres which are geographically dispersed to provide the greatest possible availability for organisational data. [Data resiliency in Microsoft 365](https://learn.microsoft.com/compliance/assurance/assurance-data-resiliency-overview) and [Exchange Online data resiliency in Microsoft 365](https://learn.microsoft.com/compliance/assurance/assurance-exchange-data-resiliency) provide further information. 

Data availability and resiliency of Microsoft 365 cloud service is in-built and managed by Microsoft.

### Related information

#### Security & Governance

* [Essential Eight - Regular Backups]({{<ref "security-and-governance/essential-eight/regular-backups.md">}})
* [System Management]({{<ref "system-management.md">}})

#### Design

* [Retention policies]({{<ref "design/shared-services/purview/retention-policies">}})

#### Configuration

* None identified

#### References

* [Protective Security Policy Framework](https://www.protectivesecurity.gov.au/sites/default/files/2019-11/pspf-infosec-10-safeguarding-information-cyber-threats.pdf) 
* [Essential Eight Maturity Model](https://www.cyber.gov.au/acsc/view-all-content/publications/essential-eight-maturity-model)
* [Protect and recover in cloud management](https://learn.microsoft.com/azure/cloud-adoption-framework/manage/considerations/protect)
* [Data resiliency in Microsoft 365](https://learn.microsoft.com/compliance/assurance/assurance-data-resiliency-overview)
* [Exchange Online data resiliency in Microsoft 365](https://learn.microsoft.com/compliance/assurance/assurance-exchange-data-resiliency)