---
title: "Restrict Administrative Privileges"
linkTitle: "Restrict Administrative Privileges"
weight: 025
type: docs
description: This page provides a template and guidance to assist organisations in documenting their approach to restricting administrative privileges, as per the Essential Eight Maturity Model, associated with their system(s) built on ASD's Blueprint for Secure Cloud.
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

The Restrict Administrative Privileges mitigation strategy is applicable to restricting and hardening all administrative access used for any components of `<SYSTEM-NAME>`.

### Maturity Level

|                     |                    |
| :------------------ | ------------------ |
| Targeted:           | `<TARGET-LEVEL>`   |
| Currently Assessed: | `<ASSESSED-LEVEL>` |
|                     |                    |

### Implementation

#### Privileged access requests

{{% alert title="Essential Eight guidance" color="success" %}}

| Privileged Access to:         | What                                         | ML1 | ML2 | ML3 |
| :---------------------------- | :------------------------------------------- | :-: | :-: | :-: |
| **Systems and Applications:** | Validated when first requested:              | Yes | Yes | Yes |
|                               | Disabled after 12 months unless revalidated: |  -  | Yes | Yes |
|                               | Disabled after 45 days of inactivity:        |  -  | Yes | Yes |
|                               |                                              |     |     |     |
| Data Repositories:            | Validated when first requested:              | Yes | Yes | Yes |
|                               | Disabled after 12 months unless revalidate:  |  -  | Yes | Yes |
|                               |                                              |     |     |     |

{{% /alert %}}

{{% alert title="Blueprint guidance" color="info" %}}

The Blueprint does not currently provide guidance for automating the disabling of accounts. Organisations building a system using the Blueprint should implement appropriate organisational processes for both validating initial privileged access requests, and disabling them where appropriate.

{{% /alert %}}

`<DETAIL PROCESSES FOR PRIVILEGED ACCESS REQUESTS AS APPROPRIATE>`

#### Operating environments

{{% alert title="Essential Eight guidance" color="success" %}}

All maturity levels require that privileged users use separate privileged and unprivileged operating environments, with the following restrictions:

| For Unprivileged Operating Environments:                                                      | ML1 | ML2 | ML3 |
| --------------------------------------------------------------------------------------------- | --- | --- | --- |
| Privileged accounts (excluding local administrator accounts) cannot logon to the environment. | Yes | Yes | Yes |
|                                                                                               |     |     |     |

| For Privileged Operating Environments:                                           | ML1 | ML2 | ML3 |
| :------------------------------------------------------------------------------- | :-: | :-: | :-: |
| Unprivileged accounts cannot logon to the environment:                           | Yes | Yes | Yes |
| The environment is not virtualised within an unprivileged operating environment: |  -  | Yes | Yes |
| Administrative activities are conducted through jump servers:                    |  -  | Yes | Yes |
| Administrative activities are conducted on Secure Admin Workstations:            |  -  |  -  | Yes |
|                                                                                  |     |     |     |

{{% /alert %}}

{{% alert title="Blueprint guidance" color="info" %}}

The Blueprint does not currently provide guidance for implementing hardened operating environments administrative activities, including jump servers of Secure Administrative Workstations. The implementation below describes a typical Maturity Level Three implementation for a system built using the Blueprint, and should be adapted to whatever implementation is used for the final system.

{{% /alert %}}

##### Unprivileged operating environment

`<SYSTEM-NAME>` standard workstations utilise Microsoft Entra ID as the source of identity and access management, and Conditional Access prevents privileged accounts from logging on.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

##### Privileged operating environment

`<SYSTEM-NAME>` utilises dedicated Secure Admin Workstations for privileged users.

These workstations utilise Microsoft Entra ID as the source of identity and access management, and Conditional Access prevents unprivileged accounts from logging on.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Privileged access

{{% alert title="Essential Eight guidance" color="success" %}}

The following restrictions are required for privileged accounts:

| Privileged account type                                             | Restriction                                                                                          | ML1 | ML2 | ML3 |
| ------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- | :-: | :-: | :-: |
| Privileged accounts explicitly authorised to access online services | Prevented from accessing the internet, email and web services                                        |  -  |  -  |  -  |
|                                                                     | Access is strictly limited to only what is required for users and services to undertake their duties | Yes | Yes | Yes |
|                                                                     | Just-in-time administration is used                                                                  |     |     | Yes |
|                                                                     |                                                                                                      |     |     |     |
| Other privileged accounts                                           | Prevented from accessing the internet, email and web services                                        | Yes | Yes | Yes |
|                                                                     | Access is strictly limited to only what is required for users and services to undertake their duties |  -  |  -  | Yes |
|                                                                     | Just-in-time administration is used                                                                  |  -  |  -  | Yes |
|                                                                     |                                                                                                      |     |     |     |

{{% /alert %}}

{{% alert title="Blueprint guidance" color="info" %}}

The Blueprint does not currently provide guidance for restricting privileged account activities. The implementation below describes a typical Maturity Level Three implementation for a system built using the Blueprint, and should be adapted to whatever implementation is used for the final system.

{{% /alert %}}

Privileged accounts for `<SYSTEM-NAME>` users are accounts are restricted from accessing the internet, email and web services, and are only able to access relevant Microsoft management portals.

