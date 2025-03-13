---
title: "ASD iOS Hardening"
weight: 30
description: "This section describes the configuration of device configuration profiles within Microsoft Intune associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Intune portal at the following URL:

<https://intune.microsoft.com/#view/Microsoft_Intune_DeviceSettings/DevicesMenu/~/iOSiPadOSUpdate>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Properties

#### Basics

| Item        |                Value |
| ----------- | -------------------: |
| Name        |    ASD iOS Hardening |
| Description |                      |

#### Update policy settings

| Item              |                   Value |
| ----------------- | ----------------------: |
| Update to install |           Latest update |
| Schedule type     | Update at next check-in |

#### Assignments

| Item            |              Value |
| --------------- | -----------------: |
| Included groups | No Included groups |
| Excluded groups | No Excluded groups |

### Related information

#### Security & Governance

* [Enterprise Mobility]({{<ref "security-and-governance/system-security-plan/enterprise-mobility.md">}})
* [User Application Hardening]({{<ref "security-and-governance/system-security-plan/system-hardening-user-apps.md">}})
* [Essential Eight: Restrict Microsoft Office Macros]({{<ref "restrict-microsoft-office-macros.md">}})
* [Essential Eight: Patch Applications]({{< ref "patch-applications.md">}})
* [Essential Eight: Patch Operating Systems]({{< ref "patch-os.md">}})
* [Essential Eight: Regular Backups]({{< ref "regular-backups.md">}})
* [Application Control]({{<ref "security-and-governance/essential-eight/application-control.md">}})
* [Enterprise Mobility]({{<ref "security-and-governance/system-security-plan/enterprise-mobility.md">}})
* [System Management]({{<ref "system-management.md">}})
* [System Monitoring]({{<ref "system-monitoring.md">}})
  
#### Design

* [Authentication]({{<ref "design/platform/identity/authentication.md">}})
* [Securing iOS devices]({{<ref "securing-ios-devices.md">}})
  
#### Configuration

* [iOS and iPadOS]({{< ref "configuration/intune/apps/by-platform/ios-ipados.md">}})
* [Microsoft Intune - profile configurations]({{<ref "configuration/intune/devices/configuration-policies">}})
* [Endpoint security policies]({{<ref "configuration/defender/endpoints/configuration-management/endpoint-security-policies.md">}})
* [Permissions]({{<ref "configuration/defender/settings/endpoints/permissions.md">}})
* [Rules]({{<ref "configuration/defender/settings/endpoints/rules.md">}})

#### References

* None identified
