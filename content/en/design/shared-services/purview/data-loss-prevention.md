---
title: "Data Loss Prevention"
weight: 60
description: "This section describes the design decisions associated with Data Loss Prevention Microsoft 365 security features for system(s) built using ASD's Blueprint for Secure Cloud."
---

Data Loss Prevention (DLP) policies enable organisations to identify, monitor, and automatically protect sensitive information across Office 365 and endpoint devices. DLP policies can be targeted to one or more products within the Office 365 suite.

A DLP policy can be configured to:

* Identify sensitive information (Sensitive information types), documents in a specific site (for SharePoint only) or specific labels (sensitivity labels) contained in Exchange Online, SharePoint Online, locally on devices (endpoint DLP), and OneDrive for Business.
* Prevent end-users from accidentally sharing sensitive information.
* Prevent end-users from accidentally deleting a document.
* Update documents or emails based on sensitivity labels or data matching, used in conjunction with auto-labelling feature can assist with PSPF compliance
* Educate end-users by presenting messages them on how to stay compliant when relevant. This is done without interrupting their workflow.

Office 365 has over 200 prebuilt sensitive information types (Australian Passport Numbers etc.). In addition to the prebuilt sensitive information types custom types can be created. These custom types look for strings, patterns, or key words.

Note, endpoint DLP requires onboarding of those devices into Microsoft Defender for Endpoint. organisations should consider the use of Endpoint DLP as part of a unified DLP strategy.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                | Design Decision | Justification                                                                                                                                       |
|-------------------------------|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| Data Lost Prevention Policies | Configured      | To provide insights into the movement of potentially sensitive information, and for PSPF compliance (x-protected header and subject field marking). |

{{% /alert %}}

Data Loss Prevention Configuration applicable to all organisations and implementation types.

| Configuration                                                       | Value                                                                                                                                                                                                                         | Description                                                                                                             |
|---------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------|
| **Name: Australian Privacy Act**                                    |                                                                                                                                                                                                                               |                                                                                                                         |
| Locations                                                           | Protect content in Exchange email, Teams chats, channel messages, OneDrive and SharePoint documents.                                                                                                                          | The locations where the policy will apply.                                                                              |
| Content type                                                        | Australia Driver's Licence number<br>Australia Passport number                                                                                                                                                              | The types of sensitive information being detected.                                                                      |
| Sharing detection                                                   | With people outside my organisation                                                                                                                                                                                           | When the policy is applied.                                                                                             |
| Notify users                                                        | Enabled                                                                                                                                                                                                                       | Users are notified when the policy is triggered. They are also provided policy tips for managing sensitive information. |
| Amount of instances                                                 | 5                                                                                                                                                                                                                             | The amount of sensitive information required to trigger the policy (10 is the default).                                 |
| Send incident reports                                               | Enabled                                                                                                                                                                                                                       | User and nominated administrator are notified when the policy is triggered.                                             |
| Restrict access or encrypt the content                              | Disabled                                                                                                                                                                                                                      | Access to the content that triggers the policy can be encrypted or and access limited.                                  |
| **Name: Australian Personally Identifiable Information (PII) data** |                                                                                                                                                                                                                               |                                                                                                                         |
| Locations                                                           | Protect content in Exchange email, Teams chats, channel messages, OneDrive and SharePoint documents.                                                                                                                          | The locations where the policy will apply.                                                                              |
| Content type                                                        | Australia Tax File Number <br>Australia Driver's Licence Number                                                                                                                                                               | The types of sensitive information being detected.                                                                      |
| Sharing detection                                                   | With people outside my organisation                                                                                                                                                                                           | When the policy is applied.                                                                                             |
| Notify users                                                        | Enabled                                                                                                                                                                                                                       | Users are notified when the policy is triggered. They are also provided policy tips for managing sensitive information. |
| Amount of instances                                                 | 5                                                                                                                                                                                                                             | The amount of sensitive information required to trigger the policy (10 is the default).                                 |
| Send incident reports                                               | Enabled                                                                                                                                                                                                                       | User and nominated administrator are notified when the policy is triggered.                                             |
| Restrict access or encrypt the content                              | Disabled                                                                                                                                                                                                                      | Access to the content that triggers the policy can be encrypted or and access limited.                                  |
| **Name: Australian Health Records Act (HRIP Act)**                  |                                                                                                                                                                                                                               |                                                                                                                         |
| Locations                                                           | Protect content in Exchange email, Teams chats, channel messages, OneDrive and SharePoint documents.                                                                                                                          | The locations where the policy will apply.                                                                              |
| Content type                                                        | Australia Tax File Number <br>Australia Medical Account Number                                                                                                                                                                | The types of sensitive information being detected.                                                                      |
| Sharing detection                                                   | With people outside my organisation                                                                                                                                                                                           | When the policy is applied.                                                                                             |
| Notify users                                                        | Enabled                                                                                                                                                                                                                       | Users are notified when the policy is triggered. They are also provided policy tips for managing sensitive information. |
| Amount of instances                                                 | 5                                                                                                                                                                                                                             | The amount of sensitive information required to trigger the policy (10 is the default).                                 |
| Send incident reports                                               | Enabled                                                                                                                                                                                                                       | User and nominated administrator are notified when the policy is triggered.                                             |
| Restrict access or encrypt the content                              | Disabled                                                                                                                                                                                                                      | Access to the content that triggers the policy can be encrypted or and access limited.                                  |
| **Name: Australian Financial Data**                                 |                                                                                                                                                                                                                               |                                                                                                                         |
| Locations                                                           | Protect content in Exchange email, Teams chats, channel messages, OneDrive and SharePoint documents.                                                                                                                          | The locations where the policy will apply.                                                                              |
| Content type                                                        | SWIFT Code <br>Australia Tax File Number <br>Australia Bank Account Number <br>Credit Card Number                                                                                                                             | The types of sensitive information being detected.                                                                      |
| Sharing detection                                                   | With people outside my organisation                                                                                                                                                                                           | When the policy is applied.                                                                                             |
| Notify users                                                        | Enabled                                                                                                                                                                                                                       | Users are notified when the policy is triggered. They are also provided policy tips for managing sensitive information. |
| Number of instances                                                 | 10                                                                                                                                                                                                                            | The amount of sensitive information required to trigger the policy (10 is the default).                                 |
| Send incident reports                                               | Enabled                                                                                                                                                                                                                       | User and nominated administrator are notified when the policy is triggered.                                             |
| Restrict access or encrypt the content                              | Disabled                                                                                                                                                                                                                      | Access to the content that triggers the policy can be encrypted or and access limited.                                  |
| **Name: PROTECTED Data***                                           |                                                                                                                                                                                                                               |                                                                                                                         |
| Locations                                                           | Protect content in OneDrive and SharePoint documents.                                                                                                                                                                         | The locations where the policy will apply.                                                                              |
| Content type                                                        | All published PROTECTED sensitivity labels (Any of these)                                                                                                                                                                     | The types of sensitive information being detected.                                                                      |
| Sharing detection                                                   | With people outside my organisation                                                                                                                                                                                           | When the policy is applied.                                                                                             |
| Notify users                                                        | Enabled                                                                                                                                                                                                                       | Users are notified when the policy is triggered. They are also provided policy tips for managing sensitive information. |
| Amount of instances                                                 | 1                                                                                                                                                                                                                             | The amount of sensitive information required to trigger the policy (10 is the default).                                 |
| Send incident reports                                               | Enabled                                                                                                                                                                                                                       | User and nominated administrator are notified when the policy is triggered.                                             |
| Restrict access or encrypt the content                              | Disabled                                                                                                                                                                                                                      | Access to the content that triggers the policy can be encrypted or and access limited.                                  |
| **Name: *Classification* Append Subject**                           | Note: each sensitivity label published requires a separate  'Append Subject' policy                                                                                                                                           |                                                                                                                         |
| Content type                                                        | *Classification* sensitivity labels (Any of these)                                                                                                                                                                            | The types of sensitive information being detected.                                                                      |
| Advanced DLP Rules                                                  | Content Contains: Sensitivity labels (select classification for policy)<br />Action: Modify subject<br />Remove text that matches this patten `\[SEC=.*?\]`<br />Insert this replacement text: `[SEC=Classification and DLM]` | Classification the policy is target for Subject line modification, e.g. `[SEC=OFFICIAL:Sensitive]`                      |
| Notify users                                                        | Disabled                                                                                                                                                                                                                      | Users are not notified when the policy is triggered.                                                                    |

