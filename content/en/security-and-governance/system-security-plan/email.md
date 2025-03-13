---
title: "Email"
linkTitle: "Email"
weight: 95
type: docs
description: This page provides a template and guidance to assist organisations in documenting their approach to email gateways and servers and email use associated with their system(s) built on ASD's Blueprint for Secure Cloud.
---

{{% alert title="Instruction" color="dark" %}}

The email section of a System Security Plan (SSP) should document an organisation's approach to email gateways and servers and email use. As with other sections of the SSP, information in this section should be documented according to the relevant controls outlined in ASD's ISM and the SSP Annex. 

All template text refers to a typical implementation of a system built using the Blueprint, and includes reference to organisational policies, processes and technical configurations to be implemented in addition to the technical controls that may be configured using guidance from the Blueprint. Any implementation implied by the below text should not be considered as prescriptive of how organisations must scope, build, document, or assess its system.

When completing the below template, organisations should insert and update information where relevant to ensure it accurately represents their approach to email gateways and servers and email use. When complete, remove any instructional boxes throughout. 

{{% /alert %}}

### Email usage

#### Applicability

ISM controls relating to the email usage within `<SYSTEM-NAME>`'s system boundary are applicable to and covered by this section of the SSP. 

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

The usage of `<SYSTEM-NAME>`'s email services by users is performed in accordance with the `<ORGANISATION-NAME>`'s [Email Usage Policy]({{<ref "/security-and-governance/policies">}}).

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

Technical controls for email usage within `<SYSTEM-NAME>` are configured with reference to ASD's [*Blueprint for Secure Cloud*](https://blueprint.asd.gov.au) including the following technical configurations:

* `<SYSTEM-NAME>` applies protective markings based on the classification of the content of emails, including attachments
* users are required to select the classification of emails to apply protective markings
* only appropriate classification options will be presented to `<SYSTEM-NAME>` users
* Defender for Microsoft 365 will notify users and administrators of blocked emails.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Email gateways and servers

#### Applicability

ISM controls relating to the hardening of email routing, including proper interaction with `<ORGANISATION-NAME>`'s `<GATEWAY-SYSTEM>`, within `<SYSTEM-NAME>`'s system boundary are applicable to and covered by this section of the SSP. 

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

The usage of `<SYSTEM-NAME>`'s email services by users is performed in accordance with the `<ORGANISATION-NAME>`'s [Email Usage Policy]({{<ref "security-and-governance/policies">}}).

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

Technical controls for email gateways and servers within `<SYSTEM-NAME>` are configured with reference to ASD's [*Blueprint for Secure Cloud*](https://blueprint.asd.gov.au) including the following technical configurations:

`<SYSTEM-NAME>` uses Exchange Online within the Microsoft 365 platform. Native Exchange Online security capabilities are enabled to mitigate against email-related threats such as spoofing, phishing and malware. 

The advanced features of Defender for Microsoft 365 are enabled within `<SYSTEM-NAME>` including Safe Attachments and Safe Links, which provide sandboxing of attachments and inspection of hyperlinks respectively. This provides email content filtering and expands on the default protections offered by Exchange Online Protection (EOP).

Exchange Online is configured to: 
* ensure OFFICIAL emails *are not routed* through `<ORGANISATION-NAME>`'s `GATEWAY-SYSTEM`
* ensure OFFICIAL:Sensitive and above emails *are routed* through `<ORGANISATION-NAME>`'s `GATEWAY-SYSTEM` 
* encrypt traffic between external users with TLS 1.2, and then forward emails to `<ORGANISATION-NAME>`'s `GATEWAY-SYSTEM` via an Exchange connector
* not act as an open relay
* implement TLS 1.2 for opportunistic TLS encryption where supported by the other mail server
* implement Mail Transfer Agent - Strict Transport Security (MTA-STS) for outbound mail flow
* configure Sender Policy Framework (SPF) using a hard fail record 
* keep SPF blocks visible to the recipients
* configure the appropriate use of DomainKeys Identified Mail (DKIM)
* verify DKIM signatures on received emails
* implement `<ORGANISATION-NAME>`'s Domain-based Message Authentication, Reporting and Conformance (DMARC) records

Defender for Microsoft 365 provides content filtering including sandboxing of attachments (Safe Attachments) and inspection of links (Safe Links).

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Related information

#### Security & Governance

*   `<ORGANISATION-NAME>`'s [Email Usage Policy]({{<ref "security-and-governance/policies">}})
*  [Incident Management Policy]({{< ref "security-and-governance/policies" >}})

#### Design

*   [Exchange Online]({{<ref "design/shared-services/exchange-online">}})


#### Configuration

* [Exchange Online]({{<ref "configuration/exchange-online" >}})


#### External documentation

* ASD's [*Guidelines for Email*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-email)
* ASD's [*Gateway Hardening Guidance*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/gateway-hardening)