---
title: "Restrict Microsoft Office Macros"
linkTitle: "Restrict Microsoft Office Macros"
weight: 035
type: docs
description: This page provides a template and guidance to assist organisations in documenting their approach to restricting Microsoft Office macros, as per the Essential Eight Maturity Model, associated with their system(s) built on ASD's Blueprint for Secure Cloud.
---

{{% alert title="Instruction" color="dark" %}}

The Essential Eight sections of a System Security Plan (SSP) should document the Essential Eight Maturity levels associated with implementation of a system. As with other sections of the SSP, information in this section should be documented according to the relevant controls outlined in ASD's ISM and the SSP Annex. 

All template text refers to a typical implementation of a system built using the Blueprint, and includes reference to organisational policies, processes and technical configurations to be implemented in addition to the technical controls that may be configured using guidance from the Blueprint. Any implementation implied by the below text should not be considered as prescriptive of how the organisation must scope, build, document, or assess its system.

When completing the below template, organisations should insert and update information where relevant to ensure it accurately represents the Essential Eight Maturity levels associated with implementation of their system. When complete, remove any instructional boxes throughout. 


{{% /alert %}}

{{% alert title="Blueprint guidance" color="info" %}}

For applicable government organisations to meet the minimum requirements established under the [*Protective Security Policy Framework* (PSPF)](https://www.protectivesecurity.gov.au/publications-library/policy-10-safeguarding-data-cyber-threats) maturity model, these organisations must implement Maturity Level Two for each of the below components of ASD's [*Essential Eight Maturity Model*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/essential-eight).

As with implementation of ISM controls, the Blueprint does not itself *achieve* any particular Essential Eight Maturity levels, but rather assists organisations in designing and building systems to achieve their desired maturity level based on their own operating context.

{{% /alert %}}

### Applicability

The Restrict Microsoft Office Macros mitigation strategy is applicable to restricting the execution of Microsoft Office Macros on all `<SYSTEM-NAME>` workstations and servers.

### Maturity Level

|                     |                    |
| :------------------ | ------------------ |
| Targeted:           | `<TARGET-LEVEL>`   |
| Currently Assessed: | `<ASSESSED-LEVEL>` |
|                     |                    |

### Implementation

{{% alert title="Essential Eight guidance" color="success" %}}

All Maturity levels require that for all systems and users:
* all Microsoft Office macros are disabled, unless the user has a demonstrated business requirement
* Microsoft Office macros in files originating from the internet are blocked
* Microsoft Office macro antivirus scanning is enabled
* Microsoft Office macro security settings cannot be changed by users.

Maturity Levels Two and Three also require that for user accounts that have a demonstrated business requirement to run Microsoft Office macros:
* these macros are blocked from making Win32 API calls.

Maturity Level Three also requires that for user accounts that have a demonstrated business requirement to run Microsoft Office macros:
* Microsoft Office macros are only allowed to execute where they are running in one of the following conditions:
* running from within a sandboxed environment, 
* running from a Trusted Location, or
* are digitally signed by a trusted publisher.
* that before being digitally signed or placed within Trusted Locations:
* Microsoft Office macros are checked to ensure they are free of malicious code
* Microsoft Office macros cannot be enabled via the Message Bar or Backstage View where they have been digitally signed by either:
* an untrusted publisher
* signatures other than V3 signatures.

{{% /alert %}}

#### Windows endpoints

`<SYSTEM-NAME>` restricts macro execution to only those signed by a trusted digital certificate in accordance with ASD's [*Microsoft Office Macro Security*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/restricting-microsoft-office-macros) guidance. This includes blocking Microsoft Office macros originating from the internet and preventing standard users from modifying macro security settings in all Microsoft Office applications.

Microsoft Defender Antivirus and Defender for Endpoint provide antivirus scanning of all Microsoft Office file types, including embedded macros. This leverages the [Antimalware Scan Interface](https://www.microsoft.com/security/blog/2018/09/12/office-vba-amsi-parting-the-veil-on-malicious-macros/) (AMSI) to enable inspecting macros at runtime.

Microsoft Office macros are blocked from making Win32 API calls using Attack Surface Reduction (ASR) rules as per ASD's [*Hardening Microsoft Windows 10 version 21H1 Workstations*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/hardening-microsoft-windows-10-version-21h1-workstations) and [*Hardening Microsoft 365, Office 2021, Office 2019 and Office 2016*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/hardening-microsoft-365-office-2021-office-2019-and-office-2016) hardening guides.

`<SYSTEM-NAME>` uses Defender for Endpoint to centrally store Endpoint Detection & Response (EDR) logs for all Windows endpoints, which includes the execution of macro-enabled documents and resulting behaviours (such as attempts to make Win32 API calls).


`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Hybrid servers

{{% alert title="Blueprint guidance" color="info" %}}

While the Blueprint does not provide specific guidance for hardening user applications for servers, the section below is provided for organisations to describe their implementation for a system, where this management is included within the authorisation boundary for a system built using the Blueprint.

Generally, much of the applicable software (such as Microsoft Office) is not installed on servers, and so together with the proper implementation of application control and system monitoring, is likely to be limited in scope. However, implementation of this hardening is also often completed as part of a separate system specific to these servers.

Where the organisation appropriately assesses this within another document, it may choose to remove its implementation and assessment from this particular SSP Annex, though it is advised that organisations consider tracking this here for a holistic capture of the system context and associated risk.

{{% /alert %}}

Office productivity suites are not installed on `<SYSTEM-NAME>` servers.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Related information

#### Security & Governance

* [User Application Hardening]({{<ref "system-hardening-user-apps.md">}})
* [Essential Eight: User Application Hardening]({{< ref "user-application-hardening.md">}})
* [Essential Eight: Restrict Microsoft Office Macros]({{<ref "restrict-microsoft-office-macros.md">}})

#### Design

* Microsoft's [Office Macro Hardening]({{< ref "microsoft-office-macro-hardening.md">}})
* [Microsoft Office Hardening]({{< ref "microsoft-office-hardening.md">}})
* [Microsoft Edge Hardening]({{< ref "edge-hardening.md">}})
* [Windows Defender Application Control]({{< ref "windows-defender-application-control.md">}})

#### Configuration

* [Microsoft Office Macro Hardening]({{<ref "configuration/intune/devices/scripts/officemacrohardening-preventactivationofole.md">}})
* [Microsoft Intune - Profile Configurations]({{<ref "configuration/intune/devices/configuration-policies">}})


#### External links

* ASD's [*Essential Eight*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/essential-eight)
* ASD's [*Hardening Microsoft Windows 10 version 21H1 Workstations*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/hardening-microsoft-windows-10-version-21h1-workstations)
* ASD's [*Hardening Microsoft 365, Office 2021, Office 2019 and Office 2016*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/hardening-microsoft-365-office-2021-office-2019-and-office-2016)
* Microsoft's [Service Trust Portal](https://servicetrust.microsoft.com/)
* Microsoft's [*Guidance for meeting ASD's Essential Eight - Configure Microsoft Office Macro Settings*](https://learn.microsoft.com/compliance/anz/e8-macro)