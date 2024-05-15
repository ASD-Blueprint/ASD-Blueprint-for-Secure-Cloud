---
Title: "ASD Office Hardening Guidelines"
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

| Item        |                           Value |
| ----------- | ------------------------------: |
| Name        | ASD Office Hardening Guidelines |
| Description |                                 |
| Platform    |            Windows 10 and later |

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

| Item                                                               |   Value |
| ------------------------------------------------------------------ | ------: |
| **Application Settings > Security > Trust Center**                 |         |
| Block macros from running in Office files from the Internet (User) | Enabled |

#### Microsoft Excel 2016

| Item                                                                                               |                                   Value |
| -------------------------------------------------------------------------------------------------- | --------------------------------------: |
| **Excel Options > Security**                                                                       |                                         |
| Force file extension to match file type (User)                                                     |       Enabled<br>Always match file type |
| Turn off file validation (User)                                                                    |                                Disabled |
| **Excel Options > Security > Trust Center**                                                        |                                 Enabled |
| Block macros from running in Office files from the Internet (User)                                 |                                 Enabled |
| Disable Trust Bar Notification for unsigned application add-ins and block them (User) (Deprecated) |                                 Enabled |
| Require that application add-ins are signed by Trusted Publisher (User)                            |                                 Enabled |
| Turn off trusted documents (User)                                                                  |                                 Enabled |
| Turn off Trusted Documents on the network (User)                                                   |                                 Enabled |
| **Excel Options > Security > Trust Center > External Content**                                     |                                         |
| Always prevent untrusted Microsoft Query files from opening (User)                                 |                                 Enabled |
| Don’t allow Dynamic Data Exchange (DDE) server launch in Excel (User)                              |                                 Enabled |
| Don’t allow Dynamic Data Exchange (DDE) server lookup in Excel (User)                              |                                 Enabled |
| **Excel Options > Security > Trust Center > File Block Settings**                                  |                                         |
| dBase III / IV files (User)                                                                        |                                 Enabled |
| - File block setting (User)                                                                        |      Open/Save blocked, use open policy |
| Dif and Sylk files (User)                                                                          |                                 Enabled |
| - File block setting (User)                                                                        |      Open/Save blocked, use open policy |
| Excel 2 macrosheets and add-in files (User)                                                        |                                 Enabled |
| - File block setting (User)                                                                        |      Open/Save blocked, use open policy |
| Excel 2 worksheets (User)                                                                          |                                 Enabled |
| - File block setting (User)                                                                        |      Open/Save blocked, use open policy |
| Excel 3 macrosheets and add-in files (User)                                                        |                                 Enabled |
| - File block setting (User)                                                                        |      Open/Save blocked, use open policy |
| Excel 3 worksheets (User)                                                                          |                                 Enabled |
| - File block setting (User)                                                                        |      Open/Save blocked, use open policy |
| Excel 4 macrosheets and add-in files (User)                                                        |                                 Enabled |
| - File block setting (User)                                                                        |      Open/Save blocked, use open policy |
| Excel 4 workbooks (User)                                                                           |                                 Enabled |
| - File block setting (User)                                                                        |      Open/Save blocked, use open policy |
| Excel 4 worksheets (User)                                                                          |                                 Enabled |
| - File block setting (User)                                                                        |      Open/Save blocked, use open policy |
| Excel 95 workbooks (User)                                                                          |                                 Enabled |
| - File block setting (User)                                                                        |      Open/Save blocked, use open policy |
| Excel 95-97 workbooks and templates (User)                                                         |                                 Enabled |
| - File block setting (User)                                                                        |      Open/Save blocked, use open policy |
| Excel 97-2003 workbooks and templates (User)                                                       |                                 Enabled |
| - File block setting (User)                                                                        |      Open/Save blocked, use open policy |
| Set default file block behavior (User)                                                             | Enabled<br>Blocked files are not opened |
| Web pages and Excel 2003 XML spreadsheets (User)                                                   |                                 Enabled |
| - File block setting (User)                                                                        |      Open/Save blocked, use open policy |
| **Excel Options > Security > Trust Center > Protected View**                                       |                                         |
| Always open untrusted database files in Protected View (User)                                      |                                 Enabled |
| Do not open files from the Internet zone in Protected View (User)                                  |                                Disabled |
| Do not open files in unsafe locations in Protected View (User)                                     |                                Disabled |
| Set document behavior if file validation fails (User)                                              |                  Enabled<br>Block files |
| - Checked: Allow edit. Unchecked: Do not allow edit. (User)                                        |                                   False |
| Turn off Protected View for attachments opened from Outlook (User)                                 |                                Disabled |


