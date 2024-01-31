---
title: Role-Based Access Control
weight: 20
description: "This section describes the design decisions associated with Role Based Access Control (RBAC) for system(s) built using ASD's Blueprint for Secure Cloud."
---

Role-Based Access Control (RBAC) defines what an end user or administrator can do. In relation to system administration, RBAC provides various roles each of which can only perform certain tasks. For example, help desk staff may be able to only view certain resources, whereas system administrators could view, create, and delete those resources.

Privileged Identity Management (PIM) can be leveraged to enhance the RBAC model available within Microsoft Entra ID. PIM is an implementation of Just-in-time (JIT) access, which ensures that an administrative account only has privileges when required to complete a function, and aligns to the principle of Zero Standing Privilege.

Each PIM role assignment can have the following attributes:

* **Activation Duration** - the Activation Duration attribute specifies the duration to allow the access request, the maximum is 72 hours.
* **Approver** - the Approver attribute specifies the person or people who can approve role activation requests.
* **Notification** - the Notification attribute specifies that a pending request is awaiting approval via email.
* **Incident Request Ticket** - the Incident Request Ticket attribute specifies that the approver add an incident ticket number to the approval request.
* **Multi-factor Authentication (MFA)** - the MFA attribute specifies whether MFA is required for activation.

Microsoft Entra ID roles can be assigned via PIM to various scope types, depending on the specific role being assigned. Scope types include:

* **Directory** - Roles that apply permissions across the entire Microsoft Entra ID tenant.
* **Administrative Unit** - Configurable by administrators to segregate permissions within organisation into specific business units or locations.
* **Application** - A specific application registered to Microsoft Entra ID.
* **Service Principal** - Including registered applications, managed identities and legacy apps.

{{% alert title="Note" color="info" %}}

Only [specific Microsoft Entra ID roles](https://learn.microsoft.com/entra/identity/role-based-access-control/admin-units-assign-roles#roles-that-can-be-assigned-with-administrative-unit-scope) can be assigned to the Administrative Unit scope type.

{{% /alert %}}

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point        | Design Decision                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | Justification                                                                                                                                                                                                                                                                                                                                                                                                                               |
| --------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Role Based Management | Least Privilege, using PIM                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | PIM will be utilised to provide Just-in-Time role-based management to ensure elevated access is only provided when required.                                                                                                                                                                                                                                                                                                                |
| PIM Roles             | Authentication Administrator<br>Azure Information Protection Administrator<br>Global Administrator<br>Exchange Administrator<br>Helpdesk Administrator<br>Intune Administrator<br>Office Apps Administrator<br>Power BI Administrator<br>Power Platform Administrator<br>Privileged Role Administrator<br>Security Administrator<br>Security Operator<br>SharePoint Administrator<br>Teams Communications Administrator<br>Teams Communications Support Engineer<br>Teams Communications Support Specialist<br>Teams Administrator<br>User Account Administrator | The configured PIM roles align to the services utilised within the solution.                                                                                                                                                                                                                                                                                                                                                                |
| PIM approval          | Automatic approval for all roles except for Global Administrator                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | Approval will only be required for Global Administrators.                                                                                                                                                                                                                                                                                                                                                                                   |
| PIM assignment type   | Eligible (for supported roles)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | Roles should be assigned as "eligible" for supported roles as per the ASD's Essential Eight guidance for restricting administrative privilege (just-in-time administration). Note, some roles such as SharePoint Administrators and Device Administrators [can experience some delays in applying using PIM](https://learn.microsoft.com/entra/id-governance/privileged-identity-management/pim-roles#what-about-microsoft-365-admin-roles). |
| PIM assignment period | 12 Months                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | Assignment of all roles within PIM for a maximum of 12 months as per the ASD's Essential Eight guidance for restricting administrative privilege.                                                                                                                                                                                                                                                                                            |
| Activation duration   | 8 hours                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | The activation duration will be one workday to ensure that administrative actions are not impeded.                                                                                                                                                                                                                                                                                                                                          |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* [Privileged Identity Management]({{<ref "rbac#privileged-identity-management">}})
* [Identity Governance]({{<ref "governance">}})

#### References

* [Azure RBAC](https://learn.microsoft.com/entra/identity/role-based-access-control/custom-overview)
* [Entra ID Roles](https://learn.microsoft.com/entra/identity/role-based-access-control/permissions-reference)
* [Azure Resource Roles](https://docs.microsoft.com/azure/role-based-access-control/built-in-roles)
* [Additional Microsoft 365 Roles](https://learn.microsoft.com/entra/identity/role-based-access-control/m365-workload-docs)
* [Entra ID Least privilege by Task](https://learn.microsoft.com/entra/identity/role-based-access-control/delegate-by-task)
