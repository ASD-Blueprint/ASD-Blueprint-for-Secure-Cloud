---
title: "Media"
linkTitle: "Media"
weight: 65
type: docs
description: This page provides a template and guidance to assist organisations in documenting their approach to management of media usage, sanitisation, destruction and disposal associated with their system(s) built on ASD's Blueprint for Secure Cloud.
---

{{% alert title="Instruction" color="dark" %}}

The media section of a System Security Plan (SSP) should document an organisation's approach to management of usage, sanitisation, destruction and disposal of media. As with other sections of the SSP, information in the media section should be documented according to the relevant controls outlined in ASD's ISM and the SSP Annex. 

All template text refers to a typical implementation of a system built using the Blueprint, and includes reference to organisational policies, processes and technical configurations to be implemented in addition to the technical controls that may be configured using guidance in the Blueprint. Any implementation implied by the below should not be considered as prescriptive as to how organisations must scope, build, document, or assess a system.

When completing the below template, organisations should insert and update information where relevant to ensure it accurately represents their approach to managing media. When complete, remove any instructional boxes throughout. 

{{% /alert %}}

As `<ORGANISATION-NAME>`'s approach to implementing controls related to media is consistent across all controls addressed within this section, it does not delve into subsections but rather addresses the controls as a group. This approach is consistent with ASD's [*Guidelines for Media*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-media)

#### Applicability

ISM controls relating to the appropriate  selection usage, sanitisation, destruction, and disposal of media used within `<SYSTEM-NAME>`'s system boundary are applicable to and covered by this section of the SSP. 

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

The use, sanitisation, destruction, and disposal of media used with `<SYSTEM-NAME>` equipment is performed in accordance with `<ORGANISATION-NAME>`'s [Media Management Policy]({{<ref "security-and-governance/policies">}}) and associated SOPs:
* `<SYSTEM-NAME>` [Media Sanitisation Process]({{<ref "security-and-governance/general-documentation">}})
* `<SYSTEM-NAME>` [Media Destruction Process]({{<ref "security-and-governance/general-documentation">}})
* `<SYSTEM-NAME>` [Media Disposal Process]({{<ref "security-and-governance/general-documentation">}})

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical Controls Implemented

Technical controls for `<SYSTEM-NAME>`'s implementation relating to to the use, sanitisation, destruction, and disposal of media are configured with reference to ASD's [*Blueprint for Secure Cloud*](https://blueprint.asd.gov.au) and includes the following technical configurations:

* Windows endpoints are configured via Intune to implement Bitlocker AES-256 encryption for internal media

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Related Information

#### Security & Governance

* [Media Management Policy]({{<ref "security-and-governance/policies">}}) and associated SOPs:
* `<SYSTEM-NAME>` [Media Sanitisation Process]({{<ref "security-and-governance/general-documentation">}})
* `<SYSTEM-NAME>` [Media Destruction Process]({{<ref "security-and-governance/general-documentation">}})
* `<SYSTEM-NAME>` [Media Disposal Process]({{<ref "security-and-governance/general-documentation">}})

#### Design

*   [Device Management]({{<ref "design/platform/identity/devices">}})
*   [Device Security]({{<ref "design/platform/client/device-security">}})

#### Configuration

* [Microsoft Intune - Devices]({{< ref "configuration/intune/devices">}})
* [Microsoft Entra ID - Devices]({{< ref "configuration/entra-id/devices">}})

#### External documentation

* ASD's [*Guidelines for Media*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-media)