#### Microsoft Office 2016

| Item                                                                                      |                               Value |
| ----------------------------------------------------------------------------------------- | ----------------------------------: |
| **Security Settings**                                                                     |                                     |
| Allow file extensions for OLE embedding (User)                                            |                            Disabled |
| Disable All ActiveX (User)                                                                |                             Enabled |
| Force Runtime AV Scan (User)                                                              |                             Enabled |
| Macro Runtime Scan Scope (User)                                                           | Enabled<br>Enable for all documents |
| **Trust Center**                                                                          |                                     |
| Allow including screenshot with Office Feedback (User)                                    |                            Disabled |
| Automatically receive small updates to improve reliability (User)                         |                            Disabled |
| Configure the level of client software diagnostic data sent by Office to Microsoft (User) |                             Enabled |
| - Type of diagnostic data: (User)                                                         |                            Required |
| Disable Opt-in Wizard on first run (User)                                                 |                             Enabled |
| Enable Customer Experience Improvement Program (User)                                     |                            Disabled |
| Send Office Feedback (User)                                                               |                            Disabled |
| Send personal information (User)                                                          |                            Disabled |

#### Microsoft PowerPoint 2016

| Item                                                                                               |                                       Value |
| -------------------------------------------------------------------------------------------------- | ------------------------------------------: |
| **PowerPoint Options > Security**                                                                  |                                     Enabled |
| Make hidden markup visible (User)                                                                  |                                     Enabled |
| Run Programs (User)                                                                                | Enabled<br>disable (don't run any programs) |
| Turn off file validation                                                                           |                                    Disabled |
| **PowerPoint Options > Security > Trust Center**                                                   |                                             |
| Block macros from running in Office files from the Internet (User)                                 |                                     Enabled |
| Disable Trust Bar Notification for unsigned application add-ins and block them (User) (Deprecated) |                                     Enabled |
| Require that application add-ins are signed by Trusted Publisher (User)                            |                                     Enabled |
| Turn off trusted documents (User)                                                                  |                                     Enabled |
| Turn off Trusted Documents on the network (User)                                                   |                                     Enabled |
| **PowerPoint Options > Security > Trust Center > File Block Settings**                             |                                             |
| PowerPoint 2007 and later presentations, shows, templates, themes and add-in files (User)          |                                    Disabled |
| Set default file block behavior (User)                                                             |     Enabled<br>Blocked files are not opened |
| **PowerPoint Options > Security > Trust Center > Protected View**                                  |                                             |
| Do not open files from the Internet zone in Protected View (User)                                  |                                    Disabled |
| Do not open files in unsafe locations in Protected View (User)                                     |                                    Disabled |
| Set document behavior if file validation fails (User)                                              |                      Enabled<br>Block files |
| - Checked: Allow edit. Unchecked: Do not allow edit. (User)                                        |                                       False |
| Turn off Protected View for attachments opened from Outlook (User)                                 |                                    Disabled |

#### Microsoft Project 2016

| Item                                                                                               |   Value |
| -------------------------------------------------------------------------------------------------- | ------: |
| **Project Options > Security > Trust Center**                                                      |         |
| Disable Trust Bar Notification for unsigned application add-ins and block them (User) (Deprecated) | Enabled |
| Require that application add-ins are signed by Trusted Publisher (User)                            | Enabled |

#### Microsoft Visio 2016

| Item                                                                |                              Value |
| ------------------------------------------------------------------- | ---------------------------------: |
| **Visio Options > Security > Trust Center**                         |                                    |
| Block macros from running in Office files from the Internet (User)  |                            Enabled |
| **Visio Options > Security > Trust Center > File Block Settings**   |                                    |
| - File block setting (User)                                         | Open/Save blocked, use open policy |
| Visio 2000-2002 Binary Drawings, Templates and Stencils (User)      |                            Enabled |
| - File block setting (User)                                         | Open/Save blocked, use open policy |
| Visio 2003-2010 Binary Drawings, Templates and Stencils (User)      |                            Enabled |
| - File block setting (User)                                         | Open/Save blocked, use open policy |
| Visio 5.0 or earlier Binary Drawings, Templates and Stencils (User) |                            Enabled |

#### Microsoft Word 2016

| Item                                                                                               |                                   Value |
| -------------------------------------------------------------------------------------------------- | --------------------------------------: |
| **Word Options > Security**                                                                        |                                         |
| Make hidden markup visible (User)                                                                  |                                 Enabled |
| Turn off file validation (User)                                                                    |                                Disabled |
| **Word Options > Security > Trust Center**                                                         |                                         |
| Block macros from running in Office files from the Internet (User)                                 |                                 Enabled |
| Disable Trust Bar Notification for unsigned application add-ins and block them (User) (Deprecated) |                                 Enabled |
| Require that application add-ins are signed by Trusted Publisher (User)                            |                                 Enabled |
| Turn off trusted documents (User)                                                                  |                                 Enabled |
| Turn off Trusted Documents on the network (User)                                                   |                                 Enabled |
| **Word Options > Security > Trust Center > File Block Settings**                                   |                                         |
| Set default file block behavior (User)                                                             | Enabled<br>Blocked files are not opened |
| Word 2 and earlier binary documents and templates (User)                                           |                                 Enabled |
| - File block setting (User)                                                                        |      Open/Save blocked, use open policy |
| Word 2000 binary documents and templates (User)                                                    |                                 Enabled |
| - File block setting (User)                                                                        |      Open/Save blocked, use open policy |
| Word 2003 binary documents and templates (User)                                                    |                                 Enabled |
| - File block setting (User)                                                                        |      Open/Save blocked, use open policy |
| Word 2007 and later binary documents and templates (User)                                          |                                 Enabled |
| - File block setting (User)                                                                        |      Open/Save blocked, use open policy |
| Word 6.0 binary documents and templates (User)                                                     |                                 Enabled |
| - File block setting (User)                                                                        |      Open/Save blocked, use open policy |
| Word 95 binary documents and templates (User)                                                      |                                 Enabled |
| - File block setting (User)                                                                        |      Open/Save blocked, use open policy |
| Word 97 binary documents and templates (User)                                                      |                                 Enabled |
| - File block setting (User)                                                                        |      Open/Save blocked, use open policy |
| Word XP binary documents and templates (User)                                                      |                                 Enabled |
| - File block setting (User)                                                                        |      Open/Save blocked, use open policy |
| **Word Options > Security > Trust Center > Protected View**                                        |                                         |
| Do not open files from the Internet zone in Protected View (User)                                  |                                Disabled |
| Do not open files in unsafe locations in Protected View (User)                                     |                                Disabled |
| Set document behavior if file validation fails (User)                                              |                  Enabled<br>Block files |
| - Checked: Allow edit. Unchecked: Do not allow edit. (User)                                        |                                   False |
| Turn off Protected View for attachments opened from Outlook (User)                                 |                                Disabled |
| **Word Options > Advanced**                                                                        |                                         |
| Update automatic links at Open (User)                                                              |                                Disabled |

### Related information

#### Security & Governance

* [Server Application Hardening]({{<ref "security-and-governance/system-security-plan/system-hardening-server-apps.md">}})
* [User Application Hardening]({{<ref "security-and-governance/system-security-plan/system-hardening-user-apps.md">}})
* [Restrict Microsoft Office Macros]({{<ref "security-and-governance/essential-eight/restrict-microsoft-office-macros.md">}})
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