---
title: "Platform Monitoring"
weight: 70
description: "This section articulates how security monitoring, compliance, threat detection and response from Hosted Services, Web Services, Platform Data and Identity and Endpoints come together in a centralised cloud security solution for platform security operations for system(s) built using ASD's Blueprint for Secure Cloud."
---

Log Analytics is a component of the Azure Monitor solution and also forms the storage location for the data analysed by Microsoft Sentinel. It is utilised for log ingestion and querying. Logs can be ingested into Log Analytics in several ways including via:

* Diagnostic Settings
* Sentinel Connectors
* HTTP Post

Log data stored in Log Analytics data can be consumed in various ways:

* **Azure Portal** - Enables creation of log queries and analysis of the results.
* **Azure Monitor Alert rules** - Automatic searches of logs run at regular intervals. Results are automatically inspected to determine if an alert in Azure Monitor should be generated.
* **Azure Dashboards** - Dashboards can be used per Azure user to visualise data gathered from Log Analytics. These dashboards can be shared amongst Azure administrators.
* **Export** - Data from Azure Monitor can be imported into Excel or Power BI for further visualisation.
* **PowerShell** - Enables programmatic retrieval of data for various use-cases.
* **Azure Monitor Logs API** - The native API, uses REST to retrieve log data from the workspace.
* **Microsoft Sentinel** - Provides a security information and event management (SIEM) capability which includes the ability to create dashboards, alerts, and log analysis.

Log Analytics is billed per gigabyte (GB) of data ingested and retained into the service. When ingesting into a SIEM, data retention periods can be shortened.

{{% alert title="Design decisions" color="warning" %}}

| Decision point            | Design decision | Justification                                                                                                                                                      |
|---------------------------|-----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Log Analytics Workspace   | Deployed        | The Log Analytics workspace will primarily be used to store log data for Microsoft Intune managed workloads and Microsoft Entra ID sign in logs.                   |
| Pricing mode              | Per GB          | Log Analytics pricing is based on data consumed.                                                                                                                   |
| Incurs Subscription Cost? | Yes             | Log Analytics pricing is based on data consumed. Data Volume could be reduced to 90 days if the organisation has an existing SIEM for further custom log analysis. |

{{% /alert %}}

Log Analytics configuration for all organisations and implementation types.

| Configuration                   | Value                                            | Description                                                                                           |
|---------------------------------|--------------------------------------------------|-------------------------------------------------------------------------------------------------------|
| Workspace Name                  | organisation-log-workspace                       | Log workspace name to be confirmed by the organisation.                                               |
| Azure Subscription              | Organisation subscription                        | Configured by Office 365.                                                                             |
| Region                          | Australia Central                                | Closest location of Log Analytics to the organisation.                                                |
| Log retention                   | Retention Period: 1 year<br>Data Volume Cap: Off | One year aligns with other data retention periods in this solution and meets the system requirements. |
| Enabled Diagnostic Settings     | Microsoft Intune, Microsoft Entra ID             | Ensures logs are ingested by log analytics.                                                           |
| Log Analytics Contributor Group | rol-organisation-log-admin                       | Log Analytics Contributor group name to be confirmed by the organisation.                             |

### Related information

#### Security & Governance

* [Application Control]({{<ref "security-and-governance/essential-eight/application-control.md">}})
* [System Monitoring]({{<ref "system-monitoring.md">}})

#### Design

* None identified

#### Configuration

* [Device Management]({{<ref "configuration/defender/settings/endpoints/device-management.md">}})

#### References

* [Overview of Log Analytics in Azure Monitor](https://learn.microsoft.com/azure/azure-monitor/logs/log-analytics-overview)
* [Log Analytics tutorial](https://learn.microsoft.com/azure/azure-monitor/logs/log-analytics-tutorial)
