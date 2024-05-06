---
title: "Networking"
linkTitle: "Networking"
weight: 100
type: docs
description: This page provides a template and guidance to assist organisations in documenting their approach to networking design and configuration, wireless networks and service continuity for online services associated with their system(s) built on ASD's Blueprint for Secure Cloud.
---

{{% alert title="Instruction" color="dark" %}}

The networking section of a System Security Plan (SSP) should document an organisation's approach to networking design and configuration, wireless networks and service continuity for online services. As with other sections of the SSP, information in this section should be documented according to the relevant controls outlined in ASD's ISM and the SSP Annex. 

All template text refers to a typical implementation of a system built using the Blueprint, and includes reference to organisational policies, processes and technical configurations to be implemented in addition to the technical controls that may be configured using guidance from the Blueprint. Any implementation implied by the below text should not be considered as prescriptive of how organisations must scope, build, document, or assess its system.

When completing the below template, organisations should insert and update information where relevant to ensure it accurately represents their approach to networking design and configuration, wireless networks and service continuity for online services. When complete, remove any instructional boxes throughout. 

{{% /alert %}}

### Network design and configuration

#### Applicability

This section of the SSP is not applicable as physical networks are not implemented as part of `<SYSTEM-NAME>`. Instead, `<SYSTEM-NAME>` utilises `<ORGANISATION-NAME>`'s `WIRELESS-NETWORK-SYSTEM` and/or `WIRED-NETWORK-SYSTEM` to provide these services for `<SYSTEM-NAME>` ICT equipment. However, `<SYSTEM-NAME>` does implement extensive logical data flows for connecting to and between Microsoft 365 services and this section is applicable to the management of these data flows. 

`<SYSTEM-NAME>` also uses both physical and logical networking components as implemented by Microsoft as part of its Microsoft 365 services. `<ORGANISATION-NAME>` has assessed the implementation of these as documented in Microsoft's IRAP assessments, and available in Microsoft's [Service Trust Portal](https://servicetrust.microsoft.com/), and is satisfied with their implementation as they relate to `<SYSTEM-NAME>`.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

Technical documentation of `<SYSTEM-NAME>`'s logical data flows for connecting to and between Microsoft services are configured with reference to ASD's [*Blueprint for Secure Cloud*](https://blueprint.asd.gov.au) including the Microsoft 365 design, which includes a high-level network diagram showing the components that are considered in-scope and a last updated date.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

Technical controls for logical networking for connecting to and between Microsoft services associated with `<SYSTEM-NAME>` are configured with reference to ASD's [*Blueprint for Secure Cloud*](https://blueprint.asd.gov.au) including the following technical configurations:

* all communication between `<SYSTEM-NAME>`'s Windows endpoints and Microsoft 365 components is encrypted by TLS
* conditional Access policies are configured to restrict access to only specified geographic regions within Australia 
* `<SYSTEM-NAME>` also uses Microsoft Entra ID Identity Protection to analyse sign-in logs to identify and notify administrators when users are identified as originating from anonymous proxy IP addresses. 

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Wireless networks

#### Applicability

This section of the SSP is not applicable as `<SYSTEM-NAME>` does not implement wireless networks. Instead, `<SYSTEM-NAME>` utilises `<ORGANISATION-NAME>`'s `WIRELESS-NETWORK-SYSTEM` to provide these services for `<SYSTEM-NAME>` endpoints.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

No organisational policies or processes have been implemented in `<SYSTEM-NAME>` relating to wireless networks.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

No technical controls are implemented in `<SYSTEM-NAME>` relating to wireless networks.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Service continuity for online services

#### Applicability

This section of the SSP is not directly applicable to `<SYSTEM-NAME>` as `<SYSTEM-NAME>` does not include the hosting of online services, nor does it leverage the use of online services within `<ORGANISATION-NAME>` as part of its operation.

If and when `<SYSTEM-NAME>` is considered for hosting online services, `<ORGANISATION-NAME>` will assess and implement security controls relating to ensuring their service continuity at that time.

However, `<SYSTEM-NAME>` does use online services as implemented by Microsoft as part of its Microsoft 365 services. `<ORGANISATION-NAME>` has assessed the implementation of these as documented in Microsoft's IRAP assessments, and available in Microsoft's [Service Trust Portal](https://servicetrust.microsoft.com/) and is satisfied with their implementation as they relate to `<SYSTEM-NAME>`.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

No organisational policies or processes have been implemented in `<SYSTEM-NAME>` relating to the hosting of online services.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

No technical controls are implemented in `<SYSTEM-NAME>` relating to the hosting of online services.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Related information

#### Security & Governance

* None identified 

#### Design


* [Networking Designs ]({{< ref "design/endpoints/windows/configuration/networking.md">}})

#### Configuration

* [Networking ]({{< ref "configuration/networking">}})

#### External links

* ASD's [*Guidelines for Networking*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-networking)
* Microsoft's [Service Trust Portal](https://servicetrust.microsoft.com/)