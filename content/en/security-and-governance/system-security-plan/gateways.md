---
title: "Gateways"
linkTitle: "Gateways"
weight: 110
type: docs
description: This page provides a template and guidance to assist organisations in documenting their approach to gateways, cross-domain solutions, firewalls, web proxies, content filtering and peripheral switches associated with their system(s) built on ASD's Blueprint for Secure Cloud.
---

{{% alert title="Instruction" color="dark" %}}

The gateways section of a System Security Plan (SSP) should document an organisation's approach to gateways, cross domain solutions, firewalls, diodes, web proxies and content filtering and peripheral switches. As with other sections of the SSP, information in this section should be documented according to the relevant controls outlined in ASD's ISM and the SSP Annex. 

All template text refers to a typical implementation of a system built using the Blueprint, and includes reference to organisational policies, processes and technical configurations to be implemented in addition to the technical controls that may be configured using guidance from the Blueprint. Any implementation implied by the below text should not be considered as prescriptive of how organisations must scope, build, document, or assess its system.

When completing the below template, organisations should insert and update information where relevant to ensure it accurately represents their approach to gateways, cross domain solutions, firewalls, diodes, web proxies and content filtering and peripheral switches. When complete, remove any instructional boxes throughout. 

{{% /alert %}}


### Gateways

{{% alert title="Blueprint guidance" color="info" %}}

The Blueprint does not cover management of gateways and the below template excludes these from the scope of a SSP for systems built on the Blueprint. However, the implementation of demilitarised zones, traffic inspections and filtering is often conducted as part of a separate system specific to these services and should be documented elsewhere.

Where organisations decides to implement their own internal gateways, cross domain solutions or diodes within the boundary of a system built on the Blueprint, they are responsible for assessing and documenting the risk and applicability associated with each individual security control and describing the implementation of these controls here.

{{% /alert %}}

#### Applicability

This section of the SSP is not applicable as `<SYSTEM-NAME>` does not include gateways. Instead, `<SYSTEM-NAME>` utilises `<ORGANISATION-NAME>`'s `GATEWAY-SYSTEM` to provide these services.

