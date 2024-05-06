---
title: "Data Security"
weight: 40
description: "This section describes the design decisions associated with managing data security for system(s) built using ASD's Blueprint for Secure Cloud." 
---

### Microsoft Purview Compliance Manager

Microsoft Purview Compliance Manager is a solution in the Microsoft Purview compliance portal that helps organisations automatically assess and manage compliance across an environment. Compliance Manager can help identify and monitor protection risks, manage complexities associated with controls implementation, remain current with relevant regulations and certifications, and provide reporting capabilities to stakeholders.
 
Compliance Manager provides a Compliance score based on the Microsoft 365 data protection baseline. This baseline is a set of controls that includes key regulations and standards for data protection and general data governance.
 
Compliance Manager includes assessments which help organisations implement data protection controls specified by compliance, security, privacy and data protection standards, regulations, and laws. Assessments include actions that have been taken by Microsoft to protect organisational data, and they're completed when taking action to implement the controls included in the assessment.  Microsoft E5 licensing includes the capability to utilise up to 3 regulation licenses (additional assessments can be purchased from Microsoft). Those of relevance within the Blueprint include ASD Essential 8, ASD Essential 8 Maturity Level 1, ASD Essential 8 Maturity Level 2, ASD Essential 8 Maturity Level 3, ASD Essential 8 Maturity Level 3 for Microsoft 365, Australia Privacy Act, Australia Public Record Act, and Infosec Registered Assessors Program (IRAP).

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point   | Design Decision | Justification                                |
|------------------|-----------------|----------------------------------------------|
| Compliance Score | > 60%           | Continual monitoring and improvement program |
| Assessments      | Use             | Assists in internal and external auditing    |

{{% /alert %}}

### Microsoft Purview Data Loss Prevention

In Microsoft Purview, organisations implement data loss prevention (DLP) by defining and applying DLP policies. DLP policies enable organisations to identify, monitor, and automatically protect sensitive items across:

* Microsoft 365 services such as Teams, Exchange, SharePoint, and OneDrive accounts
* Office applications such as Word, Excel, and PowerPoint
* Windows 10, Windows 11 and macOS (three latest released versions) endpoints
* Non-Microsoft cloud apps
* On-premises file shares and on-premises SharePoint
* Power BI

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                         | Design Decision                                                                                    | Justification                     |
|----------------------------------------|----------------------------------------------------------------------------------------------------|-----------------------------------|
| Microsoft Purview Data Loss Prevention | Implement policies across Microsoft 365 services, Office applications, Windows 10/11, and Power BI | Provides additional data security |

{{% /alert %}}

{{% alert title="Note" color="info" %}}

For Data Loss Prevention policies associated with Microsoft 365 and Office applications see Data Loss Prevention within the [Microsoft 365 Security]({{<ref "design/shared-services/purview/data-loss-prevention">}}) section.

{{% /alert %}}

### Microsoft Purview Endpoint data loss prevention

Endpoint data loss prevention extends the activity monitoring and protection capabilities of DLP to sensitive items that are physically stored on Windows 10, Windows 11, and macOS devices. Once devices are onboarded into Microsoft Purview solutions, the information about user actions with sensitive items is made visible in Activity Explorer. Organisations can enforce protective actions on those items via DLP policies.

Microsoft provides a full list of [endpoint activities that can be monitored and actioned](https://learn.microsoft.com/purview/endpoint-dlp-learn-about#endpoint-activities-you-can-monitor-and-take-action-on). 

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                                  | Design Decision                                                    | Justification                                 |
|-------------------------------------------------|--------------------------------------------------------------------|-----------------------------------------------|
| Microsoft Purview Endpoint Data Loss Prevention | Investigate implementing basic policies specific to Windows 10/11. | Provide additional data security to endpoints |

{{% /alert %}}

{{% alert title="Note" color="info" %}}

The Blueprint recommends organisations evaluate the capabilities which Endpoint data loss prevention provides and select those that fit within the organisations risk appetite.

{{% /alert %}}

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

* [Data Loss Prevention]({{<ref "design/shared-services/purview/data-loss-prevention">}})

#### Configuration

* [Device Management]({{<ref "configuration/defender/settings/endpoints/device-management.md">}})
* [Rules]({{<ref "configuration/defender/settings/endpoints/rules.md">}})

#### References

* [Microsoft Purview Compliance Manager](https://learn.microsoft.com/microsoft-365/compliance/compliance-manager)
* [Learn about data loss prevention](https://learn.microsoft.com/microsoft-365/compliance/dlp-learn-about-dlp)
* [Learn about Endpoint data loss prevention](https://learn.microsoft.com/microsoft-365/compliance/endpoint-dlp-learn-about?view=o365-worldwide)
* [Microsoft Purview eDiscovery solutions](https://learn.microsoft.com/microsoft-365/compliance/ediscovery?view=o365-worldwide)
* [Microsoft Purview Communication Compliance](https://learn.microsoft.com/purview/communication-compliance)
* [Microsoft Purview Insider Risk Management](https://learn.microsoft.com/microsoft-365/compliance/insider-risk-management-solution-overview?view=o365-worldwide)
* [Microsoft Purview Information Barriers](https://learn.microsoft.com/microsoft-365/compliance/information-barriers-solution-overview?view=o365-worldwide)