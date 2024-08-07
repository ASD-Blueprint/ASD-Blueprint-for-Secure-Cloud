---
title: "Windows"
linkTitle: "Windows"
weight: 10
description: "This section describes the configuration of Windows within Microsoft Intune associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Intune portal at the following URL:

<https://intune.microsoft.com/#view/Microsoft_Intune_DeviceSettings/AppsWindowsMenu/~/windowsApps>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Company Portal

#### App information

| Item                                              |                                                                                                                                                                                                                                                                                                                                                                                                                           Value |
| ------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| Name                                              |                                                                                                                                                                                                                                                                                                                                                                                                                  Company Portal |
| Description                                       | Microsoft Intune helps organizations manage access to corporate apps, data, and resources. Company Portal is the app that lets you, as an employee of your company, securely access those resources.<br><br>Before you can use this app, make sure your IT admin has set up your work account. Your company must also have a subscription to Microsoft Intune.<br><br>Company Portal helps simplify the tasks you need to do... |
| Publisher                                         |                                                                                                                                                                                                                                                                                                                                                                                                           Microsoft Corporation |
| Package Identifier                                |                                                                                                                                                                                                                                                                                                                                                                                                                    9WZDNCRFJ3PZ |
| Installer Type                                    |                                                                                                                                                                                                                                                                                                                                                                                                                             UWP |
| Install behavior                                  |                                                                                                                                                                                                                                                                                                                                                                                                                          System |
| Category                                          |                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| Show this as a featured app in the Company Portal |                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| Information URL                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| Privacy URL                                       |                                                                                                                                                                                                                                                                                                                                                                                   <http://go.microsoft.com/fwlink/?LinkID=316999> |
| Developer                                         |                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| Owner                                             |                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| Notes                                             |                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| Logo                                              |                                                                                                                                                                                                                                                                                                                                                                                                                                 |

#### Assignments

##### Required

| Item  |       Value |
| ----- | ----------: |
| Group | All devices |

### Microsoft 365 Apps for Windows 10 and later

#### App information

| Item                                              |                                               Value |
| ------------------------------------------------- | --------------------------------------------------: |
| Name                                              |         Microsoft 365 Apps for Windows 10 and later |
| Description                                       |         Microsoft 365 Apps for Windows 10 and later |
| Publisher                                         |                                           Microsoft |
| Category                                          |                                                     |
| Show this as a featured app in the Company Portal |                                                 Yes |
| Information URL                                   | <https://products.office.com/explore-office-for-home> |
| Privacy URL                                       |      <https://privacy.microsoft.com/privacystatement> |
| Developer                                         |                                           Microsoft |
| Owner                                             |                                           Microsoft |
| Notes                                             |                                                     |
| Logo                                              |                                                     |

#### App suite configuration

| Item                                                           |                                                                   Value |
| -------------------------------------------------------------- | ----------------------------------------------------------------------: |
| Configuration settings format                                  |                                                  Configuration designer |
| **Configure app suite**                                        |                                                                         |
| Select Office apps                                             | Excel<br>OneNote<br>Outlook<br>PowerPoint<br>Publisher<br>Teams<br>Word |
| Select other Office apps                                       |                                                            (0 selected) |
| **App suite information**                                      |                                                                         |
| Architecture                                                   |                                                                  64-bit |
| Default file format                                            |                                             Office Open Document Format |
| Update channel                                                 |                                              Monthly Enterprise Channel |
| Remove other versions                                          |                                                                     Yes |
| Version to install                                             |                                                                  Latest |
| Current version                                                |                                                                         |
| Specific version                                               |                                                                         |
| **Properties**                                                 |                                                                         |
| Use shared computer activation                                 |                                                                     Yes |
| Accept the Microsoft Software License Terms on behalf of users |                                                                     Yes |
| Install background service for Microsoft Search in Bing        |                                                                      No |
| Languages                                                      |                                                                         |

#### Assignments

##### Required

