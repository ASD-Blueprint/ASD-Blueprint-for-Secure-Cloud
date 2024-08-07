---
title: Security Baseline for Windows 10 and later
weight: 10
description: "This section describes the configuration of security baselines within Microsoft Intune associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Intune portal at the following URL:

https://intune.microsoft.com/#view/Microsoft_Intune_Workflows/SecurityManagementMenu/~/securityBaselines

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

Microsoft Windows Security Baseline

### Basics

| Item        |                               Value |
| ----------- | ----------------------------------: |
| Name        | Microsoft Windows Security Baseline |
| Description |                                     |
| Platform    |                Windows 10 and later |

### Assignments

| Item            |               Value |
| --------------- | ------------------: |
| Included groups | grp-windows10-users |
| Excluded groups |                     |

### Configuration settings

#### Above Lock

| Item                                   |    Value |
| -------------------------------------- | -------: |
| Voice activate apps from locked screen | Disabled |
| Block display of toast notification    |      Yes |

#### App Runtime

| Item                                               |   Value |
| -------------------------------------------------- | ------: |
| Microsoft accounts optional for Windows Store apps | Enabled |

#### Application management

| Item                                             | Value |
| ------------------------------------------------ | ----: |
| Block app installations with elevated privileges |   Yes |
| Block user control over installations            |   Yes |
| Block game DVR (desktop only)                    |   Yes |

#### Audit

| Item                                                         |               Value |
| ------------------------------------------------------------ | ------------------: |
| Account Logon Audit Credential Validation (Device)           | Success and Failure |
| Account Logon Audit Kerberos Authentication Service (Device) |                None |
| Account Logon Logoff Audit Account Lockout (Device)          |             Failure |
| Account Logon Logoff Audit Group Membership (Device)         |             Success |
| Account Logon Logoff Audit Logon (Device)                    | Success and Failure |
| Audit Other Logon Logoff Events (Device)                     | Success and Failure |
| Audit Special Logon (Device)                                 |                None |
| Audit Security Group Management (Device)                     |                None |
| Audit User Account Management (Device)                       | Success and Failure |
| Detailed Tracking Audit PNP Activity (Device)                |             Success |
| Detailed Tracking Audit Process Creation (Device)            |             Success |
| Object Access Audit Detailed File Share (Device)             |             Failure |
| Audit File Share Access (Device)                             | Success and Failure |
| Object Access Audit Other Object Access Events (Device)      | Success and Failure |
| Object Access Audit Removable Storage (Device)               | Success and Failure |
| Audit Authentication Policy Change (Device)                  |             Success |
| Policy Change Audit MPSSVC Rule Level Policy Change (Device) | Success and Failure |
| Policy Change Audit Other Policy Change Events (Device)      |                None |
| Audit Changes to Audit Policy (Device)                       |                None |
| Privilege Use Audit Sensitive Privilege Use (Device)         | Success and Failure |
| System Audit Other System Events (Device)                    | Success and Failure |
| System Audit Security State Change (Device)                  |             Success |
| Audit Security System Extension (Device)                     |             Success |
| System Audit System Integrity (Device)                       | Success and Failure |

#### Auto Play

| Item                                   |          Value |
| -------------------------------------- | -------------: |
| Auto play default auto run behavior    | Not configured |
| Auto play mode                         | Not configured |
| Block auto play for non-volume devices | Not configured |

#### BitLocker

| Item                                                                     |     Value |
| ------------------------------------------------------------------------ | --------: |
| BitLocker removable drive policy                                         | Configure |
| - Block write access to removable data-drives not protected by BitLocker |       Yes |

#### Browser

| Item                                            |          Value |
| ----------------------------------------------- | -------------: |
| Block Password Manager                          | Not configured |
| Require SmartScreen for Microsoft Edge Legacy   |            Yes |
| Block malicious site access                     |            Yes |
| Block unverified file download                  |            Yes |
| Prevent user from overriding certificate errors |            Yes |

#### Connectivity