`<SYSTEM-NAME>` also leverages gateways as implemented by Microsoft as part of its Microsoft 365 services. `<ORGANISATION-NAME>` has assessed the implementation of these as documented in Microsoft's IRAP assessments, and available in Microsoft's [Service Trust Portal](https://servicetrust.microsoft.com/), and is satisfied with their implementation as they relate to `<SYSTEM-NAME>`.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

No organisational policies or processes have been implemented in `<SYSTEM-NAME>` relating to 

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

No technical controls are implemented in `<SYSTEM-NAME>` relating to gateways.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Cross domain solutions (CDS)

#### Applicability

The section of the SSP is not applicable as `<SYSTEM-NAME>` does not include any CDSs, nor does it leverage the use of any CDSs within `<ORGANISATION-NAME>`. If and when CDSs are considered for future use as part of `<SYSTEM-NAME>`, `<ORGANISATION-NAME>` will assess and implement appropriate security controls in relation to their use at that time.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

No organisational policies or processes have been implemented in `<SYSTEM-NAME>` relating to CDSs.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

No technical controls are implemented in `<SYSTEM-NAME>` relating to CDSs.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Firewalls

#### Applicability

The section of the SSP is not applicable as `<SYSTEM-NAME>` does not include any firewalls. Instead, `<SYSTEM-NAME>` leverages the use of `<ORGANISATION-NAME>`'s `GATEWAY-SYSTEM` to provide these services.

`<SYSTEM-NAME>` also leverages firewalls as implemented by Microsoft as part of its Microsoft 365 services. `<ORGANISATION-NAME>` has assessed the implementation of these as documented in Microsoft's IRAP assessments, and available in Microsoft's [Service Trust Portal](https://servicetrust.microsoft.com/), and is satisfied with their implementation as they relate to `<SYSTEM-NAME>`.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

No organisational policies or processes have been implemented in `<SYSTEM-NAME>` relating to firewalls.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

No technical controls are implemented in `<SYSTEM-NAME>` relating to firewalls.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Diodes

#### Applicability

This section of the SSP is not applicable as `<SYSTEM-NAME>` does not include any diodes, nor does it leverage the use of any diodes within `<ORGANISATION-NAME>`.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

No organisational policies or processes have been implemented in `<SYSTEM-NAME>` relating to diodes.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

No technical controls are implemented in `<SYSTEM-NAME>` relating to diodes.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Web proxies

{{% alert title="Blueprint guidance" color="info" %}}

While Microsoft Defender for Cloud Apps configured as a Cloud Access Security Broker (CASB) can provide proxy functionality for Microsoft 365 traffic, use of CASB is generally in addition to an organisation's gateway and as such their configuration is not currently covered by the Blueprint.

{{% /alert %}}

#### Applicability

ISM controls relating to the use of web proxies, including generated logs configured as part of `<ORGANISATION-NAME>`'s `GATEWAY-SYSTEM`, within `<SYSTEM-NAME>`'s system boundary are applicable to and covered by this section of the SSP. 

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

`<ORGANISATION-NAME>` has developed a [`Web Usage Policy`]({{< ref "security-and-governance/policies">}}) that governs appropriate web usage on `<SYSTEM-NAME>`.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

All `<SYSTEM-NAME>` web access, including that of internal servers, is configured to be conducted through `<ORGANISATION-NAME>`'s `GATEWAY-SYSTEM` web proxy.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Web content filters

#### Applicability

ISM controls relating to the web content filters within `<SYSTEM-NAME>`'s system boundary are applicable to and covered by this section of the SSP as `<SYSTEM-NAME>` uses `<ORGANISATION-NAME>`'s `GATEWAY-SYSTEM` for effective holistic management of web content filtering. Please see the `GATEWAY-SYSTEM` [SSP]({{<ref "security-and-governance/general-documentation">}}) and [IRAP assessment]({{<ref "security-and-governance/general-documentation">}}) for its implementation of the relevant controls.

However, `<SYSTEM-NAME>` does implement a defence-in-depth approach to its implementation of web content filtering, particularly for web content accessed via the Edge browser on Intune configured Windows endpoints, as configured by Windows Defender for Endpoint. The controls discussed in this section of the SSP relate to implementation of these controls.

Notably, this web filtering relates only to this scenario and not to other browsers on Intune configured Windows endpoints, nor to other systems such as Windows Server or iOS devices. These devices rely solely on the aforementioned gateway level implementation of web content filtering. 

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

Web content filtering as implemented within `<SYSTEM-NAME>` is performed according to allowed web categories as per `<ORGANISATION-NAME>`'s [Web Usage Policy]({{< ref "security-and-governance/policies">}}).

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

Technical controls for `<SYSTEM-NAME>`'s implementation of web content filtering (as scoped above) are configured with reference to ASD's [*Blueprint for Secure Cloud*](https://blueprint.asd.gov.au) including the following technical configurations on Windows endpoints:

* web content filtering is enabled for Windows devices using Microsoft Defender for Endpoint
* client-side active content, including all Java and Flash content, is blocked on all Windows devices
* Microsoft Defender for Endpoint blocks specific web categories that are maintained by Microsoft.

For information on implementation of web content filtering via `<ORGANISATION-NAME>`'s `GATEWAY-SYSTEM`, please see the `GATEWAY-SYSTEM` [SSP]({{<ref "security-and-governance/general-documentation">}}) and [IRAP assessment]({{<ref "security-and-governance/general-documentation">}}).

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Content filtering

#### Applicability

ISM controls relating to the content filtering within `<SYSTEM-NAME>`'s system boundary are applicable to and covered by this section of the SSP as `<SYSTEM-NAME>` uses `<ORGANISATION-NAME>`'s `GATEWAY-SYSTEM` for effective holistic management of web content filtering. Please see the `GATEWAY-SYSTEM` [SSP]({{<ref "security-and-governance/general-documentation">}}) and [IRAP assessment]({{<ref "security-and-governance/general-documentation">}}) for its implementation of the relevant controls.

However, `<SYSTEM-NAME>` does implement a defence-in-depth approach to its implementation of web content filtering, particularly in leveraging Microsoft 365 capabilities including Defender for Microsoft 365 and Exchange Online Protection to inspect and manage email traffic. 

Notably, this web filtering relates only to this scenario and not to other parts of `<SYSTEM-NAME>`, including Windows Server or iOS devices. These devices rely solely on the aforementioned gateway level implementation of content filtering. 

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

Content filtering as implemented within `<SYSTEM-NAME>` is performed to meet allowed web categories as allowed by the [`<SYSTEM-NAME>` System Usage Policy]({{<ref "security-and-governance/policies">}}).

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

Technical controls for `<SYSTEM-NAME>`'s implementation of web content filtering (as scoped above) are configured with reference to ASD's [*Blueprint for Secure Cloud*](https://blueprint.asd.gov.au) including the following technical configurations on Windows endpoints:

* Exchange Online Protection and Defender for Microsoft 365 are configured to prevent specific file types from entering `<SYSTEM-NAME>` via email
* Defender for Microsoft 365 provides content filtering including sandboxing of attachments (Safe Attachments) and inspection of links (Safe Links)
* multiple scanning engines are provided by Exchange Online Protection, Defender for Microsoft 365 and Defender for Endpoint
* archives are scanned for malware
* Defender for Microsoft 365 alerts are configured
* integrity of patches is verified before installation.

For implementation of content filtering by `<ORGANISATION-NAME>`'s `GATEWAY-SYSTEM`, please see the `GATEWAY-SYSTEM` [SSP]({{<ref "security-and-governance/general-documentation">}}) and [IRAP assessment]({{<ref "security-and-governance/general-documentation">}}).

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Peripheral switches

#### Applicability

This section of the SSP is not applicable as `<SYSTEM-NAME>` does not include any peripheral switches, nor does it leverage the use of peripheral switches within `<ORGANISATION-NAME>`. If and when peripheral switches are considered for future use as part of `<SYSTEM-NAME>`, `<ORGANISATION-NAME>` will assess and implement appropriate security controls in relation to their use at that time.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

No organisational policies or processes have been implemented in `<SYSTEM-NAME>` relating to peripheral switches.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

No technical controls are implemented in `<SYSTEM-NAME>` relating to peripheral switches.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Related information

#### Security & Governance

* `<ORGANISATION-NAME>`'s [`GATEWAY-SYSTEM` SSP]({{<ref "security-and-governance/general-documentation">}})
* `<ORGANISATION-NAME>`'s [`GATEWAY-SYSTEM` IRAP Assessment Report]({{<ref "security-and-governance/general-documentation">}})
* `<SYSTEM-NAME>`'s [Continuous Monitoring Plan]({{<ref "security-and-governance/general-documentation">}})
* `<SYSTEM-NAME>`'s [System Usage Policy]({{<ref "security-and-governance/policies">}})

#### Design

* None identified

#### External links

* ASD's [*Guidelines for Gateways*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-gateways)
* Microsoft's [Service Trust Portal](https://servicetrust.microsoft.com/)