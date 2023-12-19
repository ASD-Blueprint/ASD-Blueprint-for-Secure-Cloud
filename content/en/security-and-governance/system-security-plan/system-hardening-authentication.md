---
title: "Authentication Hardening"
linkTitle: "System Hardening: Authentication"
weight: 73
type: docs
description: This page provides a template and guidance to assist organisations in documenting their approach to authentication hardening associated with their system(s) built on ASD's Blueprint for Secure Cloud.
---

{{% alert title="Instruction" color="dark" %}}

The authentication hardening section of a System Security Plan (SSP) should document an organisation's approach to hardening user authentication. As with other sections of the SSP, information in the server application hardening section should be documented according to the relevant controls outlined in ASD's ISM and the SSP Annex.

All template text refers to a typical implementation of a system built using the Blueprint, and includes reference to organisational policies, processes and technical configurations to be implemented in addition to the technical controls that may be configured using guidance in the Blueprint. Any implementation implied by the below should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

When completing the below template, organisations should insert and update information where relevant to ensure it accurately represents their approach to operating system hardening. When complete, remove any instructional boxes throughout. 

{{% /alert %}}

Due to the number of applicable controls in ASD's [*Guidelines for System Hardening*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-system-hardening), guidance on system hardening has been split into its five sections for the purpose of this SSP.

### Authentication hardening

#### Applicability

This section of the SSP is applicable to the hardening of authentication methods within the system boundary of `<SYSTEM-NAME>`.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

`<SYSTEM-NAME>` provides a central identity store that governs and grants all user access prior to accessing `<SYSTEM-NAME>` resources. Users are assigned specific user roles according to their business requirements.

Credentials for break glass accounts, local administrator accounts and service accounts are required to be a minimum of 30 characters, uniquely and unpredictably generated, and managed in accordance with the `<SYSTEM-NAME>` [System Administration Process and Procedures]({{<ref "security-and-governance/policies">}}), including ensuring that all service accounts are created as Managed Service Accounts.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

Technical controls for authentication hardening within  `<SYSTEM-NAME>`'s are configured with reference to ASD's [*Blueprint for Secure Cloud*](https://blueprint.asd.gov.au) and includes the following technical configurations.

Microsoft Entra ID is configured as the central store for identity and access management within `<SYSTEM-NAME>`, acting as central management for user authentication and authorisation to various Single Sign On (SSO), including as for access to `<SYSTEM-NAME>` Windows endpoints. Notably, Entra ID implements SAML 2.0, OpenID Connect, and WS-Federation for authentication and authorisation to Microsoft applications and services, with legacy authentication methods disabled.

Technical controls are implemented according to the relevant ISM control topics listed below:

<div class="no-band-table">

|                                                                                                                              |                                                                                                                                                                                                                                                   |     |     |     |
| ---------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --- | --- | --- |
| **Authenticating to Systems:**                                                                                               | Microsoft Entra ID is configured to require all users to be authenticated before granting access                                                                                                                                                  |     |     |     |
| **Insecure Authentication Methods:**                                                                                         | legacy authentication methods are disabled                                                                                                                                                                                                        |     |     |     |
| **Multi-factor and Single Factor Authentication Methods:**                                                                   | Microsoft Entra ID MFA is enforced for all standard and privileged users accessing M365 services                                                                                                                                                  |     |     |     |
|                                                                                                                              | Microsoft Entra ID MFA requires Microsoft Entra ID password and Microsoft Authenticator app (either acceptance of push notification or entry of OTP)                                                                                              |     |     |     |
|                                                                                                                              | Entra ID password/passphrase complexity enforces a minimum of least 4 random words with a total minimum length of 14 characters                                                                                                                   |     |     |     |
|                                                                                                                              | none of the authentication factors on their own can be used for single-factor authentication to another system                                                                                                                                    |     |     |     |
|                                                                                                                              | all authentication attempts are logged in Microsoft Entra ID Sign-ins                                                                                                                                                                             |     |     |     |
|                                                                                                                              | Microsoft Entra ID logs are forwarded to a Log Analytics workspace for long-term secure retention                                                                                                                                                 |     |     |     |
|                                                                                                                              | single factor authentication is disabled for all user accounts                                                                                                                                                                                    |     |     |     |
| **Setting and Changing Credentials, including for Break Glass Accounts, Local Administrator Accounts and Service Accounts:** | *these control topics relate solely to processes and procedures described above*                                                                                                                                                                  |     |     |     |
| **Protecting Credentials:**                                                                                                  | standard Windows & iOS functionality is to obscure passwords during logon                                                                                                                                                                         |     |     |     |
|                                                                                                                              | Windows Defender Credential Guard is enabled for `<SYSTEM-NAME>` Windows endpoints                                                                                                                                                                                  |     |     |     |
|                                                                                                                              | credentials are stored within Microsoft Entra ID                                                                                                                                                                                                  |     |     |     |
|                                                                                                                              | only one previous logon is cached for `<SYSTEM-NAME>` Windows endpoints                                                                                                                                                                                             |     |     |     |
| **Account Lockouts:**                                                                                                        | Microsoft Entra ID Smart Lockout is configured to lock account after five failed logon attempts                                                                                                                                                   |     |     |     |
| **Session Termination, Session and Screen Locking, and Logon Banner:**                                                       | Intune is used to configure Windows and iOS endpoints with with logon banner that reminds users of their security responsibilities when accessing `<SYSTEM-NAME>` and its resources, and with native screen lock function after 15 minutes of activity |     |     |     |

</div>

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Related information

#### Security & Governance

-   [Essential Eight: Multi-factor-Authentication]({{< ref "multi-factor-authentication.md" >}})

#### Design

- [Platform Monitoring and Auditing]({{< ref "platform-monitoring-auditing.md" >}})
- [Authentication]({{< ref "design/platform/identity/authentication.md" >}})
- [Entra ID Protection]({{< ref "protection.md" >}})

#### External documentation

- ASD's [*Guidelines for System Hardening*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-system-hardening)
- [Log Analytics tutorial](https://learn.microsoft.com/azure/azure-monitor/logs/log-analytics-tutorial)