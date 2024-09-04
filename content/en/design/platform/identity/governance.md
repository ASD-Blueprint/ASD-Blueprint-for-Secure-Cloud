---
title: "Identity governance"
linkTitle: "Identity governance"
weight: 30
description: "This section describes the design decisions associated with identity governance for system(s) built using ASD's Blueprint for Secure Cloud."
---

Identity governance encompasses:

- Entitlement management - the management of access to resources
- Access reviews - the audit and maintenance of ongoing access
- Lifecycle workflows - the onboarding, offboarding and moves of users
- Privileged Identity Management (PIM) - the just-in-time access management of privileged roles

Identity governance has a significant role to play in implementing the principle of least privilege; enhancing security and mitigating risks by ensuring users are only accessing the resources relevant to their responsibilities, and nothing more. Information Security Manual (ISM), [Guidelines for Personnel Security, Access to systems and their resources](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-personnel-security) has several controls relevant to identity governance.

### Entitlement management

Entitlement management is largely focussed on the use of *access packages*, where administrators create *catalogs* of resources (like SharePoint sites, Teams, groups or applications) that are presented to select users or guests, and then lifecycle-managed with expiration and access review workflows.

Access packages are particularly useful for managing access to the common resources associated with the various divisions and user-types within an organisation.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point  | Design Decision                                | Justification                                                      |
| --------------- | ---------------------------------------------- | ------------------------------------------------------------------ |
| Access packages | Access packages should be used where practical | Access packages simplify resource assignments for common use cases |

{{% /alert %}}

### Access reviews

Access reviews enable the audit and maintenance of group memberships, access to applications, and role assignments. Access reviews help mitigate the dangling access often associated with user's access requirements changing over time.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                                       | Design Decision                                                     | Justification                                                            |
| ---------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| Access reviews for privileged roles<sup>1</sup>      | Use 6-monthly access reviews for active and eligible assigned roles | Assist compliance with Essential Eight privileged access validation      |
| Access reviews for Conditional Access exclude groups | Use 3-monthly access reviews for Conditional Access exclude groups  | Conditional Access exclude group membership should be tightly controlled |
| Access reviews for role assigned groups              | Use 6-monthly access reviews for role assigned groups               | Assist compliance with Essential Eight privileged access validation      |

{{% /alert %}}

1: While access reviews for Teams, groups and applications are performed via the Entra Identity Governance portal page, access reviews for roles are performed via the Entra PIM portal page.

Access reviews for inactive users are subject to Microsoft Entra ID Governance license requirements and are not in implemented in the Blueprint.

### Lifecycle workflows

Lifecycle workflows provide automation for the onboarding, offboarding and moves of users, and can integrate with an organisation's other user management systems like human resources and financial systems to further streamline such processes.

Lifecycle workflows are subject to Microsoft Entra ID Governance license requirements and are not in implemented in the Blueprint.

### Privileged Identity Management (PIM)

The use of PIM is discussed in more detail in the [Role-Based Access Control design page]({{<ref "identity/roles">}}).

### Related information

#### Security & Governance

- None identified

#### Design

- [Conditional Access]({{<ref "identity/conditional-access">}})
- [Groups]({{<ref "identity/groups">}})
- [Role-based access control]({{<ref "identity/roles">}})

#### Configuration

- None identified

#### References

- [Create an access review of Azure resource and Microsoft Entra roles in PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-create-roles-and-resource-roles-review)
- [Identity Governance](https://learn.microsoft.com/entra/id-governance/identity-governance-overview)
- [Plan a Microsoft Entra access reviews deployment](https://learn.microsoft.com/en-us/entra/id-governance/deploy-access-reviews)
