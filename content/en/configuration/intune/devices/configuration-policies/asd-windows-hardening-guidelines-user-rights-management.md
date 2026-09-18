---
title: "ASD Windows hardening guidelines - user rights assignment"
weight: 30
description: "This section describes the settings for device configuration profiles within Microsoft Intune associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the _as built_ configuration for ASD's _Blueprint for Secure Cloud_ (the Blueprint) for the Microsoft Intune portal at the following URL:

<https://intune.microsoft.com/#view/Microsoft_Intune_DeviceSettings/DevicesMenu/~/configuration>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

{{% alert title="Importing policies" color="info" %}}

This configuration policy can be imported.

Download the {{% download file="/content/files/intune-config-policies/WindowsUserRights.txt" %}} User Rights Assignment {{% /download %}} _.txt_ file and change the extension to _.json_, then select **Create > Import Policy**.

{{% /alert %}}

### Basics

| Item         |                                                     Value |
| ------------ | --------------------------------------------------------: |
| Name         | ASD Windows hardening guidelines - user rights assignment |
| Description  |                                                           |
| Platform     |                                      Windows 10 and later |
| Profile type |                                                    Custom |

### Assignments

#### Included groups

| Item   |       Value |
| ------ | ----------: |
| Groups | All devices |

#### Excluded groups

| Item   |              Value |
| ------ | -----------------: |
| Groups | No groups selected |

### Scope tags

| Item       |   Value |
| ---------- | ------: |
| Scope tags | Default |

### Configuration settings

#### SeCreatePermanentPrivilege

| Item        |                                                                        Value |
| ----------- | ---------------------------------------------------------------------------: |
| Displayname |                                                   SeCreatePermanentPrivilege |
| umaUri      | "./Device/Vendor/MSFT/Policy/Config/UserRights/CreatePermanentSharedObjects" |
| IsEncrypted |                                                                        false |

#### SeCreateTokenPrivilege

| Item        |                                                       Value |
| ----------- | ----------------------------------------------------------: |
| Displayname |                                      SeCreateTokenPrivilege |
| umaUri      | "./Device/Vendor/MSFT/Policy/Config/UserRights/CreateToken" |
| IsEncrypted |                                                       false |

#### SeEnableDelegationPrivilege

| Item        |                                                            Value |
| ----------- | ---------------------------------------------------------------: |
| Displayname |                                      SeEnableDelegationPrivilege |
| umaUri      | "./Device/Vendor/MSFT/Policy/Config/UserRights/EnableDelegation" |
| IsEncrypted |                                                            false |

#### SeLockMemoryPrivilege

| Item        |                                                      Value |
| ----------- | ---------------------------------------------------------: |
| Displayname |                                      SeLockMemoryPrivilege |
| umaUri      | "./Device/Vendor/MSFT/Policy/Config/UserRights/LockMemory" |
| IsEncrypted |                                                      false |

#### SeTrustedCredManAccessPrivilege

| Item        |                                                                                  Value |
| ----------- | -------------------------------------------------------------------------------------: |
| Displayname |                                                        SeTrustedCredManAccessPrivilege |
| umaUri      | "./Device/Vendor/MSFT/Policy/Config/UserRights/AccessCredentialManagerAsTrustedCaller" |
| IsEncrypted |                                                                                  false |

#### SeTcbPrivilege

| Item        |                                                                         Value |
| ----------- | ----------------------------------------------------------------------------: |
| Displayname |                                                                SeTcbPrivilege |
| umaUri      | "./Device/Vendor/MSFT/Policy/Config/UserRights/ActAsPartOfTheOperatingSystem" |
| IsEncrypted |                                                                         false |

### Related information

#### Security and governance

- [Restrict Microsoft Office macros](/security-and-governance/essential-eight/restrict-microsoft-office-macros)
- [User application hardening](/security-and-governance/system-security-plan/system-hardening-user-apps)
- [Essential Eight - Patch applications](/security-and-governance/essential-eight/patch-applications)
- [Essential Eight - Patch operating systems](/security-and-governance/essential-eight/patch-os)
- [Essential Eight - Regular backups](/security-and-governance/essential-eight/regular-backups)
- [System management](/security-and-governance/system-security-plan/system-management)
- [Enterprise mobility](/security-and-governance/system-security-plan/enterprise-mobility)
- [System monitoring](/security-and-governance/system-security-plan/system-monitoring)
- [Essential Eight - Application control](/security-and-governance/essential-eight/application-control)

#### Design

- [Microsoft Office macro hardening](/design/endpoints/windows/security/microsoft-office-macro-hardening)
- [Microsoft Office hardening](/design/endpoints/windows/security/microsoft-office-hardening)

#### Configuration

- [Microsoft Intune - profile configurations](/configuration/intune/devices/configuration-policies)
- [Endpoint security policies](/configuration/defender/endpoints/configuration-management/endpoint-security-policies)
- [Permissions](/configuration/defender/system/settings/endpoints/permissions)
- [Rules](/configuration/defender/system/settings/endpoints/rules)

#### References

- None identified
