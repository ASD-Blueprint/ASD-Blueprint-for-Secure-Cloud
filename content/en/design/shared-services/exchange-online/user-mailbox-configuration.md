---
title: "User Mailbox Configuration"
weight: 35
description: "This section describes the design decisions associated with User Mailbox Configuration for system(s) built using ASD's Blueprint for Secure Cloud."
---

User Mailboxes are Exchange Mailboxes that are associated with a user account. Usually one mailbox is associated to one user account.

User mailboxes can be configured to:

* Allow or deny Internet Message Access Protocol (IMAP) and Post Office Protocol (POP) connections
* Prevent deletion of mail
* Control ActiveSync connections
* Control mail size limits
* Control use of mail archives

The above configurations can be completed on all new mailboxes using a Client Access Services (CAS) Mailbox Plan. A CAS Mailbox Plan is used to configure settings when a licence is assigned to a new user. If the licence is changed, the CAS Mailbox plan linked to that new licence is applied. CAS Mailbox plans will be inherited from the existing organisational plans.

In addition to the above mailbox configuration, by default, standard user accounts have access to Exchange Online via Exchange Online PowerShell. ASD guidance to disable unneeded features requires that this feature be disabled.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                 | Design Decision                                | Justification                                                                                                                                                                                                                  |
|--------------------------------|------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Disable IMAP                   | Configured                                     | IMAP will be disabled to meet ASD guidance to disable unneeded features.                                                                                                                                                      |
| Disable POP                    | Configured                                     | POP will be disabled to meet ASD guidance to disable unneeded features.                                                                                                                                                       |
| Exchange Mailbox Size          | 100GB per user                                 | Included with Office 365 E3 / E5 licensing.                                                                                                                                                                                    |
| Language                       | English                                        | The default language is English, users will have the ability to adjust this if required.                                                                                                                                       |
| Default time zone              | GMT +10                                        | The default time zone is GMT +10 however this will be adjusted based on user location.                                                                                                                                         |
| Exchange Message Size Limits   | Up to 90MB                                     | Default setting. Note that message limits may be smaller when sending messages to external mail recipients (can be as low as 10MB).                                                                                            |
| Custom Primary SMTP Addressing | first.last@organisation.gov.au | Usernames are recommended to follow the Universal Principal Name (UPN) format of the user.<br>The primary SMTP address will be changed from `first.last@<tenantname>.onmicrosoft.com` to ensure email continues to function in the same manner |
| Exchange Online PowerShell     | Disabled for standard users                    | Standard users have no need to access Exchange Online via Powershell                                                                                                                                                           |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* None identified