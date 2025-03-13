---
title: "ASD Edge Hardening Guidelines"
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

{{% alert title="Policy import" color="info" %}}

This configuration policy can be imported.

Download the {{% download file="/content/files/intune-config-policies/edge-hardening.txt" %}} Edge Hardening Guidelines {{% /download %}} *.txt* file and change the extension to *.json*, then select **Create > Import Policy**.

{{% /alert %}}

### Basics

| Item        |                         Value |
| ----------- | ----------------------------: |
| Name        | ASD Edge Hardening Guidelines |
| Description |                               |
| Platform    |          Windows 10 and later |

### Assignments

#### Included groups

| Item   |       Value |
| ------ | ----------: |
| Groups | All devices |

#### Excluded groups

None

### Scope tags

| Item       |   Value |
| ---------- | ------: |
| Scope tags | Default |

### Configuration settings

#### Defender

| Item                      |                Value |
| ------------------------- | -------------------: |
| Enable Network Protection | Enabled (block mode) |

#### Microsoft Edge

| Item                                                                         |                                 Value |
| ---------------------------------------------------------------------------- | ------------------------------------: |
| Ads setting for sites with intrusive ads                                     |                               Enabled |
| - Ads setting for sites with intrusive ads (Device)                          | Block ads on sites with intrusive ads |
| Allow download restrictions                                                  |                               Enabled |
| - Download restrictions (Device)                                             | Block potentially dangerous downloads |
| Configure Do Not Track                                                       |                               Enabled |
| Control the mode of DNS-over-HTTPS                                           |                               Enabled |
| - Control the mode of DNS-over-HTTPS (Device)                                |                Disable DNS-over-HTTPS |
| Control where developer tools can be used                                    |                               Enabled |
| - Control where developer tools can be used (Device)                         | Don't allow using the developer tools |
| DNS interception checks enabled                                              |                              Disabled |
| **Content settings**                                                         |                                       |
| Default pop-up window setting                                                |                               Enabled |
| - Default pop-up window setting (Device)                                     |                               Enabled |
| **Password manager and protection**                                          |                                       |
| Enable saving passwords to the password manager                              |                              Disabled |
| **SmartScreen settings**                                                     |                                       |
| Configure Microsoft Defender SmartScreen                                     |                               Enabled |
| Prevent bypassing Microsoft Defender SmartScreen prompts for sites           |                               Enabled |
| Prevent bypassing of Microsoft Defender SmartScreen warnings about downloads |                               Enabled |

### Related information

#### Security & Governance

* [User Application Hardening]({{<ref "security-and-governance/system-security-plan/system-hardening-user-apps.md">}})
* [Application Control]({{<ref "security-and-governance/essential-eight/application-control.md">}})
* [Enterprise Mobility]({{<ref "security-and-governance/system-security-plan/enterprise-mobility.md">}})
* [Essential Eight: Restrict Microsoft Office Macros]({{<ref "restrict-microsoft-office-macros.md">}})
* [Essential Eight: Patch Applications]({{< ref "patch-applications.md">}})
* [Essential Eight: Patch Operating Systems]({{< ref "patch-os.md">}})
* [Essential Eight: Regular Backups]({{< ref "regular-backups.md">}})
* [System Management]({{<ref "system-management.md">}})
* [System Monitoring]({{<ref "system-monitoring.md">}})
  
#### Design

* [Microsoft Edge Hardening]({{<ref "design/endpoints/windows/security/edge-hardening.md">}})

  
#### Configuration

* [Security Baseline for Microsoft Edge]({{<ref "configuration/intune/endpoint-security/security-baselines/security-baseline-for-microsoft-edge.md">}})
* [Microsoft Intune - profile configurations]({{<ref "configuration/intune/devices/configuration-policies">}})
* [Endpoint security policies]({{<ref "configuration/defender/endpoints/configuration-management/endpoint-security-policies.md">}})
* [Permissions]({{<ref "configuration/defender/settings/endpoints/permissions.md">}})
* [Rules]({{<ref "configuration/defender/settings/endpoints/rules.md">}})


#### References

* None identified