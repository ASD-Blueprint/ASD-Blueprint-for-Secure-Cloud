---
title: "Operating System Hardening"
linkTitle: "System Hardening: OS"
weight: 70
type: docs
description: This page provides a template and guidance to assist organisations in documenting their approach to operating system hardening associated with their system(s) built on ASD's Blueprint for Secure Cloud.
---

{{% alert title="Instruction" color="dark" %}}

The operating system hardening section of a System Security Plan (SSP) should document an organisation's approach to hardening operating systems using vendor and ASD guidance. As with other sections of the SSP, information in the operating system hardening section should be documented according to the relevant controls outlined in ASD's ISM and the SSP Annex. 

All template text refers to a typical implementation of a system built using the Blueprint, and includes reference to organisational policies, processes and technical configurations to be implemented in addition to the technical controls that may be configured using guidance in the Blueprint. Any implementation implied by the below should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

When completing the below template, organisations should insert and update information where relevant to ensure it accurately represents their approach to operating system hardening. When complete, remove any instructional boxes throughout. 

{{% /alert %}}

Due to the number of applicable controls in ASD's [*Guidelines for System Hardening*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-system-hardening), guidance on system hardening has been split into its five sections for the purpose of this SSP. The following controls have been grouped by equipment types and as as they relate to hardening of operating systems within `<SYSTEM-NAME>`.

### Operating system selection, versions, releases and SOEs

#### Applicability

ISM controls relating to the operating system selection, releases and versions and standard operating environments (SOE) within `<SYSTEM-NAME>`'s system boundary are applicable to and covered by this section of the SSP. 

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

All vendors of operating systems used within `<SYSTEM-NAME>` have been assessed by `<ORGANISATION-NAME>` as demonstrating a commitment to secure-by-design and secure-by-default principles, use of memory-safe programming languages where possible, secure programming practices, and maintaining the security of their products.
- `<ORGANISATION-NAME>` [Vendor Assessment: Microsoft]({{<ref "security-and-governance/general-documentation">}})
- `<ORGANISATION-NAME>` [Vendor Assessment: Apple]({{<ref "security-and-governance/general-documentation">}})
- `<ORGANISATION-NAME>` [Vendor Assessment: `<VENDOR-3>`]({{<ref "security-and-governance/general-documentation">}})

`<SYSTEM-NAME>` uses Microsoft Intune for the enrolment and configuration of endpoints (including Windows 10, 11 and iOS endpoints), that serve as the SOE for `<SYSTEM-NAME>`.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

Technical controls for operating system hardening and SOEs within `<SYSTEM-NAME>` were configured with reference to ASD's [*Blueprint for Secure Cloud*](https://blueprint.asd.gov.au), and applied by `<ORGANISATION-NAME>` with regard to any malicious configurations that may have been injected. These controls will continue to be reviewed on an ongoing basis, with regard to the Blueprint and consideration of any malicious configurations that could be injected.

