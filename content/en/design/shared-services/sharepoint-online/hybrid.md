---
title: "Hybrid"
weight: 50
description: "This section describes the design decisions associated with SharePoint Hybrid for system(s) built using ASD's Blueprint for Secure Cloud."
---

In a hybrid configuration SharePoint Online integrates with an existing on-premises SharePoint environment, extending the functionality and access between the two environments. Enhanced search results and site redirection provides administrators the control on which location a user access information. SharePoint hybrid offers the following options for a hybrid configuration:

* **Hybrid Federated Search** – In a Federated Search configuration, the index for documents remains in the same system as the data. A SharePoint server can display results from SharePoint Online by making a remote SharePoint query, and users can also search SharePoint on-premises directly from SharePoint Online.
* **Hybrid Cloud Search** – In Cloud Search, the index of the SharePoint Server is pushed and merged with the SharePoint Online index. All the Content Processing and Analytics are done in Office 365, where the index is stored.
* **Hybrid Site following** – Hybrid site following can be configured to send users from the on-premises SharePoint Server to the equivalent service in Office 365.

{{% alert title="Design decisions" color="warning" %}}

| Decision point    | Design decision                              | Justification                                                                         |
|-------------------|----------------------------------------------|---------------------------------------------------------------------------------------|
| SharePoint Hybrid | SharePoint Hybrid Search will be configured. | To enable hybrid searching capabilities between SharePoint on-premises and SharePoint Online. |

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