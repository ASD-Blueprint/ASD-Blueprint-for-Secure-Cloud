---
title: Identity Governance
weight: 30
description: "This section describes the design decisions associated with entitlement management and access to workloads and landing zones for system(s) built using ASD's Blueprint for Secure Cloud."
---

Identity Governance encompasses:

* **Entitlement Management** - the automation of request and approval workflows for access to groups, applications and sites
* **Access Reviews** - enforcing review and expiry of continued access to these groups, applications and sites

Entitlement Management delegates the management of user permissions from the Platform Administrators to the resource owners. Access Packages provide access to Azure resources, applications, and SharePoint sites using Entra ID group membership. This method is preferred over direct group assignment as it requires that access is explicitly sought by the requester and granted by the owner on a "business need" basis.

Access Management delegates the management of continued access from the Platform Owner to the entitlement owner. This provides a review process for the assignment of users to groups, and can be carried out for directly assigned users (via Groups), Security Groups (via Entitlement Management) and Privileged Groups (via Privileged Identity Management). Access Reviews must be carried out for all group memberships on a six monthly basis.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point             | Design Decision                                             | Justification                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| -------------------------- | ----------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Access Packages            | Used for all Security Groups                                | Assignment to groups providing access to resources or services should be explicitly obtained and granted on a business needs basis.                                                                                                                                                                                                                                                                                                                            |
| Access Reviews             | Maximum 6 months                                            | In line with an organisation's Information Management policy.<br><br>**Essential 8**<br><ul><li>Privileged access to systems and applications is automatically disabled after 12 months unless revalidated.</li></ul>                                                                                                                                                                                                                                                     |
| Privileged Role Delegation | Where Privileged Roles are delegated by the Platform Owners | Privileged Role delegations are explicitly obtained and granted when delegated.<br><br>**Essential 8**<br><ul><li>Requests for privileged access to systems and applications are validated when first requested.</li><li>Privileged access to systems and applications is limited to only what is required for users and services to undertake their duties.</li><li>Just-in-time administration is used for administering systems and applications.</li></ul> |
| Account inactivity         | Inactive accounts automatically disabled                    | **Essential 8**<br><ul><li>Access to systems and applications is automatically disabled after 45 days of inactivity.</li></ul>                                                                                                                                                                                                                                                                                                                                 |

{{% /alert %}}

### Access Reviews

A base recommendation for access reviews is below. However, organisations should review and update these configurations based on their risk appetite and organisational policies.

| Review Type                               | Reviewer              | Recurrence  |
| ----------------------------------------- | --------------------- | ----------- |
| Privileged Access - Global Administrators | Organisation Decision | 6 monthly   |
| Privileged Access - Privileged Group      | Global Administrators | 6 monthly   |
| Privileged Access - Entra ID Role         | Global Administrators | 6 monthly   |
| Workloads (Applications)                  | Application Owner     | 6 monthly   |
| Other Security Groups                     | Group Owner           | As required |
| Microsoft 365 Groups                      | Group Owner           | 6 monthly   |

### Related information

#### Security & Governance

* None identified

#### Design

* [Role-Based Access Control]({{<ref "roles">}})
* [Privileged Identity Management]({{<ref "rbac#privileged-identity-management">}})

#### References

* [Identity Governance](https://learn.microsoft.com/entra/id-governance/identity-governance-overview)

