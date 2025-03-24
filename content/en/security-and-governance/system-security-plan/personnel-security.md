---
title: "Personnel Security"
linkTitle: "Personnel Security"
weight: 35
type: docs
description: This page provides a template and guidance to assist organisations in documenting their approach to personnel security associated with their system(s) built on ASD's Blueprint for Secure Cloud.
---

{{% alert title="Instruction" color="dark" %}}

The personnel security section of a System Security Plan (SSP) should document an organisation's approach to managing personnel security associated with facilities and systems. As with other sections of the SSP, information in the personnel security section should be documented according to the relevant controls outlined in ASD's ISM and the SSP Annex.

All template text refers to a typical implementation of a system built using the Blueprint, and includes reference to organisational policies, processes and technical configurations to be implemented in addition to the technical controls that may be configured using guidance in the Blueprint. Any implementation implied by the below should not be considered as prescriptive as to how organisations must scope, build, document, or assess a system.

When completing the below template, organisations should insert and update information where relevant to ensure it accurately represents their approach to cybersecurity documentation within their organisation. When complete, remove any instructional boxes throughout. 

{{% /alert %}}

### Cyber security awareness training

#### Applicability

ISM controls relating to cybersecurity awareness training are applicable to ensuring `<SYSTEM-NAME>`receives appropriate overarching governance of decisions and activities that might affect the cybersecurity within `<ORGANISATION-NAME>` and are covered by this section of the SSP.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

`<ORGANISATION-NAME>` is responsible for conducting regular cybersecurity awareness training for all staff and contractors. As such, cybersecurity awareness training is undertaken annually by all `<ORGANISATION-NAME>` staff and contractors covering:

* the purpose of cybersecurity awareness training
* cybersecurity roles and key contacts
* authorised use of systems and resources
* protection of systems and resources
* reporting of cybersecurity incidents and suspected compromises.

Tailored privileged user training is also undertaken annually by all privileged users of `<SYSTEM-NAME>`.

`<ORGANISATION-NAME>`'s cybersecurity awareness training material can be found [here]({{<ref "security-and-governance/general-documentation">}}).

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

No technical controls are implemented in `<SYSTEM-NAME>` relating to cybersecurity awareness training.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Access to systems and resources

#### Applicability

ISM controls relating to access control are directly applicable to `<SYSTEM-NAME>` and are covered by this section of the SSP. 

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

Use of `<SYSTEM-NAME>` by `<ORGANISATION-NAME>` staff and contractors is in accordance with the `<SYSTEM-NAME>` [System Usage Policy]({{<ref "security-and-governance/policies">}}).

Staff are only granted access to `<SYSTEM-NAME>` after:

* undergoing employment screening and obtaining a `<REQUIRED-CLEARANCE>` security clearance from the Australian Government Security Vetting Agency (AGSVA)
* agreeing to the `<SYSTEM-NAME>` Acceptable Usage Policy
* receiving a `<REQUIRED-BRIEFING>` briefing
* the request for system access and completion of the above requirements by the user has been validated via `<VALIDATION-PROCESS>`.

{{% alert title="Blueprint guidance" color="info" %}}

The requirement for staff to obtain a security clearance from AGSVA is particularly applicable to government organisations working with information up to the PROTECTED level. Organisations should consider their own requirements, with reference to the Department of Home Affairs' [*Protective Security Policy Framework* (PSPF)](https://www.protectivesecurity.gov.au/) as appropriate.

{{% /alert %}}

All `<SYSTEM-NAME>` users are granted uniquely identifiable accounts for their general system use, with privileged users granted additional uniquely identifiable privileged accounts to be used for these duties. In accordance with the `<PRIVILEGED-ACCESS-PROCESS>`, the validity of the business case for each privileged account will be assessed on request and revalidated on an annual basis.

**Temporary access**

Temporary access to `<SYSTEM-NAME>` is only granted in the following circumstances:

* `<TEMP-ACCESS-REASON-1>`
* `<TEMP-ACCESS-REASON-2>`
* `<TEMP-ACCESS-REASON-3>`

Accounts used for temporary access are specifically restricted using Role Based Access Control (RBAC) to the minimum required access for these users to undertake their duties. 

**Shared and emergency access**

Shared accounts for `<SYSTEM-NAME>` will only be used in the following extenuating circumstances:
* Break Glass Accounts

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

Use of Break Glass Accounts is documented in `<SYSTEM-NAME>`'s [Incident Response Plan]({{<ref "security-and-governance/general-documentation">}}), which has been tested on `<TEST-DATE>` as part of its initial implementation and deployment. This testing is also to be completed after any fundamental system change, with the last test completed on `<TEST-DATE>`.

#### Technical controls implemented

Technical controls for implementation of user access to `<SYSTEM-NAME>` and its resources are configured with reference to ASD's [*Blueprint for Secure Cloud*](https://blueprint.asd.gov.au). In particular, the following technical configurations have been implemented:

* all unprivileged access attempts are logged within Microsoft Entra Sign-ins
* Microsoft Entra logs are forwarded to a log analytics workspace for long-term secure retention
* an AppLocker blocklist is configured on workstations via Intune to prevent administrators from launching web browsers and email clients
* Microsoft Privileged Identity Management (MPIM) has been configured to provide Just-in-Time (JIT) administration
* changes to privileged accounts and groups are logged in the Microsoft Entra Audit Log
* Microsoft Entra accounts are automatically disabled after 45-days of inactivity
* privileged users access to systems, applications and data repositories is automatically disabled after 12-months unless revalidated
* Microsoft Defender for Cloud Apps policy monitoring is implemented to monitor the activity of Break Glass Accounts
* the use of Break Glass Accounts is logged in Microsoft Entra Sign-ins. 

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Related information

#### Security & Governance

* `<SYSTEM-NAME>` [System Usage Policy]({{<ref "security-and-governance/policies">}})
* [Incident Response Plan]({{<ref "security-and-governance/general-documentation">}})

#### Design

* [Application Control]({{<ref "design/endpoints/windows/security/windows-defender-application-control.md">}})
* [Windows Security]({{<ref "design/endpoints/windows/security">}})
  
#### Configuration

* [Break Glass]({{<ref "configuration/entra-id/users/break-glass-accounts.md">}})


#### External documentation

* ASD's [*Guidelines for Personnel Security*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-personnel-security)