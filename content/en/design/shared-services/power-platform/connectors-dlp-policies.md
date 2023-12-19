---
title: "Connectors and Data Loss Prevention Policies"
weight: 55
description: "This section describes the design decisions associated with restricting access of connectors within Power Platform for system(s) built using ASD's Blueprint for Secure Cloud."
---

Power Apps and Power Automate are built with underlying connectors that allow applications to consume data from other services and define businesses process to act on this information. Power Apps and Power Automate connectors can be categorised as follows: 

* **Microsoft 365 and Office 365 connectors** – These connectors provide data access to Microsoft 365 and Office 365 applications (e.g. SharePoint, Teams)
* **Azure Services connectors** – Azure services connectors provide Power Apps and Power Automate access to consume Azure Services (e.g. Azure Cosmos DB, Azure Computer Vision API)
* **Third Party connectors** – Third Party connectors allow external vendors to provide a service to Power Apps and Power Automate (e.g. Adobe Reader Sign)
* **On-premises data connectors** – On-premises data connectors allow Power Apps and Power Automate to consume data from a variety of sources such as SQL Server and SharePoint On-Premises
* **Custom connectors** – in a situation when a connector is not present, a custom connector can be created to connect to a service that has a REST API

{{% alert title="Note" color="info" %}}

On-premises data connectors also require an [on-premises data gateway](https://learn.microsoft.com/data-integration/gateway/service-gateway-onprem).

Additional Power Apps and / or Power Automate plan licenses are required to use premium connectors, which includes all custom connectors, on-premises connectors, some Azure services, and third party connectors.

{{% /alert %}}

The following image shows consideration required for authentication process and requirements for each generalised group of connectors. The cloud services connector is required to be registered in Azure platform before it can be consumed in Power App and Power Automate. On-premises data access requires a service account for network access and a database service account access for Power Apps and Power Automate to consume its data.

{{<figure src="/content/images/power-platform-authentication.png" title="Power Apps and Power Automate authentication flow">}}

See Microsoft documentation for additional information on [Power Apps and Power Automate authentication and security](https://learn.microsoft.com/power-automate/guidance/planning/authentication-security).

### Data Loss Prevention Policies Overview 

Organisations can create Power Platform data loss prevention (DLP) policies to act as guardrails which helps prevent users from unintentionally exposing organisational data via connectors. DLP policies can be scoped at the environment level or tenant level, offering flexibility to craft sensible policies that strike the right balance between protection and productivity. For tenant-level policies organisations can define the scope to be `all environments`, `selected environments`, or `all environments except ones specifically excluded`. Environment-level policies can be defined for one environment at a time. 

DLP policies enforce rules for which connectors can be used together by classifying connectors as either `Business` or `Non-Business` grouping. Business group connectors can only be used with other connectors from that group in any given app or flow. Organisations may want to block the usage of certain connectors altogether by classifying them as `Blocked`. 

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                                  | Design Decision                                                                                     | Justification                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
|-------------------------------------------------|-----------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| On-Premises data sources                        | Not enabled                                                                                         | The Blueprint does not detail provisioning of an on-premises Data Gateway to support On-Premises data sources such as SQL Server or SharePoint On-Premises.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| Data Policies for Power Automate and Power Apps | Only selected standard Microsoft connectors to be enabled                                           | Microsoft Premium connectors and third-party connectors will be disabled.<br>The following connectors as will be enabled under the Business Group:  SharePoint, OneDrive for Business, Office 365 Users, Planner, Outlook for 365, and Teams.<br>The following additional connectors will also be enabled under the Business Group: Approvals, Excel, Excel Online, Notifications, OneNote (Business), Outlook Tasks, Power BI, Microsoft To-Do (Business), Power Apps Notification, Microsoft Planner.<br>**Note**: a number of connectors such as Microsoft Dataverse and Yammer cannot be disabled so these will be moved to the Non-Business Group, thereby restricting their use alongside Business Group connectors.<br>Organisations will need to evaluate additional requested connectors prior to enabling.|
| Sharing with External Users                     | Disabled                                                                                            | Power Platform relies on Entra ID for authentication and therefore external sharing will be disabled at the Entra ID level.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| Environment Administrator                       | Access to `Environment Administrator` assigned to a security group for Power App and Power Automate | Security group should be used to be assigned as Environment Administrator for PowerApps and Power Automate.<br>Environment Administrator will be allowed to create additional environment and configure the connector policies.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* [Planning a Power Automate project](https://learn.microsoft.com/power-automate/guidance/planning/introduction)
* [Power Apps and Power Automate authentication and security](https://learn.microsoft.com/power-automate/guidance/planning/authentication-security)
* [Create a data loss prevention (DLP) policy](https://docs.microsoft.com/power-platform/admin/create-dlp-policy)
