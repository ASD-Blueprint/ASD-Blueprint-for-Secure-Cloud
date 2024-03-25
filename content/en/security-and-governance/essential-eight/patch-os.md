---
title: "Patch Operating Systems"
linkTitle: "Patch Operating Systems"
weight: 015
type: docs
description: This page provides a template and guidance to assist organisations in documenting their approach to patching operating systems, as per the Essential Eight Maturity Model, associated with their system(s) built on ASD's Blueprint for Secure Cloud.
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

The Patch Operating Systems mitigation strategy is applicable to the appropriate patching of operating systems for the following components of `<SYSTEM-NAME>`:

* Endpoints (Windows laptops and desktops)
* `<ON-PREMISES SERVERS>`

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Maturity Level

|                     |                    |
| :------------------ | ------------------ |
| Targeted:           | `<TARGET-LEVEL>`   |
| Currently Assessed: | `<ASSESSED-LEVEL>` |
|                     |                    |

### Implementation

#### Asset discovery

{{% alert title="Blueprint guidance" color="info" %}}

The Blueprint design does not provide guidance for management of asset discovery, though the below template serves as a guide of a typical implementation of this section for systems built using the Blueprint.

All maturity levels require that an automated method of asset discovery is used at least fortnightly to support the detection of assets for subsequent vulnerability scanning activities.

{{% /alert %}}

`<ASSET-DISCOVERY-TOOL>` is used to scan for all assets within `<SYSTEM-NAME>`.

`<ASSET-DISCOVERY-TOOL>` performs an asset discovery scan on a `<FORTNIGHTLY>` basis.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Vulnerability scanning

{{% alert title="Essential Eight guidance" color="success" %}}

All maturity levels require that a vulnerability scanner is used to identify missing patches or updates for vulnerabilities in a variety of applications per the below table, that this vulnerability scanner uses an up-to-date vulnerability database.

| Asset Type                               |      Layer       |  ML1 & ML2  |     ML3     |
| :--------------------------------------- | :--------------: | :---------: | :---------: |
| Internet-facing servers/network devices: | Operating System |    Daily    |    Daily    |
|                                          |     Drivers      | Fortnightly | Fortnightly |
|                                          |     Firmware     | Fortnightly | Fortnightly |
|                                          |                  |             |             |
| Other (including workstations):          | Operating System | Fortnightly | Fortnightly |
|                                          |     Drivers      | Fortnightly | Fortnightly |
|                                          |     Firmware     | Fortnightly | Fortnightly |
|                                          |                  |             |             |

{{% /alert %}}

{{% alert title="Blueprint guidance" color="info" %}}

The Blueprint design does not provide guidance for  management of vulnerability scanning, though the below template serves as a guide of a typical implementation of this section for systems built using the Blueprint.

Given that scanning is generally performed on an asset basis rather than an application basis, and that the patching of applications calls for weekly scans to be run the below describes the scanning of endpoints on a weekly basis, while on-premise servers are described as being scanned on a daily basis, particularly to account for internet facing servers including Exchange servers.

{{% /alert %}}

`<VULNERABILITY-SCANNING-TOOL>` is used to scan for all operating system, `DRIVER, AND FIRMWARE` vulnerabilities on endpoints and servers `AND NETWORK DEVICES` within `<SYSTEM-NAME>`. `<VULNERABILITY-SCANNING-TOOL>` is configured to update its vulnerability database on a `<nightly>` basis.

##### Windows Endpoints

`<VULNERABILITY-SCANNING-TOOL>` is configured to scan all Windows endpoints discovered by `<ASSET-DISCOVERY-TOOL>`, performing vulnerability scans on a `WEEKLY` basis.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

##### Hybrid servers

{{% alert title="Blueprint guidance" color="info" %}}

While the Blueprint does not provide specific guidance for hardening user applications for servers, the section below is provided for organisations to describe its implementation for the system, where this management is included within the authorisation boundary for the system built using the Blueprint. However, implementation of this hardening is also often completed as part of a separate system specific to these servers.

Where an organisation appropriately assesses this within another document, it may choose to remove its implementation and assessment from this particular SSP, though it is advised that organisations consider tracking this here for a holistic capture of the system context and associated risk.

{{% /alert %}}

`<VULNERABILITY-SCANNING-TOOL>` is configured to scan all hybrid servers discovered by `<ASSET-DISCOVERY-TOOL>`, performing vulnerability scans on a `daily` basis.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Patching

{{% alert title="Essential Eight guidance" color="success" %}}

