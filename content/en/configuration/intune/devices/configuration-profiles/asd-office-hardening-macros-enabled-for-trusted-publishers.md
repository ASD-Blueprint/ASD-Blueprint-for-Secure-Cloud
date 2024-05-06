---
Title: "ASD Office Hardening - Macros Enabled for Trusted Publishers"
weight: 30
description: "This section describes the configuration of device configuration profiles within Microsoft Intune associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Intune portal blade at the following URL:

https://intune.microsoft.com/#view/Microsoft_Intune_DeviceSettings/DevicesMenu/~/configurationProfiles
 
The settings described in these tables should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

### Basics

| Item        |                                                        Value |
| ----------- | -----------------------------------------------------------: |
| Name        | ASD Office Hardening - Macros Enabled for Trusted Publishers |
| Description |                                                              |
| Platform    |                                         Windows 10 and later |

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
| **Excel Options > Security > Trust Center**                        |  Disable all except digitally signed macros |
| Block macros from running in Office files from the Internet (User) |                                     Enabled |
| Trust access to Visual Basic Project (User)                        |                                    Disabled |
| Turn off trusted documents (User)                                  |                                     Enabled |
| Turn off Trusted Documents on the network (User)                   |                                     Enabled |
| VBA Macro Notification Settings (User)                             |                                     Enabled |
| **Excel Options > Security > Trust Center > Trusted Locations**    |                                             |
| Allow Trusted Locations on the network (User)                      |                                    Disabled |
| Disable all trusted locations (User)                               |                                     Enabled |
| Scan encrypted macros in Excel Open XML workbooks (User)           | Enabled<br>Scan encrypted macros (disabled) |
| **Disable Items in User Interface > Custom**                       |                                             |
| Enter a command bar ID to disable (User)                           |                                       19092 |
| Disable commands (User)                                            |                                     Enabled |

#### Microsoft Office 2016

| Item                                                           |                                Value |
| -------------------------------------------------------------- | -----------------------------------: |
| **Security Settings > Trust Center**                           |                                      |
| Allow mix of policy and user locations (User)                  |                             Disabled |
| Macro Runtime Scan Scope (User)                                |  Enabled<br>Enable for all documents |
| Disable VBA for Office applications (User)                     |                             Disabled |
| Disable all Trust Bar notifications for security issues (User) |                              Enabled |
| Automation Security (User)                                     |                              Enabled |
| - Set the Automation Security level (User)                     | Use application macro security level |

#### Microsoft PowerPoint 2016

| Item                                                                 |                                      Value |
| -------------------------------------------------------------------- | -----------------------------------------: |
| **PowerPoint Options > Security > Trust Center**                     | Disable all except digitally signed macros |
| Block macros from running in Office files from the Internet (User)   |                                    Enabled |
| Trust access to Visual Basic Project (User)                          |                                   Disabled |
| Turn off trusted documents (User)                                    |                                    Enabled |
| Turn off Trusted Documents on the network (User)                     |                                    Enabled |
| VBA Macro Notification Settings (User)                               |                                    Enabled |
| **PowerPoint Options > Security > Trust Center > Trusted Locations** |                                            |
| Allow Trusted Locations on the network (User)                        |                                   Disabled |
| Disable all trusted locations (User)                                 |                                    Enabled |
| Scan encrypted macros in PowerPoint Open XML presentations (User)    | Enabled<br>Scan encrypted macros (default) |
| **Disable Items in User Interface > Custom**                         |                                            |
| Enter a command bar ID to disable (User)                             |                                      19092 |
| Disable commands (User)                                              |                                    Enabled |

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
| **Security > Trust Center**                  | Disable all except digitally signed macros |
| VBA Macro Notification Settings (User)       |                                    Enabled |
| Publisher Automation Security Level (User)   |                Enabled<br>By UI (prompted) |
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

#### Security & Governance

* [Operating System Hardening]({{<ref "security-and-governance/system-security-plan/system-hardening-os.md">}})
* [User Application Hardening]({{<ref "security-and-governance/system-security-plan/system-hardening-user-apps.md">}})
* [Essential Eight: Restrict Microsoft Office Macros]({{<ref "restrict-microsoft-office-macros.md">}})
* [Essential Eight: Patch Applications]({{< ref "patch-applications.md">}})
* [Essential Eight: Regular Backups]({{< ref "regular-backups.md">}})
* [System Management]({{<ref "system-management.md">}})
* [System Monitoring]({{<ref "system-monitoring.md">}})
* [Enterprise Mobility]({{<ref "security-and-governance/system-security-plan/enterprise-mobility.md">}})
* [Application Control]({{<ref "security-and-governance/essential-eight/application-control.md">}})
  
#### Design

* None identified
  
#### Configuration

* [Microsoft Intune - profile configurations]({{<ref "configuration/intune/devices/configuration-profiles">}})
* [Endpoint security policies]({{<ref "configuration/defender/endpoints/configuration-management/endpoint-security-policies.md">}})
* [Permissions]({{<ref "configuration/defender/settings/endpoints/permissions.md">}})
* [Rules]({{<ref "configuration/defender/settings/endpoints/rules.md">}})


#### References

* None identified