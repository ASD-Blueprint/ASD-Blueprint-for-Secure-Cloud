---
title: "Device management"
linkTitle: "Device management"
weight: 40
description: "This section describes the configuration of device management within Microsoft Defender associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Defender portal at the following URL:

<https://security.microsoft.com/securitysettings/endpoints/onboarding>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Onboarding

| Item                                                |                                       Value |
| --------------------------------------------------- | ------------------------------------------: |
| Select operating system to start onboarding process |                           Windows 10 and 11 |
| Connectivity type                                   |                                 Streamlined |
| Deployment method                                   | Mobile Device Management / Microsoft Intune |

### Offboarding

| Item                                                 | Value                                       |
| ---------------------------------------------------- | -------------------------------------------:|
| Select operating system to start offboarding process | Windows 10 and 11                           |
| Deployment method                                    | Mobile Device Management / Microsoft Intune |

### Related information

#### Security & Governance

* [Essential Eight: Patch Applications]({{<ref "patch-applications.md">}})
* [Essential Eight: Patch Operating Systems]({{<ref "patch-os.md">}})
* [Essential Eight: Regular Backups]({{<ref "regular-backups.md">}})
* [System Administration Process]({{<ref "security-and-governance/general-documentation">}})
  
#### Design

* [Endpoint Security - Devices]({{<ref "design/platform/security/endpoint-security">}})
* [Web Filtering]({{<ref "web-filtering.md">}})

#### Configuration

* [Networking]({{<ref "configuration/networking">}})

#### References

* [Defender for Endpoint](https://learn.microsoft.com/microsoft-365/security/defender-endpoint)