| Item  |       Value |
| ----- | ----------: |
| Group | All devices |

### Microsoft Edge for Windows 10 and later

#### App information

| Item                                              |                                                                                                                                                                                                                                                                       Value |
| ------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| Name                                              |                                                                                                                                                                                                                                     Microsoft Edge for Windows 10 and later |
| Description                                       | Microsoft Edge is the browser for business with modern and legacy web compatibility, new privacy features such as Tracking prevention, and built-in productivity tools such as enterprise-grade PDF support and access to Office and corporate search right from a new tab. |
| Publisher                                         |                                                                                                                                                                                                                                                                   Microsoft |
| Category                                          |                                                                                                                                                                                                                                                                Productivity |
| Show this as a featured app in the Company Portal |                                                                                                                                                                                                                                                                         Yes |
| Information URL                                   |                                                                                                                                                                                                                            <https://www.microsoft.com/windows/microsoft-edge> |
| Privacy URL                                       |                                                                                                                                                                                                                              <https://privacy.microsoft.com/privacystatement> |
| Developer                                         |                                                                                                                                                                                                                                                                   Microsoft |
| Owner                                             |                                                                                                                                                                                                                                                                   Microsoft |
| Notes                                             |                                                                                                                                                                                                                                                                             |

### App settings

| Item     |                    Value |
| -------- | -----------------------: |
| Channel  |                   Stable |
| Language | Operating system default |
| Logo     |                          |

#### Assignments

##### Required

| Item  |       Value |
| ----- | ----------: |
| Group | All devices |

### Visual Studio Code

#### App information

| Item                                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Value |
| ------------------------------------------------- | -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| Name                                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Visual Studio Code |
| Description                                       | Visual Studio Code is a free, lightweight, and extensible code editor for building web, desktop, and mobile applications, using any programming language and framework.<br><br>Visual Studio Code has built-in support for Git source control management and powerful integrations with GitHub, an integrated debugger, and smart code completion with IntelliSense and with AI-driven IntelliCode. With over 30,000 extensions and themes in the Visual Studio Code Marketplace, you can customize the features and the look of Visual Studio Code to fit your needs, preferences, and style.<br><br>You can use Visual Studio Code to build any kind of app, for web, desktop, and mobile. Visual Studio Code supports JavaScript and TypeScript natively and offers extensions for coding in languages such as Python, Java, C/C++, C#, Go, Rust, PHP, and many more. |
| Publisher                                         |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Microsoft Corporation |
| Package Identifier                                |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           XP9KHM4BK9FZ7Q |
| Installer Type                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Win32 |
| Install behavior                                  |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     User |
| Category                                          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| Show this as a featured app in the Company Portal |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       No |
| Information URL                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| Privacy URL                                       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     <https://privacy.microsoft.com/privacystatement> |
| Developer                                         |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| Owner                                             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| Notes                                             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| Logo                                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |

#### Assignments

##### Required

| Item  |       Value |
| ----- | ----------: |
| Group | All devices |

### Related information

#### Security & Governance

* [Authentication Hardening]({{<ref "system-hardening-authentication">}})
* [Application Control]({{<ref "security-and-governance/essential-eight/application-control.md">}})
* [User Application Hardening]({{<ref "system-hardening-user-apps.md">}})
* [Essential Eight: Patch Applications]({{< ref "patch-applications.md">}})
  
#### Design

* [Endpoint Management]({{<ref "design/platform/client">}})

#### Configuration

* [Microsoft Intune - Devices]({{<ref "configuration/intune/devices">}})
* [Microsoft Entra ID - Devices]({{<ref "configuration/entra-id/devices">}})
* [Windows]({{<ref "configuration/intune/apps/by-platform/windows.md">}})
* [Permissions]({{<ref "configuration/defender/settings/endpoints/permissions.md">}})

#### References

* [Defender for Endpoint](https://learn.microsoft.com/microsoft-365/security/defender-endpoint)
