---
title: "Power BI Tenancy Settings"
weight: 55
description: "This section describes the design decisions associated with configuring Power BI within the Power BI Admin Portal for system(s) built using ASD's Blueprint for Secure Cloud."
---
Power BI is a data visualisation tool which can be leveraged to provide interactive dashboards and reports. It integrates with a variety of data sources to enable the creation of dashboards and reports.

Power BI consists of five components:

* **Power BI Desktop** - Power BI desktop is a Windows desktop application which allows for the manipulation of data and the creation of reports and dashboards.
* **Power BI Service** - The Power BI service is a SaaS offering which allows the creation, modification, and sharing of reports and dashboards.
* **Power BI Mobile** - Power BI mobile is a mobile application which allows for the consumption of reports and dashboards.
* **Power BI Report Server** - The Power BI report server is an on-premises tool which enables reports to be distributed as required.
* **Power BI Embedded** – Power BI embedded allows organisation to publish Power BI report to be consumed in a public website.

Inside the Power BI Service, the creation of workspaces, content packs, custom visualisations, and data flows can be controlled both on an enterprise level and a group level. This simplifies management of the service.

Power BI also allows administrators to control the sharing of datasets, content, report publishing, and template apps. This ensures adequate control over sharing of organisation information.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                  | Design Decision | Justification                                                                                                                                                                                                   |
|---------------------------------|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Power BI Information Protection | Enabled         | Power BI Information Protection leverages sensitive labels to label Power BI Reports.                                                                                                                           |
| External Sharing                | Disabled        | External Sharing is disabled to reduce the risk of data spills.                                                                                                                                                 |
| Data Export                     | Disabled        | Export of data is disabled to prevent unauthorised access to the underlying report information.                                                                                                                 |
| Third Party integration         | Disable         | Disable third party integration. This should be evaluated by organisations to ensure that data stays within Australia where necessary and should only be allowed for organisation approved/accredited services. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* [About tenant settings](https://learn.microsoft.com/power-bi/admin/service-admin-portal-about-tenant-settings)
