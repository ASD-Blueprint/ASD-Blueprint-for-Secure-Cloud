---
title: "System Management"
linkTitle: "System Management"
weight: 75
type: docs
description: This page provides a template and guidance to assist organisations in documenting their approach to system administration, patching and backups and restoration associated with their system(s) built on ASD's Blueprint for Secure Cloud.
---

{{% alert title="Instruction" color="dark" %}}

The system management section of a System Security Plan (SSP) should document an organisation's approach to system administration, patching, backups and restoration. As with other sections of the SSP, information in the system management section should be documented according to the relevant controls outlined in ASD's ISM and the SSP Annex. 

All template text refers to a typical implementation of a system built using the Blueprint, and includes reference to organisational policies, processes and technical configurations to be implemented in addition to the technical controls that may be configured using guidance from the Blueprint. Any implementation implied by the below text should not be considered as prescriptive of how organisations must scope, build, document, or assess its system.

When completing the below template, organisations should insert and update information where relevant to ensure it accurately represents their approach to system administration, patching and backups and restoration. When complete, remove any instructional boxes throughout. 

{{% /alert %}}

### System administration

#### Applicability

ISM controls relating to the system administration of `<SYSTEM-NAME>`'s are applicable to and covered by this section of the SSP. 

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

Administration of Microsoft services within `<SYSTEM-NAME>` is performed as per `<SYSTEM-NAME>`'s [System Administration Process]({{<ref "security-and-governance/general-documentation">}}) via a number of Microsoft portals as listed below:

