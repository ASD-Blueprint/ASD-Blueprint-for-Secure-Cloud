---
title: "Shared Mailboxes"
weight: 35
description: "This section describes the design decisions associated with Shared Mailboxes for system(s) built using ASD's Blueprint for Secure Cloud."
---

A Shared Mailbox is a mailbox which enables one or more users to read and send messages. Shared Mailboxes also enable sharing of a calendar between multiple users.

Within Microsoft 365, shared mailboxes do not require a licence to be assigned to them unless the mailbox has over 50GBs of data.

Unlike user mailboxes, these mailboxes are represented within Entra ID by a disabled user account. These accounts can be enabled however this poses a security risk as the mailbox account is not related to a single user.

User access to the mailbox is provided using mailbox delegation rights (Full Access, Send As, Send on Behalf). These rights can be assigned either directly or using a mail enabled security group.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                                                   | Design decision                                                                           | Justification                                                                                                                                                                                                   |
|------------------------------------------------------------------|-------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Shared mailbox delegation (Full Access, Send As, Send on Behalf) | Configured via mail-enabled Security groups which are hidden from the Global Address book | Mail-enabled security groups limit the management overhead associated with mailbox delegation when compared to direct delegations. A security group is required to be mail-enabled to appear within Office 365. |
| Naming standard for security groups                              | Configured                                                                                | To distinguish between security groups managing a shared mailbox an organisational naming standard should be followed.                                                                                        |
| Shared Mailbox user account                                      | Disabled                                                                                  | Default configuration. Accounts will remain disabled to reduce system attack surface.                                                                                                                           |

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