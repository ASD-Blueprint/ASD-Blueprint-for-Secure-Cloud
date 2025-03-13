---
title: "Regular Backups"
linkTitle: "Regular Backups"
weight: 045
type: docs
description: This page provides a template and guidance to assist organisations in documenting their approach to regular backups, as per the Essential Eight Maturity Model, associated with their system(s) built on ASD's Blueprint for Secure Cloud.
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

The Regular Backups mitigation strategy is applicable to mitigating the risk of losing system availability or important `<SYSTEM-NAME>` data as part of a ransomware attack, or other form of destructive attack, and ensuring that in the event of such an attack, `<SYSTEM-NAME>` services and data can be quickly restored.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Maturity Level

|                     |                    |
| :------------------ | ------------------ |
| Targeted:           | `<TARGET-LEVEL>`   |
| Currently Assessed: | `<ASSESSED-LEVEL>` |
|                     |                    |

### Implementation

#### Performing backups

{{% alert title="Essential Eight guidance" color="success" %}}

All maturity levels require that backups of data, applications and settings are:
* performed and retained in accordance with business criticality and business continuity requirements
* synchronised to enable restoration to a common point in time
* retained in a secure and resilient manner.

{{% /alert %}}

{{% alert title="Blueprint guidance" color="info" %}}

While the Blueprint does not provide specific guidance on performing data backups, the section below is provided for organisations to describe their specific implementation, including where this is included within the authorisation boundary of system(s) built using the Blueprint.

{{% /alert %}}

`<DESCRIBE APPROACH TO PERFORMING BACKUPS AS APPROPRIATE>`

#### Restoring from backups

{{% alert title="Essential Eight guidance" color="success" %}}

All maturity levels require that the organisation performs disaster recovery exercises that include testing the restoration of data, applications and settings from backups to a common point in time.

{{% /alert %}}

{{% alert title="Blueprint guidance" color="info" %}}

While the Blueprint does not provide specific guidance on performing disaster recovery exercises or otherwise restoring from data backups performed, the section below is provided for organisations to describe their approach to implementing and testing restoration procedures.

{{% /alert %}}

`<DESCRIBE APPROACH TO RESTORING FROM BACKUPS AS APPROPRIATE>`

#### Hardening backups

{{% alert title="Essential Eight guidance" color="success" %}}

Required hardening for backups is determined by the following table:

<div class="no-band-table">

| Account Type                                                   | Restriction Applied                                                          | ML1 | ML2 | ML3 |
| :------------------------------------------------------------- | :--------------------------------------------------------------------------- | :-: | :-: | :-: |
| Unprivileged Accounts:                                         | Cannot access backups belonging to other accounts:                           | Yes | Yes | Yes |
|                                                                | Prevented from modifying and deleting backups:                               | Yes | Yes | Yes |
|                                                                | Cannot access their own backups:                                             |  -  |  -  | Yes |
|                                                                |                                                                              |     |     |     |
| Privileged accounts (excluding backup administrator accounts): | Cannot access backups belonging to other accounts:                           |  -  | Yes | Yes |
|                                                                | Prevented from modifying and deleting backups:                               |  -  | Yes | Yes |
|                                                                | Cannot access their own backups:                                             |  -  |  -  | Yes |
|                                                                |                                                                              |     |     |     |
| Backup administrator accounts:                                 | Prevented from modifying and deleting backups during their retention period: |  -  |  -  | Yes |
|                                                                |                                                                              |     |     |     |

</div>

{{% /alert %}}

{{% alert title="Blueprint guidance" color="info" %}}

While the Blueprint does not provide specific guidance on hardening data backups, the section below is provided for organisations to describe their specific implementation, including where this is included within the authorisation boundary of system(s) built using the Blueprint.

{{% /alert %}}

`<DESCRIBE APPROACH TO HARDENING BACKUPS AS APPROPRIATE>`

### Related information

#### Security & Governance

* [System Management]({{<ref "system-management.md">}})
* [Essential Eight: Patch Applications]({{< ref "patch-applications.md">}})
* [Essential Eight: Patch Operating Systems]({{< ref "patch-os.md">}})
* [Essential Eight: Regular Backups]({{< ref "regular-backups.md">}})
* [System Administration Process]({{<ref "security-and-governance/general-documentation">}})

#### Design

* [Backup and Operational Management]({{<ref "design/platform/backup">}})
* [Data Lifecycle Management]({{<ref "design/shared-services/purview/data-lifecycle-management">}})

#### Configuration

* [Microsoft Intune - Profile Configurations]({{<ref "configuration/intune/devices/configuration-policies">}})
* [Device Management]({{<ref "configuration/defender/settings/endpoints/device-management.md">}})

#### External links

* ASD's [*Essential Eight*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/essential-eight)
* Microsoft's [Service Trust Portal](https://servicetrust.microsoft.com/)
* Microsoft's [*Guidance for meeting ASD's Essential Eight - Regular Backups*](https://learn.microsoft.com/compliance/essential-eight/e8-backups)