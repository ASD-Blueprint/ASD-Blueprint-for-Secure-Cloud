---
title: "Overview"
linkTitle: "Overview"
weight: 1
type: docs
description: This page provides a template and guidance to assist organisations in preparing an Overview for their SSP describing system(s) built on ASD's Blueprint for Secure Cloud.
---

{{% alert title="Instruction" color="dark" %}}

The Overview of a System Security Plan (SSP) should provide a comprehensive overview of a system and clearly articulate its purpose, boundaries and any risks associated with operation of the system. This section should also include links to relevant documentation and outline any information or matters outside of the scope of the SSP.

All template text refers to a typical implementation of a system built using the Blueprint, and includes reference to organisational policies, processes and technical configurations to be implemented in addition to the technical controls that may be configured using guidance in the Blueprint. Any implementation implied by the below should not be considered as prescriptive as to how organisations must scope, build, document, or assess a system.

When completing the below template, organisations should insert and update information where relevant to ensure it accurately represents their system. When complete, remove any grey instructional or blue guidance boxes throughout. 

{{% /alert %}}

### System information

| System Name            | `<SYSTEM-NAME>`                          |
|------------------------|------------------------------------------|
| System Classification  | `<SYSTEM-CLASSIFICATION>`                |
| Operational Status     | `<UNDER DEVELOPMENT / IN OPERATION>`     |

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### System purpose

{{% alert title="Blueprint guidance" color="info" %}}

The system purpose section of an SSP should document the intended scope of implementation of the Blueprint, outlining the intended security and business value to be derived from `<SYSTEM-NAME>`. While the below template is a starting point to help describe a system, its scope and purpose, organisations should ensure they develop their own terminology to accurately portray the purpose and scope of their system in accordance with their requirements. 

{{% /alert %}}

`<SYSTEM-NAME>` aims to provide a scalable, multi-classified, multi-vendor platform that enables trusted external suppliers, partners, and staff to collaboratively develop and enhance our services more rapidly.

The objectives of the `<SYSTEM-NAME>` are to:

* Scale resources faster​
* Support the development of more innovative solutions​
* Provide faster on boarding for new staff
* Improve workplace and partner collaboration
* Assist with greater community engagement
* Enable scalable service continuity

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### System overview

`<SYSTEM-NAME>` is `<ORGANISATION-NAME>`’s implementation of a range of cloud services and applications focused on driving productivity and business outcomes and enabling `<ORGANISATION-NAME>`’s workforce to securely work and collaborate from the office, while travelling or from home.

`<SYSTEM-NAME>` includes the following components that will improve the security posture of `<ORGANISATION-NAME>`:

*  **Identity** including:
    * Microsoft Entra ID (previously known as Azure Active Directory)
    * Multi-Factor Authentication (MFA)
    * Conditional Access
    * Privileged Identity Management
*  **Microsoft 365** including:
    * Exchange Online & Exchange Online Protection
    * SharePoint Online
    * OneDrive for Business
    * Power Platform (Power Automate and Power Apps)
    * Microsoft Teams
    * Office 365 Applications
*  **Device management (Intune)** including:
    * Windows 10
    * Windows 11
    * iOS
*  **Connectivity**
    * Cloud to cloud
    * Endpoints
    * Point to site
    * Government to Government (GovLINK)
*  **Security and Compliance Services** including:
    * Microsoft Defender XDR
    * Microsoft Defender for Cloud Apps
    * Microsoft Defender for Endpoints
    * Microsoft Defender for Identity
    * Microsoft Defender for Office 365
    * Microsoft Defender Vulnerability Management (MDVM)
    * Microsoft Information Protection
    * Microsoft Purview
    * Log Analytics
*  **Automation** including:
    * Desired State Configuration (DSC)
    * Microsoft Graph
    * PowerShell
*  **Support**

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### System boundary

The `<SYSTEM-NAME>` boundary consists of:
* Physical Boundaries — comprising the perimeter security measures of `<ORGANISATION-NAME>`’s office locations and service provider datacentre locations, network infrastructure and physical endpoints, and
* Virtual boundaries — comprising `<SYSTEM-NAME>`’s network segments, its information holdings, system access controls, internet gateway boundaries, inter-office connectivity and connectivity with partner services and Software as a Service (SaaS) applications.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

##### Diagram

`<INSERT SYSTEM-BOUNDARY-DIAGRAM>`

##### Out of scope

The following systems and components are out of the scope of this SSP as they are either addressed elsewhere or are not in-scope of `<SYSTEM-NAME>`:

* `<SYSTEM/COMPONENT-1>`
* `<SYSTEM/COMPONENT-2>`
* `<SYSTEM/COMPONENT-3>`

The above systems and components will have separate SSP(s) produced for them.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Risk assessment

The results of the threat and risk assessment undertaken for `<SYSTEM-NAME>` are documented in the Security Risk Management Plan (SRMP). This document describes the reduction in risk to the confidentiality, integrity and availability of system components and information processed and stored by `<SYSTEM-NAME>` by the implementation of security controls and mitigations.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### System delivery

The initial project to design, configure and deploy `<SYSTEM-NAME>` is being managed by `<ORGANISATION-NAME>`’s `<SECTION/TEAM NAME>` team as part of the `<PROJECT-NAME>` project. As this is a significant system build, this project has a variety of stakeholders, including:
* `<STAKEHOLDER-1>`
* `<STAKEHOLDER-2>`
* `<STAKEHOLDER-3>`

The design, configuration and deployment of `<SYSTEM-NAME>` will also leverage managed services from `<MSP1-NAME>` and `<MSP2-NAME>` respectively as described in the [Procurement and Outsourcing]({{< ref "procurement-and-outsourcing.md">}}) section of this SSP. Similarly, as the build of `<SYSTEM-NAME>` primarily pertains to the use of Microsoft Cloud Services, the project team will liaise regularly with Microsoft in developing, improving and maintaining the system.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

