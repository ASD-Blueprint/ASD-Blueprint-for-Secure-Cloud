---
title: "Role Based Access Control"
weight: 55
description: "This section describes the design decisions associated with Role Based Access Control within Power Platform Services for system(s) built using ASD's Blueprint for Secure Cloud."
---

To help administer environments and settings for Microsoft Power Platform, organisations can assign users either of the following roles to manage at the tenant level without having to assign the more powerful Microsoft 365 global admin privilege. 

**Dynamics 365 administrator**

The Dynamics 365 administrator role can: 

* Sign in to and manage multiple environments. If an environment uses a security group, a service admin would need to be added to the security group in order to manage that environment. Not assigning to an in- place security group essentially locks these admins out of any admin management
* Perform admin functions in Microsoft Power Platform because they have the System Administrator role
* Perform admin functions within Dynamics 365 services, if these have been licensed. 

**Power Platform administrator**

The Power Platform administrator role can: 

* Sign in to and manage multiple environments. Power Platform admins are not affected by security group membership and can manage environments even if not added to an environment's security group
* Perform admin functions in Microsoft Power Platform because they have the System Administrator role
* Manage the Power BI tenant

When planning an implementation, organisations should consider the following:

* Power BI Administrator is a separate role which can be assigned to users who just need to manage the Power BI tenant, noting that Dynamics 365 Administrator role does not have the rights to manage the Power BI tenant 
* Environment specific administration rights can be managed by an Environment Admin Role, noting that by default all Environment users are provided with the Environment Maker role
* Dataverse has specific built-in security roles.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point              | Design Decision                                                                            | Justification                                                                                                                                                                                                                         |
|-----------------------------|--------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Power Platform Environments | Configured Access to Power Platform tenant and environments is assigned to security groups | Security group (controlled via PIM) assigned to Power Platform Service Admin and default Environment Admin role.<br>Dynamics 365 Administrator is not required to be assigned unless Dynamics 365 specific services will be utilised. |

{{% /alert %}}

{{% alert title="Note" color="info" %}}

User access rights can be allocated at the specific Power Apps, Power Automate and Power BI level.

{{% /alert %}}

### Related information

#### Security & Governance

* [Essential Eight - User Application Hardening]({{<ref "security-and-governance/essential-eight/user-application-hardening.md">}})
* [Essential Eight - Restrict Administrative Privileges]({{<ref "security-and-governance/essential-eight/restrict-administrative-privileges.md">}})
* [Authentication Hardening]({{<ref "system-hardening-authentication">}})

#### Design

* None identified

#### Configuration

* None identified

#### References

* [Overview of user security](https://docs.microsoft.com/power-platform/admin/grant-users-access)

