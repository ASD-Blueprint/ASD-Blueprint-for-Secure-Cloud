---
title: "General"
linkTitle: "General"
weight: 10
type: docs
description: "This page describes the configuration of external identities within Microsoft Entra ID associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Entra ID portal blade at the following URL: 

https://entra.microsoft.com/#view/Microsoft_AAD_IAM/GroupsManagementMenuBlade/~/General
 
The settings described in these tables should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

### Self Service Group Management

| Item                                                                                                                                                   | Value |
| ------------------------------------------------------------------------------------------------------------------------------------------------------ | ----: |
| Owners can manage group membership requests in My Groups                                                                                               |   Yes |
| Restrict user ability to access groups features in My Groups. Group and User Admin will have read-only access when the value of this setting is 'Yes'. |    No |

### Security Groups

| Item                                                                 | Value |
| -------------------------------------------------------------------- | ----: |
| Users can create security groups in Azure portals, API or PowerShell |    No |

### Microsoft 365 Groups

| Item                                                                      | Value |
| ------------------------------------------------------------------------- | ----: |
| Users can create Microsoft 365 groups in Azure portals, API or PowerShell |    No |

### Related information

#### Security & Governance

* None identified
  
#### Design

* [Groups]({{<ref "design/platform/identity/groups">}})
* [Microsoft Groups]({{<ref "design/shared-services/microsoft-365/microsoft365-groups.md">}})
  
#### Configuration

* None identified

#### References

* [Learn about groups and access rights](https://learn.microsoft.com/entra/fundamentals/concept-learn-about-groups)
* [Microsoft Entra groups to manage role assignments](https://learn.microsoft.com/entra/identity/role-based-access-control/groups-concept)
* [Make a group available for user self-service](https://learn.microsoft.com/entra/identity/users/groups-self-service-management?WT.mc_id=Portal-Microsoft_AAD_IAM#make-a-group-available-for-user-self-service)