---
title: "Multi-factor authentication"
weight: 020
type: docs
description: This page provides a template and guidance to assist organisations in documenting their approach to Multi-Factor Authentication, as per the Essential Eight maturity model, associated with their system(s) built on ASD's Blueprint for Secure Cloud.
---

{{% alert title="Instruction" color="dark" %}}

The Essential Eight sections of a System Security Plan (SSP) should document the Essential Eight maturity levels associated with implementation of a system. As with other sections of the SSP, information in this section should be documented according to the relevant controls outlined in ASD's ISM and the SSP Annex.

All template text refers to a typical implementation of a system built using the Blueprint, and includes reference to organisational policies, processes and technical configurations to be implemented in addition to the technical controls that may be configured using guidance from the Blueprint. Any implementation implied by the below text should not be considered as prescriptive of how the organisation must scope, build, document, or assess its system.

When completing the below template, organisations should insert and update information where relevant to ensure it accurately represents the Essential Eight maturity levels associated with implementation of their system. When complete, remove any instructional boxes throughout.

{{% /alert %}}

{{% alert title="Blueprint guidance" color="info" %}}

For applicable government organisations to meet the minimum requirements established under the [_Protective Security Policy Framework_ (PSPF)](https://www.protectivesecurity.gov.au/publications-library/protective-security-policy-framework-pspf-assessment-report-2023-24) maturity model, these organisations must implement Maturity Level Two for each of the below components of ASD's [_Essential Eight maturity model_](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/essential-eight).

As with implementation of ISM controls, the Blueprint does not itself _achieve_ any particular Essential Eight maturity levels, but rather assists organisations in designing and building systems to achieve their desired maturity level based on their own operating context.

{{% /alert %}}

### Applicability

The Multi-Factor Authentication (MFA) mitigation strategy is applicable to all access management within `<SYSTEM-NAME>`.

In particular, this is applicable to the configuration of Microsoft Entra ID `AND ON PREMISES ACTIVE DIRECTORY` to provide identity and access management (IAM) services for `<SYSTEM-NAME>`, particularly for governing access to Microsoft 365 services and to managed `<SYSTEM-NAME>` Windows endpoints.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Maturity level

|                     |                    |
| :------------------ | ------------------ |
| Targeted:           | `<TARGET-LEVEL>`   |
| Currently Assessed: | `<ASSESSED-LEVEL>` |

### Implementation

#### Authentication methods used

{{% alert title="Essential Eight guidance" color="success" %}}

The _Essential Eight maturity model_ requires that all MFA used is either:

- something users have and something users know, or
- something users have that is unlocked by something users know or are.

Applicability to online services is determined by the following table:

| System/Service                           |    Who    | That process, store or communicate  | ML1 |              ML2               |             ML3              |
| ---------------------------------------- | :-------: | ----------------------------------- | :-: | :----------------------------: | :--------------------------: |
| Third-party Online Services:             |   Users   | Sensitive or<br>Non-sensitive Data: | Any |  Phishing Resistant<br>_Only_  | Phishing Resistant<br>_Only_ |
| Organisation’s Online Services:          |   Users   | Sensitive Data:                     | Any |  Phishing Resistant<br>_Only_  | Phishing Resistant<br>_Only_ |
| Third-party Online Customer Services:    |   Users   | Sensitive Customer Data:            | Any |  Phishing Resistant<br>_Only_  | Phishing Resistant<br>_Only_ |
| Organisation’s Online Customer Services: |   Users   | Sensitive Customer Data:            | Any |  Phishing Resistant<br>_Only_  | Phishing Resistant<br>_Only_ |
| Online Customer Services:                | Customers | Sensitive Customer Data:            | Any | Phishing Resistant<br>_Option_ | Phishing Resistant<br>_Only_ |

Applicability to other systems and services is determined by the following table:

| System/Service     |         Who         | ML1 |             ML2              |             ML3              |
| ------------------ | :-----------------: | :-: | :--------------------------: | :--------------------------: |
| Systems:           |  Privileged Users:  |  -  | Phishing Resistant<br>_Only_ | Phishing Resistant<br>_Only_ |
|                    | Unprivileged Users: |  -  | Phishing Resistant<br>_Only_ | Phishing Resistant<br>_Only_ |
| Data Repositories: |  Privileged Users:  |  -  |              -               | Phishing Resistant<br>_Only_ |
|                    | Unprivileged Users: |  -  |              -               | Phishing Resistant<br>_Only_ |

{{% /alert %}}

{{% alert title="Blueprint guidance" color="info" %}}

The use of Microsoft services constitutes user access to online services per the above table, which at Maturity Level two and three requires phishing-resistant multi-factor authentication to be used. For consideration of options for authentication factors, see [Blueprint Design: Authentication](/design/platform/identity/authentication), noting that authentication method selection should distinguish between Microsoft Authenticator software token, push notification and passwordless sign-in methods, and Passkeys in Microsoft Authenticator. Passkeys in Microsoft Authenticator are phishing-resistant when configured as a Passkey (FIDO2) authentication method and enforced using phishing-resistant authentication strength.

Phishing-resistant authentication methods include passkeys (FIDO2), FIDO2 security keys, Windows Hello for Business and certificate-based authentication.

Similarly, authentication to Windows endpoints constitutes access to other systems, and should similarly require phishing-resistant multi-factor authentication as described above.

{{% /alert %}}

Microsoft Entra ID is configured as the central store for identity and access management within `<SYSTEM-NAME>`, acting as central management for user authentication and authorisation to various Single Sign On (SSO) services, including as for access to `<SYSTEM-NAME>` Windows endpoints.

Microsoft Entra ID is configured to utilise the following authentication methods:

| User group          | Authentication method       | Notes |
| ------------------- | --------------------------- | ----- |
| Unprivileged users: | `<Authentication method-1>` |       |
|                     | `<Authentication method-2>` |       |
| Privileged users:   | `<Authentication method-1>` |       |

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Logging

{{% alert title="Essential Eight guidance" color="success" %}}

Maturity Levels 2 and 3 require that

- all successful and unsuccessful MFA events to be captured from all systems and services and centrally logged
- event logs are protected from unauthorised modification and deletion.

{{% /alert %}}

The collection of event logs for monitoring of `<SYSTEM-NAME>` is performed in accordance with `<ORGANISATION-NAME>`’s Event Logging Policy, and includes the aggregation of the following logs into Microsoft Log Analytics:

| MFA Event (Microsoft 365 services) | Forwarded to Log Analytics |
| ---------------------------------- | :------------------------: |
| Successful MFA:                    |          `<YES>`           |
| Unsuccessful MFA:                  |          `<YES>`           |

| MFA Event (Workstations) | Forwarded to Log Analytics |
| ------------------------ | :------------------------: |
| Successful MFA:          |          `<YES>`           |
| Unsuccessful MFA:        |          `<YES>`           |

| MFA Event (`<Internet-facing servers>`) | Forwarded to Log Analytics |
| --------------------------------------- | :------------------------: |
| Successful MFA:                         |          `<YES>`           |
| Unsuccessful MFA:                       |          `<YES>`           |

| MFA Event (`<Non-internet-facing servers>`) | Forwarded to Log Analytics |
| ------------------------------------------- | :------------------------: |
| Successful MFA:                             |          `<YES>`           |
| Unsuccessful MFA:                           |          `<YES>`           |

| MFA Event (`<OTHER-SERVICE-1>`) | Forwarded to Log Analytics |
| ------------------------------- | :------------------------: |
| Successful MFA:                 |          `<YES>`           |
| Unsuccessful MFA:               |          `<YES>`           |

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Monitoring and response

{{% alert title="Essential Eight guidance" color="success" %}}

Maturity Levels 2 and 3 require all successful and unsuccessful MFA event logs from the following systems to be analysed in a timely manner to detect cyber security events:

| System                       | ML2 | ML3 |
| ---------------------------- | :-: | :-: |
| Internet-facing servers:     | Yes | Yes |
| Non-internet-facing servers: |  -  | Yes |
| Workstations:                |  -  | Yes |

Both Maturity Levels 2 and 3 also require the following:

- cyber security events are analysed in a timely manner to identify cyber security incidents
- as soon as possible after a cyber security incident occurs or is discovered the:
  - cyber security incident response plan is enacted.
  - incident is reported to the CISO, or one of their delegates
  - incident is reported to ASD.

{{% /alert %}}

{{% alert title="Blueprint guidance" color="info" %}}

The Blueprint provides limited guidance to support organisations in developing an approach for the response to cyber security incidents. However, the section below is provided for organisations to describe the measures implemented within their system.

Effective implementation of these controls is generally built on a combination of system-specific and whole of organisation processes, and may include the coordination of a number of teams and staff across an organisation.

{{% /alert %}}

`<SYSTEM-NAME>` utilises the Microsoft 365 Defender portal and `<SIEM-PRODUCT>` to assist in the identification of cyber security incidents.

This includes the processing, analysis, and response to the following event logs in a timely manner:

| MFA Event         | Microsoft 365 Services | Workstations | `<INTERNET-FACING-SERVERS>` | `<NON-INTERNET-FACING-SERVERS>` | `<OTHER SERVICES>` |
| ----------------- | :--------------------: | :----------: | :-------------------------: | :-----------------------------: | :----------------: |
| Successful MFA:   |        `<YES>`         |   `<YES>`    |     `<IMPLEMENTATION>`      |       `<IMPLEMENTATION>`        | `<IMPLEMENTATION>` |
| Unsuccessful MFA: |        `<YES>`         |   `<YES>`    |     `<IMPLEMENTATION>`      |       `<IMPLEMENTATION>`        | `<IMPLEMENTATION>` |

`<ORGANISATION-NAME>` has established a Security Operations Centre (SOC) to analyse cyber security events in a timely manner, a [Cyber Security Incident Register](/security-and-governance/general-documentation) and [Incident Response Plan](/security-and-governance/general-documentation) to facilitate the response to detected cyber security events in a timely and appropriate manner. This plan includes reporting all incidents to the `<ORGANISATION-NAME>` CISO and to ASD in a timely manner.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Related information

#### Security and governance

- [Authentication hardening](/security-and-governance/system-security-plan/system-hardening-authentication)
- [System management](/security-and-governance/system-security-plan/system-management)
- [System monitoring](/security-and-governance/system-security-plan/system-monitoring)
- [Cyber security incidents](/security-and-governance/system-security-plan/cyber-security-incidents)

#### Design

- [Authentication](/design/platform/identity/authentication)
- [Conditional access](/design/platform/identity/conditional-access)
- [Identity Monitoring and Auditing](/design/platform/identity/reporting-and-monitoring)
- [Platform monitoring](/design/platform/security/platform-monitoring-auditing)
- [Security Information and Event Monitoring](/design/platform/security/siem)

#### Configuration

- [Microsoft Entra ID - Protection](/configuration/entra-id/protection)
- [Endpoint security policies](/configuration/defender/endpoints/configuration-management/endpoint-security-policies)

#### External links

- ASD's [Essential Eight](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/essential-eight)
- Microsoft's [Service Trust Portal](https://servicetrust.microsoft.com)
- Microsoft's [_Guidance for meeting ASD's Essential Eight - Multi-Factor Authentication_](https://learn.microsoft.com/en-au/compliance/anz/e8-mfa)
