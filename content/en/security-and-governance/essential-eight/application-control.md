---
title: "Application Control"
linkTitle: "Application Control"
weight: 030
type: docs
description: This page provides a template and guidance to assist organisations in documenting their approach to application control, as per the Essential Eight Maturity Model, associated with their system(s) built on ASD's Blueprint for Secure Cloud.
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

The application control mitigation strategy is applicable to the management of applications on the following `<SYSTEM-NAME>` components:
- Windows Endpoints
- `<HYBRID SERVERS>`

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Maturity level

|                     |                    |
| :------------------ | ------------------ |
| Targeted:           | `<TARGET-LEVEL>`   |
| Currently Assessed: | `<ASSESSED-LEVEL>` |
|                     |                    |

### Implementation

#### Windows endpoints

{{% alert title="Essential Eight guidance" color="success" %}}

Application control on workstations is required to apply to the following profiles and locations:

| Profiles and locations                                                      | ML1 | ML2 | ML3 |
| --------------------------------------------------------------------------- | :-: | :-: | :-: |
| User profiles                                                               | Yes | Yes | Yes |
| Temporary folders used by operating systems, web browsers and email clients | Yes | Yes | Yes |
| All other locations                                                         |  -  | Yes | Yes |
|                                                                             |     |     |     |

Application control on workstations is required to restrict the following filetypes:

| Filetypes                                                                   | ML1 | ML2 | ML3 |
| --------------------------------------------------------------------------- | :-: | :-: | :-: |
| Executables                                                                 | Yes | Yes | Yes |
| Software libraries                                                          | Yes | Yes | Yes |
| Scripts                                                                     | Yes | Yes | Yes |
| Installers                                                                  | Yes | Yes | Yes |
| Compiled HTML                                                               | Yes | Yes | Yes |
| HTML applications                                                           | Yes | Yes | Yes |
| Control panel applets                                                       | Yes | Yes | Yes |
| Drivers                                                                     |  -  |  -  | Yes |
|                                                                             |     |     |     |


In addition, the following Microsoft blocklists should be implemented:

| Blocklists                                                                  | ML1 | ML2 | ML3 |
| --------------------------------------------------------------------------- | :-: | :-: | :-: |
| Microsoft’s recommended application blocklist                               |  -  | Yes | Yes |
| Microsoft’s vulnerable driver blocklist                                     |  -  |  -  | Yes |
|                                                                             |     |     |     |

**Validation of rule-set**

Maturity Levels 2 and 3 additionally require that application control rule-sets on workstations are validated on an annual basis (if not more frequently).

{{% /alert %}}

Windows Defender Application Control (WDAC) is used to apply application control on `<SYSTEM-NAME>` workstations and is configured via Microsoft Intune to:

- prevent users (other than local administrators) from installing or uninstalling applications
- utilise a combination of hash, publisher certificate and path rules in enforcing defined application control policies
- restrict the execution of the following filetypes to a `<ORGANISATION-NAME>` approved set:
  - executables
  - software libraries
  - scripts
  - installers
  - compiled html
  - HTML applications
  - control panel applets
  - drivers
