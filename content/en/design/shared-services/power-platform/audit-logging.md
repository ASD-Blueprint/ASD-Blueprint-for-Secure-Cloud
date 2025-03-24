---
title: "Power Platform Audit Logging"
weight: 55
description: "This section describes the design decisions associated with Power Platform specific audit logging for system(s) built using ASD's Blueprint for Secure Cloud."
---

Power Platform activities are logged as follows:

* **Power Apps** – written to unified audit log.
* **Power Automate** – written to unified audit log. 
* **Power BI** – written to unified audit log and additional Power BI activity log. 
* **DLP Policy** – creation, update, and deletion written to unified audit log.

**Note:**  
* Dataverse and model-driven apps logging is stored within Dataverse. 
* Alerting can be triggered via unified audit log alert policies or via integration with a Security Information and Event Management (SIEM) solution.

{{% alert title="Design decisions" color="warning" %}}

| Decision point | Design decision | Justification                                                                                                                                                                                                                                          |
|----------------|-----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Auditing       | Enabled         | Enabled for log access and read logs.<br>As a guide, logs should be retained for seven years to align ISM-0859; however, organisations should consider their overall operating context and retention strategy. Logs are sent to the unified audit log. |

{{% /alert %}}

### Related information

#### Security & Governance

* [System Monitoring]({{<ref "system-monitoring.md">}})

#### Design

* None identified

#### Configuration

* None identified

#### References

* [Power Apps activity logging](https://docs.microsoft.com/power-platform/admin/logging-powerapps)
* [Power Automate activity logging](https://docs.microsoft.com/power-platform/admin/logging-power-automate)
* [Data Loss Prevention activity logging](https://docs.microsoft.com/power-platform/admin/dlp-activity-logging)
* [Manage Dataverse Logging](https://docs.microsoft.com/power-platform/admin/manage-dataverse-auditing)
