---
title: "Communications Systems"
linkTitle: "Communications Systems"
weight: 45
type: docs
description: This page provides a template and guidance to assist organisations in documenting their approach to managing communications systems associated with their system(s) built on ASD's Blueprint for Secure Cloud.
---

{{% alert title="Instruction" color="dark" %}}

The communications systems section of a System Security Plan (SSP) should document an organisation's approach to managing communications systems, such as telephone, videoconferencing and faxes. As with other sections of the SSP, information in the communications systems section should be documented according to the relevant controls outlined in ASD's ISM and the SSP Annex. 

All template text refers to a typical implementation of a system built using the Blueprint, and includes reference to organisational policies, processes and technical configurations to be implemented in addition to the technical controls that may be configured using guidance in the Blueprint. Any implementation implied by the below should not be considered as prescriptive as to how organisations must scope, build, document, or assess a system.

When completing the below template, organisations should insert and update information where relevant to ensure it accurately represents the approach to communications systems organisation. When complete, remove any instructional boxes throughout. 

{{% /alert %}}

### Telephone systems

#### Applicability

{{% alert title="Blueprint guidance" color="info" %}}

The Blueprint does not cover management of landline and mobile telephone systems. However, the use of Microsoft Teams does constitute a telephone system for the purpose of organisational policies relating to these systems.
  
Please note that the Blueprint does not currently provide guidance on implementing [Telstra Calling for Office 365](https://www.telstra.com.au/small-business/business-software/telstra-calling-for-office-365). This service enables calling between Microsoft Teams and landline and mobile telephones. Organisations wishing to use this service or another similar service should ensure it is implemented, assessed, and managed appropriately.

{{% /alert %}}

ISM controls relating to communications systems are applicable to the use of Microsoft Teams within `<SYSTEM-NAME>`, considering it as a telephone system in alignment with `<ORGANISATION-NAME>`'s policies and processes governing its use, and are covered by this section of the SSP.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes

Use of Microsoft Teams within `<SYSTEM-NAME>` is subject to `<ORGANISATION-NAME>`'s [Telephone Usage Policy]({{< ref "security-and-governance/policies">}}), which describes the sensitivity or classification of information that can be discussed over applicable systems and connection types.

`<ORGANISATION-NAME>` cyber security awareness training also informs staff of the security risks associated with using each of these connection types, particularly in areas where sensitive classified conversations may occur.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

No technical controls are implemented in `<SYSTEM-NAME>` relating to the management of telephone systems.

{{% alert title="Blueprint guidance" color="info" %}}

Organisations that use Telstra Calling for Office 365 or a similar service, should consider inclusion of the following words or similar in this section of the SSP: 

`<SYSTEM-NAME>` utilises `<SERVICE-NAME>` to allow calling between Teams and landline and mobile telephones. 

{{% /alert %}}

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Video conferencing and internet protocol telephony

#### Applicability

ISM controls relating to communications systems are applicable to the use of Microsoft Teams for video conferencing and IP telephony services within `<SYSTEM-NAME>` and are covered by this section of the SSP.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

`<ORGANISATION-NAME>` implements and maintains a [Denial of Service Response Plan for IP Telephony]({{< ref "security-and-governance/general-documentation">}}) that includes appropriate business continuity practices in the event of a loss of Microsoft Teams functionality within `<SYSTEM-NAME>`.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

Technical controls for `<SYSTEM-NAME>`'s implementation of Microsoft Teams for video conferencing and IP telephony were configured with reference to ASD's [*Blueprint for Secure Cloud*](https://blueprint.asd.gov.au).

`<SYSTEM-NAME>` use of Microsoft Teams inherits the implementation of the following controls from Microsoft:

* use of Entra ID as the source of authentication and authorisation
* use of Microsoft Azure's Distributed Denial of Service (DDoS) protection capabilities
* implementation of secure signalling data encryption, including:
* Session Initiation Protocol (SIP) 
* Secure Real Time Protocol (SRTP)
* use of a dedicated Virtual Local Area Network (VLAN) within the Microsoft cloud.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Fax machines and multifunction devices

{{% alert title="Blueprint guidance" color="info" %}}

The Blueprint does not cover management of fax machines or multifunction devices. However, organisations may find the below template a useful guide for documenting the use of fax machines or multifunction devices associated with system(s) built using the Blueprint.

{{% /alert %}}

#### Applicability

ISM controls relating to multifunction devices (MFDs) are applicable to `<ORGANISATION-NAME>`'s use of MFDs for office productivity purposes. These devices are connected to `<SYSTEM-NAME>` for printing and scanning services. However, the technical implementation of these devices is not within the authorisation boundary of `<SYSTEM-NAME>`.

Please see the `<PRINT-SYSTEM>` System Security at Plan `<insert document reference here>` for further information on implementation of these services.

`<ORGANISATION-NAME>` does not use faxing services, and therefore these controls are not in scope of this SSP.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

Appropriate organisational use of MFDs and fax machines is detailed in the `<ORGANISATION-NAME>`'s [Fax Machine and MFD Usage Policy]({{< ref "security-and-governance/policies">}}).

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

No technical controls are implemented in `<SYSTEM-NAME>` relating to the use of fax machines or MFDs.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Related Information

#### Security & Governance

* [Telephone Usage Policy]({{< ref "security-and-governance/policies">}})
* [Denial of Service Response Plan for IP Telephony]({{< ref "security-and-governance/general-documentation">}})
* [Fax Machine and MFD Usage Policy]({{< ref "security-and-governance/policies">}})

#### Design

* [Teams Policies and Settings]({{< ref "policies-and-settings.md">}})
* [Authentication]({{< ref "design/platform/identity/authentication.md" >}})
* [Windows Security]({{<ref "design/endpoints/windows/security">}})

#### Configuration

* [Microsoft Teams]({{<ref "configuration/microsoft-teams">}})

#### External documentation

* ASD's [*Guidelines for Communications Systems*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-communications-systems)
* [Telstra Calling for Office 365](https://www.telstra.com.au/small-business/business-software/telstra-calling-for-office-365)
* ASD's [*Blueprint for Secure Cloud*](https://blueprint.asd.gov.au)