---
Title: "Windows 10/11 Compliance Policy"
weight: 30
description: "This section describes the configuration of device compliance policies within Microsoft Intune associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Intune portal blade at the following URL:

https://intune.microsoft.com/#view/Microsoft_Intune_DeviceSettings/DevicesComplianceMenu/~/policies
 
The settings described in these tables should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

### Basics

| Item         |                           Value |
| ------------ | ------------------------------: |
| Name         | Windows 10/11 Compliance Policy |
| Description  |                              -- |
| Platform     |            Windows 10 and later |
| Profile type | Windows 10/11 compliance policy |

### Compliance settings

#### Custom Compliance

| Item              |          Value |
| ----------------- | -------------: |
| Custom compliance | Not configured |

#### Device Health

| Item           |   Value |
| -------------- | ------: |
| BitLocker      | Require |
| Secure Boot    | Require |
| Code integrity | Require |

#### Device Properties

| Item                                  |            Value |
| ------------------------------------- | ---------------: |
| Minimum OS version                    | 10.0.19043.10000 |
| Maximum OS version                    |   Not configured |
| Minimum OS version for mobile devices | 10.0.19043.10000 |
| Maximum OS version for mobile devices |   Not configured |

#### Configuration Manager Compliance

| Item                                                 |          Value |
| ---------------------------------------------------- | -------------: |
| Require device compliance from Configuration Manager | Not configured |

#### System Security

| Item                                                            |                                                        Value |
| --------------------------------------------------------------- | -----------------------------------------------------------: |
| **Password**                                                    |                                                              |
| Require a password to unlock mobile devices                     |                                                      Require |
| Simple passwords                                                |                                                        Block |
| Password type                                                   |                                                 Alphanumeric |
| Password complexity                                             | Require digits, lowercase, uppercase, and special characters |
| Minimum password length                                         |                                                           14 |
| Maximum minutes of inactivity before password is required       |                                                   15 minutes |
| Password expiration (days)                                      |                                                          365 |
| Number of previous passwords to prevent reuse                   |                                                            5 |
| Require password when device returns from idle state            |                                                      Require |
| **Encryption**                                                  |                                                              |
| Require encryption of data storage on device                    |                                                      Require |
| **Device Security**                                             |                                                              |
| Firewall                                                        |                                                      Require |
| Trusted Platform Module (TPM)                                   |                                                      Require |
| Antivirus                                                       |                                                      Require |
| Antispyware                                                     |                                                      Require |
| **Defender**                                                    |                                                              |
| Microsoft Defender Antimalware                                  |                                                      Require |
| Microsoft Defender Antimalware minimum version                  |                                                     4.18.0.0 |
| Microsoft Defender Antimalware security intelligence up-to-date |                                                      Require |
| Real-time protection                                            |                                                      Require |

#### Microsoft Defender for Endpoint

| Item                                                        |  Value |
| ----------------------------------------------------------- | -----: |
| Require the device to be at or under the machine risk score | Medium |

### Actions for noncompliance

| Item                     | Value |
| ------------------------ | ----: |
| **Action**               |       |
| Mark device noncompliant |     1 |

### Scope tags

| Item       |   Value |
| ---------- | ------: |
| Scope tags | Default |

### Assignments

#### Included groups

| Item   |                                       Value |
| ------ | ------------------------------------------: |
| Groups | rol-<org>-administrators<br>rol-<org>-users |

#### Excluded groups

No results.

### Related information

#### Security & Governance

* [Authentication Hardening]({{<ref "system-hardening-authentication">}}) 
* [Enterprise Mobility]({{<ref "security-and-governance/system-security-plan/enterprise-mobility.md">}})
* [User Application Hardening]({{<ref "system-hardening-user-apps.md">}})
* [Essential Eight: Patch Applications]({{< ref "patch-applications.md">}})
* [Essential Eight: Patch Operating Systems]({{< ref "patch-os.md">}})
  
#### Design

* [Endpoint Management]({{<ref "design/platform/client">}})


#### Configuration

* [Microsoft Intune - Devices]({{<ref "configuration/intune/devices">}})
* [Microsoft Entra ID - Devices]({{<ref "configuration/entra-id/devices">}})
* [Windows]({{<ref "configuration/intune/apps/by-platform/windows.md">}})
* [Endpoint security policies]({{<ref "configuration/defender/endpoints/configuration-management/endpoint-security-policies.md">}})

#### References

* None identified



