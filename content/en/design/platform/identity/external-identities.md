---
title: External Identities
weight: 50
description: "This section describes the design decisions associated with external identities (e.g. B2B Collaboration, B2B Direct Connect and Entra ID B2C from other tenants) for system(s) built using ASD's Blueprint for Secure Cloud."
---

Microsoft Entra External ID provides the ability within Entra ID and Microsoft 365 to collaborate with other tenants through use of B2B (Business-to-Business) collaboration, B2B direct connect, and Entra ID B2C (Business-to-Customer).

Organisations can configure collaboration with other organisations where:

* A business requirement exists
* Both organisations choose to collaborate
* The organisations trust each other
* Organisations staff possess the appropriate clearance levels
* Risk assessments have been completed
* Collaboration is based on the lowest classification level of any involved organisation or organisations

Collaboration between organisations assessed and operating at the same security level is relatively straightforward, while collaboration between organisations operating on networks that have been assessed at different security levels presents additional considerations and risk. The additional risks and considerations are similar to those that already exist for organisations, with activities such as personnel clearances, physical security requirements, and the secure creation, storage and destruction of physical artefacts. These considerations will need to be assessed on a case by case basis and risks accepted.

ASD's [*Fundamentals of Cross Domain Solutions*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/cross-domain-solutions/fundamentals-cross-domain-solutions) provides guidance on connecting networks with differing security classifications. At the time of writing, there are no automated options for external collaboration from a PROTECTED environment and user validation for external collaboration remains a manual process. This is particularly the case should organisations adopting this service seek to collaborate from a PROTECTED environment to an environment that is operating at a lower classification. ASD's ISM stipulates that all users of a PROTECTED environment must have a valid security clearance. It is recommended that users of the higher classification organisation collaborate into the lower classification organisation, and that unified labelling be configured as per the Blueprint with PROTECTED content restricted to external sharing.

For organisations operating at a PROTECTED level seeking to collaborate, B2C collaboration is not suitable as it enables authentication through publicly accessible domains such as Google and Facebook. Entra B2B enables authentication between Microsoft 365 tenants to provide a higher level of assurance.

B2B enables the most secure sharing of an organisation's applications, services, and data with external guest users from other organisations while maintaining maximum control over corporate data. The collaboration options between two or more organisations can use the following platforms:

* Teams
* Planner
* SharePoint Online
* OneDrive for Business

Entra supports several B2B access scenarios to enable users within external organisations to collaborate with a host organisation. Users will be authenticated using an external identity source (e.g., Entra ID tenant credentials) which then generates a linked guest account within the host Entra ID tenant.

When an external user is invited to collaborate, the following items are checked:

* Is collaboration with the external domain allowed by B2B at the Entra ID level?
* Is guest access allowed by the application?
* Is external access with the external domain allowed by the application?

When the above are all true, the external user can be invited generating an invitation email. The user must accept the invitation by clicking on the link contained within the email causing a linked guest account to be created in the hosting Entra ID tenant. When the guest account has been created it is available for use by any of the applications that are configured to allow guest access.

B2B only requires a small amount of user information (name and email). However, it is recommended that organisations create a process outside of technology to ensure organisational identity requirements are met. The identity requirements should include the properties listed in the table below and the external user's nationality and clearances held.

The following table describes the identity properties that should be a minimum requirement before collaboration is enabled for all organisations and implementation types.

| Field                         | Example                             | Justification                                              |
| ----------------------------- | ----------------------------------- | ---------------------------------------------------------- |
| FirstName                     | John                                | Search and identify the user.                              |
| LastName                      | Smith                               | Search and identify the user.                              |
| UserName (UPN) = EmailAddress | john.smith@organisation.gov.au      | User's organisation and contract address.                  |
| UserName                      | john.smith                          | Identity in Microsoft.                                     |
| EmailAddress                  | john.smith@organisation.gov.au<br>. | User's email contact.                                      |
| OfficePhone                   | 612xx xxxxxx                        | User's phone contact.                                      |
| MobilePhone                   | 04xx xxx xxx                        | User's phone contact.                                      |
| JobProfile                    | Finance                             | User's job description in identifying appropriate contact. |
| Organisation                  | Australian Signals Directorate      | User's organisation.                                       |
| Manager                       | Julie Citizen                       | User's manager for further consultation.                   |
| Photo                         | ID.JPEG                             | Viewing and identifying the user.                          |

In addition to the above, Conditional Access policies should be enforced requiring external individuals to use Multi Factor Authentication, block legacy authentication, and block from disallowed locations.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point    | Design Decision  | Justification                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| ----------------- | ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| B2B Relationships | Block by default | Maintain a secure default configuration while allowing for partner organisations to potentially be granted access where an organisation understands, has considered and accepted any associated risks.                                                                                                                                                                                                                                                                                            |
| B2C Relationships | Not configured   | Client collaboration other than partner organisations is not required.                                                                                                                                                                                                                                                                                                                                                                                                                            |
| External Sharing  | Disabled         | To maintain a robust and secure platform for the organisation, B2B collaboration should not be configured. Organisations may choose to consider specifying partner tenants, assuming they are also rated at the same classification level and approved by an appropriate authority, according to their organisational requirements and following consideration of associated risks. Only users of these tenants assessed at the same classification level should be allowed collaborative access. |

{{% /alert %}}

{{% alert title="Design Decisions" color="warning" %}}

Conditional Access policies that should be applied by the partner organisation for all organisations and implementation types.

| Decision Point              | Design Decision                                                                                                                                                                                                                                                                       | Justification                                                                                            |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| Conditional Access Policies | **BLOCK - Legacy Authentication**:<br>This global policy blocks all connections from unsecure legacy protocols like ActiveSync, IMAP, POP3, etc.<br>**BLOCK - Countries not Allowed:**<br>This global policy blocks all connections from countries not in the Allowed countries list. | Minimises the risk of the user in the partner organisation using credentials that have been compromised. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* [Cross-tenant access settings]({{<ref "configuration/entra-id/external-identities/cross-tenant-access-settings">}})
* [External collaboration settings]({{<ref "configuration/entra-id/external-identities/external-collaboration-settings">}})

#### References

* [External Identities in Azure Active Directory Overview](https://learn.microsoft.com/entra/external-id/external-identities-overview)
* [Overview: Cross-tenant access with Entra ID External Identities](https://learn.microsoft.com/entra/external-id/cross-tenant-access-overview)
* [B2B direct connect overview](https://learn.microsoft.com/entra/external-id/b2b-direct-connect-overview)
