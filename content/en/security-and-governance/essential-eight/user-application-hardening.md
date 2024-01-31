---
title: "User Application Hardening"
linkTitle: "User Application Hardening"
weight: 040
type: docs
description: This page provides a template and guidance to assist organisations in documenting their approach to use application hardening, as per the Essential Eight Maturity Model, associated with their system(s) built on ASD's Blueprint for Secure Cloud.
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

The User Application Hardening mitigation strategy is applicable to hardening of user applications on all `<SYSTEM-NAME>` workstations and servers.

### Maturity Level

|                     |                    |
| ------------------: | ------------------ |
|           Targeted: | `<TARGET-LEVEL>`   |
| Currently Assessed: | `<ASSESSED-LEVEL>` |
|                     |                    |

### Implementation

#### User application hardening

{{% alert title="Essential Eight guidance" color="success" %}}

All maturity levels require:

* Internet Explorer 11 is disabled or removed
* web browsers:
* security settings cannot be changed by users
* do not process Java from the internet
* do not process web advertisements from the internet.

In addition, Maturity Levels Two and Three require:
* web browsers are hardened using ASD and vendor hardening guidance, with the most restrictive guidance taking precedence when conflicts occur
* office productivity suites:
* security settings cannot be changed by users
* are hardened using ASD and vendor hardening guidance, with the most restrictive guidance taking precedence when conflicts occur
* Microsoft Office:
* is blocked from creating child processes
* is blocked from creating executable content
* is blocked from injecting code into other processes
* is configured to prevent activation of Object Linking and Embedding packages
* PDF software
* security settings cannot be changed by users
* is hardened using ASD and vendor hardening guidance, with the most restrictive guidance taking precedence when conflicts occur
* is blocked from creating child processes.

In addition, Maturity Level Three requires:
* .NET Framework 3.5 (includes .NET 2.0 and 3.0) is disabled or removed,
* Windows PowerShell 2.0 is disabled or removed, and
* PowerShell is configured to use Constrained Language Mode.

{{% /alert %}}

##### Workstations

**Internet Explorer 11**

Internet Explorer is not installed on `<SYSTEM-NAME>` workstations.

**Web browsers**

The following web browsers are allowed to operate on `<SYSTEM-NAME>` workstations:

| Microsoft Edge                                         | Restriction Applied                                                                                                 |
| :----------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| Security settings cannot be changed by users:          | `YES - RESTRICTED VIA WDAC`                                                                                         |
| Does not process Java from the internet:               | `YES - RESTRICTED VIA WDAC`                                                                                         |
| Does not process web advertisements from the internet: | `Yes - RESTRICTED VIA WDAC USING BUILT IN EDGE FUNCTIONALITY, AND BLOCKED VIA <ORGANISATION-NAME> <GATEWAY-SYSTEM>` |
|                                                        |                                                                                                                     |

| `e.g. GOOGLE CHROME`                                   | Restriction Applied |
| :----------------------------------------------------- | ------------------- |
| Security settings cannot be changed by users:          | `<IMPLEMENTATION>`  |
| Does not process Java from the internet:               | `<IMPLEMENTATION>`  |
| Does not process web advertisements from the internet: | `<IMPLEMENTATION>`  |
|                                                        |                     |

**Office productivity suites**

`<SYSTEM-NAME>` uses Microsoft Office as its sole office productivity suite, with the following hardening applied:

| Microsoft Office                                                           | Restriction Applied         |
| :------------------------------------------------------------------------- | --------------------------- |
| Security settings cannot be changed by users:                              | `YES - RESTRICTED VIA WDAC` |
| Hardened using the following guides:                                       | `<GUIDES USED>`             |
| Blocked from creating child processes:                                     | `YES - RESTRICTED VIA WDAC` |
| Blocked from creating executable content:                                  | `YES - RESTRICTED VIA WDAC` |
| Blocked from injecting code into other processes:                          | `YES - RESTRICTED VIA WDAC` |
| Configured to prevent activation of Object Linking and Embedding packages: | `YES - RESTRICTED VIA WDAC` |
|                                                                            |                             |

**PDF software**

The following PDF software is allowed to operate on `<SYSTEM-NAME>` workstations:

| `e.g. ADOBE ACROBAT`                          | Restriction Applied         |
| :-------------------------------------------- | --------------------------- |
| Security settings cannot be changed by users: | `YES - RESTRICTED VIA WDAC` |
| Hardened using the following guides:          | `<GUIDES USED>`             |
| Blocked from creating child processes:        | `YES - RESTRICTED VIA WDAC` |
|                                               |                             |

**Other software**

| Software                                        | Restriction Applied                         |
| :---------------------------------------------- | ------------------------------------------- |
| .NET Framework 3.5 (includes .NET 2.0 and 3.0:) | `<ENABLED>/<DISABLED>/<REMOVED>`            |
| Windows PowerShell 2.0:                         | `<ENABLED>/<DISABLED>/<REMOVED>`            |
| PowerShell:                                     | `<CONFIGURED TO USE CONFINED LANGUAGE MODE` |
|                                                 |                                             |

##### Servers

**Internet Explorer 11**

Internet Explorer is not installed on `<SYSTEM-NAME>` servers.

**Web browsers**

The following web browsers are allowed to operate on `<SYSTEM-NAME>` servers:

| Microsoft Edge                                         | Restriction Applied                                                                                                 |
| :----------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| Security settings cannot be changed by users:          | `YES - RESTRICTED VIA WDAC`                                                                                         |
| Does not process Java from the internet:               | `YES - RESTRICTED VIA WDAC`                                                                                         |
| Does not process web advertisements from the internet: | `Yes - RESTRICTED VIA WDAC USING BUILT IN EDGE FUNCTIONALITY, AND BLOCKED VIA <ORGANISATION-NAME> <GATEWAY-SYSTEM>` |
|                                                        |                                                                                                                     |

