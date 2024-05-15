---
title: Application Management
weight: 1
description: "This section describes the design decisions associated with the management of Applications deployed to endpoints for system(s) built using ASD's Blueprint for Secure Cloud."
---

Mobile Application Management (MAM) enables the management and protection of an organisation's data within an application. It controls data flows into and out of the application container that houses corporate data.

Using MAM, a corporate app that contains sensitive data can be managed on a wide variety of devices. Many productivity apps, such as the Microsoft Office apps, can be managed by Intune MAM. MAM can protect data within the application container using authentication methods and copy/paste controls. However, these controls must be balanced with any MDM controls of the device to maintain usability of the solution.

When deploying a hybrid solution, the management of Windows devices should be considered when choosing to implement MAM for clients. Management solutions such as Group Policy and Microsoft Endpoint Configuration Manager (MECM) can provide functionality to control applications that negates the use of MAM on Windows machines.

### Cloud native deployments

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                       | Design Decision                                                                                                                                                                | Justification                                                                                                                   |
|--------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| Mobile Application Management Method | Windows 10 – Intune<br>iOS - Intune                                                                                                                                            | Mobile applications (Windows 10 and iOS) will be deployed via Intune.                                                           |
| Applications Managed                 | Microsoft Purview Information Protection<br>Microsoft Corporate Portal<br>Adobe Reader<br>Microsoft Suite - <br>Outlook<br>Word<br>Excel<br>Teams<br>PowerPoint<br>OneNote<br>OneDrive | These core Microsoft business applications will be managed via Intune as they will be deployed to all Windows 10 and iOS users. |

{{% /alert %}}

### Hybrid deployments

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                       | Design Decision                                                                                                                                                                | Justification                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
|--------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Mobile Application Management Method | Windows 10 – Not Configured<br>iOS - Intune                                                                                                                                    | Organisations operating in hybrid environments can elect to have Windows 10 applications managed by an existing management solution, such as MECM and Group Policy, or to manage Windows 10 applications via Intune. The Blueprint offers an example of using MECM as the Windows 10 management tool for illustrative purposes. However, organisations can elect to have Intune as the primary MAM method for both platforms without affecting cyber security postures.<br>Mobile applications (iOS) will be deployed via Intune. |
| Applications Managed                 | Microsoft Purview Information Protection<br>Microsoft Corporate Portal<br>Adobe Reader<br>Microsoft Suite - <br>Outlook<br>Word<br>Excel<br>Teams<br>PowerPoint<br>OneNote<br>OneDrive | organisations operating in hybrid environments can elect to have Windows 10 applications managed by an existing management solution, such as MECM and Group Policy, or to manage Windows 10 applications via Intune. The Blueprint offers an example of using MECM as the Windows 10 management tool for illustrative purposes, however organisations can elect to have Intune as the primary MAM method for both platforms without affecting cyber security postures.<br>Mobile applications (iOS) will be deployed via Intune. |

{{% /alert %}}

### Application lifecycle

The lifecycle of applications can be managed using Microsoft Intune, which enables deployment, configuration, patching, and removal of applications. Microsoft Intune can provision managed applications to the following platforms:

* Android & Android Enterprise
* iOS & iPadOS
* macOS
* Windows 10 / 11

Application types that can be managed include:

* Store Apps (Android, iOS, Windows Phone, Microsoft Store, and Google Play)
* The Microsoft Office suite
* Microsoft Edge
* Microsoft Defender ATP
* Web links
* Built-In applications
* Line-of-Business applications
* Win32 applications
* Android Enterprise system applications

Applications can also be deployed via PowerShell Scripts or similarly through Detect / Remediation PowerShell Scripts.

When deploying a hybrid solution, the application lifecycle should be considered as other management solutions such as MECM may be performing the same service.

