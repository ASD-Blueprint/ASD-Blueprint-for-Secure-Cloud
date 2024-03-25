---
title: "Endpoint analytics"
weight: 30
description: "This section describes the design decisions associated with endpoint analytics on Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

Endpoint analytics is a service which provides insight and intelligence to organisations to make informed decisions about the update readiness of the Windows clients. Desktop analytics is a Microsoft cloud service that integrates with Windows analytics and Configuration Manager (MECM). The data collected from the organisation is pooled together with many other systems that are connected to Microsoft cloud services.

Desktop analytics can be used with Configuration Manager to:

* Capture application inventory for organisations.
* Analyse application compatibility with latest Windows 10 and 11 feature updates.
* Determine compatibility Endpoint analytics aims to improve user productivity and reduce IT support costs by providing insights into the user experience. The insights enable IT to optimise the end-user experience with proactive support and to detect regressions to the user experience by assessing user impact of configuration changes.

Devices that are AD Joined are automatically enrolled for Endpoint analytics. Proactive remediation's can be scripted to remediate common issues.

Endpoint analytics uses the Windows Connected User Experiences and Telemetry component (DiagTrack) to collect the data from Intune-managed devices. The data collected by the agent is described in the [Endpoint analytics Data Collection](https://docs.microsoft.com/mem/analytics/data-collection) documentation and can be accessed via `Endpoint Manager` > `Reports` > `Endpoint analytics`.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point     | Design Decision | Justification           |
|--------------------|-----------------|-------------------------|
| Endpoint analytics | Connected       | Improve user experience |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* [What is Endpoint analytics?](https://learn.microsoft.com/mem/analytics/overview)
* [Endpoint analytics data collection](https://learn.microsoft.com/mem/analytics/data-collection)