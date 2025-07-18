---
title: "Mailbox Auditing"
weight: 35
description: "This section describes the design decisions associated with Exchange Online for system(s) built using ASD's Blueprint for Secure Cloud."
---

Mailbox Auditing provides visibility into the access and modification of user mailboxes by owners, delegates, and administrators.
Once enabled on a user's mailbox, activities subject to audit appear within the Office 365 audit log. This information is then available for security teams to analyse. It is recommended that this audit log be exported to a centralised logging service.

Once enabled on a user's mailbox, the activities subject to audit appear within the Office 365 audit log. This information is then available for security to review and run analysis. It is recommended that this audit log be exported to a centralised logging service. The Microsoft Purview Audit (Premium) service requires the "Microsoft 365 Advanced Auditing" license allocated to each user in the tenant.

Security Operations teams may have a requirement that all Exchange Online (EXO) mailboxes be audited and additionally have the ability to capture, store and audit all emails sent internally within the environment and additionally in and out of the organisations email environment.

{{% alert title="Design decisions" color="warning" %}}

| Decision point               | Design decision | Justification                                                                                                                                                                                                                                                                                                                                                                    |
|------------------------------|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Mailbox Auditing             | Configured      | An event log auditing process, and supporting event log auditing procedures, is developed and implemented covering the scope and schedule of audits, what constitutes a violation of security policy, and actions to be taken when violations are detected, including reporting requirements.                                                                                    |
| Centralised Logging Facility | Not Configured  | organisations should consider their operational and security requirements around the use of a SIEM separately to the implementation of the Blueprint.<br>The Blueprint implements Microsoft PurviewThis design will implement Office ATP and Defender ATP which audit most Office and Defender logs for up to two years. These technologies send alert emails to Global Administrators and selected Office 365 administrators. |

{{% /alert %}}

### Cloud native deployments

Within cloud native deployments, the option to capture all emails for Security Operations is limited as Exchange Online mailboxes cannot be used as a journaling mailbox. To meet possible organisation security team requirements, an alternative option is use of Exchange Online Transport Rules and a shared Exchange Online mailbox. The Transport Rules will copy all internal, inbound, and outbound emails to the shared mailbox, which is restricted to members of an Entra ID Security Group.

### Hybrid deployments

Journaling within hybrid deployments is accomplished using Exchange Journaling. See [Journaling]({{<ref "/design/shared-services/exchange-online/journaling.md">}})	

### Mailbox Auditing configuration

| Configuration                                           | Value                                                                                                                                                                                                                                               | Description                                                                                                            |
|---------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------|
| **User Mailbox and Shared Mailbox Audit Configuration** |                                                                                                                                                                                                                                                     |                                                                                                                        |
| Admin Audited Actions                                   | ApplyRecord<br>Copy<br>Create<br>FolderBind<br>HardDelete<br>MessageBind<br>Move<br>MoveToDeletedItems<br>RecordDelete<br>SendAs<br>SendOnBehalf<br>SoftDelete<br>Update<br>UpdateCalendarDelegation<br>UpdateFolderPermissions<br>UpdateInboxRules | All available audit actions will be selected in order to provide the required visibility of changes made to a mailbox. |
| Delegate Audited Actions                                | ApplyRecord<br>Create<br>FolderBind<br>HardDelete<br>Move<br>MoveToDeletedItems<br>RecordDelete<br>SendAs<br>SendOnBehalf<br>SoftDelete<br>Update<br>UpdateFolderPermissions<br>UpdateInboxRules                                                    | All available audit actions will be selected in order to provide the required visibility of changes made to a mailbox. |
| Owner Audited Actions                                   | ApplyRecord<br>Create<br>HardDelete<br>MailboxLogin<br>Move<br>MoveToDeletedItems<br>RecordDelete<br>SoftDelete<br>Update<br>UpdateCalendarDelegation<br>UpdateFolderPermissions<br>UpdateInboxRules                                                | All available audit actions will be selected in order to provide the required visibility of changes made to a mailbox. |
| **Office 365 Group Mailbox Audit Configuration**        |                                                                                                                                                                                                                                                     |                                                                                                                        |
| Admin Audited Actions                                   | Create<br>HardDelete<br>MoveToDeletedItems<br>SendAs<br>SendOnBehalf<br>SoftDelete<br>Update                                                                                                                                                        | All available audit actions will be selected in order to provide the required visibility of changes made to a mailbox. |
| Delegate Audited Actions                                | Create<br>HardDelete<br>MoveToDeletedItems<br>SendAs<br>SendOnBehalf<br>SoftDelete<br>Update                                                                                                                                                        | All available audit actions will be selected in order to provide the required visibility of changes made to a mailbox. |
| Owner Audited Actions                                   | HardDelete<br>MoveToDeletedItems<br>SoftDelete<br>Update                                                                                                                                                                                            | All available audit actions will be selected in order to provide the required visibility of changes made to a mailbox. |

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* None identified

#### References

* None identified
