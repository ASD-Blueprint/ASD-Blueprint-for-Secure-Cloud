---
title: "User Application Hardening"
linkTitle: "System Hardening: User Apps"
weight: 71
type: docs
description: This page provides a template and guidance to assist organisations in documenting their approach to user application hardening associated with their system(s) built on ASD's Blueprint for Secure Cloud.
---

{{% alert title="Instruction" color="dark" %}}

The user application hardening section of a System Security Plan (SSP) should document an organisation's approach to hardening applications typically installed on workstations using vendor and ASD guidance, such as office productivity suites, web browsers and their extensions, email clients, PDF software and security products (e.g. antivirus software, device access control software, HIPS and software firewalls), commonly referred to as user applications. As with other sections of the SSP, information in the user application hardening section should be documented according to the relevant controls outlined in ASD's ISM and the SSP Annex.

All template text refers to a typical implementation of a system built using the Blueprint, and includes reference to organisational policies, processes and technical configurations to be implemented in addition to the technical controls that may be configured using guidance in the Blueprint. Any implementation implied by the below should not be considered as prescriptive as to how organisations must scope, build, document, or assess a system.

When completing the below template, organisations should insert and update information where relevant to ensure it accurately represents their approach to operating system hardening. When complete, remove any instructional boxes throughout. 

{{% /alert %}}

Due to the number of applicable controls in ASD's [*Guidelines for System Hardening*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-system-hardening), guidance on system hardening has been split into its five sections for the purpose of this SSP.

### User application selection and releases

#### Applicability

This section of the SSP is applicable to application selection for the below `<SYSTEM-NAME>` components:
* Endpoints (Windows laptops and desktops)
* Mobile Devices (iOS)
* `<ON-PREMISES SERVERS>`

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

All vendors of user applications used within `<SYSTEM-NAME>` have been assessed by `<ORGANISATION-NAME>` as demonstrating a commitment to secure-by-design and secure-by-default principles, use of memory-safe programming languages where possible, secure programming practices, and maintaining the security of their products.
* `<ORGANISATION-NAME>` [Vendor Assessment: Microsoft]({{<ref "security-and-governance/general-documentation">}})
* `<ORGANISATION-NAME>` [Vendor Assessment: Apple]({{<ref "security-and-governance/general-documentation">}})
* `<ORGANISATION-NAME>` [Vendor Assessment: \<VENDOR-3>]({{<ref "security-and-governance/general-documentation">}})

User applications used for `<SYSTEM-NAME>`, along with their releases and versions are listed in the `<SYSTEM-NAME>` [Allowed Applications Register]({{<ref "security-and-governance/general-documentation">}}).
  
`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

Allowed applications are deployed to endpoints and configured via Microsoft Intune, with application control implemented as per the information in the section below.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Hardening user application configurations and macros (Windows endpoints)

#### Applicability

This section of the SSP is applicable to the hardening of user applications for the below `<SYSTEM-NAME>` components:
* Endpoints (laptops and desktops)
* Mobile Devices
* `<ON-PREMISES SERVERS>`

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

`<ORGANISATION-NAME>` has not implemented any specific organisational policies or processes related to hardening user application configurations within `<SYSTEM-NAME>` beyond ensuring implementation of the below technical controls as part of this SSP and reviewing the configurations on at least an annual basis (if not more frequently).

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

Technical controls for hardening of user applications and Microsoft Office macros within `<SYSTEM-NAME>` are configured with reference to ASD's [*Blueprint for Secure Cloud*](https://blueprint.asd.gov.au) and includes the following technical configurations:

<div class="no-band-table">

|                                      |                                                                                               |     |     |     |
| ------------------------------------ | --------------------------------------------------------------------------------------------- | --- | --- | --- |
| **User Application Configurations:** | Microsoft and built-in web browsers hardening                                                 |     |     |     |
|                                      | remove unnecessary functionality, such as Microsoft Access                                    |     |     |     |
|                                      | restrict the use of add-ons to only those deployed via Intune                                 |     |     |     |
|                                      | prevent the installation of Java                                                              |     |     |     |
|                                      | enable native Microsoft Edge advertisement blocking                                           |     |     |     |
|                                      | disable Internet Explorer 11                                                                  |     |     |     |
|                                      | configure Attack Surface Reduction rules                                                      |     |     |     |
|                                      | block Object Linking and Embedding (OLE)                                                      |     |     |     |
| **Macros:**                          | only allow Microsoft macros that have been digitally signed by a trusted publisher to execute |     |     |     |
|                                      | disable all macros downloaded from the internet                                               |     |     |     |
|                                      | enable antivirus scanning of Microsoft macros                                                 |     |     |     |
|                                      | prevent users from changing macro settings                                                    |     |     |     |
|                                      | configure Defender for Endpoint to centrally store EDR logs and send these to Log Analytics   |     |     |     |

</div>

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Hardening user applications on servers

{{% alert title="Blueprint guidance" color="info" %}}

While the Blueprint does not provide specific guidance for hardening user applications for servers, the section below is provided for organisations to describe their implementation of hardening of user applications for servers where it is included within the authorisation boundary for system(s) built using the Blueprint. As most user applications (such as Microsoft Office) are not installed on servers, with the proper implementation of application control and system monitoring, hardening of user applications for servers is likely to be limited in scope.

Where an organisation appropriately assesses hardening user applications for servers within another document, it may choose to remove its implementation and assessment from this SSP. However, it is recommended that organisations consider also documenting their approach to hardening operating systems for servers here for a holistic capture of a system's context and associated risk.

{{% /alert %}}

#### Applicability

`<INSERT IMPLEMENTATION DETAILS AS APPROPRIATE>`

#### Organisational policies and processes implemented

`<INSERT IMPLEMENTATION DETAILS AS APPROPRIATE>`

#### Technical controls implemented

`<INSERT IMPLEMENTATION DETAILS AS APPROPRIATE>`

### Related information

#### Security & Governance

* [Essential Eight: User Application Hardening]({{< ref "user-application-hardening.md">}})
* [Essential Eight: Restrict Microsoft Office Macros]({{< ref "restrict-microsoft-office-macros.md">}})

#### Design

* [Microsoft Office Macro Hardening]({{< ref "microsoft-office-macro-hardening.md">}})
* [Microsoft Office Hardening]({{< ref "microsoft-office-hardening.md">}})
* [Microsoft Edge Hardening]({{< ref "edge-hardening.md">}})
* [Windows Defender Application Control]({{< ref "windows-defender-application-control.md">}})

#### Configuration

* [Microsoft Intune - Applications]({{<ref "configuration/intune/apps">}})
* [Microsoft Entra ID - Applications]({{<ref "configuration/entra-id/applications">}})
* [Microsoft Intune - Profile Configurations]({{<ref "configuration/intune/devices/configuration-policies">}})
* [Endpoint security policies]({{<ref "configuration/defender/endpoints/configuration-management/endpoint-security-policies.md">}})

#### External documentation

* ASD's [*Guidelines for System Hardening*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-system-hardening)
* ASD's [*Shifting the Balance of Cybersecurity Risk: Principles and Approaches for Security-by-Design and Default*](https://www.cyber.gov.au/resources-business-and-government/governance-and-user-education/secure-by-design/shifting-balance-cybersecurity-risk)
* ASD's [*The Case for Memory Safe Roadmaps*](https://www.cyber.gov.au/resources-business-and-government/governance-and-user-education/secure-by-design/case-memory-safe-roadmaps)