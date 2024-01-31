---
title: "Content Filtering"
weight: 60
description: "This section describes the design decisions associated with Content Filtering Microsoft 365 security features for system(s) built using ASD's Blueprint for Secure Cloud."
---

Content Filtering within Exchange Online Protection refers to SPAM management and SPAM policies.

Content Filtering polices enable:

* The customisation of response on SPAM detection
* Marking emails as SPAM based on language detected
* Marking emails as SPAM based on the sender or sender's domain
* Increasing the SPAM score if certain content is present in the email
* Marking emails as SPAM if certain content is present in the email

The use of these policies enables greater management control over SPAM emails.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point        | Design Decision       | Justification                                             |
|-----------------------|-----------------------|-----------------------------------------------------------|
| Configure SPAM policy | Default configuration | Exchange Online Protection will complete SPAM evaluation. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* [Anti-spam protection in EOP](https://docs.microsoft.com/microsoft-365/security/office-365-security/anti-spam-protection?view=o365-worldwide)