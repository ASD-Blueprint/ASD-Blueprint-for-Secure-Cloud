---
title: "ASD Windows Hardening Guidelines-User Rights Assignment"
weight: 30
description: "This section describes the configuration of device configuration profiles within Microsoft Intune associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Intune portal at the following URL:

https://intune.microsoft.com/#view/Microsoft_Intune_DeviceSettings/DevicesMenu/~/configurationProfiles
 
The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

### Basics

| Item         |                                                   Value |
| ------------ | ------------------------------------------------------: |
| Name         | ASD Windows Hardening Guidelines-User Rights Assignment |
| Description  |                                                         |
| Platform     |                                    Windows 10 and later |
| Profile type |                                                  Custom |

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

The below must be configured using Graph API

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

#### Security & Governance

* [Restrict Microsoft Office Macros]({{<ref "security-and-governance/essential-eight/restrict-microsoft-office-macros.md">}})
* [User Application Hardening]({{<ref "security-and-governance/system-security-plan/system-hardening-user-apps.md">}})
* [Essential Eight: Patch Applications]({{< ref "patch-applications.md">}})
* [Essential Eight: Patch Operating Systems]({{< ref "patch-os.md">}})
* [Essential Eight: Regular Backups]({{< ref "regular-backups.md">}})
* [System Management]({{<ref "system-management.md">}})
* [Enterprise Mobility]({{<ref "security-and-governance/system-security-plan/enterprise-mobility.md">}})
* [System Monitoring]({{<ref "system-monitoring.md">}})
* [Application Control]({{<ref "security-and-governance/essential-eight/application-control.md">}})
  
#### Design

* [Microsoft Office Macro Hardening]({{<ref "design/endpoints/windows/security/microsoft-office-macro-hardening.md">}})
* [Microsoft Office Hardening]({{<ref "design/endpoints/windows/security/microsoft-office-hardening.md">}})

#### Configuration

* [Microsoft Intune - profile configurations]({{<ref "configuration/intune/devices/configuration-profiles">}})
* [Endpoint security policies]({{<ref "configuration/defender/endpoints/configuration-management/endpoint-security-policies.md">}})
* [Permissions]({{<ref "configuration/defender/settings/endpoints/permissions.md">}})
* [Rules]({{<ref "configuration/defender/settings/endpoints/rules.md">}})


#### References

* None identified