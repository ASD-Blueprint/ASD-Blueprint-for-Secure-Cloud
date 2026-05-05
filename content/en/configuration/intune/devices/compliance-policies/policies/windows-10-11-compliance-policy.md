---
title: "Windows 10/11 compliance policy"
weight: 30
description: "This section describes the configuration of device compliance policies within Microsoft Intune associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the _as built_ configuration for ASD's _Blueprint for Secure Cloud_ (the Blueprint) for the Microsoft Intune portal at the following URL:

<https://intune.microsoft.com/#view/Microsoft_Intune_DeviceSettings/DevicesComplianceMenu/~/policies>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Basics

| Item         |                           Value |
| ------------ | ------------------------------: |
| Name         | Windows 10/11 compliance policy |
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
| Minimum OS version                    | 10.0.19045       |
| Maximum OS version                    |   Not configured |
| Minimum OS version for mobile devices | 10.0.19045       |
| Maximum OS version for mobile devices |   Not configured |

#### Configuration Manager Compliance

| Item                                                 |          Value |
| ---------------------------------------------------- | -------------: |
| Require device compliance from Configuration Manager | Not configured |

#### System Security

| Item                                                            |          Value |
| --------------------------------------------------------------- | -------------: |
| **Password**                                                    |                |
| Require a password to unlock mobile devices                     |        Require |
| Simple passwords                                                |          Block |
| Password type                                                   | Device default |
| Minimum password length                                         |             15 |
| Maximum minutes of inactivity before password is required       |     15 minutes |
| Password expiration (days)                                      |            365 |
| Number of previous passwords to prevent reuse                   |              5 |
| Require password when device returns from idle state            |        Require |
| **Encryption**                                                  |                |
| Require encryption of data storage on device                    |        Require |
| **Device Security**                                             |                |
| Firewall                                                        |        Require |
| Trusted Platform Module (TPM)                                   |        Require |
| Antivirus                                                       |        Require |
| Antispyware                                                     |        Require |
| **Defender**                                                    |                |
| Microsoft Defender Antimalware                                  |        Require |
| Microsoft Defender Antimalware minimum version                  |       4.18.0.0 |
| Microsoft Defender Antimalware security intelligence up-to-date |        Require |
| Real-time protection                                            |        Require |

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

#### Security and governance

- [Authentication hardening](/security-and-governance/system-security-plan/system-hardening-authentication)
- [Enterprise mobility](/security-and-governance/system-security-plan/enterprise-mobility)
- [User application hardening](/security-and-governance/system-security-plan/system-hardening-user-apps)
- [Essential Eight - Patch applications](/security-and-governance/essential-eight/patch-applications)
- [Essential Eight - Patch operating systems](/security-and-governance/essential-eight/patch-os)

#### Design

- [Endpoint Management](/design/platform/client)

#### Configuration

- [Microsoft Intune - Devices](/configuration/intune/devices)
- [Microsoft Entra ID - Devices](/configuration/entra-id/devices)
- [Windows](/configuration/intune/apps/by-platform/windows)
- [Endpoint security policies](/configuration/defender/endpoints/configuration-management/endpoint-security-policies)

#### References

- None identified
