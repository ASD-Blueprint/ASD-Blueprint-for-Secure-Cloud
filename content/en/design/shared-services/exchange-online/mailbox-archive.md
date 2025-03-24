---
title: "Mailbox Archive"
weight: 35
description: "This section describes the design decisions associated with Exchange Online for system(s) built using ASD's Blueprint for Secure Cloud."
---

Office 365 Mailbox Archives provide an unlimited email storage space for users. A mailbox archive is an additional mailbox storage space. This archive can be accessed through the Outlook on the Web or the Outlook client. Users can move or copy mail between their primary and archive mailboxes. Administrators can enable archive and deletion policies. These policies automatically move mail to the archive and, if required, delete mail from the archive when the set criteria are met. Mailbox archives are also subject to retention policies.

{{% alert title="Design decisions" color="warning" %}}

| Decision point         | Design decision | Justification                                                                                                                     |
|------------------------|-----------------|-----------------------------------------------------------------------------------------------------------------------------------|
| Mailbox Archive        | Enabled         | The archive mailbox is required to control primary mailbox cache sizes.                                                           |
| Mailbox Archive Policy | Enabled         | The use of automated archive mailbox policies improves the user experience and ensures that primary mailbox sizes are controlled. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* None identified

#### References

* None identified