Furthermore, these accounts have appropriate Role Based Access Control applied, with just-in-time administration required for each role to be granted to privileged users.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Management of credentials

{{% alert title="Essential Eight guidance" color="success" %}}

Maturity Levels Two and Three require that credentials for the following account types are long, unique, unpredictable and managed:

* Break Glass Accounts
* Local Administrator Accounts
* Service Accounts

{{% /alert %}}

`<SYSTEM-NAME>` provides a central identity store that governs and grants all user access prior to accessing resources on the system. Users are assigned specific user roles according to their business requirements.

Credentials for Break Glass Accounts, local administrator accounts and service accounts are required to be a minimum of 30 characters, uniquely and unpredictably generated, and managed in accordance with the `<SYSTEM-NAME>` [System Administration Process and Procedures]({{<ref "security-and-governance/policies">}}), including ensuring that all service accounts are created as Managed Service Accounts.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Protecting credentials

{{% alert title="Essential Eight guidance" color="success" %}}

Maturity Level Three Requires the following functionality to be enabled for protecting accounts:
* Memory integrity
* Local Security Authority protection
* Credential Guard
* Remote Credential Guard

{{% /alert %}}

`<SYSTEM-NAME>` implements the following required protections for user accounts:

| Protection                          | Configured |
| ----------------------------------- | ---------- |
| Memory integrity                    | `<YES>`    |
| Local Security Authority protection | `<YES>`    |
| Credential Guard                    | `<YES>`    |
| Remote Credential Guard             | `<N/A>`    |
|                                     |            |

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Logging

{{% alert title="Essential Eight guidance" color="success" %}}

Maturity Levels Two and Three require that
* all Allowed and blocked application control events to be captured from all systems and services and centrally logged
* event logs are protected from unauthorised modification and deletion.                         

{{% /alert %}}

The collection of event logs for monitoring of `<SYSTEM-NAME>` is performed in accordance with `<ORGANISATION-NAME>`’s Event Logging Policy, and includes the aggregation of the following logs into Microsoft Log Analytics:

| Event (Entra ID)               | Forwarded to Log Analytics |
| ------------------------------ | :------------------------: |
| Privileged access:             |          `<YES>`           |
| Privileged account management: |          `<YES>`           |
| Privileged group management:   |          `<YES>`           |
|                                |                            |

| System / Service                 | Event                   | Forwarded to Log Analytics |
| -------------------------------- | ----------------------- | :------------------------: |
| Microsoft 365 services:          | Privileged access event |          `<YES>`           |
| Workstations:                    | Privileged access event |          `<YES>`           |
| `<Internet-facing servers>`:     | Privileged access event |          `<YES>`           |
| `<Non-Internet-facing servers>`: | Privileged access event |          `<YES>`           |
| `<OTHER-SERVICE-1>`:             | Privileged access event |          `<YES>`           |
|                                  |                         |                            |

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Monitoring and response

{{% alert title="Essential Eight guidance" color="success" %}}

Maturity Levels Two and Three require all Privileged access, privileged account, and group management event logs from the following systems to be analysed in a timely manner to detect cyber security events:

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

| Event               | Workstations |    `<Hybrid servers>`     |
| :------------------ | :----------: | :-----------------------: |
| Privileged access:  |    `Yes`     | `<Detail implementation>` |
| Privileged account: |    `Yes`     | `<Detail implementation>` |
| Group management:   |    `Yes`     | `<Detail implementation>` |
|                     |              |                           |

`<ORGANISATION-NAME>` has established a Security Operations Centre (SOC) to analyse cyber security events in a timely manner, and a [Cyber Security Incident Register]({{<ref "security-and-governance/general-documentation">}}), and [Incident Response Plan]({{<ref "security-and-governance/general-documentation">}}) to facilitate the response to detected cyber security events in a timely and appropriate manner. This plan includes reporting all incidents to the `<ORGANISATION-NAME>` CISO and to ASD in a timely manner.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Related information

#### Security & Governance

* [System Management]({{<ref "system-management.md">}})
* [System Monitoring]({{<ref "system-monitoring.md">}})
* [Cyber Security Incidents]({{<ref "cyber-security-incidents.md">}})
* [System Administration Process and Procedures]({{<ref "security-and-governance/policies">}})

#### Design

* [Authentication]({{<ref "design/platform/identity/authentication.md" >}})
* [Entra ID Protection]({{< ref "design/platform/identity/protection.md" >}})
* [Windows Security]({{<ref "design/endpoints/windows/security">}})

#### Configuration

* [Microsoft Entra ID - Users]({{<ref "configuration/entra-id/users">}})
* [Microsoft Intune - Profile Configurations]({{<ref "configuration/intune/devices/configuration-policies">}})
* [Entra ID Protection]({{<ref "configuration/entra-id/protection">}})
* [Intune Endpoint Security]({{<ref "configuration/intune/endpoint-security">}})

#### External links

* ASD's [*Essential Eight*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/essential-eight)
* Microsoft's [Service Trust Portal](https://servicetrust.microsoft.com/)
* Microsoft's [*Guidance for meeting ASD's Essential Eight - Restrict Administrative Privileges*](https://learn.microsoft.com/compliance/essential-eight/e8-admin)