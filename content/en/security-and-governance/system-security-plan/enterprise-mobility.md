---
title: "Enterprise Mobility"
linkTitle: "Enterprise Mobility"
weight: 50
type: docs
description: This page provides a template and guidance to assist organisations in documenting their approach to enterprise mobility associated with their system(s) built on ASD's Blueprint for Secure Cloud.
---

{{% alert title="Instruction" color="dark" %}}

The enterprise mobility section of a System Security Plan (SSP) should document an organisation's approach to enterprise mobility, including allowing privately owned devices to access systems and data and mobile device management. As with other sections of the SSP, information in the enterprise mobility section should be documented according to the relevant controls outlined in ASD's ISM and the SSP Annex. 

All template text refers to a typical implementation of a system built using the Blueprint, and includes reference to organisational policies, processes and technical configurations to be implemented in addition to the technical controls that may be configured using guidance in the Blueprint. Any implementation implied by the below should not be considered as prescriptive as to how organisations must scope, build, document, or assess a system.

When completing the below template, organisations should insert and update information where relevant to ensure it accurately represents their approach to enterprise mobility. When complete, remove any instructional boxes throughout. 

{{% /alert %}}

### Enterprise mobility

#### Applicability

ISM controls relating to enterprise mobility are applicable to `<SYSTEM-NAME>` and are covered by this section of the SSP as the system includes the use of corporate mobile devices, but does not permit personal devices to connect to `<SYSTEM-NAME>` or its resources. 

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

Use of `<SYSTEM-NAME>` by `<ORGANISATION-NAME>`'s staff and contractors is in accordance with the [`<SYSTEM-NAME>` Mobile Device Usage Policy]({{< ref "security-and-governance/policies">}}), which requires that all system access is performed via corporately issued devices, and that these devices are used solely for corporate use.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

Technical controls for `<SYSTEM-NAME>`'s implementation of enterprise mobility are configured with reference to ASD's [*Blueprint for Secure Cloud*](https://blueprint.asd.gov.au), and includes the following technical configurations:

* conditional access policies are set to prevent non corporately-issued devices from connecting to `<SYSTEM-NAME>` or its resources
* application control is configured on corporately issued mobile devices to provide some restriction of personal use on these devices
* corporately issued devices connect to the internet through `<ORGANISATION-NAME>`'s `<VPN-SYSTEM>` when connecting remotely, and do so with split tunnelling disabled
* corporately issued devices connect to the internet through `<ORGANISATION-NAME>`'s `<GATEWAY-SYSTEM>`, which also restricts web categories associated with personal use on these devices.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Mobile device management

#### Applicability

ISM controls relating to the management of mobile devices are applicable to `<SYSTEM-NAME>` and are covered by this section of the SSP as the system includes the configuration and hardening of corporately owned and issued Apple iPhones. 

While considered to be mobile devices in other contexts, this section of the SSP does not apply to the management of Windows laptops.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

The management of corporately owned and issued mobile devices for `<SYSTEM-NAME>` is implemented through the use of Microsoft Intune, and is governed by `<ORGANISATION-NAME>`'s [Mobile Device Management Policy]({{< ref "security-and-governance/policies">}}). This policy requires appropriate selection of mobile operating systems and use of mobile device management solutions to be from those that have completed appropriate [Common Criteria Protection Profiles](https://commoncriteriaportal.org/pps/index.cfm). 

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

Technical controls for `<SYSTEM-NAME>`'s implementation of mobile device management are configured with reference to ASD's [*Blueprint for Secure Cloud*](https://blueprint.asd.gov.au).

`<SYSTEM-NAME>` uses Microsoft Intune as its Mobile Device Management (MDM) solution. While Intune has not completed the relevant protection profile assessment, `<ORGANISATION-NAME>` considers that as Microsoft has [commenced the assessment process](https://www.niap-ccevs.org/Product/PINE.cfm) for Intune and has completed an IRAP assessment of Microsoft 365 services including Intune, associated risks are mitigated. `<ORGANISATION-NAME>` has reviewed this IRAP assessment together with the commenced protection profile assessment.

`<SYSTEM-NAME>` requires use of the latest version of iOS, which is currently iOS 17. The most recent version of iOS to have completed the relevant protection profile assessment is iOS 16. However, `<ORGANISATION-NAME>` considers that while the protection profile assessment is not of the implemented operating system (iOS 17), the recency of the assessment of iOS 16 (OS version N-1) mitigates associated risks.

iOS devices are configured to:
* operate in Supervised Mode
* be remotely wipeable using Intune
* operate with a secure lock screen
* apply the latest security patches released by Apple
* restrict iOS users from installing applications from the App Store on iOS
* restrict iOS users from disabling or modifying security functionality once provisioned.

Mobile device encryption is also inherently enabled for iOS devices' internal storage. 

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Mobile device usage

#### Applicability

ISM controls relating to mobile devices, including Windows laptops and iOS devices, are applicable to `<SYSTEM-NAME>` and are covered by this section of the SSP. 

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational Policies and Processes Implemented

Management of `<SYSTEM-NAME>` mobile devices and their peripherals is in accordance with the `<ORGANISATION-NAME>`'s [`<SYSTEM-NAME>` Mobile Device Usage Policy]({{< ref "security-and-governance/policies">}}). 

Use of `<SYSTEM-NAME>` mobile devices and their peripherals is in accordance with the `<ORGANISATION-NAME>`'s [`<SYSTEM-NAME>` Mobile Device Usage Policy]({{< ref "security-and-governance/policies">}}). 

Procedures related to overseas travel by `<SYSTEM-NAME>` users are outlined in the [Overseas Travel SOP]({{< ref "security-and-governance/general-documentation" >}}).

`<SYSTEM-NAME>`'s [Mobile Device Emergency Sanitisation Standard Operating Procedure]({{< ref "security-and-governance/general-documentation" >}}) provides advice on the remote sanitisation of mobile devices.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

Technical controls for `<SYSTEM-NAME>`'s implementation of mobile device usage were configured with reference to ASD's [*Blueprint for Secure Cloud*](https://blueprint.asd.gov.au), and implements the following technical configurations:
* Windows Defender for Endpoint is configured to restrict allowed peripherals to an approved list
* iOS is configured to restrict allowed peripherals to an approved list.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Related information

#### Security & Governance

-   [`<SYSTEM-NAME>` Mobile Device Usage Policy]({{< ref "security-and-governance/policies">}})
-   [`<SYSTEM-NAME>` Mobile Device Management Policy]({{< ref "security-and-governance/policies">}})
-   [Overseas Travel SOP]({{< ref "security-and-governance/general-documentation">}})
-   [Mobile Device Emergency Sanitisation Standard Operating Procedure]({{< ref "security-and-governance/general-documentation">}})

#### Design

- [Conditional Access]({{< ref "design/platform/identity/conditional-access.md">}})
- [Securing iOS devices]({{< ref "securing-ios-devices.md">}})
- [Endpoint Management]({{<ref "design/platform/client">}})

#### External documentation

- ASD's [*Guidelines for Enterprise Mobility*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-enterprise-mobility)
- ASD's [*Blueprint for Secure Cloud*](https://blueprint.asd.gov.au)