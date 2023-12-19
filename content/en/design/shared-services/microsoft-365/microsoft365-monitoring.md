---
title: "Microsoft 365 Monitoring"
weight: 70
description: "Design decisions associated with monitoring of Microsoft 365 activities for system(s) built using ASD's Blueprint for Secure Cloud."
---

Microsoft 365 activities are logged to the Microsoft 365 Unified Log as detailed in [Audit and Logging]({{<ref "audit-and-logging">}}). Integration with Microsoft Sentinel SIEM is managed via the Sentinel Microsoft 365 Data Connector. This connector writes information to the following Log Analytics tables : 

| Table name     | Events type                                                                                                                                                                                                           |
| -------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| OfficeActivity | Provides insights into ongoing user activities, including details of operations such as file downloads, access requests sent, changes to group events, set-mailbox and details of the user who performed the actions. |


Additional security is provided by Microsoft Defender for Office 365.  

Microsoft Defender for Office 365 is part of the Microsoft 365 Defender stack. Integration with Azure Sentinel SIEM is managed via the Sentinel Microsoft 365 Defender Data Connector. This connector writes Microsoft Defender for Office 365 information to the following Sentinel Log Analytics tables :

| Sentinel Table name     | Events type                                                                                                     |
|-------------------------|-----------------------------------------------------------------------------------------------------------------|
| EmailAttachmentInfo     | Information about files attached to emails                                                                      |
| EmailEvents             | Microsoft 365 email events, including email delivery and blocking events                                        |
| EmailPostDeliveryEvents | Security events that occur post-delivery, after Microsoft 365 has delivered the emails to the recipient mailbox |
| EmailUrlInfo            | Information about URLs on emails                                                                                |

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                                     | Design Decision                                                  | Justification                                                      |
|----------------------------------------------------|------------------------------------------------------------------|--------------------------------------------------------------------|
| Microsoft 365 Unified Log Routing                  | Microsoft Sentinel via Microsoft Microsoft 365 Data Connector    | Archive and audit solution downstream from log analytics workspace |
| Microsoft  Defender  for Microsoft 365 Log routing | Microsoft Sentinel via Microsoft 365 Defender 365 Data Connector | Archive and audit solution downstream from log analytics workspace |

{{% /alert %}}

### Related Information

#### Security & Governance

* None identified

#### Design

* [Data Loss Prevention]({{<ref "data-loss-prevention">}})
* [Logging and Auditing]({{<ref "audit-and-logging">}})
* [Security logging and monitoring overview]({{<ref "siem">}})

#### References

* [Connect data from Microsoft 365 Defender to Microsoft Sentinel](https://learn.microsoft.com/azure/sentinel/connect-microsoft-365-defender)
* [Microsoft 365 Defender integration with Microsoft Sentinel](https://learn.microsoft.com/azure/sentinel/microsoft-365-defender-sentinel-integration)
* [Find Data Connector - Microsoft 365 Defender](https://learn.microsoft.com/azure/sentinel/data-connectors-reference#microsoft-365-defender)  
* [Find Data Connector - Microsoft Defender for Microsoft 365](https://learn.microsoft.com/azure/sentinel/data-connectors-reference#microsoft-defender-for-office-365) 