| Item                                                                   |          Value |
| ---------------------------------------------------------------------- | -------------: |
| Configure secure access to UNC paths                                   | Not configured |
| Block downloading of print drivers over HTTP                           |        Enabled |
| Block Internet download for web publishing and online ordering wizards |        Enabled |

#### Credentials Delegation

| Item                                                 |          Value |
| ---------------------------------------------------- | -------------: |
| Remote host delegation of non-exportable credentials | Not configured |

#### Credentials UI

| Item                     |          Value |
| ------------------------ | -------------: |
| Enumerate administrators | Not configured |

#### Data Protection

| Item                       |   Value |
| -------------------------- | ------: |
| Block direct memory access | Enabled |

#### Device Guard

| Item                                 |                 Value |
| ------------------------------------ | --------------------: |
| Virtualization based security        |        Not configured |
| Enable virtualization based security |        Not configured |
| Launch system guard                  |               Enabled |
| Turn on Credential Guard             | Enable with UEFI lock |

#### Device Installation

| Item                                                |                                  Value |
| --------------------------------------------------- | -------------------------------------: |
| Block hardware device installation by setup classes |                                    Yes |
| - Remove matching hardware devices                  |                                    Yes |
| Block list                                          | {d48179be-ec20-11d1-b6b8-00c04fa372a7} |

#### Device Lock

| Item                                              |          Value |
| ------------------------------------------------- | -------------: |
| Require password                                  |            Yes |
| - Required password                               |   Alphanumeric |
| - Password expiration (days)                      |             60 |
| - Password minimum character set count            |              3 |
| - Prevent reuse of previous passwords             |             24 |
| - Minimum password length                         |              8 |
| - Number of sign-in failures before wiping device |             10 |
| - Block simple passwords                          |            Yes |
| Password minimum age in days                      |              1 |
| Prevent use of camera                             | Not configured |
| Prevent slide show                                | Not configured |

#### DMA Guard

| Item                                                                    |     Value |
| ----------------------------------------------------------------------- | --------: |
| Enumeration of external devices incompatible with Kernel DMA Protection | Block all |

#### Event Log Service

| Item                                    | Value |
| --------------------------------------- | ----: |
| Application log maximum file size in KB |       |
| System log maximum file size in KB      |       |
| Security log maximum file size in KB    |       |

#### Experience

| Item                                                 |          Value |
| ---------------------------------------------------- | -------------: |
| Block Windows Spotlight                              | Not configured |
| - Block third-party suggestions in Windows Spotlight | Not configured |
| - Block consumer specific features                   | Not configured |

#### File Explorer

| Item                                 |          Value |
| ------------------------------------ | -------------: |
| Block data execution prevention      | Not configured |
| Block heap termination on corruption | Not configured |

#### Firewall

| Item                                                     |     Value |
| -------------------------------------------------------- | --------: |
| Firewall profile domain                                  | Configure |
| - Inbound connections blocked                            |       Yes |
| - Outbound connections required                          |       Yes |
| - Inbound notifications blocked                          |       Yes |
| - Firewall enabled                                       |   Allowed |
| Firewall profile private                                 | Configure |
| - Inbound connections blocked                            |       Yes |
| - Outbound connections required                          |       Yes |
| - Inbound notifications blocked                          |       Yes |
| - Firewall enabled                                       |   Allowed |
| Firewall profile public                                  | Configure |
| - Inbound connections blocked                            |       Yes |
| - Outbound connections required                          |       Yes |
| - Inbound notifications blocked                          |       Yes |
| - Firewall enabled                                       |   Allowed |
| - Connection security rules from group policy not merged |       Yes |
| - Policy rules from group policy not merged              |       Yes |

#### Internet Explorer

