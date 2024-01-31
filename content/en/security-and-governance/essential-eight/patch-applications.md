---
title: "Patch Applications"
linkTitle: "Patch Applications"
weight: 010
type: docs
description: This page provides a template and guidance to assist organisations in documenting their approach to patching applications, as per the Essential Eight Maturity Model, associated with their system(s) built on ASD's Blueprint for Secure Cloud.
---

{{% alert title="Instruction" color="dark" %}}

The Essential Eight sections of a System Security Plan (SSP) should document the Essential Eight Maturity levels associated with implementation of a system. As with other sections of the SSP, information in the email section should be documented according to the relevant controls outlined in ASD's ISM and the SSP Annex. 

All template text refers to a typical implementation of a system built using the Blueprint, and includes reference to organisational policies, processes and technical configurations to be implemented in addition to the technical controls that may be configured using guidance from the Blueprint. Any implementation implied by the below text should not be considered as prescriptive of how the organisation must scope, build, document, or assess its system.

When completing the below template, organisations should insert and update information where relevant to ensure it accurately represents the Essential Eight Maturity levels associated with implementation of their system. When complete, remove any instructional boxes throughout. 

{{% /alert %}}

{{% alert title="Blueprint guidance" color="info" %}}

For applicable government organisations to meet the minimum requirements established under the [*Protective Security Policy Framework* (PSPF)](https://www.protectivesecurity.gov.au/publications-library/policy-10-safeguarding-data-cyber-threats) maturity model, these organisations must implement Maturity Level Two for each of the below components of ASD's [*Essential Eight Maturity Model*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/essential-eight).

As with implementation of ISM controls, the Blueprint does not itself *achieve* any particular Essential Eight Maturity levels, but rather assists organisations in designing and building systems to achieve their desired maturity level based on their own operating context.

{{% /alert %}}

### Applicability

The Patch Applications mitigation strategy is applicable to the appropriate patching of applications for the following components of `<SYSTEM-NAME>`:

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

{{% alert title="Essential Eight guidance" color="success" %}}

All maturity levels require that an automated method of asset discovery is used at least fortnightly to support the detection of assets for subsequent vulnerability scanning activities.

{{% /alert %}}

{{% alert title="Blueprint guidance" color="info" %}}

The Blueprint design does not provide guidance for direct management of asset discovery, though the below template serves as a guide of a typical implementation of this section for systems built using the Blueprint.

{{% /alert %}}

`<ASSET-DISCOVERY-TOOL>` is used to scan for all assets within `<SYSTEM-NAME>`.

`<ASSET-DISCOVERY-TOOL>` performs an asset discovery scan on a `<FORTNIGHTLY>` basis.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Vulnerability scanning

{{% alert title="Essential Eight guidance" color="success" %}}

All maturity levels require that a vulnerability scanner is used to identify missing patches or updates for vulnerabilities in a variety of applications per the below table, that this vulnerability scanner uses an up-to-date vulnerability database.

| Application Type    |  ML1   |     ML2     |     ML3     |
| :------------------ | :----: | :---------: | :---------: |
| Online services:    | Daily  |    Daily    |    Daily    |
| Core applications:* | Weekly |   Weekly    |   Weekly    |
| Other applications: |   -    | Fortnightly | Fortnightly |
|                     |        |             |             |

**For the purposes of the above table, "Core Applications" are defined as office productivity suites, web browsers and their extensions, email clients, PDF software and security products.*

{{% /alert %}}

{{% alert title="Blueprint guidance" color="info" %}}

The Blueprint design does not provide guidance for direct management of vulnerability scanning, though the below template serves as a guide of a typical implementation of this section for systems built using the Blueprint.

Given that scanning is generally performed on an asset basis rather than an application basis, the below describes the scanning of all applications on endpoints on a weekly basis, while on-premise servers are described as being scanned on a daily basis (to account for the requirements outlined in *Patch Operating Systems*), particularly to account for internet facing servers including Exchange servers.

It is assumed for the below that the system built using the Blueprint does not host online services.

{{% /alert %}}

`<VULNERABILITY-SCANNING-TOOL>` is used to scan for all application vulnerabilities on endpoints and servers within `<SYSTEM-NAME>`. `<VULNERABILITY-SCANNING-TOOL>` is configured to update its vulnerability database on a `<nightly>` basis.

##### Windows endpoints

`<VULNERABILITY-SCANNING-TOOL>` is configured to scan all Windows endpoints discovered by `<ASSET-DISCOVERY-TOOL>`, performing vulnerability scans on a `weekly` basis.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

##### Hybrid servers

`<VULNERABILITY-SCANNING-TOOL>` is configured to scan all hybrid servers discovered by `<ASSET-DISCOVERY-TOOL>`, performing vulnerability scans on a `daily` basis.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

##### Servers for online services

`<SYSTEM-NAME>` does not include the hosting of online services, nor does it leverage the use of online services within `<ORGANISATION-NAME>` as part of its operation, and as such the scanning of vulnerabilities in these services is not applicable.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Patching

{{% alert title="Essential Eight guidance" color="success" %}}

The below table outlines the time-frames for different application types, as well as the criticality or exploitability of vulnerabilities in these applications.

| Application Type    | Critical Vulnerability<br>or Exploit Available |   ML1    |   ML2    |   ML3    |
| :------------------ | :--------------------------------------------: | :------: | :------: | :------: |
| Online services:    |                      Yes                       | 48 Hours | 48 Hours | 48 Hours |
|                     |                       No                       | 2 Weeks  | 2 Weeks  | 2 Weeks  |
|                     |                                                |          |          |          |
| Core applications:* |                      Yes                       | 2 Weeks  | 2 Weeks  | 48 Hours |
|                     |                       No                       | 2 Weeks  | 2 Weeks  | 2 Weeks  |
|                     |                                                |          |          |          |
| Other applications: |                      Yes                       |    -     | 1 Month  | 1 Month  |
|                     |                       No                       |    -     | 1 Month  | 1 Month  |
|                     |                                                |          |          |          |

**For the purposes of the above table, "Core Applications" are defined as office productivity suites, web browsers and their extensions, email clients, PDF software and security products.*

{{% /alert %}}

{{% alert title="Blueprint guidance" color="info" %}}

The Blueprint provides guidance for using Microsoft Intune to deploy applications and patches to workstations, though the use of this mechanism generally relies on manual processes to choose to deploy relevant patches.

{{% /alert %}}

##### Windows endpoints

Patches for all applications on windows endpoints are managed and deployed using Microsoft Intune, and applied using Microsoft Defender for Endpoint.

In accordance with the [`<SYSTEM-NAME>` Vulnerability and Patch Management Process]({{<ref "security-and-governance/general-documentation">}}), vulnerabilities in office productivity suites, web browsers and their extensions, email clients, PDF software, Adobe Flash Player, and security products discovered by `<VULNERABILITY-SCANNING-TOOL>` are applied within `48 hours` where these vulnerabilities are assessed as critical by vendors or when working exploits exist, and applied within `2 weeks` otherwise.

Patches for vulnerabilities in all other applications on `<SYSTEM-NAME>` endpoints are applied within `1 month`.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

##### Hybrid servers

Patches for all applications on hybrid servers are applied using `<server patch deployment mechanism>`.

In accordance with the [`<SYSTEM-NAME>` Vulnerability and Patch Management Process]({{<ref "security-and-governance/general-documentation">}}), vulnerabilities in web browsers and security products discovered by `<VULNERABILITY-SCANNING-TOOL>` are applied within `48 hours` where these vulnerabilities are assessed as critical by vendors or when working exploits exist, and applied within `2 weeks` otherwise.

`<SYSTEM-NAME>` hybrid servers do not have office productivity suites, web browser extensions, email clients, PDF software (other than web browsers), or Adobe Flash Player installed.

Patches for vulnerabilities in all other applications on `<SYSTEM-NAME>` hybrid servers are applied within `1 month`.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

##### Servers for online services

`<SYSTEM-NAME>` does not include the hosting of online services, nor does it leverage the use of online services within `<ORGANISATION-NAME>` as part of its operation, and as such the application of patches for these services is not applicable.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Removal of unsupported applications

{{% alert title="Essential Eight guidance" color="success" %}}

All maturity levels require that online services, as well as any office productivity suites, web browsers and their extensions, email clients, PDF software, Adobe Flash Player, and security products that are no longer supported by vendors are removed.

{{% /alert %}}

##### Windows endpoints

In accordance with the [`<SYSTEM-NAME>` Vulnerability and Patch Management Process]({{<ref "security-and-governance/general-documentation">}}), `<ORGANISATION-NAME>` will monitor vendor support of applications used for all `<SYSTEM-NAME>` components, and ensure that all unsupported applications are removed prior to this support ending.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

##### Hybrid servers

In accordance with the [`<SYSTEM-NAME>` Vulnerability and Patch Management Process]({{<ref "security-and-governance/general-documentation">}}), `<ORGANISATION-NAME>` will monitor vendor support of applications used for all `<SYSTEM-NAME>` components, and ensure that all unsupported applications are removed prior to this support ending.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

##### Servers for online services

`<SYSTEM-NAME>` does not include the hosting of online services, nor does it leverage the use of online services within `<ORGANISATION-NAME>` as part of its operation, and as such the removal of unsupported online services is not applicable.

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
* Microsoft's [*Guidance for meeting ASD's Essential Eight - Patch Applications*](https://learn.microsoft.com/compliance/essential-eight/e8-patch-app)