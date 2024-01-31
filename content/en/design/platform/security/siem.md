---
title: "SIEM"
weight: 80
description: "This section describes the design decisions associated with Security Information and Event Monitoring for system(s) built using ASD's Blueprint for Secure Cloud."
---

Security Information and Event Monitoring (SIEM) is a combination of tools and services that provide insights into an information technology environment. The tools and services are classed as either Security Information Management (SIM) or Security Event Management (SEM). SIEM tools gather log files from devices, services, and platforms for analysis and reporting. Through this process security threats and events can be identified. SIEM tools provide real-time analysis of log and event data to alert administrators to potential issues such as security threats. When combined into a SIEM the organisation is provided with:

* Real-time visibility for the organisation's systems.
* Centralised event log management meaning data is consolidated from multiple sources across the network.
* Correlation of events gathered from different logs and security sources.
* Automated security event notification for administrators.

In a hybrid environment the SIEM can be located either on-premises or in the cloud. In either location, all logs from the environment should be sent to one SIEM. This ensures maximum insight and creates a single pane of glass for security operations teams. To ensure all logs from cloud services can be ingested by the SIEM, compatibility of the SIEM product with Microsoft 365, Microsoft Azure, and Azure Monitor should be investigated.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point           | Design Decision | Justification                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
|--------------------------|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| SIEM Solution            | Not Configured  | SIEM Solution configuration is custom to each organisation based on its specific requirements. The Blueprint does not specify a SIEM and as such does not offer configuration guidance, however organisations should consider their operational requirements in this area. The Blueprint provides guidance on Azure logs, Defender for Endpoint and Defender for Office 365 which audit most Azure, Defender, including Microsoft 365 logs for up to ten years with Microsoft Purview Audit (Premium).                                                                                                                              |
| Azure log ingestion      | Not Configured  | SIEM Solution configuration is custom to each organisation based on its specific requirements. The Blueprint does not specify a SIEM and as such does not offer configuration guidance, however organisations should consider their operational requirements in this area. The Blueprint provides guidance on Azure logs, Defender for Endpoint and Defender for Office 365 which audit most Azure, Defender, including Microsoft 365 logs for up to ten years with Microsoft Purview Audit (Premium). These technologies are also configured to send alert emails to Global Administrators and selected Office 365 administrators. |
| Office 365 log ingestion | Not Configured  | SIEM Solution configuration is custom to each organisation based on its specific requirements. The Blueprint does not specify a SIEM and as such does not offer configuration guidance, however organisations should consider their operational requirements in this area. The Blueprint provides guidance on Azure logs, Defender for Endpoint and Defender for Office 365 which audit most Azure, Defender, including Microsoft 365 logs for up to ten years with Microsoft Purview Audit (Premium). These technologies are also configured to send alert emails to Global Administrators and selected Office 365 administrators. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* [Microsoft Sentinel](https://learn.microsoft.com/azure/sentinel/overview)
* [Sentinel Integration with Microsoft 365 Defender](https://learn.microsoft.com/azure/sentinel/microsoft-365-defender-sentinel-integration)
* [Data Connector Types](https://docs.microsoft.com/azure/sentinel/connect-azure-windows-microsoft-services)
* [Data Connector Reference](https://learn.microsoft.com/azure/sentinel/data-connectors-reference)
* [Microsoft Defender Threat Intelligence](https://learn.microsoft.com/defender/threat-intelligence/what-is-microsoft-defender-threat-intelligence-defender-ti) 