| `e.g. GOOGLE CHROME`                                   | Restriction Applied |
| :----------------------------------------------------- | ------------------- |
| Security settings cannot be changed by users:          | `<IMPLEMENTATION>`  |
| Does not process Java from the internet:               | `<IMPLEMENTATION>`  |
| Does not process web advertisements from the internet: | `<IMPLEMENTATION>`  |
|                                                        |                     |

**Office productivity suites**

Office productivity suites are not installed on `<SYSTEM-NAME>` servers.

**PDF software**

PDF software is not installed on `<SYSTEM-NAME>` servers.

**Other software**

| Software                                        | Restriction Applied                         |
| :---------------------------------------------- | ------------------------------------------- |
| .NET Framework 3.5 (includes .NET 2.0 and 3.0:) | `<ENABLED>/<DISABLED>/<REMOVED>`            |
| Windows PowerShell 2.0:                         | `<ENABLED>/<DISABLED>/<REMOVED>`            |
| PowerShell:                                     | `<CONFIGURED TO USE CONFINED LANGUAGE MODE` |
|                                                 |                                             |

#### Logging

{{% alert title="Essential Eight guidance" color="success" %}}

Maturity Levels Two and Three require that
* all command line process creation, PowerShell module logging, script block logging and transcription events to be captured from all of the following:
* workstations
* internet-facing servers
* non-internet-facing servers
* event logs are protected from unauthorised modification and deletion.                        

{{% /alert %}}

The collection of event logs for monitoring of `<SYSTEM-NAME>` is performed in accordance with `<ORGANISATION-NAME>`’s Event Logging Policy, and includes the aggregation of the following logs into Microsoft Log Analytics:

| Application Event (Workstations) | Forwarded to Log Analytics |
| :------------------------------- | :------------------------: |
| Command line process creation:   |          `<YES>`           |
| PowerShell module logging:       |          `<YES>`           |
| Script block logging:            |          `<YES>`           |
| Transcription:                   |          `<YES>`           |
|                                  |                            |

| Application Event (`<Internet-Facing Servers>`) | Forwarded to Log Analytics |
| :---------------------------------------------- | :------------------------: |
| Command line process creation:                  |          `<YES>`           |
| PowerShell module logging:                      |          `<YES>`           |
| Script block logging:                           |          `<YES>`           |
| Transcription:                                  |          `<YES>`           |
|                                                 |                            |

| Application Event (`<Non-Internet-Facing Servers>`) | Forwarded to Log Analytics |
| :-------------------------------------------------- | :------------------------: |
| Command line process creation:                      |          `<YES>`           |
| PowerShell module logging:                          |          `<YES>`           |
| Script block logging:                               |          `<YES>`           |
| Transcription:                                      |          `<YES>`           |
|                                                     |                            |

#### Monitoring and response

{{% alert title="Essential Eight guidance" color="success" %}}

Maturity Levels Two and Three require all command line process creation, PowerShell module logging, script block logging and transcription event logs from the following systems to be analysed in a timely manner:

| System                       | ML2 | ML3 |
| :--------------------------- | :-: | :-: |
| Internet-facing servers:     | Yes | Yes |
| Non-internet-facing servers: |  -  | Yes |
| Workstations:                |  -  | Yes |

Both Maturity Levels Two and Three also require the following:
* cyber security events are analysed in a timely manner to identify cyber security incidents
* as soon as possible after a cyber security incident occurs or is discovered the:
* cyber security incident response plan is enacted
* incident is reported to the Chief Information Security Officer, or one of their delegates
* incident is reported to ASD.

{{% /alert %}}

{{% alert title="Blueprint guidance" color="info" %}}

While the Blueprint provides limited guidance to support organisations in developing an approach for the response to cyber security incidents, the section below is provided for organisations to describe the measures implemented within their system. Effective implementation of these controls is generally built on a combination of system-specific and whole of organisation processes, and may include the coordination of a number of teams and staff across an organisation.

{{% /alert %}}

`<SYSTEM-NAME>` utilises the Microsoft 365 Defender portal and `<SIEM-PRODUCT>` to assist in the identification of cyber security incidents. 

This includes the processing, analysis, and response to the following event logs in a timely manner:

| Event                          | Workstations | `<HYBRID SERVERS>` |
| :----------------------------- | :----------: | :----------------: |
| Command line process creation: |   `<YES>`    |      `<YES>`       |
| PowerShell module logging:     |   `<YES>`    |      `<YES>`       |
| Script block logging:          |   `<YES>`    |      `<YES>`       |
| Transcription:                 |   `<YES>`    |      `<YES>`       |
|                                |              |                    |

`<ORGANISATION-NAME>` has established a Security Operations Centre (SOC) to analyse cyber security events in a timely manner, and a [Cyber Security Incident Register]({{<ref "security-and-governance/general-documentation">}}), and [Incident Response Plan]({{<ref "security-and-governance/general-documentation">}}) to facilitate the response to detected cyber security events in a timely and appropriate manner. This plan includes reporting all incidents to the `<ORGANISATION-NAME>` CISO and to ASD in a timely manner.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Related information

#### Security & Governance

* [User Application Hardening]({{<ref "system-hardening-user-apps.md">}})

#### Design

* None identified

#### External links

* ASD's [*Essential Eight*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/essential-eight)
* Microsoft's [Service Trust Portal](https://servicetrust.microsoft.com/)
* Microsoft's [*Guidance for meeting ASD's Essential Eight - User Application Hardening*](https://learn.microsoft.com/compliance/essential-eight/e8-app-harden)