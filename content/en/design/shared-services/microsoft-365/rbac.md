---
title: "Role Based Access Control"
weight: 30
description: "This section describes the design decisions associated with Role Based Access Control within Microsoft 365 Services for system(s) built using ASD's Blueprint for Secure Cloud."
---

Role Based Access Control (RBAC) is not a new concept. Microsoft's implementation of RBAC in the context of Microsoft 365 is the process and mechanism of maintaining the principal of least privilege within an environment. Roles therefore define **what** the role holder can do, **who** is granted the role, and **where** the scope of the role is valid. The following list provides an overview of the concepts associated with RBAC:

* Security Principal: The identity assigned a role and given permissions for a specific task
* Role Group: A collection of permissions
* Management Role: A specific permission defined for a particular workload such as Exchange Online or Teams
* Role Assignment: Assignment of a Role Group to a Security Principal
* Scoping: Restricting the Role Assignment to a defined set of resources or objects 

Many of the workloads within Microsoft 365 can be managed through use of one or more default administrative roles defined within Entra ID; however, there are a lot of Microsoft 365 workloads that employ their own RBAC concepts as well as maintaining some overlap with Entra ID. This overlap varies according to the workload. Roles supported by each product are outlined below:

| Microsoft 365 Service                       | Microsoft 365 / Service Role Descriptions                                                                                                                                                                                                                                                                                                                                                        |
|---------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Admin roles in Microsoft                    | [Microsoft 365 admin roles](https://learn.microsoft.com/microsoft-365/admin/add-users/about-admin-roles?view=o365-worldwide#commonly-used-microsoft-365-admin-center-roles)                                                                                                                                                                                                                      |
| Exchange Online                             | [Exchange role-based access control](https://learn.microsoft.com/exchange/permissions-exo/permissions-exo)                                                                                                                                                                                                                                                                                       |
| SharePoint Online                           | [SharePoint admin role in Microsoft 365](https://learn.microsoft.com/sharepoint/sharepoint-admin-role)                                                                                                                                                                                                                                                                                           |
| Teams                                       | [Teams Administrator roles](https://learn.microsoft.com/MicrosoftTeams/using-admin-roles)                                                                                                                                                                                                                                                                                                        |
| Defender for Office 365 and Purview         | [Defender for Office 365 roles](https://learn.microsoft.com/microsoft-365/security/office-365-security/scc-permissions?view=o365-worldwide)                                                                                                                                                                                                                                                      |
| Azure Information Protection                | [Entra built-in roles](https://learn.microsoft.com/entra/identity/role-based-access-control/permissions-reference#azure-information-protection-administrator)                                                                                                                                                                                                                                 |
| Microsoft Defender for Cloud Apps           | [Role-based access control](https://learn.microsoft.com/defender-cloud-apps/manage-admins#office-365-and-azure-ad-roles-with-access-to-defender-for-cloud-apps)                                                                                                                                                                                                                                  |
| Azure Advanced Threat Protection            | [Azure ATP role groups](https://learn.microsoft.com/defender-for-identity/role-groups#types-of-defender-for-identity-security-groups)                                                                                                                                                                                                                                                            |
| Windows Defender Advanced Threat Protection | [Windows Defender ATP role-based access control](https://learn.microsoft.com/microsoft-365/security/defender-endpoint/rbac?view=o365-worldwide)                                                                                                                                                                                                                                                  |
| Intune                                      | [Intune role-based access control](https://learn.microsoft.com/mem/intune/fundamentals/role-based-access-control)                                                                                                                                                                                                                                                                                |
| Power Platform                              | [Power Platform Service Admin Roles](https://learn.microsoft.com/power-platform/admin/use-service-admin-role-manage-tenant#service-administrator-permission-matrix)</br>[Dataverse Security Roles](https://learn.microsoft.com/power-platform/admin/database-security)</br>[System and Application (Built In) Users](hhttps://learn.microsoft.com/power-platform/admin/system-application-users) |

### Privileged Identity Management

Privileged Identity Management (PIM) can be leveraged to enhance the RBAC model for Entra ID role-based management access and other workloads. PIM requests are made through the Entra portal for elevated access only when required, and for a defined period of time.

PIM enables assignment of the following default Microsoft 365 roles:

* Exchange administrator
* Exchange recipient administrator
* SharePoint administrator
* Teams administrator
* Teams Communications administrator
* Teams Communications support engineer
* Teams Communications support specialist
* Power BI Administrator
* Power Platform administrator
* Customer Lockbox Administrator
* Intune administrator
* Office Apps administrator
* Message Center Privacy Reader
* Message Center Reader
* Security administrator
* Security reader

{{% alert title="Note" color="info" %}}

Using PIM for the SharePoint administrator role, the Device administrator role, and roles trying to access the Microsoft Security and Compliance Center might experience delays of up to a few hours after activating the role, see [PIM Roles](https://learn.microsoft.com/entra/id-governance/privileged-identity-management/pim-roles) for further information.

{{% /alert %}}

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                         | Design Decision         | Justification                                                                                                                                                                                                   |
|----------------------------------------|-------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| PIM                                    | Configured              | PIM provides time-based and approval-based role activation to mitigate the risks of excessive, unnecessary, or misused access permissions on resources or workloads.                                            |
| Microsoft 365 administrative sub-roles | Configured by Exception | Microsoft 365 administrative sub-roles, where possible, will not be configured in favour of PIM. This ensures Azure is the location to manage Role Base Access Control permission for the organisations tenant. |

{{% /alert %}}

### Related information

#### References

* [Microsoft 365 Understanding Roles](https://learn.microsoft.com/entra/identity/role-based-access-control/concept-understand-roles)
* [Microsoft 365 Roles](https://docs.microsoft.com/microsoft-365/admin/add-users/about-admin-roles)
* [Azure AD Roles](https://docs.microsoft.com/azure/active-directory/roles/permissions-reference)
* [Microsoft 365 Roles in AAD](https://docs.microsoft.com/azure/active-directory/roles/m365-workload-docs)
* [Exchange Online Permissions](https://docs.microsoft.com/exchange/permissions-exo/permissions-exo)
* [SharePoint Admin Role](https://docs.microsoft.com/sharepoint/sharepoint-admin-role)
* [Teams Administrator roles](https://docs.microsoft.com/MicrosoftTeams/using-admin-roles)
* [Compliance Roles](https://docs.microsoft.com/microsoft-365/security/office-365-security/permissions-in-the-security-and-compliance-center#role-groups-in-the-security--compliance-center)
* [Security Center Roles](https://docs.microsoft.com/microsoft-365/security/office-365-security/permissions-microsoft-365-security-center)
* [Defender Roles](https://docs.microsoft.com/microsoft-365/security/defender/m365d-permissions)
* [Defender Custom Roles](https://docs.microsoft.com/microsoft-365/security/defender/custom-roles)
* [Defender for Cloud Apps](https://docs.microsoft.com/defender-cloud-apps/manage-admins)
* [Defender for Office 365](https://docs.microsoft.com/microsoft-365/security/office-365-security/migrate-to-defender-for-office-365-onboard#rbac-roles)
* [Intune Roles](https://docs.microsoft.com/mem/intune/fundamentals/role-based-access-control)
* [Power Platform Security Roles](https://docs.microsoft.com/power-platform/admin/security-roles-privileges)
* [Power Platform Admin Roles](https://docs.microsoft.com/power-platform/admin/use-service-admin-role-manage-tenant)
* [Dataverse Security Roles](https://docs.microsoft.com/power-platform/admin/use-service-admin-role-manage-tenant)
* [Dataverse System and Application (Built In) Users](https://docs.microsoft.com/power-platform/admin/system-application-users)

#### Related design secisions

* [Privileged Access Management](../../identity/pim)