The below table outlines the time-frames for different application types, as well as the criticality or exploitability of vulnerabilities in these applications.

Internet-facing servers/network devices

| Asset Type                               | Layer             | Critical Vulnerability<br>or Exploit Available | ML1 & ML2 |   ML3    |
| :--------------------------------------- | :---------------- | :--------------------------------------------: | :-------: | :------: |
| Internet-facing servers/network devices: | Operating System: |                      Yes                       | 48 Hours  | 48 Hours |
|                                          |                   |                       No                       |  2 Weeks  | 2 Weeks  |
|                                          | Drivers:          |                      Yes                       |     -     | 48 Hours |
|                                          |                   |                       No                       |     -     | 1 Month  |
|                                          | Firmware:         |                      Yes                       |     -     | 48 Hours |
|                                          |                   |                       No                       |     -     | 1 Month  |
| Other (including workstations):          | Operating System: |                      Yes                       |  1 Month  | 48 Hours |
|                                          |                   |                       No                       |  1 Month  | 1 Month  |
|                                          | Drivers:          |                      Yes                       |     -     | 48 Hours |
|                                          |                   |                       No                       |     -     | 1 Month  |
|                                          | Firmware:         |                      Yes                       |     -     | 48 Hours |
|                                          |                   |                                                |           |          |

{{% /alert %}}

{{% alert title="Blueprint guidance" color="info" %}}

The Blueprint provides guidance for using Microsoft Intune to deploy applications and patches to workstations, though the use of this mechanism generally relies on manual processes to choose to deploy relevant patches. The patching schedule described below aligns with Maturity Level Three, but should be adjusted to what is implemented within an organisation.

The below implementation also treats all on-premise hybrid servers as if they are internet connected for the purposes of the above table, but this should similarly be adjusted to what is implemented within the organisation.

{{% /alert %}}

##### Windows endpoints

Patches for operating systems on windows endpoints are managed and deployed using Microsoft Intune, and applied using Microsoft Defender for Endpoint.

In accordance with the [`<SYSTEM-NAME>` Vulnerability and Patch Management Process]({{<ref "security-and-governance/general-documentation">}}), vulnerabilities in operating systems`, DRIVERS AND FIRMWARE` discovered by `<VULNERABILITY-SCANNING-TOOL>` are applied within `48 HOURS` where these vulnerabilities are assessed as critical by vendors or when working exploits exist, and applied within `ONE MONTH` otherwise.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

##### Hybrid servers

Patches for operating systems`, DRIVERS AND FIRMWARE` on hybrid servers are applied using `<SERVER PATCH DEPLOYMENT MECHANISM>`.

In accordance with the [`<SYSTEM-NAME>` Vulnerability and Patch Management Process]({{<ref "security-and-governance/general-documentation">}}), vulnerabilities in operating systems`, drivers and firmware` discovered by `<VULNERABILITY-SCANNING-TOOL>` are applied within `48 hours` where these vulnerabilities are assessed as critical by vendors or when working exploits exist, and applied within `2 weeks` otherwise.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Removal of unsupported operating systems

{{% alert title="Essential Eight Guidance" color="success" %}}

All maturity levels require that operating systems that are no longer supported by vendors are removed.

Maturity Level Three requires that the latest release, or the previous release, of operating systems are used.

{{% /alert %}}

##### Windows endpoints

In accordance with the [`<SYSTEM-NAME>` Vulnerability and Patch Management Process]({{<ref "security-and-governance/general-documentation">}}), `<ORGANISATION-NAME>` will monitor Microsoft support for Windows, and ensure that all operating systems on workstations are removed prior to this support ending.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

##### Hybrid servers

In accordance with the [`<SYSTEM-NAME>` Vulnerability and Patch Management Process]({{<ref "security-and-governance/general-documentation">}}), `<ORGANISATION-NAME>` will monitor Microsoft support for Windows, and ensure that all operating systems on servers are removed prior to this support ending.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Related information

#### Security & Governance

* [System Management]({{<ref "system-management.md">}})
* [`<SYSTEM-NAME>` Vulnerability and Patch Management Process]({{<ref "security-and-governance/general-documentation">}})

#### Design

* [Endpoint Device Updates]({{<ref "device-updates">}})

#### External links

* ASD's [*Essential Eight*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/essential-eight)
* Microsoft's [Service Trust Portal](https://servicetrust.microsoft.com/)
* Microsoft's [*Guidance for meeting ASD's Essential Eight - Patch Operating Systems*](https://learn.microsoft.com/compliance/essential-eight/e8-patch-os)