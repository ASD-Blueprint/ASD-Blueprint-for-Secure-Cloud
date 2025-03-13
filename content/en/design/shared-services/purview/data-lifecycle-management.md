---
title: "Data Lifecycle Management"
linkTitle: "Data Lifecycle Management"
weight: 60
description: "This section describes the design decisions associated with Data Lifecycle Management with Microsoft Purview for system(s) built using ASD's Blueprint for Secure Cloud."
---

Data Lifecycle Management provides the capability to retain and delete information hosted within Microsoft 365 services. The retention and deletion of information is often considered in the context of managing compliance with organisational regulatory requirements. However, consideration should also be given to the protection of information, the risks associated with access to information, and the implications of managing sprawling data over time.

Data Lifecycle Management enables the control of retention and deletion actions by using policies that apply at the container level (for example, a SharePoint Online site or a user mailbox) and at the item level (for example, a document within the SharePoint Online library or an email within the user mailbox).

Using both retention policies and labels effectively requires knowledge of at least an organisation's information classification scheme, information management strategy and information architecture. Organisations should use the [retention policy]({{<ref "configuration/purview/data-lifecycle-management/retention-policies">}}) configurations as a starting point to develop their own, organisational specific policies.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                      | Design Decision                          | Justification                                                                     |
| ----------------------------------- | ---------------------------------------- | --------------------------------------------------------------------------------- |
| Data Lifecycle Management retention | Configure placeholder retention policies | Enable the development of organisational specific retention and deletion policies |

{{% /alert %}}

### Related information

#### Security & Governance

* [Regular Backups]({{<ref "security-and-governance/essential-eight/regular-backups">}})

#### Design

* None identified

#### Configuration

* [Data Lifecycle Management]({{<ref "configuration/purview/data-lifecycle-management">}})
* [Retention policies]({{<ref "configuration/purview/data-lifecycle-management/retention-policies">}})

#### References

* [Govern your data with Microsoft Purview](https://learn.microsoft.com/en-au/purview/manage-data-governance)
* [Information management legislation](https://www.naa.gov.au/information-management/information-management-legislation)
* [Learn about data lifecycle management](https://learn.microsoft.com/en-us/purview/data-lifecycle-management)
* [Learn about retention policies and retention labels](https://learn.microsoft.com/en-us/purview/retention?tabs=table-overriden)