| Item                                                                                             |                Value |
| ------------------------------------------------------------------------------------------------ | -------------------: |
| Internet Explorer encryption support                                                             | TLS v1.1<br>TLS v1.2 |
| Internet Explorer prevent managing smart screen filter                                           |               Enable |
| Internet Explorer restricted zone script Active X controls marked safe for scripting             |              Disable |
| Internet Explorer restricted zone file downloads                                                 |              Disable |
| Internet Explorer certificate address mismatch warning                                           |              Enabled |
| Internet Explorer enhanced protected mode                                                        |              Enabled |
| Internet Explorer fallback to SSL3                                                               |             No sites |
| Internet Explorer software when signature is invalid                                             |             Disabled |
| Internet Explorer check server certificate revocation                                            |              Enabled |
| Internet Explorer check signatures on downloaded programs                                        |              Enabled |
| Internet Explorer processes consistent MIME handling                                             |              Enabled |
| Internet Explorer bypass smart screen warnings                                                   |             Disabled |
| Internet Explorer bypass smart screen warnings about uncommon files                              |             Disabled |
| Internet Explorer crash detection                                                                |             Disabled |
| Internet Explorer download enclosures                                                            |       Not configured |
| Internet Explorer ignore certificate errors                                                      |             Disabled |
| Internet Explorer disable processes in enhanced protected mode                                   |              Enabled |
| Internet Explorer security settings check                                                        |              Enabled |
| Internet Explorer Active X controls in protected mode                                            |             Disabled |
| Internet Explorer users adding sites                                                             |             Disabled |
| Internet Explorer users changing policies                                                        |             Disabled |
| Internet Explorer block outdated Active X controls                                               |              Enabled |
| Internet Explorer include all network paths                                                      |             Disabled |
| Internet Explorer internet zone access to data sources                                           |              Disable |
| Internet Explorer internet zone automatic prompt for file downloads                              |             Disabled |
| Internet Explorer internet zone copy and paste via script                                        |              Disable |
| Internet Explorer internet zone drag and drop or copy and paste files                            |              Disable |
| Internet Explorer internet zone less privileged sites                                            |              Disable |
| Internet Explorer internet zone loading of XAML files                                            |              Disable |
| Internet Explorer internet zone .NET Framework reliant components                                |              Disable |
| Internet Explorer internet zone allow only approved domains to use ActiveX controls              |              Enabled |
| Internet Explorer internet zone allow only approved domains to use tdc ActiveX controls          |              Enabled |
| Internet Explorer internet zone scripting of web browser controls                                |             Disabled |
| Internet Explorer internet zone script initiated windows                                         |             Disabled |
| Internet Explorer internet zone scriptlets                                                       |              Disable |
| Internet Explorer internet zone smart screen                                                     |              Enabled |
| Internet Explorer internet zone updates to status bar via script                                 |             Disabled |
| Internet Explorer internet zone user data persistence                                            |             Disabled |
| Internet Explorer internet zone allow VBscript to run                                            |              Disable |
| Internet Explorer internet zone do not run antimalware against ActiveX controls                  |             Disabled |
| Internet Explorer internet zone download signed ActiveX controls                                 |              Disable |
| Internet Explorer internet zone download unsigned ActiveX controls                               |              Disable |
| Internet Explorer internet zone cross site scripting filter                                      |              Enabled |
| Internet Explorer internet zone drag content from different domains across windows               |             Disabled |
| Internet Explorer internet zone drag content from different domains within windows               |             Disabled |
| Internet Explorer internet zone protected mode                                                   |               Enable |
| Internet Explorer internet zone include local path when uploading files to server                |             Disabled |
| Internet Explorer internet zone initialize and script Active X controls not marked as safe       |              Disable |
| Internet Explorer internet zone java permissions                                                 |         Disable java |
| Internet Explorer internet zone launch applications and files in an iframe                       |              Disable |
| Internet Explorer internet zone logon options                                                    |               Prompt |
| Internet Explorer internet zone navigate windows and frames across different domains             |              Disable |
| Internet Explorer internet zone run .NET Framework reliant components signed with Authenticode   |              Disable |
| Internet Explorer internet zone security warning for potentially unsafe files                    |               Prompt |
| Internet Explorer internet zone popup blocker                                                    |               Enable |
| Internet Explorer intranet zone do not run antimalware against Active X controls                 |             Disabled |
| Internet Explorer intranet zone initialize and script Active X controls not marked as safe       |              Disable |
| Internet Explorer intranet zone java permissions                                                 |          High safety |
| Internet Explorer local machine zone do not run antimalware against Active X controls            |             Disabled |
| Internet Explorer local machine zone java permissions                                            |         Disable java |
| Internet Explorer locked down internet zone smart screen                                         |              Enabled |
| Internet Explorer locked down intranet zone java permissions                                     |         Disable java |
| Internet Explorer locked down local machine zone java permissions                                |         Disable java |
| Internet Explorer locked down restricted zone smart screen                                       |              Enabled |
| Internet Explorer locked down restricted zone java permissions                                   |         Disable java |
| Internet Explorer locked down trusted zone java permissions                                      |         Disable java |
| Internet Explorer processes MIME sniffing safety feature                                         |              Enabled |
| Internet Explorer processes MK protocol security restriction                                     |              Enabled |
| Internet Explorer processes notification bar                                                     |              Enabled |
| Internet Explorer prevent per user installation of Active X controls                             |              Enabled |
| Internet Explorer processes protection from zone elevation                                       |              Enabled |
| Internet Explorer remove run this time button for outdated Active X controls                     |              Enabled |
| Internet Explorer processes restrict Active X install                                            |              Enabled |
| Internet Explorer restricted zone access to data sources                                         |              Disable |
| Internet Explorer restricted zone active scripting                                               |              Disable |
| Internet Explorer restricted zone automatic prompt for file downloads                            |             Disabled |
| Internet Explorer restricted zone binary and script behaviors                                    |              Disable |
| Internet Explorer restricted zone copy and paste via script                                      |              Disable |
| Internet Explorer restricted zone drag and drop or copy and paste files                          |              Disable |
| Internet Explorer restricted zone less privileged sites                                          |              Disable |
| Internet Explorer restricted zone loading of XAML files                                          |              Disable |
| Internet Explorer restricted zone meta refresh                                                   |             Disabled |
| Internet Explorer restricted zone .NET Framework reliant components                              |              Disable |
| Internet Explorer restricted zone allow only approved domains to use Active X controls           |              Enabled |
| Internet Explorer restricted zone allow only approved domains to use tdc Active X controls       |              Enabled |
| Internet Explorer restricted zone scripting of web browser controls                              |             Disabled |
| Internet Explorer restricted zone script initiated windows                                       |             Disabled |
| Internet Explorer restricted zone scriptlets                                                     |             Disabled |
| Internet Explorer restricted zone smart screen                                                   |              Enabled |
| Internet Explorer restricted zone updates to status bar via script                               |             Disabled |
| Internet Explorer restricted zone user data persistence                                          |             Disabled |
| Internet Explorer restricted zone allow vbscript to run                                          |              Disable |
| Internet Explorer restricted zone do not run antimalware against Active X controls               |             Disabled |
| Internet Explorer restricted zone download signed Active X controls                              |              Disable |
| Internet Explorer restricted zone download unsigned Active X controls                            |              Disable |
| Internet Explorer restricted zone cross site scripting filter                                    |              Enabled |
| Internet Explorer restricted zone drag content from different domains across windows             |             Disabled |
| Internet Explorer restricted zone drag content from different domains within windows             |             Disabled |
| Internet Explorer restricted zone include local path when uploading files to server              |             Disabled |
| Internet Explorer restricted zone initialize and script Active X controls not marked as safe     |              Disable |
| Internet Explorer restricted zone java permissions                                               |         Disable java |
| Internet Explorer restricted zone launch applications and files in an iFrame                     |              Disable |
| Internet Explorer restricted zone logon options                                                  |            Anonymous |
| Internet Explorer restricted zone navigate windows and frames across different domains           |              Disable |
| Internet Explorer restricted zone run Active X controls and plugins                              |              Disable |
| Internet Explorer restricted zone run .NET Framework reliant components signed with Authenticode |              Disable |
| Internet Explorer restricted zone scripting of java applets                                      |              Disable |
| Internet Explorer restricted zone security warning for potentially unsafe files                  |              Disable |
| Internet Explorer restricted zone protected mode                                                 |               Enable |
| Internet Explorer restricted zone popup blocker                                                  |               Enable |
| Internet Explorer processes restrict file download                                               |              Enabled |
| Internet Explorer processes scripted window security restrictions                                |              Enabled |
| Internet Explorer security zones use only machine settings                                       |              Enabled |
| Internet Explorer use Active X installer service                                                 |              Enabled |
| Internet Explorer trusted zone do not run antimalware against Active X controls                  |             Disabled |
| Internet Explorer trusted zone initialize and script Active X controls not marked as safe        |              Disable |
| Internet Explorer trusted zone java permissions                                                  |          High safety |
| Internet Explorer auto complete                                                                  |             Disabled |