Operating systems used within `<SYSTEM-NAME>`'s system boundary, along with their releases and versions, are listed in the Operating System Releases table below. All versions used are 64-bit and are of either the latest or N-1 releases. Windows endpoints are configured via Intune to use Microsoft's [*General Availability Channel*](https://learn.microsoft.com/windows-server/get-started/servicing-channels-comparison).


| Component           | Vendor     | Operating System   | Release           | Version            |
| ------------------- | ---------- | ------------------ | ----------------- | ------------------ |
| Endpoints           | Microsoft  | Windows            | 22H2 (Windows 10) | 64-bit             |
|                     |            |                    | 23H2 (Windows 11) | (N/A: 64-bit only) |
| Mobile Devices      | Apple      | iOS                | 16                | (N/A: 64-bit only) |
|                     |            |                    | 17                | (N/A: 64-bit only) |
| `<ON-PREM SERVERS>` | Microsoft  | `<WINDOWS SERVER>` | `<2022>`          | (N/A: 64-bit only) |
| `<ON-PREM SERVERS>` | `<VENDOR>` | `<LINUX DISTRO>`   | `<RELEASE>`       | `<64-BIT>`         |

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Hardening Windows endpoints

#### Applicability

This section of the SSP covers the following control topics within the ISM's *Operating System Hardening* section, as they apply to all endpoints and servers within `<SYSTEM-NAME>`:
- Hardening operating system configurations
- Application management
- Application control
- Command Shell
- PowerShell
- Host-based Intrusion Prevention System
- Software firewall
- Antivirus software
- Device Access 

#### Organisational policies and processes implemented

`<ORGANISATION-NAME>` has not implemented any specific organisational policies or processes related to hardening operating system configurations for `<SYSTEM-NAME>` beyond ensuring implementation of the below technical controls as part of this System Security Plan, and reviewing all below configurations on an annual or more frequent basis. 

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

`<ORGANISATION-NAME>` has not implemented any specific organisational policies or processes relating to hardening operating systems within `<SYSTEM-NAME>` beyond ensuring implementation of the below technical controls as part of this SSP and reviewing the below configurations on at least an annual basis (if not more frequently). 

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Hardening server operating systems

{{% alert title="Blueprint guidance" color="info" %}}

While the Blueprint does provide guidance on hardening operating systems for servers, the section below is provided for organisations to describe their implementation of hardening of operating systems for servers where it is included within the authorisation boundary for system(s) built using the Blueprint, noting that hardening of operating systems for servers is often completed as part of a separate system and SSP specific to those servers.

Where an organisation appropriately assesses this within another document, it may choose to remove its implementation and assessment from this SSP. However, it is recommended that organisations consider also documenting their approach to hardening operating systems for servers here for a holistic capture of a system's context and associated risk.

{{% /alert %}}

#### Applicability

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Related information

#### Security & Governance

- `<ORGANISATION-NAME>` [Vendor Assessment: Microsoft]({{<ref "security-and-governance/general-documentation">}})
- `<ORGANISATION-NAME>` [Vendor Assessment: Apple]({{<ref "security-and-governance/general-documentation">}})
- `<ORGANISATION-NAME>` [Vendor Assessment: \<VENDOR-3>]({{<ref "security-and-governance/general-documentation">}})
- [Essential Eight: Patch Applications]({{< ref "patch-applications.md">}})
- [Essential Eight: Patch Operating Systems]({{< ref "patch-os.md">}})

#### Design

- [Windows Hardening]({{< ref "windows-hardening.md">}})
- [Microsoft Defender]({{< ref "microsoft-defender.md">}})
- [Windows Hardware Requirements]({{< ref "hardware-requirements.md">}})
- [Operating System]({{< ref "operating-system.md">}})
- [Windows Update and Patching]({{< ref "windows-update-and-patching.md">}})
- [iOS devices]({{< ref "ios-devices.md">}})
- [Endpoint Device Updates]({{<ref "device-updates">}})


#### External documentation

- ASD's [*Guidelines for System Hardening*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-system-hardening)
- ASD's [*Hardening Microsoft Windows 10 version 21H1 Workstations*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/hardening-microsoft-windows-10-version-21h1-workstations)
- [Apple iOS 16: iPhones Common Criteria Configuration Guide](https://www.niap-ccevs.org/MMO/Product/st_vid11349-agd.pdf)
- [Apple Platform Security](https://support.apple.com/guide/security/welcome/web)
- Microsoft's [*recommended block rules*](https://docs.microsoft.com/windows/security/threat-protection/windows-defender-application-control/Microsoft-recommended-block-rules) 
- Microsoft's [*recommended driver block rules*](https://docs.microsoft.com/windows/security/threat-protection/windows-defender-application-control/Microsoft-recommended-driver-block-rules) 
- ASD's [*Shifting the Balance of Cybersecurity Risk: Principles and Approaches for Security-by-Design and Default*](https://www.cyber.gov.au/about-us/view-all-content/publications/principles-and-approaches-for-security-by-design-and-default)
- ASD's [*The Case for Memory Safe Roadmaps*](https://www.cyber.gov.au/about-us/view-all-content/publications/case-memory-safe-roadmaps)