| Portal                                  | Purpose                                                                                                            | URL                                                                                    |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------|
| Microsoft Entra admin centre            | Access and administer Microsoft Entra                                                                              | [https://entra.microsoft.com](https://entra.microsoft.com)                             |
| Microsoft 365 admin centre              | Configuration for Microsoft 365 services, including role and licence management, and Microsoft 365 service updates | [https://admin.microsoft.com](https://admin.microsoft.com)                             |
| Microsoft Purview compliance portal     | Access eDiscovery and management of data handling policies                                                         | [https://compliance.microsoft.com](https://compliance.microsoft.com)                   |
| Microsoft Defender portal               | Monitor and respond to threat activity, and apply protection and response configuration across the environment     | [https://security.microsoft.com](https://security.microsoft.com)                       |
| Microsoft Endpoint Manager admin centre | Manage and secure organisational devices                                                                           | [https://endpoint.microsoft.com](https://endpoint.microsoft.com)                       |
| Microsoft 365 Apps admin centre         | Create, modify and export Office applications deployment configurations                                            | [https://config.office.com](https://config.office.com)                                 |
| Exchange admin centre                   | Exchange Online management centre to manage organisation email settings                                            | [https://admin.exchange.microsoft.com](https://admin.exchange.microsoft.com)           |
| Teams Admin centre                      | Manage and monitor the organisation Teams environment including features, licences, policies, and issues           | [https://admin.teams.microsoft.com](https://admin.teams.microsoft.com)                 |
| Power Platform Admin centre             | The unified portal to administer Power Apps, Power Automate, Power Pages, and Power Virtual Agents                 | [https://admin.powerplatform.microsoft.com](https://admin.powerplatform.microsoft.com) |
| SharePoint Admin centre                 | Inform, configure, and govern management of all aspects of SharePoint Online across the tenant                     | [https://admin.microsoft.com/sharepoint](https://admin.microsoft.com/sharepoint)       |
| Defender for Cloud Apps portal          | Configure and manage threat detection, session controls, data protections, and Shadow IT detection                 | [https://portal.cloudappsecurity.com](https://portal.cloudappsecurity.com)             |
| Azure Portal                            | View and manage all aspects of an organisation's Azure environment                                                  | [https://portal.azure.com](https://portal.azure.com)                                   |
| Network Connectivity Test Tool          | Enables measurement of the connectivity between a device and Microsoft's network for troubleshooting and tuning    | [https://connectivity.office.com/](https://connectivity.office.com/)                   |
| Microsoft Teams Call Quality Dashboard  | Shows organisation wide information for call and meeting quality with relation to Microsoft Teams                  | [https://cqd.teams.microsoft.com](https://cqd.teams.microsoft.com)                     |

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

Technical controls for system administration of `<SYSTEM-NAME>` are configured with reference to ASD's [*Blueprint for Secure Cloud*](https://blueprint.asd.gov.au) including the following technical configuration. 

Administrative access to the above portals is restricted via conditional access to be performed solely from dedicated Secure Administrative Workstations (SAWs), and with appropriate role and attribute based access control applied.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### System patching

#### Applicability

ISM controls relating to the system patching within `<SYSTEM-NAME>` are applicable to and covered by this section of the SSP. 

{{% alert title="Blueprint guidance" color="info" %}}

Organisations with hybrid configurations build on the Blueprint, should consider inclusion of the following words or similar in this section of the SSP: 

System patching is also applicable to `<SYSTEM-NAME>`'s on-premise servers that host hybrid components of this system.

{{% /alert %}}

`<SYSTEM-NAME>` also uses system components as implemented by Microsoft as part of its Microsoft 365 services, and inherits implementation of patching for those systems. `<ORGANISATION-NAME>` has assessed the implementation of these systems as documented in Microsoft's IRAP assessments, and available in Microsoft's [Service Trust Portal](https://servicetrust.microsoft.com/), and is satisfied with their implementation as they relate to `<SYSTEM-NAME>`.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

System Patching for `<SYSTEM-NAME>` is performed in accordance with the [`<SYSTEM-NAME>` Patch Management Process]({{< ref "security-and-governance/general-documentation">}}).

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

Technical controls for `<SYSTEM-NAME>`'s implementation of system patching were configured with reference to ASD's [*Blueprint for Secure Cloud*](https://blueprint.asd.gov.au), and includes the following technical configurations for `<SYSTEM-NAME>` endpoints and mobile devices via Intune:

* Intune is configured to provide a centralised approach to patching Windows endpoints, and automatically installs updates within 48-hours on all Windows devices
* Windows Update verifies the integrity of patches before installing them
* Microsoft Defender for Endpoint provides a level of continuous vulnerability management capability for all Windows devices.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Data backup and restoration

{{% alert title="Blueprint guidance" color="info" %}}

While the Blueprint does not provide specific guidance on the implementation of data backups and restoration, the section below is provided for organisations to describe their specific implementation of backups and restoration, including where this is included within the authorisation boundary of system(s) built using the Blueprint.

Where organisations appropriately assess this within another document, they may choose to de-scope it from this SSP. However, it is advised that organisations consider tracking this information here for a holistic overview of a system's context and the associated risks.

{{% /alert %}}

#### Applicability

ISM controls relating to the backups and restoration, to the extent that they relate to `<SYSTEM-NAME>`, are applicable to and covered by this section of the SSP. 

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

Backups and restoration, including for information within the system boundary of `<SYSTEM-NAME>`, are performed in accordance with `<ORGANISATION-NAME>`'s [Digital Preservation Policy]({{< ref "security-and-governance/policies">}}) and associated SOPs:
* [`<SYSTEM-NAME>` Data Backup Process]({{< ref "security-and-governance/general-documentation">}})
* [`<SYSTEM-NAME>` Data Restoration Process]({{< ref "security-and-governance/general-documentation">}})

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical Controls Implemented

Technical controls backups and restoration are configured with reference to `<RELEVANT-GUIDANCE>` and includes the following technical configurations:

* `<TECHNICAL-CONFIGURATION-1>`
* `<TECHNICAL-CONFIGURATION-2>`
* `<TECHNICAL-CONFIGURATION-3>`

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Related information

#### Security & Governance

* [Essential Eight: Patch Applications]({{< ref "patch-applications.md">}})
* [Essential Eight: Patch Operating Systems]({{< ref "patch-os.md">}})
* [Essential Eight: Regular Backups]({{< ref "regular-backups.md">}})
* [System Administration Process]({{<ref "security-and-governance/general-documentation">}})

#### Design

*  None Identified

#### External links

* ASD's [*Guidelines for System Management*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-system-management)