#### Local Policies Security Options

| Item                                                                          |                                         Value |
| ----------------------------------------------------------------------------- | --------------------------------------------: |
| Block remote logon with blank password                                        |                                           Yes |
| Minutes of lock screen inactivity until screen saver activates                |                                            15 |
| Smart card removal behavior                                                   |                              Lock workstation |
| Require client to always digitally sign communications                        |                                           Yes |
| Prevent clients from sending unencrypted passwords to third party SMB servers |                                           Yes |
| Require server digitally signing communications always                        |                                           Yes |
| Prevent anonymous enumeration of SAM accounts                                 |                                           Yes |
| Block anonymous enumeration of SAM accounts and shares                        |                                           Yes |
| Restrict anonymous access to named pipes and shares                           |                                           Yes |
| Allow remote calls to security accounts manager                               |                                               |
| Prevent storing LAN manager hash value on next password change                |                                           Yes |
| Authentication level                                                          | Send NTLMv2 response only. Refuse LM and NTLM |
| Minimum session security for NTLM SSP based clients                           |        Require NTLM V2 and 128 bit encryption |
| Minimum session security for NTLM SSP based servers                           |        Require NTLM V2 and 128 bit encryption |
| Administrator elevation prompt behavior                                       |                                Not configured |
| Standard user elevation prompt behavior                                       |         Automatically deny elevation requests |
| Detect application installations and prompt for elevation                     |                                           Yes |
| Only allow UI access applications for secure locations                        |                                           Yes |
| Require admin approval mode for administrators                                |                                           Yes |
| Use admin approval mode                                                       |                                Not configured |
| Virtualize file and registry write failures to per user locations             |                                           Yes |

