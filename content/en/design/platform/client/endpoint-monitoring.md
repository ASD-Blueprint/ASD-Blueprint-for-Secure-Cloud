---
title: Endpoint Monitoring
weight: 55
description: "Design decisions associated with monitoring of endpoint management activities for system(s) built using ASD's Blueprint for Secure Cloud."
---

Endpoint management is performed predominantly by Microsoft Intune with additional security layers provided by Microsoft Defender for Endpoint. Microsoft Defender for Endpoint is part of the Microsoft 365 Defender stack. 

Integration with Azure Sentinel Security Information and Event Management (SIEM) is managed via the Sentinel Microsoft 365 Defender Data Connector. This connector writes Defender for Endpoint information to the following Sentinel Log Analytics tables:

| Sentinel Table name                | Events type                                                                                                                     |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| **Alerts**                         |                                                                                                                                 |
| SecurityAlert                      | Information on Security Alerts                                                                                                  |
| SecurityIncident                   | Information on Security Incidents                                                                                               |
| **Defender for Endpoint Specific** |                                                                                                                                 |
| DeviceInfo                         | Machine information, including OS information                                                                                   |
| DeviceNetworkInfo                  | Network properties of devices, including physical adapters, IP and MAC addresses, as well as connected networks and domains.    |
| DeviceProcessEvents                | Process creation and related events                                                                                             |
| DeviceNetworkEvents                | Network connection and related events                                                                                           |
| DeviceFileEvents                   | File creation, modification, and other file system events                                                                       |
| DeviceRegistryEvents               | Creation and modification of registry entries                                                                                   |
| DeviceLogonEvents                  | Sign-ins and other authentication events on devices                                                                             |
| DeviceImageLoadEvents              | Dynamic Link Library (DLL) loading events                                                                                       |
| DeviceEvents                       | Multiple event types, including events triggered by security controls such as Windows Defender Antivirus and exploit protection |
| DeviceFileCertificateInfo          | Certificate information of signed files obtained from certificate verification events on endpoints                              |

### Related information

#### Security & Governance

* None identified

#### Design

*   [Microsoft Defender Audit and Logging]({{<ref "audit-and-logging">}})

#### References

*   [Connect data from Microsoft 365 Defender to Microsoft Sentinel](https://learn.microsoft.com/azure/sentinel/connect-microsoft-365-defender)
*   [Microsoft 365 Defender integration with Microsoft Sentinel](https://learn.microsoft.com/azure/sentinel/microsoft-365-defender-sentinel-integration)
*   [Find your Microsoft Sentinel data connector - Microsoft 365 Defender](https://learn.microsoft.com/azure/sentinel/data-connectors-reference#microsoft-365-defender)
*   [Connecting Intune to Azure Sentinel - Azure Cloud & AI Domain Blog (azurecloudai.blog)](https://azurecloudai.blog/2020/07/02/connecting-intune-to-azure-sentinel/)
