---
title: "Data Security"
weight: 40
description: "This section describes the design decisions associated with managing data security for system(s) built using ASD's Blueprint for Secure Cloud." 
---

### Microsoft Purview eDiscovery

Microsoft Purview provides eDiscovery tools to search for content in Exchange Online, OneDrive for Business, SharePoint Online, Microsoft Teams, Microsoft 365 Groups, and Yammer teams.

eDiscovery can search mailboxes and sites in the same eDiscovery search, and export the search results. Organisations can use Microsoft Purview eDiscovery (Standard) cases to identify, hold, and export content found in mailboxes and sites, and  can further manage custodians and analyse content by using the extended Microsoft Purview eDiscovery (Premium) solution.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point               | Design Decision | Justification                         |
|------------------------------|-----------------|---------------------------------------|
| Microsoft Purview eDiscovery | Use             | Useful tools for eDiscovery use cases |

{{% /alert %}}

### Microsoft Purview Communication Compliance

Microsoft Purview Communication Compliance is an insider risk solution that helps organisations detect, capture, and act on inappropriate messages that can lead to potential data security or compliance incidents within the organisation. Communication compliance evaluates text and image-based messages in Microsoft and third-party apps (Teams, Yammer, Outlook, WhatsApp, etc.) for potential business policy violations including inappropriate sharing of sensitive information, threatening or harassing language as well as potential regulatory violations (such as stock and capital manipulations).

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point           | Design Decision | Justification                                                   |
|--------------------------|-----------------|-----------------------------------------------------------------|
| Communication Compliance | Use             | Provide additional monitoring over reported compliance breaches |

{{% /alert %}}

### Microsoft Purview Insider Risk Management

Microsoft Purview Insider Risk Management correlates various signals to identify potential malicious or inadvertent insider risks, such as theft of intellectual property, data leakage, and other security violations. Insider risk management enables customers to create policies to manage security and compliance. Built with privacy by design, user data undergoes pseudonymisation by default, and role-based access controls and audit logs are in place to help ensure user-level privacy.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point          | Design Decision | Justification                                                         |
|-------------------------|-----------------|-----------------------------------------------------------------------|
| Insider Risk Management | Configure       | Provides additional capability to identify potential data loss events |

{{% /alert %}}

{{% alert title="Note" color="info" %}}

The Blueprint recommends organisations follow the steps within [Microsoft's Purview insider risk management configuration guide](https://learn.microsoft.com/purview/insider-risk-management-configure) to configure Purview Insider Risk Management to meet the organisations risk appetite.

{{% /alert %}}

### Microsoft Purview Information Barriers

Microsoft 365 natively supports communication and collaboration across internal user groups and external organisations. It also provides the ability to restrict communication and collaboration between specified user groups as necessary through use of Information Barriers (IB) to avoid scenarios such as a conflict of interest.

Microsoft Purview Information Barriers is supported within Microsoft Teams, SharePoint Online, and OneDrive for Business. Exchange Online does not currently support Information Barriers. Communications and collaboration between selected groups are blocked or allowed through implementation of a Microsoft Purview Information Barriers policies.  

The Blueprint recommends organisations review the [Microsoft guidance on Information Barriers](https://learn.microsoft.com/purview/information-barriers-solution-overview) and assess the value of implementation in line with their risk appetite.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point       | Design Decision       | Justification                                                                                   |
|----------------------|-----------------------|-------------------------------------------------------------------------------------------------|
| Information Barriers | Organisation decision | Enables restriction of of two-way communications and collaboration to minimise data loss events |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* [Microsoft Purview]({{<ref "design/shared-services/purview">}})

#### Configuration

* None identified

#### References

* [Microsoft Purview Compliance Manager](https://learn.microsoft.com/microsoft-365/compliance/compliance-manager)
* [Learn about data loss prevention](https://learn.microsoft.com/microsoft-365/compliance/dlp-learn-about-dlp)
* [Learn about Endpoint data loss prevention](https://learn.microsoft.com/microsoft-365/compliance/endpoint-dlp-learn-about?view=o365-worldwide)
* [Microsoft Purview eDiscovery solutions](https://learn.microsoft.com/microsoft-365/compliance/ediscovery?view=o365-worldwide)
* [Microsoft Purview Communication Compliance](https://learn.microsoft.com/purview/communication-compliance)
* [Microsoft Purview Insider Risk Management](https://learn.microsoft.com/microsoft-365/compliance/insider-risk-management-solution-overview?view=o365-worldwide)
* [Microsoft Purview Information Barriers](https://learn.microsoft.com/microsoft-365/compliance/information-barriers-solution-overview?view=o365-worldwide)