The Microsoft 365 Compliance Center provides the ability to monitor and review user and administrator activities across the Microsoft 365 applications from the past 90 days.

Audit logs are kept by default for 90 days but are configurable up to 10 years using an Audit retention policy with Microsoft Purview Audit (Premium).

When an event occurs for the respective application it will take anywhere from 30 minutes up to 24 hours before it can be viewed in the audit log search.

The Microsoft 365 Management Activity API enables third-party applications to consume audit logs from Microsoft 365. If audit logging is disabled, third-party applications can still consume audit logs from the Microsoft 365 Management Activity API.

A list of Office 365 applications, their auditing capabilities and duration wait time once an event occurs.

| Application                                                      | User Activity | Admin Activity | Duration wait time |
|------------------------------------------------------------------|:-------------:|:--------------:|--------------------|
| Exchange Online                                                  | x             | x              | 30 minutes         |
| OneDrive for Business                                            | x             |                | 30 minutes         |
| SharePoint Online                                                | x             | x              | 30 minutes         |
| Sway                                                             | x             | x              | 24 hours           |
| Power Bi                                                         | x             | x              | 30 minutes         |
| Workplace Analytics                                              |               | x              | 30 minutes         |
| Dynamics 365                                                     | x             | x              | 24 hours           |
| Yammer                                                           | x             | x              | 24 hours           |
| Microsoft Power Apps                                             | x             | x              | 24 hours           |
| Microsoft Power Automate                                         | x             | x              | 24 hours           |
| Microsoft Steam                                                  | x             | x              | 30 minutes         |
| Microsoft Teams                                                  | x             | x              | 30 minutes         |
| Microsoft Forms                                                  | x             | x              | 30 minutes         |
| Entra ID                                                         |               | x              | 24 hours           |
| eDiscovery activities in Office 365 Security & Compliance Center | x             | x              | 30 minutes         |

Audit logging is not enabled by default and must be turned on first in Microsoft Purview (formerly Microsoft 365 Compliance Center) before user or administrator activities can be audited.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                    | Design Decision              | Justification                                                                                 |
|-----------------------------------|------------------------------|-----------------------------------------------------------------------------------------------|
| Microsoft Purview Audit (Premium) | Enabled<br>10-year retention | To provide visibility into the actions being undertaken within the Microsoft 365 environment. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* None identified

#### References

* [Learn about data loss prevention](https://docs.microsoft.com/microsoft-365/compliance/dlp-learn-about-dlp?view=o365-worldwide)
* [Learn about Endpoint data loss prevention](https://learn.microsoft.com/purview/endpoint-dlp-learn-about)
