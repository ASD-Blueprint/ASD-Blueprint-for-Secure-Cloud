---
title: "Physical Security"
linkTitle: "Physical Security"
weight: 30
type: docs
description: This page provides a template and guidance to assist organisations in documenting their approach to physical security associated with their system(s) built on ASD's Blueprint for Secure Cloud.
---

{{% alert title="Instruction" color="dark" %}}

The physical security section of a System Security Plan (SSP) should document an organisation's approach to managing physical security associated with facilities and systems. As with other sections of the SSP, information in the physical security section should be documented according to the relevant controls outlined in ASD's ISM and the SSP Annex.

All template text refers to a typical implementation of a system built using the Blueprint, and includes reference to organisational policies, processes and technical configurations to be implemented in addition to the technical controls that may be configured using guidance in the Blueprint. Any implementation implied by the below should not be considered as prescriptive as to how organisations must scope, build, document, or assess a system.

When completing the below template, organisations should insert and update information where relevant to ensure it accurately represents their approach to physical security within their organisation. When complete, remove any instructional boxes throughout. 

{{% /alert %}}

As `<ORGANISATION-NAME>`'s approach to implementing controls related to physical security is consistent across all controls addressed within this section, it does not delve into subsections but rather addresses the controls as a group. This approach is consistent with ASD's [*Guidelines for Physical Security*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-physical-security). 

#### Applicability

{{% alert title="Blueprint guidance" color="info" %}}

While system(s) built using the Blueprint rely on Microsoft (and any other cloud or managed service providers used) for managing the physical security of facilities and systems that host their services, organisations that own system(s) built using the Blueprint are responsible for the physical security of all other components.

In particular, this is relevant to any server infrastructure hosting a hybrid deployment of system(s) built using the Blueprint and for any additional services, such as gateways or networking equipment where they are within the relevant system boundary.

{{% /alert %}}

`<ORGANISATION-NAME>` uses on-premises facilities and systems to host hybrid components of `<SYSTEM-NAME>`, as well as networking components for the use of ICT devices in `<ORGANISATION-NAME>`'s offices.

`<SYSTEM-NAME>` does not consider the direct management of these physical facilities or systems within its system boundary, and relies on the implementation from the following system assessments:

* `<ORG-NETWORKING-SYSTEM>`
* `<ORG-IDENTITY-SYSTEM>`

Use of laptops and/or iPhones by staff outside of `<ORGANISATION-NAME>`'s offices is in accordance with the [Enterprise Mobility]({{<ref "enterprise-mobility.md">}}) section of this SSP. However, `<SYSTEM-NAME>` endpoints and peripherals are also deployed in `<ORGANISATION-NAME>`'s offices as their primary place of operation.

`<ORGANISATION-NAME>` is responsible for the physical security of devices located at `<ORGANISATION-NAME>`'s` offices. 

#### Organisational  policies and processes implemented

Management of facilities and physical security is performed in accordance with `<ORGANISATION-NAME>`'s [Physical Security Policy]({{<ref "security-and-governance/policies">}}), which requires all organisational assets, including ICT equipment and media to be appropriately secured according to their use.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

Physical server hardware, networking devices, and cryptographic equipment are deployed in secure rooms within `<ORGANISATION-NAME>`'s offices, assessed to meet `<ZONE 2>` requirements as per the Department of Home Affair's Protective Security Policy Framework (PSPF).

Workstations are also deployed within `<ORGANISATION-NAME>`'s offices, assessed to meet `<ZONE 2>` requirements as per the PSPF.

`<SYSTEM-NAME>` also inherits implementation of physical security controls by `<ORGANISATION-NAME>`'s cloud and managed service providers.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Related information

#### Security & Governance

* [Physical Security Policy]({{<ref "security-and-governance/policies">}})
* [Enterprise Mobility]({{<ref "enterprise-mobility.md">}})

#### Design

* None identified


#### Configuration

* None identified

#### External documentation

* ASD's [*Guidelines for Physical Security*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-physical-security)