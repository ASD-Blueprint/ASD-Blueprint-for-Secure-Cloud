---
title: "Power Platform Environments"
weight: 55
description: "This section describes the design decisions associated with provisioning and configuration of Power Platform Environments for system(s) built using ASD's Blueprint for Secure Cloud."
---

A Power Platform environment is a space to store, manage, and share organisations business data, apps, chatbots, and flows. It also serves as a container to separate apps that might have different roles, security requirements or target audiences in different locations. Typical uses for different environments include:

* Building an organisation-wide Power App (app) in a separate single environment.
* Separate environments that group the test and production versions of apps separately.
* Separate environments that correspond to specific teams or departments in the organisation, each containing the relevant data and apps for each audience.
* Separate environments for different global branches of an organisation.
  
Every environment can have zero or one Microsoft Dataverse databases which provide storage for apps and chatbots. 

{{% alert title="Note" color="info" %}}

Creating an additional database for an environment may require purchase of additional Power Apps licensing.
  
{{% /alert %}}

A single 'default' environment is automatically created by Power Apps for each tenant and shared by all users in that tenant. Whenever a new user signs up for Power Apps, they are automatically added to the `Maker` role of the default environment. The default environment is designed to be an open environment that enables users to extend Microsoft 365 and trusted applications or to build personal productivity applications.

{{% alert title="Design decisions" color="warning" %}}

| Decision point              | Design decision                                             | Justification                                                                                                                                                                                                                                                                                                                 |
|-----------------------------|-------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Power Platform Environments | Only Default environment enabled with no Dataverse database | Default environment should be renamed to `<organisation> (default)` to ensure that its usage is more specifically understood.<br>Additional Power Platform environments can be enabled based on organisation policies<br>Creation of new environments should be restricted to specific Power Platform Service Administrators. |
| Tenant Analytics            | Enabled                                                     | As per [Microsoft Docs](https://learn.microsoft.com/power-platform/admin/tenant-level-analytics) once enabled, this feature will copy data from environments that are associated with a tenant to the tenet location geo regardless of the location of the environment.                                                       |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* None identified

#### References

* [Environments Overview](https://docs.microsoft.com/power-platform/admin/environments-overview)
