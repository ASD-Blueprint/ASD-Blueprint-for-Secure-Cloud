---
title: "Procurement and Outsourcing"
linkTitle: "Procurement and Outsourcing"
weight: 20
type: docs
description: This page provides a template and guidance to assist organisations in documenting their approach to procurement and outsourcing associated with their system(s) built on ASD's Blueprint for Secure Cloud.
---

{{% alert title="Instruction" color="dark" %}}

The procurement and outsourcing section of a System Security Plan (SSP) should document an organisation's approach to management of suppliers of applications, ICT equipment and services associated with systems built using the Blueprint. As with other sections of the SSP, information in the procurement and outsourcing section should be documented according to the relevant controls outlined in ASD's ISM and the SSP Annex.

All template text refers to a typical implementation of a system built using the Blueprint, and includes reference to organisational policies, processes and technical configurations to be implemented in addition to the technical controls that may be configured using guidance in the Blueprint. Any implementation implied by the below should not be considered as prescriptive as to how organisations must scope, build, document, or assess a system.

When completing the below template, organisations should insert and update information where relevant to ensure it accurately represents their approach to management of suppliers of applications, ICT equipment and services within their organisation. When complete, remove any instructional boxes throughout. 

{{% /alert %}}

As `<ORGANISATION-NAME>`'s overall approach to implementing controls related to procurement and outsourcing is consistent across all controls addressed within this section, it does not delve into subsections but rather addresses the controls as a group. 

### Cyber supply chain risk management

#### Applicability

{{% alert title="Blueprint guidance" color="info" %}}

This section of a SSP is directly applicable to the management of an organisation's relationship with Microsoft as a service provider, including as a supplier of operating systems and applications. Similarly, this section is also applicable to the procurement of any other hardware, software or services used within a system built using the Blueprint, including:

* Laptops, endpoints and peripherals
* Server hardware
* Networking equipment
* On-premise server applications
* SaaS products

{{% /alert %}}

`<ORGANISATION-NAME>` uses Azure, Microsoft 365, and other cloud-based Software as a Service (SaaS) products as shared services, as well as Information and Communication Technology (ICT) equipment for client and on-premises components of `<SYSTEM-NAME>`. As such, controls related to cyber supply chain risk management are directly applicable to `<SYSTEM-NAME>`.

`<ORGANISATION-NAME>` is responsible for implementing administrative controls to govern the direct management of supply chain risks and security for `<SYSTEM-NAME>`.

#### Organisational policies and processes implemented

Endpoints, networking, ICT equipment and relevant operating systems and applications should be procured through existing `<ORGANISATION-NAME>` supply arrangements. ICT equipment has been procured for `<SYSTEM-NAME>` using these existing procurement arrangements.

The following suppliers are used to procure ICT equipment and software for `<SYSTEM-NAME>`:

| Provider Name               | Equipment or Software Provided                    | Notes     |
| --------------------------- | ------------------------------------------------- | --------- |
| Microsoft                   | Windows Operating System and related applications | `<NOTES>` |
| Apple                       | iOS Operating System and related applications     | `<NOTES>` |
| Apple                       | iPhones                                           | `<NOTES>` |
| `<HARDWARE-MANUFACTURER-1>` | `<LAPTOPS>`                                       | `<NOTES>` |
| `<HARDWARE-MANUFACTURER-2>` | `<SERVER EQUIPMENT>`                              | `<NOTES>` |
| `<HARDWARE-MANUFACTURER-3>` | `<FIREWALL DEVICE>`                               | `<NOTES>` |
| `<HARDWARE-MANUFACTURER-4>` | `<PRINTERS>`                                      | `<NOTES>` |
| `<HARDWARE-MANUFACTURER-5>` | `<FIDO2 HARDWARE KEYS>`                           | `<NOTES>` |
|                             |                                                   |           |
|                             |                                                   |           |

#### Technical controls implemented

No technical controls are implemented in `<SYSTEM-NAME>` relating to cyber supply chain risk management.

### Managed services

#### Applicability

{{% alert title="Blueprint guidance" color="info" %}}

The Blueprint does not inherently leverage the use of Managed Service Providers (MSPs). However, the section below is provided for organisations to describe their use of MSPs in the implementation of systems built on using the Blueprint.

{{% /alert %}}

