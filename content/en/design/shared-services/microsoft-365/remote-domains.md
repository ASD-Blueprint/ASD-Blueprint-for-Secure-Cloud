---
title: "Remote Domains"
weight: 30
description: "This section describes the design decisions associated with Remote Domains for system(s) built using ASD's Blueprint for Secure Cloud."
---

Remote Domains enable administrators to control the type of replies and format of messages users send to the destination domain.

Administrators can configure Exchange to allow (or block) the following:

* Out of Office messages
* Automatic replies and forwards
* Read or delivery receipts
* Non-delivery report to a specified domain

The default remote domain will apply the same settings to all messages; however, administrators can configure specific settings for specific domains.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point           | Design Decision               | Justification                                                       |
|--------------------------|-------------------------------|---------------------------------------------------------------------|
| Configure Remote Domains | Default configuration applied | The default configuration within Exchange Online will be leveraged. |

{{% /alert %}}

Remote Domain Configuration

| Policy Setting                  | Configuration                                                                                                               | Description                                                                      |
|---------------------------------|-----------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------|
| Name:                           | `Default`                                                                                                                   | Name of the remote domain setting                                                |
| Remote Domain                   | `*`                                                                                                                         | All external organisations                                                       |
| Out of Office Automatic Replies | Allow only external Out of Office replies: `Selected`                                                                       | Limits the type of client automatic replies.                                     |
| Automatic Replies               | Allow automatic replies: `Unchecked`<br>Allow automatic forwarding: `Unchecked`                                             | Limits automatic replies and automatic forwards.                                 |
| Message Reporting               | Allow Delivery Reports: `Ticked`<br>Allow Non-delivery Reports:`Ticked`<br>Allow Meeting Forward Notifications: `Unchecked` | Limits delivery reports, no-delivery reports, and meeting forward notifications. |
| Use rich text format            | Follow User Settings: `Selected`                                                                                            | Enables control over message format.                                          |
| Supported Character Set         | None                                                                                                                        | Enables control over the character set.                                       |

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* None identified

#### References

* None identified

#### Related design decisions

* None identified
