---
title: "Data Transfers"
linkTitle: "Data Transfers"
weight: 115
type: docs
description: This page provides a template and guidance to assist organisations in documenting their approach to data transfers associated with their system(s) built on ASD's Blueprint for Secure Cloud.
---

{{% alert title="Instruction" color="dark" %}}

The cryptography section of a System Security Plan (SSP) should document an organisation's approach to data transfers. As with other sections of the SSP, information in this section should be documented according to the relevant controls outlined in ASD's ISM and the SSP Annex. 

All template text refers to a typical implementation of a system built using the Blueprint, and includes reference to organisational policies, processes and technical configurations to be implemented in addition to the technical controls that may be configured using guidance from the Blueprint. Any implementation implied by the below text should not be considered as prescriptive of how organisations must scope, build, document, or assess its system.

When completing the below template, organisations should insert and update information where relevant to ensure it accurately represents their approach to data transfers. When complete, remove any instructional boxes throughout.

{{% /alert %}}

### Data transfers

#### Applicability

ISM controls relating to data transfers within `<SYSTEM-NAME>`'s system boundary are applicable to and covered by this section of the SSP. 

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

Data transfers associated with `<SYSTEM-NAME>` are performed in accordance with `<SYSTEM-NAME>`'s [Data Transfer Process]({{< ref "security-and-governance/general-documentation" >}}), which outlines the processes and methods that can be used to transfer data into or out of `<SYSTEM-NAME>`.

`<ORGANISATION-NAME>`'s Security Operations Centre (SOC) will monitor data transfer logs in accordance with `<SYSTEM-NAME>`'s [Continuous Monitoring Plan]({{< ref "security-and-governance/general-documentation" >}}).

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

Technical controls for `<SYSTEM-NAME>`'s implementation of data transfers are configured with reference to ASD's [*Blueprint for Secure Cloud*](https://blueprint.asd.gov.au) including the following technical configurations:
* Defender for Endpoint will scan all data copied onto Windows 11 devices
* event logs are generated when data is transferred from a Windows 11 endpoint to external media. These Logs are then centrally stored and monitored.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Related information

#### Security & Governance

* `<SYSTEM-NAME>`'s [Data Transfer Process]({{< ref "security-and-governance/general-documentation">}})
* `<SYSTEM-NAME>`'s [Continuous Monitoring Plan]({{< ref "security-and-governance/general-documentation">}})

#### Design

* [Platform Monitoring]({{< ref "platform-monitoring-auditing" >}})

#### Configuration

* None identified

#### External links

* ASD's [*Guidelines for Data Transfers*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-data-transfers)