See [App management capabilities by platform](https://learn.microsoft.com/mem/intune/fundamentals/supported-devices-browsers) for full information on capabilities.

### Application deployment

ASD's *Blueprint for Secure Cloud* details a range of methods to deploy different applications:

* [**Windows Package Manager**](https://learn.microsoft.com/windows/package-manager/) - This is the successor technology to [Microsoft Store for Business](https://learn.microsoft.com/mem/intune/apps/windows-store-for-business). Leveraging the command line tool WinGet, it enables Platform Administrators with the relevant assigned rights to add applications.
* [**Windows (MSI) line-of-business app**](https://docs.microsoft.com/mem/intune/apps/lob-apps-windows) - This app packaging method uses .MSI files to publish the application. The main disadvantage is that the ability to update the app by using Win32 app supersedence is unable to be controlled, unless it is being used as a required deployment to a group. If the application has a high application update cadence, it is best to use the Windows app (Win32) method that enables application updates.
* [**Win 32**](https://docs.microsoft.com/mem/intune/apps/apps-win32-app-management) - This method involves sourcing the application executable directly from the vendor and packaging it using the [Intune Win App Utility](https://github.com/microsoft/Microsoft-Win32-Content-Prep-Tool) to deploy as a Intune application.
* [**Powershell Scripts**](https://docs.microsoft.com/mem/intune/apps/intune-management-extension) - scripts are used to do advanced application configuration and deployment where they cannot be packaged using the methods above.

### Application patching

The configuration recommended by the Blueprint assumes a patching policy in line with ASD's recommendations for [*Patching Applications and Operating Systems*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-administration/patching-applications-and-operating-systems), which states that application updates are to be deployed with 48 hours for patching Zero Day or Extreme Vulnerabilities, and within two weeks for other updates.

The following three methods are recommended within the Blueprint to meet this requirement for application updates:

1.  **Relevant applications are allowed to self-update** - These include Microsoft 365 Apps, including Teams, Google Chrome Enterprise Edition, Microsoft Edge, etc. These applications do not require any more work beyond the ability to check the Internet for updates. The main challenge is being able to package the initial installer to actually download the latest version. If this is not possible, then it may be necessary to rely on application auto-update mechanisms to activate. Please note the application must be able to update itself without the user having administrator rights to facilitate this approach.
2.  **Applications have a remediation task that runs daily to check for new versions** - These include Docker Desktop, Git for Windows, Microsoft Visual Studio Code. These applications have a daily update check run to see if there is an update, using automated [Proactive Remediations](https://docs.microsoft.com/mem/analytics/proactive-remediations) and consist of a detection script to validate the deployed version is the most up-to-date version and a remediation script that will deploy the latest version of the detection scripts determines the latest version is not installed.
3.  **Manual application package updates** - These are done by regular monitoring of new versions. It is recommended that these applications be monitored for updates manually, checking updates every 2 weeks at a minimum.

{{% alert title="Note" color="info" %}}

While not covered by the Blueprint, organisations may also want to consider [Microsoft Enterprise App Management](https://learn.microsoft.com/windows/client-management/enterprise-app-management) to enable patching of third party applications on Windows 10 and Windows 11.

{{% /alert %}}

### Applications by persona / role

Applications can be deployed to devices based on the authenticated persona or role. Applications managed via this means are controlled though application based Entra ID Security Groups. Example personas include: Information Worker (standard user), Developer and Platform Administrator.

Platform Administrators, for example, can also have a separate set of applications, which are deployed to separate Secure Administrative Workstation (SAW) devices. The SAW is a separate device that will receive different sets of compliance, security, and configuration profiles. The SAW is used for all privileged administration activities for the Microsoft 365 tenant. It should be a separate build, not built on other profiles, and should not be installed with collaboration applications such as Teams or Outlook.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point            | Design Decision                                                               | Justification                                                                                                                                               |
| ------------------------- | ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Application Deployment    | Configured                                                                    | Deployment and monitoring of the deployment can be assigned to users or devices.                                                                            |
| Application Configuration | Configured                                                                    | Store applications are easily updated while Win32 applications will need some packaging.                                                                    |
| Application Protection    | Configured                                                                    | In combination with conditional access and network boundaries, applications are limited with respect to the copy, paste, forwarding, printing capabilities. |
| Application Removal       | Configured                                                                    | When applications (or versions of applications) are no longer required they are removed via Intune.                                                         |
| Application Patching      | Automated where available <br>Otherwise, 48 hours (critical) 2 weeks (normal) | Applications are patched in line with ISM controls.                                                                                                         |

{{% /alert %}}

{{% alert title="Note" color="info" %}}

Windows Defender for Application Control (WDAC) is used to restricts the applications that users can run on Windows devices System Core (kernel). Applications deployed to Windows devices using Endpoint Manager need WDAC rules implemented as part of the deployment process.

{{% /alert %}}

### Related information

#### Security & Governance

* [User application hardening]({{<ref "security-and-governance/system-security-plan/system-hardening-user-apps.md">}})
* [Enterprise Mobility]({{<ref "security-and-governance/system-security-plan/enterprise-mobility.md">}})

#### Design

* [Windows Desktop Applications]({{<ref "/design/endpoints/windows/configuration/enterprise-applications">}})
* [Windows Universal Applications]({{<ref "universal-platform-applications">}})

#### Configuration

* [iOS and iPadOS]({{<ref "configuration/intune/apps/by-platform/ios-ipados.md">}})
* [Windows]({{< ref "configuration/intune/apps/by-platform/windows.md">}})

#### References

* [What is Microsoft Intune app management?](https://learn.microsoft.com/mem/intune/apps/app-management)
* [Proactive Remediations](https://docs.microsoft.com/mem/analytics/proactive-remediations)
* [Microsoft Enterprise App Management](https://learn.microsoft.com/windows/client-management/enterprise-app-management)
* [App management capabilities by platform](https://learn.microsoft.com/mem/intune/fundamentals/supported-devices-browsers)
* [Windows Package Manager](https://learn.microsoft.com/windows/package-manager/)
* [Microsoft Store for Business](https://learn.microsoft.com/mem/intune/apps/windows-store-for-business)
* [Windows (MSI) line-of-business app](https://docs.microsoft.com/mem/intune/apps/lob-apps-windows)
* [Win 32 App Management](https://docs.microsoft.com/mem/intune/apps/apps-win32-app-management)
* [Win 32 Content Prep Tool](https://github.com/microsoft/Microsoft-Win32-Content-Prep-Tool)
* [Intune Management Extension Powershell Scripts](https://docs.microsoft.com/mem/intune/apps/intune-management-extension)