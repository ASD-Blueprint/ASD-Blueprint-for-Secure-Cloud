---
title: "iOS Microsoft Enterprise SSO Plugin"
weight: 30
description: "This section describes the configuration of device configuration profiles within Microsoft Intune associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Intune portal at the following URL:

https://intune.microsoft.com/#view/Microsoft_Intune_DeviceSettings/DevicesMenu/~/configuration
 
The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

### Basics

| Item         |                               Value |
| ------------ | ----------------------------------: |
| Name         | IoS Microsoft Enterprise SSO plugin |
| Description  |                                     |
| Platform     |                          iOS/iPadOS |
| Profile type |                     Device features |

### Assignments

#### Included groups

None

#### Excluded groups

None

### Scope tags

| Item       |   Value |
| ---------- | ------: |
| Scope tags | Default |

### Configuration settings

#### Single sign-on

| Item                           |         Value |
| ------------------------------ | ------------: |
| Credential renewal certificate | None selected |

#### Single sign-on app extension

| Item                     |              Value |
| ------------------------ | -----------------: |
| SSO app extension type   | Microsoft Entra ID |
| App bundle IDs           |      App bundle ID |
|                          |   com.apple.Safari |

##### Additional configuration

| Key                             |    Type |                     Value |
| ------------------------------- | ------: | ------------------------: |
| AppPrefixAllowList              |  String | com.microsoft.,com.apple. |
| browser_sso_interaction_enabled | Integer |                         1 |
| disable_explicit_app_prompt     | Integer |                         1 |
| Enable_SSO_On_All_ManagedApp    | Integer |                         1 |
| admin_debug_mode_enabled        | Integer |                         1 |

### Related information

#### Security & Governance

* [Enterprise Mobility]({{<ref "security-and-governance/system-security-plan/enterprise-mobility.md">}})
* [Essential Eight: Restrict Microsoft Office Macros]({{<ref "restrict-microsoft-office-macros.md">}})
* [Essential Eight: Patch Applications]({{< ref "patch-applications.md">}})
* [Essential Eight: Patch Operating Systems]({{< ref "patch-os.md">}})
* [Essential Eight: Regular Backups]({{< ref "regular-backups.md">}})
* [Application Control]({{<ref "security-and-governance/essential-eight/application-control.md">}})
  
#### Design

* [Securing iOS devices]({{<ref "securing-ios-devices.md">}})
  
#### Configuration

* [Microsoft Intune - profile configurations]({{<ref "configuration/intune/devices/configuration-policies">}})
* [Endpoint security policies]({{<ref "configuration/defender/endpoints/configuration-management/endpoint-security-policies.md">}})
* [Permissions]({{<ref "configuration/defender/settings/endpoints/permissions.md">}})
* [Rules]({{<ref "configuration/defender/settings/endpoints/rules.md">}})


#### References

* None identified