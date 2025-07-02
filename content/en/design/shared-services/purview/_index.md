---
Title: "Microsoft Purview"
linkTitle: "Microsoft Purview"
weight: 20
description: "The set of solutions to assist organisations with governing, protecting, and managing data for system(s) built using ASD's Blueprint for Secure Cloud."
---

Microsoft Purview encompasses a number of solutions which can be used to protect organisational data. The following solutions are used to assist in meeting the requirements outlined in the *Protective Security Policy Framework* (PSPF), ASD's *Information Security Manual* (ISM), and other related standards and regulations:

* **Information Protection** assists the discovery, classification and protection of information
* **Data Loss Prevention** prevents the unauthorised use and sharing of information
* **Compliance Manager** automatically assess and manage information compliance against known standards
* **Data Lifecycle Management** retains and deletes information
* **Auditing** captures, records and retains user and administrative operations

While the Purview solutions outlined above integrate with several end-user applications and services, the design guidance is largely focussed on email communications. This approach has been taken due to the detailed email marking requirements outlined in the PSPF and the complexity associated with using Purview to detect implicit sensitive and security classified information.

Purview has many specific requirements depending on which applications, services and document types are used across an organisation. Organisations must assess Microsoft's [minimum versions for sensitivity labels in Office apps](https://learn.microsoft.com/en-au/purview/sensitivity-labels-versions) documentation and the Purview deployment guides in conjunction with this design and configuration guidance to ensure suitable implementation. [Known issues with sensitivity labels in Office apps](https://support.microsoft.com/en-au/office/known-issues-with-sensitivity-labels-in-office-b169d687-2bbd-4e21-a440-7da1b2743edc) are also tracked and should be checked prior to implementation.

### Related information

#### Security & Governance

* [System management]({{<ref "security-and-governance/system-security-plan/system-management">}})

#### Design

* None identified

#### Configuration

* [Audit]({{<ref "configuration/purview/audit">}})
* [Compliance Manager]({{<ref "configuration/purview/compliance-manager">}})
* [Data Lifecycle Management]({{<ref "configuration/purview/data-lifecycle-management">}})
* [Data Loss Prevention]({{<ref "configuration/purview/data-loss-prevention">}})
* [Information Protection]({{<ref "configuration/purview/information-protection">}})

#### References

* [Govern your data with Microsoft Purview](https://learn.microsoft.com/en-au/purview/manage-data-governance)
* [Known issues with sensitivity labels in Office](https://support.microsoft.com/en-au/office/known-issues-with-sensitivity-labels-in-office-b169d687-2bbd-4e21-a440-7da1b2743edc) 
* [Learn about auditing solutions in Microsoft Purview](https://learn.microsoft.com/en-au/purview/audit-solutions-overview)
* [Learn about data loss prevention](https://learn.microsoft.com/en-au/purview/dlp-learn-about-dlp)
* [Microsoft Purview Compliance Manager](https://learn.microsoft.com/en-au/purview/compliance-manager)
* [Microsoft Purview Information Protection Guide for Australian Government compliance with PSPF](https://learn.microsoft.com/en-au/compliance/anz/pspf-overview)
* [Minimum versions for sensitivity labels in Office apps](https://learn.microsoft.com/en-au/purview/sensitivity-labels-versions)
* [Protect your sensitive data with Microsoft Purview](https://learn.microsoft.com/en-au/purview/information-protection)