`<ORGANISATION-NAME>` uses managed services in the delivery and operation of `<SYSTEM-NAME>`. As such, controls related to managed services are directly applicable to `<SYSTEM-NAME>`. `<ORGANISATION-NAME>` is responsible for implementing administrative controls to govern the administration and oversight of managed services for `<SYSTEM-NAME>`.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

`<SYSTEM-NAME>` only uses managed services that have been procured through existing `<ORGANISATION-NAME>` supply arrangements. 

The following Managed Service Providers (MSPs) are used in relation to `<SYSTEM-NAME>`:

**`<MANAGED SERVICE PROVIDER 1>`**

| MSP Name                                    | `<MSP-NAME>`                                                          |
| ------------------------------------------- | --------------------------------------------------------------------- |
| Managed service name                        | `<MSP-SERVICE>`                                                       |
| Purpose of managed service                  | `<PURPOSE>`                                                           |
| Sensitivity/classification of data involved | `<PROTECTED>`                                                         |
| Due date for next security assessment       | `<MMM-YYYY>`                                                          |
| Contractual arrangements                    | [`<LINK>`]({{<ref "security-and-governance/general-documentation">}}) |
| Point of contact                            | `<MSP-POC-NAME>`                                                      |
| Contact email                               | `<CONTACT-EMAIL>`                                                     |
| 24/7 contact phone                          | `<+61X XX XXX XXX>`                                                   |

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

No technical controls are implemented in `<SYSTEM-NAME>` relating to procurement or outsourcing of managed services.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Cloud services

#### Applicability

`<ORGANISATION-NAME>` utilises cloud services in the delivery and operation of `<SYSTEM-NAME>`. As such, controls relating to cloud services are directly applicable to `<SYSTEM-NAME>`. `<ORGANISATION-NAME>` is responsible for implementing administrative controls to govern the direct management of outsourced cloud services for `<SYSTEM-NAME>`.

#### Organisational policies and processes implemented

`<SYSTEM-NAME>` only uses cloud services that have been procured through existing `<ORGANISATION-NAME>` supply arrangements. `All cloud services have been configured to store and process data solely in Australia`.

The following cloud services providers are used in relation to `<SYSTEM-NAME>`:

##### Microsoft

**Contractual details and contacts**

| Field                                                | Value                                                                       |
| ---------------------------------------------------- | --------------------------------------------------------------------------- |
| Completed IRAP Assessment                            | Yes ([<`LINK`>]({{<ref "security-and-governance/general-documentation">}})) |
| Completed Vendor Assessment by `<ORGANISATION-NAME>` | Yes ([<`LINK`>]({{<ref "security-and-governance/general-documentation">}})) |
| Due date for next security assessment                | `<MMM-YYYY>`                                                                |
| Contractual arrangements                             | [<`LINK`>]({{<ref "security-and-governance/general-documentation">}})       |
| Point of contact                                     | `<CSP-POC-NAME>`                                                            |
| Contact email                                        | `<CONTACT-EMAIL>`                                                           |
| 24/7 contact phone                                   | `<+61X XX XXX XXX>`                                                         |


**Entra ID**

| Field                                                         | Value           |
| ------------------------------------------------------------- | --------------- |
| Included in latest Microsoft IRAP assessment                  | Yes             |
| Included in latest Vendor Assessment by `<ORGANISATION-NAME>` | `Yes`           |
| Purpose of using service                                      | `<PURPOSE>`     |
| Description of data involved                                  | `<DESCRIPTION>` |
| Sensitivity/classification of data involved                   | `<PROTECTED>`   |
| Availability regions used                                     | `<REGION>`      |

**Purview**

| Field                                                         | Value           |
| ------------------------------------------------------------- | --------------- |
| Included in latest Microsoft IRAP assessment                  | Yes             |
| Included in latest Vendor Assessment by `<ORGANISATION-NAME>` | `Yes`           |
| Purpose of using service                                      | `<PURPOSE>`     |
| Description of data involved                                  | `<DESCRIPTION>` |
| Sensitivity/classification of data involved                   | `<PROTECTED>`   |
| Availability regions used                                     | `<REGION>`      |


**Defender**

