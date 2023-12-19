---
title: "Journaling"
weight: 35
description: "This section describes the design decisions associated with Journaling for system(s) built using ASD's Blueprint for Secure Cloud."
---

Journaling within Exchange is the recording of email communications as part of an organisation's retention strategy.

Journaling can assist with achieving compliance with government regulations. A Journal rule can be scoped to:

* Internal messages only
* External messages only
* All messages
* Specific recipients

Microsoft 365 supports the use of journaling with the caveat that an Exchange Online mailbox cannot be used as a journaling mailbox. When configuring a mailbox for journaling, it must reside on an Exchange server. Journal reports can be delivered to a separate system from the Exchange Online instance. 

Within Microsoft 365, additional options are available to be leveraged in an organisation's retention strategy. These include:

* Retention Policies
* Litigation hold

Retention Policies can also be leveraged across the Office 365 organisation, whereas litigation hold is configured on a per-mailbox basis. These options reduce the complexity and management overhead involved with recording email and backing up to separate systems.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point       | Design Decision | Justification                                                                                                                                                                                                   |
|----------------------|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Configure Journaling | Not Configured  | In place of Journaling, Litigation hold and retention policies in conjunction with eDiscovery will be leveraged by the organisation to meet investigation requirements, unless required by Security Operations. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* None identified