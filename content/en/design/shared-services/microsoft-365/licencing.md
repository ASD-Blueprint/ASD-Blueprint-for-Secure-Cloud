---
title: "Microsoft 365 Licensing"
weight: 30
description: "This section describes the design decisions associated with Microsoft 365 Licensing for system(s) built using ASD's Blueprint for Secure Cloud."
---

Microsoft licenses access to Microsoft 365 and its security offerings through user-based licensing. Microsoft offers several enterprise licensing options for Microsoft 365, Enterprise Mobility and Security (EMS), and Windows. These licensing options are summarised below:

* **Microsoft 365 E5 (recommended for the Blueprint)** – Top level Enterprise Plan. Microsoft 365 E5 includes everything inside Microsoft 365 E3 plus additional features and services (largely security and compliance related). In the case of Microsoft 365 E5, the capabilities in Microsoft Defender for Microsoft 365  suite as well as other services such as Microsoft 365 Advanced Compliance are increased.
* **Microsoft 365 E3** - Mid range Enterprise Plan. Microsoft 365 E3 provides access to core products with enhanced features and security features. In the case of Microsoft 365 E3, the Office client suite is included, and the service limits are increased.

The [Microsoft 365 Maps by Aaron Dinnage](https://m365maps.com/) provides detailed information and comparisons of the Microsoft 365 licences as well as detailing licences and features required to align with the Essential Eight and ASD's [*Information Security Manual*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism) (ISM).

To grant access to the services a licence is assigned to an individual user account. A licence can be assigned by an administrator at the time of the user account is created or through Microsoft Entra ID group-based licensing. Microsoft Entra ID group-based licensing enables an administrator to associate a licence to a group. Any members within the group will be assigned that licence automatically. When a user is removed from the group the licence is removed from the user.

{{% alert title="Design decisions" color="warning" %}}

| Decision point            | Design decision  | Justification                                                                                                                                                                                             |
|---------------------------|------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Products Licensed         | Microsoft 365 E5 | Microsoft 365 E5 licences combines Microsoft 365 E5, EMS E5, and Windows E5 are required to ensure that the Microsoft 365 tenant has appropriate security controls for Australian Government requirements |
| Licence Allocation Method | Automated        | Dynamic Security Groups in Entra ID to automatically assign licenses and reduce the management overhead associated with licensing.                                                                        |

{{% /alert %}}

### Suggested licensing configuration

| Configuration       | Value                                | Description                                                                |
|---------------------|--------------------------------------|----------------------------------------------------------------------------|
| Admin Licence Group | `rol-OrganisationName-Administrator` | This is the group that the organisation administrators belong to.          |
| User Licence Groups | `rol-OrganisationName-Users`         | This is the group that the organisation non-administrator users belong to. |

### Related information

#### Security & Governance

* None identified

#### Design

* [Microsoft 365 Groups]({{<ref "microsoft365-groups">}})

#### Configuration

* None identified

#### References

* [Microsoft 365 Maps by Aaron Dinnage](https://m365maps.com/)