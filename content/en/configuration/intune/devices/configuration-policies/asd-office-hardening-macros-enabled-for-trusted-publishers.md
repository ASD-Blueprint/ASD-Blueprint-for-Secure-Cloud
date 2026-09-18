---
title: "ASD Office hardening - macros enabled for trusted publishers"
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

Download the {{% download file="/content/files/intune-config-policies/OfficeMacrosForTrusted.txt" %}} Macros Enabled for Trusted Publishers {{% /download %}} _.txt_ file and change the extension to _.json_, then select **Create > Import Policy**.

{{% /alert %}}

### Basics

| Item        |                                                        Value |
| ----------- | -----------------------------------------------------------: |
| Name        | ASD Office hardening - macros enabled for trusted publishers |
| Description |                                                              |
| Platform    |                                         Windows 10 and later |

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

#### Administrative Templates

| Item                                                               |   Value |
| ------------------------------------------------------------------ | ------: |
| **Windows Components > Microsoft Management Console**              |         |
| Restrict users to the explicitly permitted list of snap-ins (User) | Enabled |

#### Microsoft Access 2016

| Item                                                                   |                                      Value |
| ---------------------------------------------------------------------- | -----------------------------------------: |
| **Disable Items in User Interface > Custom**                           |                                            |
| Enter a command bar ID to disable (User)                               |                                      19092 |
| Disable commands (User)                                                |                                    Enabled |
| **Application Settings > Security > Trust Center**                     | Disable all except digitally signed macros |
| Block macros from running in Office files from the Internet (User)     |                                    Enabled |
| Turn off trusted documents (User)                                      |                                    Enabled |
| Turn off Trusted Documents on the network (User)                       |                                    Enabled |
| VBA Macro Notification Settings (User)                                 |                                    Enabled |
| **Application Settings > Security > Trust Center > Trusted Locations** |                                            |
| Allow Trusted Locations on the network (User)                          |                                   Disabled |
| Disable all trusted locations (User)                                   |                                    Enabled |

#### Microsoft Excel 2016

| Item                                                               |                                       Value |
| ------------------------------------------------------------------ | ------------------------------------------: |
| **Excel Options>Security**                                         |                                             |
| Scan encrypted macros in Excel Open XML workbooks (User)           | Enabled<br>Scan encrypted macros (disabled) |
| **Excel Options > Security > Trust Center**                        |  Disable all except digitally signed macros |
| Block macros from running in Office files from the Internet (User) |                                     Enabled |
| Trust access to Visual Basic Project (User)                        |                                    Disabled |
| Turn off trusted documents (User)                                  |                                     Enabled |
| Turn off Trusted Documents on the network (User)                   |                                     Enabled |
| VBA Macro Notification Settings (User)                             |                                     Enabled |
| **Excel Options > Security > Trust Center > Trusted Locations**    |                                             |
| Allow Trusted Locations on the network (User)                      |                                    Disabled |
| Disable all trusted locations (User)                               |                                     Enabled |
| **Disable Items in User Interface > Custom**                       |                                             |
| Enter a command bar ID to disable (User)                           |                                       19092 |
| Disable commands (User)                                            |                                     Enabled |

#### Microsoft Office 2016

| Item                                                           |                                Value |
| -------------------------------------------------------------- | -----------------------------------: |
| **Security Settings**                                          |                                      |
| Automation Security (User)                                     |                              Enabled |
| - Set the Automation Security level (User)                     | Use application macro security level |
| Disable all Trust Bar notifications for security issues (User) |                              Enabled |
| Disable VBA for Office applications (User)                     |                             Disabled |
| Macro Runtime Scan Scope (User)                                |  Enabled<br>Enable for all documents |
| **Security Settings > Trust Center**                           |                                      |
| Allow mix of policy and user locations (User)                  |                             Disabled |

#### Microsoft PowerPoint 2016

| Item                                                                 |                                       Value |
| -------------------------------------------------------------------- | ------------------------------------------: |
| **Excel Options>Security**                                           |                                             |
| Scan encrypted macros in Excel Open XML workbooks (User)             | Enabled<br>Scan encrypted macros (disabled) |
| **PowerPoint Options > Security > Trust Center**                     |  Disable all except digitally signed macros |
| Block macros from running in Office files from the Internet (User)   |                                     Enabled |
| Trust access to Visual Basic Project (User)                          |                                    Disabled |
| Turn off trusted documents (User)                                    |                                     Enabled |
| Turn off Trusted Documents on the network (User)                     |                                     Enabled |
| VBA Macro Notification Settings (User)                               |                                     Enabled |
| **PowerPoint Options > Security > Trust Center > Trusted Locations** |                                             |
| Allow Trusted Locations on the network (User)                        |                                    Disabled |
| Disable all trusted locations (User)                                 |                                     Enabled |
| **Disable Items in User Interface > Custom**                         |                                             |
| Enter a command bar ID to disable (User)                             |                                       19092 |
| Disable commands (User)                                              |                                     Enabled |

