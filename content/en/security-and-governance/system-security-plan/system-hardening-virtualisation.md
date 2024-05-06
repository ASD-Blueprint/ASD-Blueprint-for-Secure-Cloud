---
title: "Virtualisation Hardening"
linkTitle: "System Hardening: Virtualisation"
weight: 74
type: docs
description: This page provides a template and guidance to assist organisations in documenting their approach to virtualisation hardening associated with their system(s) built on ASD's Blueprint for Secure Cloud.
---

{{% alert title="Instruction" color="dark" %}}

The virtualisation hardening section of a System Security Plan (SSP) should document an organisation's approach to use of a software-based isolation mechanism to share a physical server's hardware (virtualisation hardening). As with other sections of the SSP, information in the virtualisation hardening section should be documented according to the relevant controls outlined in ASD's ISM and the SSP Annex.

All template text refers to a typical implementation of a system built using the Blueprint, and includes reference to organisational policies, processes and technical configurations to be implemented in addition to the technical controls that may be configured using guidance in the Blueprint. Any implementation implied by the below should not be considered as prescriptive as to how organisations must scope, build, document, or assess a system.

When completing the below template, organisations should insert and update information where relevant to ensure it accurately represents their approach to operating system hardening. When complete, remove any instructional boxes throughout.

{{% /alert %}}

Due to the number of applicable controls in ASD's [*Guidelines for System Hardening*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-system-hardening), guidance on system hardening has been split into its five sections for the purpose of this SSP.

### Virtualisation hardening

#### Applicability

This section of the SSP is not applicable to `<SYSTEM-NAME>` as it does not utilise system virtualisation and as such the requirements of this section are not directly applicable to this SSP. However, `<SYSTEM-NAME>` does rely on other systems and services that implement virtualisation as part of their hosting.

In particular, `<SYSTEM-NAME>` leverages system virtualisation components as implemented by Microsoft as part of its Microsoft 365 services. `<ORGANISATION-NAME>` has assessed the implementation of these as documented in Microsoft's IRAP assessments, and available in Microsoft's [Service Trust Portal](https://servicetrust.microsoft.com/) and is satisfied with their implementation as they relate to `<SYSTEM-NAME>`.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

If and when system virtualisation is considered for future use as part of `<ORGANISATION-NAME>`'s `<SYSTEM-NAME>`, `<ORGANISATION-NAME>` will assess and implement appropriate security controls in relation to its use at that time.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

No technical controls are implemented in `<SYSTEM-NAME>` relating to virtualisation hardening.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Related information

#### Security & Governance

* [System Management]({{<ref "system-management.md">}})

#### Design

* [Windows Hardware]({{<ref "design/endpoints/windows/hardware">}})

#### Configuration

* [Microsoft Intune - Profile Configurations]({{<ref "configuration/intune/devices/configuration-profiles">}})


#### External documentation

* ASD's [*Guidelines for System Hardening*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-system-hardening)
* Microsoft's [Service Trust Portal](https://servicetrust.microsoft.com/)