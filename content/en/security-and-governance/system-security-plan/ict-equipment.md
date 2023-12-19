---
title: "ICT Equipment"
linkTitle: "ICT Equipment"
weight: 60
type: docs
description: This page provides a template and guidance to assist organisations in documenting their approach to management of ICT equipment associated with their system(s) built on ASD's Blueprint for Secure Cloud.
---

{{% alert title="Instruction" color="dark" %}}

The ICT equipment section of a System Security Plan (SSP) should document an organisation's approach to ICT equipment use, maintenance, repairs, sanitisation, destruction and disposal. As with other sections of the SSP, information in the ICT equipment section should be documented according to the relevant controls outlined in ASD's ISM and the SSP Annex. 

All template text refers to a typical implementation of a system built using the Blueprint, and includes reference to organisational policies, processes and technical configurations to be implemented in addition to the technical controls that may be configured using guidance in the Blueprint. Any implementation implied by the below should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

When completing the below template, organisations should insert and update information where relevant to ensure it accurately represents their approach to managing ICT equipment. When complete, remove any instructional boxes throughout. 

{{% /alert %}}

As `<ORGANISATION-NAME>`'s approach to implementing controls related to ICT equipment is consistent across all controls addressed within this section, it does not delve into subsections but rather addresses the controls as a group. This approach is consistent with ASD's [*Guidelines for ICT Equipment*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-ict-equipment).

#### Applicability


ISM controls relating to the appropriate selection, use, maintenance, repair, sanitisation, destruction, and disposal of `<SYSTEM-NAME>` equipment listed under technical controls implemented are covered by this section of the SSP. 

`<SYSTEM-NAME>` also relies on the implementation of controls within the following system assessments:

- `<ORG-NETWORKING-SYSTEM>`
- `<ORG-IDENTITY-SYSTEM>`

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

Selection, use, maintenance, repairs, sanitisation, destruction and disposal of `<SYSTEM-NAME>` equipment is performed according to `<ORGANISATION-NAME>`'s [ICT Equipment Management Policy]({{<ref "security-and-governance/general-documentation">}}) and associated standard operating procedures (SOPs):
- `<SYSTEM-NAME>` [ICT Equipment Maintenance Process]({{<ref "security-and-governance/general-documentation">}})
- `<SYSTEM-NAME>` [ICT Equipment Sanitisation Process]({{<ref "security-and-governance/general-documentation">}})
- `<SYSTEM-NAME>` [ICT Equipment Destruction Process]({{<ref "security-and-governance/general-documentation">}})
- `<SYSTEM-NAME>` [ICT Equipment Disposal Process]({{<ref "security-and-governance/general-documentation">}})

In accordance with `<ORGANISATION-NAME>`'s ICT Equipment Management Policy, all vendors of ICT equipment used for `<SYSTEM-NAME>` have been assessed by `<ORGANISATION-NAME>` as demonstrating a commitment to secure-by-design and secure-by-default principles, use of memory-safe programming languages where possible, secure programming practices and maintaining the security of their products more broadly.
- `<ORGANISATION-NAME>` [Vendor Assessment: Microsoft]({{<ref "security-and-governance/general-documentation">}})
- `<ORGANISATION-NAME>` [Vendor Assessment: Apple]({{<ref "security-and-governance/general-documentation">}})
- `<ORGANISATION-NAME>` [Vendor Assessment: `<VENDOR-3>`]({{<ref "security-and-governance/general-documentation">}})

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

`<SYSTEM-NAME>` uses the below ICT equipment within its authorisation boundary, with technical controls for `<SYSTEM-NAME>`'s hardening of ICT equipment performed with reference to the following guidance:

| Equipment Type       | Make/Model      | Purpose                                          | Hardening Guides Referenced                     |
|----------------------|-----------------|--------------------------------------------------|-------------------------------------------------|
| Laptop Endpoint      | `<MAKE, MODEL>` | Endpoint for general users                       | ASD's [*Blueprint for Secure Cloud*](https://blueprint.asd.gov.au)                |
|                      |                 |                                                  | ASD [*Windows 10 21H1 Hardening Guide*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/hardening-microsoft-windows-10-version-21h1-workstations)                     |
| Desktop Endpoint     | `<MAKE, MODEL>` | Endpoint for select office users                 | ASD's [*Blueprint for Secure Cloud*](https://blueprint.asd.gov.au)                |
|                      |                 |                                                  | ASD [*Windows 10 21H1 Hardening Guide*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/hardening-microsoft-windows-10-version-21h1-workstations)                     |
| Mobile               | Apple iPhone 14 | Mobile phone for general users                   | ASD's [*Blueprint for Secure Cloud*](https://blueprint.asd.gov.au)                |
|                      |                 |                                                  | Apple's [*iOS 16: iPhones Common Criteria Configuration Guide*](https://www.niap-ccevs.org/MMO/Product/st_vid11349-agd.pdf) |
| `(Further examples)` |                 |                                                  |                                                 |
| Peripheral - Headset | `<MAKE, MODEL>` | Use with Microsoft Teams Calls                          | None                                            |
| Peripheral - Dock    | `<MAKE, MODEL>` | Connection of monitor and peripherals to laptops | None                                            |
| Peripheral - Monitor | `<MAKE, MODEL>` | Use with laptop and desktop endpoints            | None                                            |

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Related information

#### Security & Governance

- [ICT Equipment Management Policy]({{<ref "security-and-governance/general-documentation">}})
- `<SYSTEM-NAME>` [ICT Equipment Maintenance Process]({{<ref "security-and-governance/general-documentation">}})
- `<SYSTEM-NAME>` [ICT Equipment Sanitisation Process]({{<ref "security-and-governance/general-documentation">}})
- `<SYSTEM-NAME>` [ICT Equipment Destruction Process]({{<ref "security-and-governance/general-documentation">}})
- `<SYSTEM-NAME>` [ICT Equipment Disposal Process]({{<ref "security-and-governance/general-documentation">}})

#### Design

-   None Applicable

#### External documentation

- ASD's [*Guidelines for ICT Equipment*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-ict-equipment)
- ASD's [*Windows 10 21H1 Hardening Guide*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/hardening-microsoft-windows-10-version-21h1-workstations)