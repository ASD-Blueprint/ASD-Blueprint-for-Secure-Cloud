---
title: "Evaluated Products"
linkTitle: "Evaluated Products"
weight: 55
type: docs
description: This page provides a template and guidance to assist organisations in documenting their approach to evaluation of products used in association with their system(s) built on ASD's Blueprint for Secure Cloud.
---

{{% alert title="Instruction" color="dark" %}}

The evaluated products section of a System Security Plan (SSP) should document an organisation's approach to procuring and using evaluated products. As with other sections of the SSP, information in the evaluated products section should be documented according to the relevant controls outlined in ASD's ISM and the SSP Annex. 

All template text refers to a typical implementation of a system built using the Blueprint, and includes reference to organisational policies, processes and technical configurations to be implemented in addition to the technical controls that may be configured using guidance in the Blueprint. Any implementation implied by the below should not be considered as prescriptive as to how organisations must scope, build, document, or assess a system.

When completing the below template, organisations should insert and update information where relevant to ensure it accurately represents their approach to procuring and using evaluated products. When complete, remove any instructional boxes throughout. 

{{% /alert %}}

As `<ORGANISATION-NAME>`'s approach to implementing controls related to evaluated products is consistent across all controls addressed within this section, it does not delve into subsections but rather addresses the controls as a group. This approach is consistent with ASD's [*Guidelines for Evaluated Products*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-evaluated-products).

#### Applicability

{{% alert title="Blueprint guidance" color="info" %}}

The below template and guidance are written as they relate to the products used and configured using the Blueprint, including Microsoft Windows and Apple iOS. When using the Blueprint, organisations should pay particular attention to any additional products used within its scope and add further information as required.

{{% /alert %}}

ISM controls relating to the procurement and use of evaluated products including applications, operating systems and devices within `<SYSTEM-NAME>` are applicable to and covered by this section of the SSP. 

`<SYSTEM-NAME>` uses the following evaluated products:

* Microsoft Windows 10
* Microsoft Windows 11
* Apple iOS 17: iPhones (Apple iOS 16 is the latest release to be certified under Common Criteria - [iOS 16 CC details](https://www.niap-ccevs.org/Product/Compliant.cfm?PID=11349))
* `<MICROSOFT WINDOWS SERVER 2022>`

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

The procurement and use of evaluated products including applications, operating systems and devices for `<SYSTEM-NAME>` is performed in accordance with `<ORGANISATION-NAME>`'s [Evaluated Products Policy]({{< ref "security-and-governance/general-documentation">}}) and associated SOPs:
* `<SYSTEM-NAME>` [`<SOP-1>`]({{< ref "security-and-governance/general-documentation">}})
* `<SYSTEM-NAME>` [`<SOP-2>`]({{< ref "security-and-governance/general-documentation">}})

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

Technical controls for `<SYSTEM-NAME>`'s management of evaluated products are configured with reference to ASD's [*Blueprint for Secure Cloud*](https://blueprint.asd.gov.au), and includes the following technical configurations:

`<DETAIL CONFIGURATION OF EVALUATED PRODUCTS AS APPROPRIATE>`

### Related information

#### Security & Governance

* [Evaluated Products Policy]({{< ref "security-and-governance/general-documentation">}})
  
#### Design

* None identified

#### External links

* [Apple iOS 16: iPhones - Protection Profile for Mobile Device Fundamentals Version 3.3: Certification Report](https://www.commoncriteriaportal.org/files/epfiles/st_vid11349-vr.pdf)
* [Apple iOS 16: iPhones Common Criteria Configuration Guide](https://www.niap-ccevs.org/MMO/Product/st_vid11349-agd.pdf)
* Microsoft's [Windows 11, Windows Server 2022, and other Windows OSes PP Certification Report](https://www.commoncriteriaportal.org/files/epfiles/2*022-21-INF-3955.pdf)
* ASD's [*Guidelines for Evaluated Products*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-evaluated-products)