---
title: "Viva Learning"
weight: 60
description: "This section describes the design decisions associated with the Blueprint for Secure Cloud Platform, Endpoints and Shared Services for system(s) built using ASD's Blueprint for Secure Cloud."
---

Viva Learning is a Microsoft Teams app which aims to assist users to find and access training from multiple content providers. Viva Learning content can be enabled from LinkedIn Learning, Microsoft Learn, and Microsoft 365 Training. Administrators can also configure a SharePoint site to host addition content, which can be done without enabling content from other providers.

Note, Viva Learning content is subject to terms other than the Microsoft Product Terms, including third-party content provider’s terms, which have not been reviewed as part of the Office 365 IRAP assessment. It is recommended that organisations review these terms as part of any risk assessment relating to the use of this content.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point         | Design Decision | Justification                                                                                                                                                               |
|------------------------|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Diagnostic data        | Disabled        | Prevent data from being provided to Microsoft for diagnostic and product improvements.                                                                                      |
| LinkedIn Learning      | Disabled        | LinkedIn Learning content is subject to third-party content provider’s terms that have not been reviewed as part of the Office 365 IRAP assessment.                         |
| Microsoft Learn        | Disabled        | Microsoft Learn content is subject to terms other than the Microsoft Product Terms and have not been reviewed as part of the Office 365 IRAP assessment.                    |
| Microsoft 365 Training | Disabled        | Microsoft 365 Training content is subject to terms other than the Microsoft Product Terms and have not been reviewed as part of the Office 365 IRAP assessment.             |
| SharePoint             | Disabled        | The Blueprint does not provide training content. organisations with existing content may enable a SharePoint site to host Viva Learning content, subject to internal assessment. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* [Services]({{<ref "configuration/microsoft-365/settings/services">}})

#### References

* None identified