---
title: "Litigation Hold"
weight: 35
description: "This section describes the design decisions associated with Exchange Online for system(s) built using ASD's Blueprint for Secure Cloud."
---

Litigation hold preserves a mailbox and its contents from being modified or removed for eDiscovery purposes. A user can continue to send and receive email whilst litigation hold is enabled, even delete an item from the mailbox, and Office 365 will retain the items for discovery purposes.

Litigation hold is not enabled by default, and legal teams will need to proactively enable the feature to avoid users potentially deleting any critical data elements. The duration for the hold can also be specified. This is calculated from the date a mailbox item is received or created. If a duration is not set, items are held indefinitely or until the hold is removed.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point  | Design Decision                          | Justification                                                    |
|-----------------|------------------------------------------|------------------------------------------------------------------|
| Litigation hold | Configured as required on selected users | Litigation hold requirements are unique to each organisation and user. |

{{% /alert %}}

{{% alert title="Note" color="info" %}}

Litigation hold is not an alternative to backups. While it is true that it keeps a copy of specified data elements it is not saved in a separate location and cannot be restored to its original location.

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