#### Microsoft Project 2016

| Item                                          |                                      Value |
| --------------------------------------------- | -----------------------------------------: |
| **Project Options > Security > Trust Center** | Disable all except digitally signed macros |
| Allow Trusted Locations on the network (User) |                                   Disabled |
| Disable all trusted locations (User)          |                                    Enabled |
| VBA Macro Notification Settings (User)        |                                    Enabled |

#### Microsoft Publisher 2016

| Item                                         |                                      Value |
| -------------------------------------------- | -----------------------------------------: |
| **Security**                                 |                                            |
| Publisher Automation Security Level (User)   |                Enabled<br>By UI (prompted) |
| **Security > Trust Center**                  | Disable all except digitally signed macros |
| VBA Macro Notification Settings (User)       |                                    Enabled |
| **Disable Items in User Interface > Custom** |                                            |
| Enter a command bar ID to disable (User)     |                                      19092 |
| Disable commands (User)                      |                                    Enabled |

#### Microsoft Visio 2016

| Item                                                                   |                                      Value |
| ---------------------------------------------------------------------- | -----------------------------------------: |
| **Visio Options > Security > Trust Center**                            | Disable all except digitally signed macros |
| Allow Trusted Locations on the network (User)                          |                                   Disabled |
| Block macros from running in Office files from the Internet (User)     |                                    Enabled |
| Disable all trusted locations (User)                                   |                                    Enabled |
| Turn off trusted documents (User)                                      |                                    Enabled |
| Turn off Trusted Documents on the network (User)                       |                                    Enabled |
| VBA Macro Notification Settings (User)                                 |                                    Enabled |
| **Visio Options > Security > Macro Security**                          |                                            |
| Enable Microsoft Visual Basic for Applications project creation (User) |                                   Disabled |
| Load Microsoft Visual Basic for Applications projects from text (User) |                                   Disabled |
| **Disable Items in User Interface > Custom**                           |                                            |
| Enter a command bar ID to disable (User)                               |                                      19092 |
| Disable commands (User)                                                |                                    Enabled |

#### Microsoft Word 2016

| Item                                                               |                                      Value |
| ------------------------------------------------------------------ | -----------------------------------------: |
| **Word Options > Security > Trust Center**                         | Disable all except digitally signed macros |
| Block macros from running in Office files from the Internet (User) |                                    Enabled |
| Scan encrypted macros in Word Open XML documents (User)            | Enabled<br>Scan encrypted macros (default) |
| Trust access to Visual Basic Project (User)                        |                                   Disabled |
| Turn off trusted documents (User)                                  |                                    Enabled |
| Turn off Trusted Documents on the network (User)                   |                                    Enabled |
| VBA Macro Notification Settings (User)                             |                                    Enabled |
| **Word Options > Security > Trust Center > Trusted Locations**     |                                            |
| Allow Trusted Locations on the network (User)                      |                                   Disabled |
| Disable all trusted locations (User)                               |                                    Enabled |
| **Disable Items in User Interface > Custom**                       |                                            |
| Enter a command bar ID to disable (User)                           |                                      19092 |
| Disable commands (User)                                            |                                    Enabled |

### Related information

#### Security and governance

- [Operating system hardening](/security-and-governance/system-security-plan/system-hardening-os)
- [User application hardening](/security-and-governance/system-security-plan/system-hardening-user-apps)
- [Essential Eight - Restrict Microsoft Office macros](/security-and-governance/essential-eight/restrict-microsoft-office-macros)
- [Essential Eight - Patch applications](/security-and-governance/essential-eight/patch-applications)
- [Essential Eight - Regular backups](/security-and-governance/essential-eight/regular-backups)
- [System management](/security-and-governance/system-security-plan/system-management)
- [System monitoring](/security-and-governance/system-security-plan/system-monitoring)
- [Enterprise mobility](/security-and-governance/system-security-plan/enterprise-mobility)
- [Essential Eight - Application control](/security-and-governance/essential-eight/application-control)

#### Design

- None identified

#### Configuration

- [Microsoft Intune - profile configurations](/configuration/intune/devices/configuration-policies)
- [Endpoint security policies](/configuration/defender/endpoints/configuration-management/endpoint-security-policies)
- [Permissions](/configuration/defender/system/settings/endpoints/permissions)
- [Rules](/configuration/defender/system/settings/endpoints/rules)

#### References

- None identified
