---
title: "Windows Features"
weight: 30
description: "This section describes the design decisions associated with Windows features on Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

Windows 10 and 11 incorporates optional features that can be enabled to offer additional functionality. When deploying a Windows Standard Operating Environment (SOE), removing unnecessary features from the standard installation creates a simpler image to maintain. In Windows if a feature is not required or used within an environment, its removal means a faster deployment and a simpler user experience.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                                                                  | Design decision | Justification                                                                                                                                                                                                                         |
|---------------------------------------------------------------------------------|-----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| .Net Framework 3.5                                                              | Disabled        | Disabled by default to meet user application hardening guidelines in ASD's [*Essential Eight*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/essential-eight).                                                                                       |
| .Net Framework 4.8                                                              | Enabled         | This is to support modern .Net applications on the Windows SOE device.                                                                                                                                                                |
| Internet Explorer 11                                                            | Disabled        | Disabled by default to meet user application hardening guidelines in ASD's [*Essential Eight*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/essential-eight) and the deprecation of the IE 11 feature. Note, this is not applicable to Windows 11. |
| Windows Media Features                                                          | Enabled         | Support media content functionality.                                                                                                                                                                                                  |
| Windows Ink Workspace                                                           | Enabled         | Required to support full functionality of devices to be deployed, including Handwriting support.                                                                                                                                      |
| Print and Document Services - Windows Fax and Scan                              | Enabled         | Support scanning functionality.                                                                                                                                                                                                       |
| Printing                                                                        | Enabled         | Printing enabled for office use only. Printer drivers must be supported by Windows 10.                                                                                                                                                |
| Microsoft Print to PDF                                                          | Enabled         | Enables user support for Print to PDF.                                                                                                                                                                                                |
| Microsoft XPS Doc Writer                                                        | Enabled         | Enables user support for Microsoft XPS Doc Writer functionality.                                                                                                                                                                      |
| Remote Differential Compression Application Programming Interface (API) Support | Enabled         | Required for application compatibility.                                                                                                                                                                                               |
| Windows PowerShell                                                              | Enabled         | Support administration scripting activities, with Constrained Language Mode. Note: PowerShell version 2.0 should be disabled or removed.                                                                                              |

{{% /alert %}}

### Related information

#### Security & Governance

* [Essential Eight - User Application Hardening]({{<ref "security-and-governance/essential-eight/user-application-hardening.md">}})

#### Design

* None identified

#### Configuration

* None identified

#### References

* None identified