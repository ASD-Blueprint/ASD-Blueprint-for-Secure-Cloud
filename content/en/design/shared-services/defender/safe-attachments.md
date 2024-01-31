---
title: "Safe Attachments"
weight: 60
description: "This section describes the design decisions associated with Safe Attachments Microsoft 365 security features for system(s) built using ASD's Blueprint for Secure Cloud."
---

The Safe Attachments feature checks email attachments after the email is received but before it is delivered to the user mailbox.

When an Safe Attachments policy is in place and an end-user who is covered by that policy views their email in Office 365, their email attachments are checked, and appropriate actions are taken, based on the configured policies. 

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                                                                                           | Design Decision          | Justification                                                                                                                                                                                                                |
|----------------------------------------------------------------------------------------------------------|--------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Microsoft Defender for Office 365 Safe Attachments                                                       | Configured               | Configured to align with ASD's Malicious Email Mitigation Strategies and Microsoft guidance                                                                                                                                 |
| Protect files in SharePoint, OneDrive, and Microsoft Teams                                               | Ticked                   | If a file in any SharePoint, OneDrive, or Microsoft Teams library is identified as malicious, Microsoft Defender for Endpoints will prevent users from opening and downloading the file.                                     |
| Turn on Safe Documents for Office clients                                                                | Ticked                   | Before a user is allowed to trust a file opened in Office 365 ProPlus, the file will be verified by Microsoft Defender for Endpoints.                                                                                        |
| Warning                                                                                                  | Dynamic Delivery         | Dynamic Delivery ensures attachments are scanned and detected malware is quarantined. It also includes attachment previewing capabilities for most PDFs and Office files during scanning.                                    |
| Redirect attachment on detection. Send the blocked, monitored or replaced attachment to an email address | Enable Redirect - Ticked | This will send blocked or replaced email messages with an attachment that is identified as malicious to a selected email address.                                                                                            |
| Apply the above selection of malware scanning for attachments if a time out or error occurs                  | Ticked                   | Will redirect an end-user's email messages to a selected email address even if a time out or error occurs when malware scanning an attachment. This enables recovery of legitimate emails and malware to be investigated. |
| Applied to                                                                                               | Configured               | All organisation domains (e.g. <organisation>.gov.au)                                                                                                                                                                        |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* None identified
* [Malicious Email Mitigation Strategies](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/email-hardening/malicious-email-mitigation-strategies)
* [Turn on Safe Attachments for SharePoint, OneDrive, and Microsoft Teams](https://docs.microsoft.com/microsoft-365/security/office-365-security/turn-on-mdo-for-spo-odb-and-teams?view=o365-worldwide)