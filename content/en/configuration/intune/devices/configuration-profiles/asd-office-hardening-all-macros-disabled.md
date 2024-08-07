---
title: "ASD Office Hardening - All Macros Disabled"
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

| Item        |                                      Value |
| ----------- | -----------------------------------------: |
| Name        | ASD Office Hardening - All Macros Disabled |
| Description |                                            |
| Platform    |                       Windows 10 and later |

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

#### Microsoft Access 2016

| Item                                                                   |                            Value |
| ---------------------------------------------------------------------- | -------------------------------: |
| **Application Settings > Security > Trust Center**                     | Disable all without notification |
| Turn off trusted documents (User)                                      |                          Enabled |
| Turn off Trusted Documents on the network (User)                       |                          Enabled |
| VBA Macro Notification Settings (User)                                 |                          Enabled |
| **Application Settings > Security > Trust Center > Trusted Locations** |                                  |
| Allow Trusted Locations on the network (User)                          |                         Disabled |
| Disable all trusted locations (User)                                   |                          Enabled |

#### Microsoft Excel 2016

| Item                                                            |                            Value |
| --------------------------------------------------------------- | -------------------------------: |
| **Excel Options > Security > Trust Center**                     | Disable all without notification |
| Trust access to Visual Basic Project (User)                     |                         Disabled |
| Turn off trusted documents (User)                               |                          Enabled |
| Turn off Trusted Documents on the network (User)                |                          Enabled |
| VBA Macro Notification Settings (User)                          |                          Enabled |
| **Excel Options > Security > Trust Center > Trusted Locations** |                                  |
| Allow Trusted Locations on the network (User)                   |                         Disabled |
| Disable all trusted locations (User)                            |                          Enabled |

#### Microsoft Office 2016

| Item                                          |                     Value |
| --------------------------------------------- | ------------------------: |
| **Security Settings**                         |                           |
| Automation Security (User)                    |                   Enabled |
| - Set the Automation Security level (User)    | Disable macros by default |
| Disable VBA for Office applications (User)    |                   Enabled |
| **Security Settings > Trust Center**          |                           |
| Allow mix of policy and user locations (User) |                  Disabled |

#### Microsoft Outlook 2016

| Item                                                                           |    Value |
| ------------------------------------------------------------------------------ | -------: |
| **Security > Trust Center**                                                    |          |
| Apply macro security settings to macros, add-ins and additional actions (User) |  Enabled |
| Security setting for macros (User) (Deprecated)                                | Disabled |

#### Microsoft PowerPoint 2016

| Item                                                                 |                            Value |
| -------------------------------------------------------------------- | -------------------------------: |
| **PowerPoint Options > Security > Trust Center**                     | Disable all without notification |
| Trust access to Visual Basic Project (User)                          |                         Disabled |
| Turn off trusted documents (User)                                    |                          Enabled |
| Turn off Trusted Documents on the network (User)                     |                          Enabled |
| VBA Macro Notification Settings (User)                               |                          Enabled |
| **PowerPoint Options > Security > Trust Center > Trusted Locations** |                                  |
| Allow Trusted Locations on the network (User)                        |                         Disabled |
| Disable all trusted locations (User)                                 |                          Enabled |

#### Microsoft Project 2016

| Item                                          |                            Value |
| --------------------------------------------- | -------------------------------: |
| **Project Options > Security > Trust Center** | Disable all without notification |
| Allow Trusted Locations on the network (User) |                         Disabled |
| Disable all trusted locations (User)          |                          Enabled |
| VBA Macro Notification Settings (User)        |                          Enabled |

#### Microsoft Publisher 2016

| Item                                       |                            Value |
| ------------------------------------------ | -------------------------------: |
| **Security**                               |                  High (disabled) |
| Publisher Automation Security Level (User) |                          Enabled |
| **Security > Trust Center**                | Visio Options > Security > Trust Center
 |
| VBA Macro Notification Settings (User)     |                          Enabled |

#### Microsoft Visio 2016

| Item                                                                   |                            Value |
| ---------------------------------------------------------------------- | -------------------------------: |
| **Visio Options > Security > Trust Center**                            | Disable all without notification |
| Allow Trusted Locations on the network (User)                          |                         Disabled |
| Disable all trusted locations (User)                                   |                          Enabled |
| Turn off trusted documents (User)                                      |                          Enabled |
| Turn off Trusted Documents on the network (User)                       |                          Enabled |
| VBA Macro Notification Settings (User)                                 |                          Enabled |
| **Visio Options > Security > Macro Security**                          |                                  |
| Enable Microsoft Visual Basic for Applications project creation (User) |                         Disabled |
| Load Microsoft Visual Basic for Applications projects from text (User) |                         Disabled |

#### Microsoft Word 2016

| Item                                                           |                            Value |
| -------------------------------------------------------------- | -------------------------------: |
| **Word Options > Security > Trust Center**                     | Disable all without notification |
| Trust access to Visual Basic Project (User)                    |                         Disabled |
| Turn off trusted documents (User)                              |                          Enabled |
| Turn off Trusted Documents on the network (User)               |                          Enabled |
| VBA Macro Notification Settings (User)                         |                          Enabled |
| **Word Options > Security > Trust Center > Trusted Locations** |                                  |
| Allow Trusted Locations on the network (User)                  |                         Disabled |
| Disable all trusted locations (User)                           |                          Enabled |

### Related information

#### Security & Governance

* [User Application Hardening]({{<ref "security-and-governance/system-security-plan/system-hardening-user-apps.md">}})
* [Essential Eight: Restrict Microsoft Office Macros]({{<ref "restrict-microsoft-office-macros.md">}})
* [Essential Eight: Patch Applications]({{< ref "patch-applications.md">}})
* [Essential Eight: Patch Operating Systems]({{< ref "patch-os.md">}})
* [Essential Eight: Regular Backups]({{< ref "regular-backups.md">}})
* [System Management]({{<ref "system-management.md">}})
* [Enterprise Mobility]({{<ref "security-and-governance/system-security-plan/enterprise-mobility.md">}})
* [System Monitoring]({{<ref "system-monitoring.md">}})
* [Application Control]({{<ref "security-and-governance/essential-eight/application-control.md">}})
  
#### Design

* [Applications]({{<ref "design/endpoints/applications">}})
  
#### Configuration

* [Microsoft Intune - profile configurations]({{<ref "configuration/intune/devices/configuration-profiles">}})
* [Endpoint security policies]({{<ref "configuration/defender/endpoints/configuration-management/endpoint-security-policies.md">}})
* [Permissions]({{<ref "configuration/defender/settings/endpoints/permissions.md">}})
* [Rules]({{<ref "configuration/defender/settings/endpoints/rules.md">}})


#### References

* None identified