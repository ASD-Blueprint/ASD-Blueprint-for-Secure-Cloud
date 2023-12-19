---
title: "Policy Filtering"
weight: 60
description: "This section describes the design decisions associated with Policy Filtering Microsoft 365 security features for system(s) built using ASD's Blueprint for Secure Cloud."
---

Policy filtering within Office 365 Exchange Online Protection refers to the enforcement of Transport Rules.

Transport Rules are a set of rules enforced on mail transiting through the Exchange Organisation. Transport rules can be leveraged by Administrators to complete a number of actions on all mail or a subsection of the mail transiting through the Exchange Organisation. These items include:

* Block mail with certain headers
* Apply disclaimers to emails
* Apply Office 365 message encryption

Transport Rules follow the following basic structure:

* **Conditions** – Conditions identify which mail the transport rule applies to. These conditions largely target either information gained from message headers (e.g. the 'to', 'from' or 'CC' fields) or message properties (e.g., size, attachments, subject, body, message classification). A single rule can have multiple conditions apply
* **Exceptions** – Exceptions are an optional component of a Transport Rule and define the mail exempt from the rule
* **Actions** – Actions are used to define what actions to undertake on the messages matching the conditions and which do not match any exemption. These actions include rejecting, deleting, redirecting the emails, and adding recipients, prefixes, and disclaimers. A single rule can have multiple actions applied however some actions are incompatible with others
* **Properties** – Properties are used to define anything which do not fall into another category. This includes enforcing or testing the rule

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point  | Design Decision | Justification                                                                              |
|-----------------|-----------------|--------------------------------------------------------------------------------------------|
| Mail flow rules | Configured      | Mail flow rules within the environment are required to enforce business rules and process. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* [Mail flow rules (transport rules) in Exchange Online](https://docs.microsoft.com/exchange/security-and-compliance/mail-flow-rules/mail-flow-rules?view=o365-worldwide)