#### Microsoft Defender

| Item                                                                                      |                           Value |
| ----------------------------------------------------------------------------------------- | ------------------------------: |
| Block Adobe Reader from creating child processes                                          |                          Enable |
| Block Office communication apps from creating child processes                             |                          Enable |
| Enter how often (0-24 hours) to check for security intelligence updates                   |                               4 |
| Scan type                                                                                 |                      Quick scan |
| Defender schedule scan day                                                                |                        Everyday |
| Scheduled scan start time                                                                 |                  Not configured |
| Cloud-delivered protection level                                                          |                  Not configured |
| Scan network files                                                                        |                             Yes |
| Turn on real-time protection                                                              |                             Yes |
| Scan scripts that are used in Microsoft browsers                                          |                             Yes |
| Scan archive files                                                                        |                             Yes |
| Turn on behavior monitoring                                                               |                             Yes |
| Turn on cloud-delivered protection                                                        |                             Yes |
| Scan incoming email messages                                                              |                             Yes |
| Scan removable drives during full scan                                                    |                             Yes |
| Block Office applications from injecting code into other processes                        |                           Block |
| Block Office applications from creating executable content                                |                           Block |
| Block all Office applications from creating child processes                               |                           Block |
| Block Win32 API calls from Office macro                                                   |                           Block |
| Block execution of potentially obfuscated scripts (js/vbs/ps)                             |                           Block |
| Block JavaScript or VBScript from launching downloaded executable content                 |                           Block |
| Block executable content download from email and webmail clients                          |                           Block |
| Block credential stealing from the Windows local security authority subsystem (lsass.exe) |                          Enable |
| Defender potentially unwanted app action                                                  |                           Block |
| Block untrusted and unsigned processes that run from USB                                  |                           Block |
| Enable network protection                                                                 |                          Enable |
| Defender sample submission consent                                                        | Send safe samples automatically |