- implement [Microsoft’s recommended application blocklist](https://docs.microsoft.com/windows/security/threat-protection/windows-defender-application-control/Microsoft-recommended-block-rules) and [Microsoft’s vulnerable driver blocklist](https://docs.microsoft.com/windows/security/threat-protection/windows-defender-application-control/Microsoft-recommended-driver-block-rules).

A current list of `<SYSTEM-NAME>` allowed applications can be found in the `<SYSTEM-NAME>` Intune portal. As per `<SYSTEM-NAME>`'s [System Administration Process]({{<ref "security-and-governance/general-documentation">}}), `<ORGANISATION-NAME>` will continually review the list of allowed applications within these filetypes for relevant groups of users, including a specific annual review.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Internet-facing servers

{{% alert title="Essential Eight guidance" color="success" %}}

Application control on internet-facing servers is required to apply to the following profiles and locations:

| Profiles and locations                                                      | ML1 | ML2 | ML3 |
| --------------------------------------------------------------------------- | :-: | :-: | :-: |
| User profiles                                                               |  -  | Yes | Yes |
| Temporary folders used by operating systems, web browsers and email clients |  -  | Yes | Yes |
| All other locations                                                         |  -  | Yes | Yes |
|                                                                             |     |     |     |

Application control on internet-facing servers is required to restrict the following filetypes:

| Filetype              | ML1 | ML2 | ML3 |
| --------------------- | :-: | :-: | :-: |
| Executables           |  -  | Yes | Yes |
| Software libraries    |  -  | Yes | Yes |
| Scripts               |  -  | Yes | Yes |
| Installers            |  -  | Yes | Yes |
| Compiled HTML         |  -  | Yes | Yes |
| HTML applications     |  -  | Yes | Yes |
| Control panel applets |  -  | Yes | Yes |
| Drivers               |  -  |  -  | Yes |
|                       |     |     |     |

In addition, the following Microsoft blocklists should be implemented

| Blocklist                                     | ML1 | ML2 | ML3 |
| --------------------------------------------- | :-: | :-: | :-: |
| Microsoft’s recommended application blocklist |  -  | Yes | Yes |
| Microsoft’s vulnerable driver blocklist       |  -  |  -  | Yes |
|                                               |     |     |     |

**Validation of rule-set**

Maturity Levels 2 and 3 additionally require that application control rule-sets on internet-facing servers are validated on an annual basis (if not more frequently).

{{% /alert %}}

{{% alert title="Blueprint guidance" color="info" %}}

This section typically applies where the system built using the Blueprint implements an on-premise Microsoft Exchange server.

The Blueprint does not provide guidance for implementing application control on servers, though it is generally implemented using Group Policy, and should be detailed below.

{{% /alert %}}

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Non-internet-facing servers

{{% alert title="Essential Eight guidance" color="success" %}}

Application control on non-internet-facing servers is required to apply to the following profiles and locations:

| Profiles and locations                                                       | ML1 | ML2 | ML3 |
| ---------------------------------------------------------------------------- | :-: | :-: | :-: |
| User profiles:                                                               |  -  |  -  | Yes |
| Temporary folders used by operating systems, web browsers and email clients: |  -  |  -  | Yes |
| All other locations:                                                         |  -  |  -  | Yes |

Application control on non-internet-facing servers is required to restrict the following filetypes:

| Filetypes              | ML1 | ML2 | ML3 |
| ---------------------- | :-: | :-: | :-: |
| Executables:           |  -  |  -  | Yes |
| Software libraries:    |  -  |  -  | Yes |
| Scripts:               |  -  |  -  | Yes |
| Installers:            |  -  |  -  | Yes |
| Compiled HTML:         |  -  |  -  | Yes |
| HTML applications:     |  -  |  -  | Yes |
| Control panel applets: |  -  |  -  | Yes |
| Drivers:               |  -  |  -  | Yes |
|                        |     |     |     |

In addition, the following Microsoft blocklists should be implemented:

| Blocklist                                      | ML1 | ML2 | ML3 |
| ---------------------------------------------- | :-: | :-: | :-: |
| Microsoft’s recommended application blocklist: |  -  |  -  | Yes |
| Microsoft’s vulnerable driver blocklist:       |  -  |  -  | Yes |
|                                                |     |     |     |

*Validation of rule-set*

Maturity Levels 2 and 3 additionally require that application control rule-sets on non-internet-facing servers are validated on an annual basis (if not more frequently).

{{% /alert %}}

{{% alert title="Blueprint guidance" color="info" %}}

This section typically applies where the system built using the Blueprint implements an on-premise server for Active Directory services.

The Blueprint does not provide guidance for implementing application control on servers, though it is generally implemented using Group Policy, and should be detailed below.

{{% /alert %}}

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Logging

{{% alert title="Essential Eight guidance" color="success" %}}

Maturity Levels 2 and 3 require that:
- all allowed and blocked application control events are to be captured from all of the following and centrally logged:
  - workstations
  - internet-facing servers
  - non-internet-facing servers
- event logs are protected from unauthorised modification and deletion.                         

{{% /alert %}}

The collection of event logs for monitoring of `<SYSTEM-NAME>` is performed in accordance with `<ORGANISATION-NAME>`’s Event Logging Policy, and includes the aggregation of the following logs into Microsoft Log Analytics:

| Application Control Event (Workstations) | Forwarded to Log Analytics |
| :--------------------------------------- | :------------------------: |
| Allowed application execution:           |          `<YES>`           |
| Blocked application execution:           |          `<YES>`           |

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

| Application Control Event (`<Internet-facing servers>`) | Forwarded to Log Analytics |
| :------------------------------------------------------ | :------------------------: |
| Allowed application execution:                          |          `<YES>`           |
| Blocked application execution:                          |          `<YES>`           |
|                                                         |                            |

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

| Application Control Event (`<Non-Internet-facing servers>`) | Forwarded to Log Analytics |
| :---------------------------------------------------------- | :------------------------: |
| Allowed application execution:                              |          `<YES>`           |
| Blocked application execution:                              |          `<YES>`           |
|                                                             |                            |

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Monitoring and response

{{% alert title="Essential Eight guidance" color="success" %}}

Maturity Levels 2 and 3 require all allowed and blocked application control event logs from the following systems to be analysed in a timely manner to detect cyber security events:

| System                       | ML2 | ML3 |
| ---------------------------- | :-: | :-: |
| Internet-facing servers:     | Yes | Yes |
| Non-internet-facing servers: |  -  | Yes |
| Workstations:                |  -  | Yes |

Both Maturity Levels 2 and 3 also require the following:
- cyber security events are analysed in a timely manner to identify cyber security incidents
- as soon as possible after a cyber security incident occurs or is discovered the:
  - cyber security incident response plan is enacted
  - incident is reported to the Chief Information Security Officer (CISO), or one of their delegates
  - incident is reported to ASD.

{{% /alert %}}

{{% alert title="Blueprint guidance" color="info" %}}

The Blueprint provides limited guidance on developing an approach for response to cyber security incidents. However, the section below is provided for organisations to describe the measures implemented within their system(s) built on the Blueprint. 

Effective implementation of these controls is generally built on a combination of system-specific and whole of organisation processes, and may include the coordination of a number of teams and personnel across an organisation.

{{% /alert %}}

`<SYSTEM-NAME>` utilises the Microsoft 365 Defender portal and `<SIEM-PRODUCT>` to assist in the identification of cyber security incidents. 

This includes the processing, analysis, and response to the following event logs in a timely manner:

| Application Control Event      | Workstations | `<HYBRID SERVERS>` |
| ------------------------------ | :----------: | :----------------: |
| Allowed application execution: |    `YES`     | `<IMPLEMENTATION>` |
| Blocked application execution: |    `YES`     | `<IMPLEMENTATION>` |
|                                |              |                    |

`<ORGANISATION-NAME>` has established a Security Operations Centre (SOC) to analyse cyber security events in a timely manner, a [Cyber Security Incident Register]({{<ref "security-and-governance/general-documentation">}}) and [Incident Response Plan]({{<ref "security-and-governance/general-documentation">}}) to facilitate the response to detected cyber security events in a timely and appropriate manner. This plan includes reporting all incidents to `<ORGANISATION-NAME>`'s Chief Information Security Officer (CISO) and to ASD in a timely manner.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Related information

#### Security & Governance

- [System Management]({{<ref "system-management.md">}})
- [System Monitoring]({{<ref "system-monitoring.md">}})
- [Cyber Security Incidents]({{<ref "cyber-security-incidents.md">}})

#### Design

- None identified

#### External links

- ASD's [*Essential Eight*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/essential-eight)
- Microsoft's [Service Trust Portal](https://servicetrust.microsoft.com/)
- Microsoft's [*Guidance for meeting ASD's Essential Eight - Application Control*](https://learn.microsoft.com/compliance/essential-eight/e8-app-control)