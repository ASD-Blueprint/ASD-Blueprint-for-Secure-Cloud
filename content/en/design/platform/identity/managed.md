---
title: Managed Identities for Resources
weight: 80
description: "This section describes the design decisions associated with managed identities for azure resources for system(s) built using ASD's Blueprint for Secure Cloud."
---

Managed identities are like service accounts, allowing resources that support AD Authentication to access one another, but eliminates the need to manage these credentials.

Managed identities provide an identity for applications to use when connecting to resources that support Azure Active Directory (Entra ID) authentication. Applications may use the managed identity to obtain Entra ID tokens. For example, an application may use a managed identity to access resources like Azure Key Vault where developers can store credentials in a secure manner or to access storage accounts.

There are two types of managed identities:

* **System-assigned** - Some Azure services allow a managed identity to be enabled directly on a service instance - it is a one-to-one relationship between the identity and the resource. When a system-assigned managed identity is enabled, an identity is created in Entra ID that is tied to the life cycle of that service instance. So when the resource is deleted, Azure automatically deletes the identity. By design, only that Azure resource can use this identity to request tokens from Entra ID.
* **User-assigned** - A managed identity may also be created as a standalone Azure resource - it is a one-to-many relationship between the identity and the resources. A user-assigned managed identity can be created and assigned to one or more instances of an Azure service. In the case of user-assigned managed identities, the identity is managed separately from the resources that use it.

Regardless of the type of identity chosen a managed identity is a service principal of a special type that may only be used with Azure resources.

Resources that support system-assigned managed identities:

* Allow managed identities at the resource level to be enabled or disabled.
* Use RBAC roles to grant permissions.
* Allow the viewing of create, read, update, delete (CRUD) operations in Azure Activity logs.
* Allow the viewing of sign-in activity in Entra ID sign-in logs.

A user-assigned managed identity:

* Enables create, read, update, delete (CRUD) operations for the identities.
* Uses RBAC role assignments to grant permissions.
* Can be used on more than one resource.
* Allows the review of CRUD operations in Azure Activity logs.
* Allows the viewing of sign-in activity in Entra ID sign-in logs.

The services that [support managed identities](https://docs.microsoft.com/azure/active-directory/managed-identities-azure-resources/services-support-managed-identities) are varied.

User-assigned managed identities are more efficient in a broader range of scenarios than system-assigned managed identities.

User-assigned identities can be used by multiple resources, and their life cycles are decoupled from the associated resources' life cycles. This life cycle allows resource creation and identity administration responsibilities to be separated. User-assigned identities and their role assignments can be configured in advance of the resources that require them. Users who create the resources only require the access to assign a user-assigned identity, without the need to create new identities or role assignments.

As system-assigned identities are created and deleted along with the resource, role assignments can't be created in advance. This sequence can cause failures while deploying infrastructure if the user creating the resource doesn't also have access to create role assignments. If the infrastructure requires that multiple resources require access to the same resources, a single user-assigned identity can be assigned to them. Administration overhead will be reduced, as there are fewer distinct identities and role assignments to manage. If each resource is required to have its own identity, or have resources that require a unique set of permissions and want the identity to be deleted as the resource is deleted, then a system-assigned identity should be used.

When the managed identity is deleted, the corresponding service principal is automatically removed.

User-assigned identities need to be manually deleted when it's no longer required, even if no resources are associated with it. Role assignments aren't automatically deleted when either system-assigned or user-assigned managed identities are deleted. These role assignments should be manually deleted so the limit of role assignments per subscription isn't exceeded. Role assignments that are associated with deleted managed identities will be displayed with "Identity not found" when viewed in the portal.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point     | Design Decision                                                | Justification                           |
| ------------------ | -------------------------------------------------------------- | --------------------------------------- |
| Managed Identities | Varies by workload, use when available for supported resources | Reduce risks around credential exposure |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* [Managed Identities for Azure Resources Overview](https://docs.microsoft.com/azure/active-directory/managed-identities-azure-resources/overview)
* [Managed Identity Best Practice](https://docs.microsoft.com/azure/active-directory/managed-identities-azure-resources/managed-identity-best-practice-recommendations)