#### MS Security Guide

| Item                                                      |          Value |
| --------------------------------------------------------- | -------------: |
| SMB v1 client driver start configuration                  | Not configured |
| Apply UAC restrictions to local accounts on network logon | Not configured |
| Structured exception handling overwrite protection        | Not configured |
| SMB v1 server                                             | Not configured |
| Digest authentication                                     | Not configured |

#### MSS Legacy

| Item                                                                  |          Value |
| --------------------------------------------------------------------- | -------------: |
| Network IPv6 source routing protection level                          | Not configured |
| Network IP source routing protection level                            | Not configured |
| Network ignore NetBIOS name release requests except from WINS servers | Not configured |
| Network ICMP redirects override OSPF generated routes                 | Not configured |

#### Power

| Item                                          |          Value |
| --------------------------------------------- | -------------: |
| Require password on wake while on battery     | Not configured |
| Require password on wake while plugged in     | Not configured |
| Standby states when sleeping while on battery | Not configured |
| Standby states when sleeping while plugged in | Not configured |

#### Remote Assistance

| Item                        |          Value |
| --------------------------- | -------------: |
| Remote Assistance solicited | Not configured |

#### Remote Desktop Services

| Item                                                       |          Value |
| ---------------------------------------------------------- | -------------: |
| Remote desktop services client connection encryption level | Not configured |
| Block drive redirection                                    | Not configured |
| Block password saving                                      | Not configured |
| Prompt for password upon connection                        | Not configured |
| Secure RPC communication                                   | Not configured |

#### Remote Management

| Item                               |          Value |
| ---------------------------------- | -------------: |
| Block client digest authentication | Not configured |
| Block storing run as credentials   | Not configured |
| Client basic authentication        | Not configured |
| Basic authentication               | Not configured |
| Client unencrypted traffic         | Not configured |
| Unencrypted traffic                | Not configured |

#### Remote Procedure Call

| Item                               |          Value |
| ---------------------------------- | -------------: |
| RPC unauthenticated client options | Not configured |

#### Search

| Item                             | Value |
| -------------------------------- | ----: |
| Disable indexing encrypted items |   Yes |

#### Smart Screen

| Item                                           | Value |
| ---------------------------------------------- | ----: |
| Turn on Windows SmartScreen                    |   Yes |
| Block users from ignoring SmartScreen warnings |   Yes |

#### System

| Item                                    |          Value |
| --------------------------------------- | -------------: |
| System boot start driver initialization | Not configured |

#### Wi-Fi

| Item                                             |          Value |
| ------------------------------------------------ | -------------: |
| Block Automatically connecting to Wi-Fi hotspots | Not configured |
| Block Internet sharing                           |            Yes |

#### Windows Connection Manager

| Item                                    |          Value |
| --------------------------------------- | -------------: |
| Block connection to non-domain networks | Not configured |

#### Windows Ink Workspace

| Item          |   Value |
| ------------- | ------: |
| Ink Workspace | Enabled |

#### Windows PowerShell

| Item                            |          Value |
| ------------------------------- | -------------: |
| PowerShell script block logging | Not configured |




### Related information

#### Security & Governance

* [Authentication Hardening]({{<ref "system-hardening-authentication">}}) 
* [Enterprise Mobility]({{<ref "security-and-governance/system-security-plan/enterprise-mobility.md">}})
* [Essential Eight: Restrict Microsoft Office Macros]({{<ref "restrict-microsoft-office-macros.md">}})

  
#### Design

* None identified
  
#### Configuration

* None identified

#### References

* None identified