| Field                                                         | Value           |
| ------------------------------------------------------------- | --------------- |
| Included in latest Microsoft IRAP assessment                  | Yes             |
| Included in latest Vendor Assessment by `<ORGANISATION-NAME>` | `Yes`           |
| Purpose of using service                                      | `<PURPOSE>`     |
| Description of data involved                                  | `<DESCRIPTION>` |
| Sensitivity/classification of data involved                   | `<PROTECTED>`   |
| Availability regions used                                     | `<REGION>`      |


**Exchange Online**

| Field                                                         | Value           |
| ------------------------------------------------------------- | --------------- |
| Included in latest Microsoft IRAP assessment                  | Yes             |
| Included in latest Vendor Assessment by `<ORGANISATION-NAME>` | `Yes`           |
| Purpose of using service                                      | `<PURPOSE>`     |
| Description of data involved                                  | `<DESCRIPTION>` |
| Sensitivity/classification of data involved                   | `<PROTECTED>`   |
| Availability regions used                                     | `<REGION>`      |


**Exchange Online Protection**

| Field                                                         | Value           |
| ------------------------------------------------------------- | --------------- |
| Included in latest Microsoft IRAP assessment                  | Yes             |
| Included in latest Vendor Assessment by `<ORGANISATION-NAME>` | `Yes`           |
| Purpose of using service                                      | `<PURPOSE>`     |
| Description of data involved                                  | `<DESCRIPTION>` |
| Sensitivity/classification of data involved                   | `<PROTECTED>`   |
| Availability regions used                                     | `<REGION>`      |


**SharePoint Online**

| Field                                                         | Value           |
| ------------------------------------------------------------- | --------------- |
| Included in latest Microsoft IRAP assessment                  | Yes             |
| Included in latest Vendor Assessment by `<ORGANISATION-NAME>` | `Yes`           |
| Purpose of using service                                      | `<PURPOSE>`     |
| Description of data involved                                  | `<DESCRIPTION>` |
| Sensitivity/classification of data involved                   | `<PROTECTED>`   |
| Availability regions used                                     | `<REGION>`      |


**OneDrive for Business**

| Field                                                         | Value           |
| ------------------------------------------------------------- | --------------- |
| Included in latest Microsoft IRAP assessment                  | Yes             |
| Included in latest Vendor Assessment by `<ORGANISATION-NAME>` | `Yes`           |
| Purpose of using service                                      | `<PURPOSE>`     |
| Description of data involved                                  | `<DESCRIPTION>` |
| Sensitivity/classification of data involved                   | `<PROTECTED>`   |
| Availability regions used                                     | `<REGION>`      |


**Teams**

| Field                                                         | Value           |
| ------------------------------------------------------------- | --------------- |
| Included in latest Microsoft IRAP assessment                  | Yes             |
| Included in latest Vendor Assessment by `<ORGANISATION-NAME>` | `Yes`           |
| Purpose of using service                                      | `<PURPOSE>`     |
| Description of data involved                                  | `<DESCRIPTION>` |
| Sensitivity/classification of data involved                   | `<PROTECTED>`   |
| Availability regions used                                     | `<REGION>`      |


**Forms**

| Field                                                         | Value           |
| ------------------------------------------------------------- | --------------- |
| Included in latest Microsoft IRAP assessment                  | Yes             |
| Included in latest Vendor Assessment by `<ORGANISATION-NAME>` | `Yes`           |
| Purpose of using service                                      | `<PURPOSE>`     |
| Description of data involved                                  | `<DESCRIPTION>` |
| Sensitivity/classification of data involved                   | `<PROTECTED>`   |
| Availability regions used                                     | `<REGION>`      |


**Power Automate**

| Field                                                         | Value           |
| ------------------------------------------------------------- | --------------- |
| Included in latest Microsoft IRAP assessment                  | Yes             |
| Included in latest Vendor Assessment by `<ORGANISATION-NAME>` | `Yes`           |
| Purpose of using service                                      | `<PURPOSE>`     |
| Description of data involved                                  | `<DESCRIPTION>` |
| Sensitivity/classification of data involved                   | `<PROTECTED>`   |
| Availability regions used                                     | `<REGION>`      |


**Power BI**

| Field                                                         | Value           |
| ------------------------------------------------------------- | --------------- |
| Included in latest Microsoft IRAP assessment                  | Yes             |
| Included in latest Vendor Assessment by `<ORGANISATION-NAME>` | `Yes`           |
| Purpose of using service                                      | `<PURPOSE>`     |
| Description of data involved                                  | `<DESCRIPTION>` |
| Sensitivity/classification of data involved                   | `<PROTECTED>`   |
| Availability regions used                                     | `<REGION>`      |


