---
title: "Connection Filtering"
weight: 60
description: "This section describes the design decisions associated with Connection Filtering Microsoft 365 security features for system(s) built using ASD's Blueprint for Secure Cloud."
---

Connection filtering within Exchange Online Protection refers to the verification of the sender using SPF, DKIM, DMARC and Microsoft intelligence.

Exchange Online Protection Connection Filtering is always enabled however it can, to a degree, be configured. A connection filter can be implemented to always allow or always block traffic based upon an IP list.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                | Design Decision | Justification                                                                                                      |
|-------------------------------|-----------------|--------------------------------------------------------------------------------------------------------------------|
| Configure Connection Filter   | Configured      | organisations are to provide IP addresses considered as safe.                                                           |
| Connection filter policy name | Default         | This policy is the default policy configured when Exchange Online is enabled and is consistent with best practice. |
| Scoped to                     | All Domains     | This is the default setting configured when Exchange Online is enabled.                                            |
| IP Allow list                 | Not Configured  | This is the default setting configured when Exchange Online is enabled.                                            |
| IP Block list                 | Not Configured  | This is the default setting configured when Exchange Online is enabled.                                            |
| Safe list                     | Disabled        | This is the default setting configured when Exchange Online is enabled.                                            |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* None identified

#### Configuration

* None identified

#### References

* [Configure connection filtering](https://docs.microsoft.com/microsoft-365/security/office-365-security/configure-the-connection-filter-policy?view=o365-worldwide)