---
title: "Cyber Security Incidents"
linkTitle: "Cyber Security Incidents"
weight: 15
type: docs
description: This page provides a template and guidance to assist organisations in documenting their approach to managing and responding to cyber security incidents associated with their system(s) built on ASD's Blueprint for Secure Cloud.
---

{{% alert title="Instruction" color="dark" %}}

The cyber security incidents section of a System Security Plan (SSP) should document an organisation's approach to managing and responding to cyber security incidents. As with other sections of the SSP, information in the cyber security incidents section should be documented according to the relevant controls outlined in ASD's ISM and the SSP Annex.

All template text refers to a typical implementation of a system built using the Blueprint, and includes reference to organisational policies, processes and technical configurations to be implemented in addition to the technical controls that may be configured using guidance in the Blueprint. Any implementation implied by the below should not be considered as prescriptive as to how organisations must scope, build, document, or assess a system.

When completing the below template, organisations should insert and update information where relevant to ensure it accurately represents the approach to managing and responding to cyber security incidents within their organisation. When complete, remove any instructional boxes throughout. 

{{% /alert %}}

As `<ORGANISATION-NAME>`'s overall approach to implementing controls related to Cyber Security Incidents is consistent across all controls addressed within this section, it does not delve into subsections but rather addresses the controls as a group. This approach is also consistent with ASD's [*Guidelines for Cyber Security Incidents*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-cyber-security-incidents).  

#### Applicability

ISM controls relating to cyber security incidents are applicable to ensuring `<SYSTEM-NAME>`receives appropriate overarching governance of cyber security matters within `<ORGANISATION-NAME>` and are covered by this section of the SSP.

`<ORGANISATION-NAME>` is responsible for implementing administrative controls to govern the direct management of, and response to the cyber security incidents for `<SYSTEM-NAME>`.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

`<ORGANISATION-NAME>`'s management of cyber security incidents relating to `<SYSTEM-NAME>` is performed in line with `<ORGANISATION-NAME>`'s [Cyber Security Incident Management Policy]({{< ref "security-and-governance/policies" >}}) and [Cyber Security Incident Response Plan]({{< ref "security-and-governance/policies" >}}), which include the reporting of incidents to `<ORGANISATION-NAME>`'s CISO and to ASD in a timely manner. These documents are exercised annually.

In accordance with the `<SYSTEM-NAME>` [Incident Response Plan (IRP)]({{< ref "security-and-governance/general-documentation" >}}), `<ORGANISATION-NAME>` will also liaise with Microsoft regarding the response to incidents that cover elements relating to their shared responsibility for `<SYSTEM-NAME>`.

All recorded incidents for `<SYSTEM-NAME>` are documented in its [Cyber Security Incident Register]({{< ref "security-and-governance/general-documentation" >}}).

The management of the threat that trusted insiders pose to `<SYSTEM-NAME>` is addressed as part of the `<ORGANISATION-NAME>`'s [Trusted Insider Program]({{< ref "security-and-governance/general-documentation" >}}).

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

{{% alert title="Blueprint guidance" color="info" %}}

While the Blueprint provides limited guidance to support organisations in developing an approach for the response to cyber security incidents, the section below is provided for organisations to describe the measures implemented within their system. Effective implementation of these controls is generally built on a combination of system-specific and whole of organisation processes, and may include the coordination of a number of teams and staff across an organisation.

{{% /alert %}}

`<SYSTEM-NAME>` utilises the Microsoft 365 Defender portal and `<SIEM-PRODUCT>` to assist in the identification of cyber security incidents. Specific capabilities include the Incident Queue and Action Centre views.

`<ORGANISATION-NAME>` has established a Security Operations Centre (SOC), a [Cyber Security Incident Register]({{< ref "security-and-governance/general-documentation" >}}), and an [IRP]({{< ref "security-and-governance/general-documentation" >}}) to meet the requirements outlined in the [SSP Annex]({{< ref "annex.md" >}}).

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Related information

#### Security & Governance

* [Incident Management Policy]({{< ref "security-and-governance/policies" >}})
* [Cyber Security Incident Response Plan]({{< ref "security-and-governance/general-documentation" >}})
* [Cyber Security Incident Register]({{< ref "security-and-governance/general-documentation" >}})

#### Design

* [SIEM]({{< ref "siem.md" >}})

#### External links

* ASD's [*Guidelines for Cyber Security Incidents*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-cyber-security-incidents)
* [Microsoft Defender portal](https://security.microsoft.com/)