**Power Apps**

| Field                                                         | Value           |
| ------------------------------------------------------------- | --------------- |
| Included in latest Microsoft IRAP assessment                  | Yes             |
| Included in latest Vendor Assessment by `<ORGANISATION-NAME>` | `Yes`           |
| Purpose of using service                                      | `<PURPOSE>`     |
| Description of data involved                                  | `<DESCRIPTION>` |
| Sensitivity/classification of data involved                   | `<PROTECTED>`   |
| Availability regions used                                     | `<REGION>`      |


**Log Analytics**

| Field                                                         | Value           |
| ------------------------------------------------------------- | --------------- |
| Included in latest Microsoft IRAP assessment                  | Yes             |
| Included in latest Vendor Assessment by `<ORGANISATION-NAME>` | `Yes`           |
| Purpose of using service                                      | `<PURPOSE>`     |
| Description of data involved                                  | `<DESCRIPTION>` |
| Sensitivity/classification of data involved                   | `<PROTECTED>`   |
| Availability regions used                                     | `<REGION>`      |


**Whiteboard**

| Field                                                         | Value           |
| ------------------------------------------------------------- | --------------- |
| Included in latest Microsoft IRAP assessment                  | Yes             |
| Included in latest Vendor Assessment by `<ORGANISATION-NAME>` | `Yes`           |
| Purpose of using service                                      | `<PURPOSE>`     |
| Description of data involved                                  | `<DESCRIPTION>` |
| Sensitivity/classification of data involved                   | `<PROTECTED>`   |
| Availability regions used                                     | `<REGION>`      |


**Planner**

| Field                                                         | Value           |
| ------------------------------------------------------------- | --------------- |
| Included in latest Microsoft IRAP assessment                  | Yes             |
| Included in latest Vendor Assessment by `<ORGANISATION-NAME>` | `Yes`           |
| Purpose of using service                                      | `<PURPOSE>`     |
| Description of data involved                                  | `<DESCRIPTION>` |
| Sensitivity/classification of data involved                   | `<PROTECTED>`   |
| Availability regions used                                     | `<REGION>`      |


**Viva Learning**

| Field                                                         | Value           |
| ------------------------------------------------------------- | --------------- |
| Included in latest Microsoft IRAP assessment                  | Yes             |
| Included in latest Vendor Assessment by `<ORGANISATION-NAME>` | `Yes`           |
| Purpose of using service                                      | `<PURPOSE>`     |
| Description of data involved                                  | `<DESCRIPTION>` |
| Sensitivity/classification of data involved                   | `<PROTECTED>`   |
| Availability regions used                                     | `<REGION>`      |



##### `<PROVIDER-2>`

**Contractual details and contacts**

| Field                                 | Value                                                                 |
| ------------------------------------- | --------------------------------------------------------------------- |
| Due date for next security assessment | `<MMM-YYYY>`                                                          |
| Contractual arrangements              | [<`LINK`>]({{<ref "security-and-governance/general-documentation">}}) |
| Point of contact                      | `<CSP-POC-NAME>`                                                      |
| Contact email                         | `<CONTACT-EMAIL>`                                                     |
| 24/7 contact phone                    | `<+61X XX XXX XXX>`                                                   |

**`<SERVICE 1>`**

| Field                                                         | Value           |
| ------------------------------------------------------------- | --------------- |
| Included in latest `<PROVIDER-2>` IRAP assessment             | `Yes`           |
| Included in latest Vendor Assessment by `<ORGANISATION-NAME>` | `Yes`           |
| Purpose of using service                                      | `<PURPOSE>`     |
| Description of data involved                                  | `<DESCRIPTION>` |
| Sensitivity/classification of data involved                   | `<PROTECTED>`   |
| Availability regions used                                     | `<REGION>`      |

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

No technical controls are implemented in `<SYSTEM-NAME>` relating to the procurement or outsourcing of cloud services.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### External links

* ASD's [*Guidelines for Procurement and Outsourcing*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-procurement-and-outsourcing)
* Microsoft's [Service Trust Portal](https://servicetrust.microsoft.com/)