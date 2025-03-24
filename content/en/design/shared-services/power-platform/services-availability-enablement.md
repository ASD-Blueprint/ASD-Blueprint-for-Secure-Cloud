---
title: "Power Platform Services Availability and Enablement "
weight: 55
description: "This section describes the design decisions associated with which Power Platform services will be enabled and how they will be enabled for system(s) built using ASD's Blueprint for Secure Cloud."
---

The Power Platform is made up of the following services. 

* **Microsoft Power Apps**: an application with services, connectors and a data platform that provides a rapid development environment for building custom apps for organisation needs
* **Microsoft Power Automate**:  lets organisations create automated workflows between applications and services, for example to synchronise files, get notifications, and collect data
* **Microsoft Power BI**: a business analytics service that delivers visual insights to enable fast, informed decisions. Users can collaboratively create and share customised dashboards and interactive reports
* **AI Builder** - a Power Platform capability that helps quickly bring AI to apps and flows that connect to business data. AI Builder provides prebuilt AI models, where organisations do not need to gather data to build and train the model, as well as the ability to create custom AI models  
* **Power Virtual Agents** : enables easy creation of bots using a guided, no-code graphical interface without the need for data scientists or developers
* **Microsoft Power Automate RPA** – An additional robotic process automation (RPA) capability within Microsoft Power Automate that enables automation of manual business processes across on-premises, cloud apps and services 
* **Power Apps Portals** – an additional service that delivers a complete content management system out of the box, with all content stored in Dataverse. Content can be edited through Power Apps Portals Studio or directly by using the Portal Management app
* **Microsoft Power Pages** (*currently preview*) - a secure, enterprise-grade, low-code software as a service (SaaS) platform for creating, hosting, and administering modern external-facing business websites.  
Note that only the following services are included in the current Microsoft 365 E5 Licensing. All other services require additional licensing
* **Power Apps for Office 365** – excluding premium connectors plus integration with Dataverse 
* **Power Automate for Office 365** - excluding premium connectors plus integration with Dataverse 
* **Power BI Pro** – which includes the ability to share reports and dashboards with internal colleagues
* **Power Virtual Agents for Teams** – excluding the capability to build standalone chat bots.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                                 | Design decision                                                                               | Justification                                                                                                                                                                                                                                                                                |
|------------------------------------------------|-----------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Power Platform services availability           | Only Power Platform services included in current Microsoft 365 E5 licensing will be available | Additional services such as AI Builder, Premium Connectors, Power Apps Portals and Power Automate RPA will incur additional licensing costs and governance / support considerations.                                                                                                         |
| Power Platform services licensing provisioning | Not enabled to all users by default                                                           | Power Automate for Office 365, Power Apps for Office 365 and Power BI Pro licenses will only be allocated to initial set of pilot users. Additional users will require completion of relevant Microsoft Learn Power Platform modules prior being provided access to Power Platform services. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* None identified

#### References

* [Set up Conditional Access for Power Platform](https://docs.microsoft.com/power-platform/guidance/adoption/conditional-access)
