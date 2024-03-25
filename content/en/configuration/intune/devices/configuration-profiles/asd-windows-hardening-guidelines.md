---
Title: "ASD Windows Hardening Guidelines"
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

| Item        |                                                                                                       Value |
| ----------- | ----------------------------------------------------------------------------------------------------------: |
| Name        |                                                                            ASD Windows Hardening Guidelines |
| Description | All currently available settings recommended within the ASD Windows Hardening Guidelines for Windows 10/11. |
| Platform    |                                                                                        Windows 10 and later |

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

| Item                                                                                                             |                                                     Value |
| ---------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------: |
| **MS Security Guide**                                                                                            |                                                           |
| Apple UAC restrictions to local accounts on network logons                                                       |                                                   Enabled |
| Configure SMB v1 client driver                                                                                   |                                                   Enabled |
| - Configure MrxSmb10 driver                                                                                      |                              Disable driver (recommended) |
| Configure SMB v1 server                                                                                          |                                                  Disabled |
| Enable Structured Exception Handling Overwrite Protection (SEHOP)                                                |                                                   Enabled |
| **MSS (Legacy)**                                                                                                 |                                                           |
| MSS (DisableIPSourceRouting IPv6) IP source routing protection level (protects against packet spoofing)          |                                                   Enabled |
| - DisableIPSourceRoutingIPv6 (Device)                                                                            | Highest protection, source routing is completely disabled |
| MSS: (DisableIPSourceRouting) IP source routing protection level (protects against packet spoofing)              |                                                   Enabled |
| - DisableIPSourceRouting (Device)                                                                                | Highest protection, source routing is completely disabled |
| MSS: (EnableICMPRedirect) Allow ICMP redirects to override OSPF generated routes                                 |                                                  Disabled |
| MSS: (NoNameReleaseOnDemand) Allow the computer to ignore NetBIOS name release requests except from WINS servers |                                                   Enabled |
| **System**                                                                                                       |                                                           |
| Prevent access to registry editing tools (User)                                                                  |                                                   Enabled |
| Disable regedit from running silently? (User)                                                                    |                                                           |
| Prevent access to the command prompt (User)                                                                      |                                                   Enabled |
| Disable the command prompt script processing also? (User)                                                        |                                                       Yes |
| **System > Audit Process Creation**                                                                              |                                                           |
| Include command line in process creation events                                                                  |                                                   Enabled |
| **System > Credentials Delegation**                                                                              |                                                   Enabled |
| Remote host allows delegation of non-exportable credentials                                                      |                                                           |
| **System > Early Launch Antimalware**                                                                            |                                                           |
| Boot-Start Driver Initialization Policy                                                                          |                                                   Enabled |
| Choose the boot-start drivers that can be initialized:                                                           |                                          Good and unknown |
| **System > Group Policy**                                                                                        |                                                           |
| Configure registry policy processing                                                                             |                                                   Enabled |
| - Do not apply during periodic background processing (Device)                                                    |                                                     False |
| - Process even if the Group Policy objects have not changed (Device)                                             |                                                      True |
| Configure security policy processing                                                                             |                                                   Enabled |
| - Do not apply during periodic background processing (Device)                                                    |                                                     False |
| - Process even if the Group Policy objects have not changed (Device)                                             |                                                      True |
| Turn off background refresh of Group Policy                                                                      |                                                  Disabled |
| Turn off Local Group Policy Objects processing                                                                   |                                                   Enabled |
| Turn off Resultant Set of Policy logging                                                                         |                                                   Enabled |
| **System > Logon**                                                                                               |                                                           |
| Allow users to select when a password is required when resuming from connected standby                           |                                                  Disabled |
| Do not display network selection UI                                                                              |                                                   Enabled |
| Do not process the legacy run list                                                                               |                                                   Enabled |
| Do not process the run once list                                                                                 |                                                   Enabled |
| Enumerate local users on domain-joined computers                                                                 |                                                  Disabled |
| Run these programs at user logon                                                                                 |                                                  Disabled |
| Turn off app notifications on the lock screen                                                                    |                                                   Enabled |
| Turn off picture password sign-in                                                                                |                                                   Enabled |
| Turn on convenience PIN sign-in                                                                                  |                                                  Disabled |
| **System > Remote Assistance**                                                                                   |                                                           |
| Configure Offer Remote Assistance                                                                                |                                                  Disabled |
| Configure Solicited Remote Assistance                                                                            |                                                  Disabled |
| **System > Remote Procedure Call**                                                                               |                                                           |
| Restrict Unauthenticated RPC clients                                                                             |                                                   Enabled |
| - RPC Runtime Unauthenticated Client Restriction to Apply:                                                       |                                             Authenticated |
| **System > Removable Storage Access**                                                                            |                                                           |
| All Removable Storage classes: Deny all access                                                                   |                                                   Enabled |
| CD and DVD: Deny execute access                                                                                  |                                                   Enabled |
| CD and DVD: Deny read access                                                                                     |                                                  Disabled |
| CD and DVD: Deny write access                                                                                    |                                                   Enabled |
| Custom Classes: Deny read access                                                                                 |                                                  Disabled |
| Floppy Drives: Deny execute access                                                                               |                                                   Enabled |
| Floppy Drives: Deny read access                                                                                  |                                                  Disabled |
| Floppy Drives: Deny write access                                                                                 |                                                   Enabled |
| Removable Disks: Deny execute access                                                                             |                                                   Enabled |
| Removable Disks: Deny read access                                                                                |                                                  Disabled |
| Tape Drives: Deny execute access                                                                                 |                                                   Enabled |
| Tape Drives: Deny read access                                                                                    |                                                  Disabled |
| Tape Drives: Deny write access                                                                                   |                                                   Enabled |
| WPD Devices: Deny read access                                                                                    |                                                  Disabled |
| WPD Devices: Deny write access                                                                                   |                                                   Enabled |
| **Windows Components > Windows Remote Shell**                                                                    |                                                           |
| Allow Remote Shell Access                                                                                        |                                                  Disabled |
| **Windows Components > Windows Remote Management (WinRM) > WinRM Service**                                       |                                                           |
| Allow Basic authentication                                                                                       |                                                  Disabled |
| Allow unencrypted traffic                                                                                        |                                                  Disabled |
| Disallow WinRM from storing RunAs credentials                                                                    |                                                   Enabled |
| **Windows Components > Windows Remote Management (WinRM) > WinRM Client**                                        |                                                           |
| Allow Basic authentication                                                                                       |                                                  Disabled |
| Allow unencrypted traffic                                                                                        |                                                  Disabled |
| Disallow Digest authentication                                                                                   |                                                   Enabled |
| **Windows Components > Windows PowerShell**                                                                      |                                                           |
| Execution Policy (Device)                                                                                        |                                 Allow only signed scripts |
| Turn on PowerShell Script Block Logging                                                                          |                                                   Enabled |
| - Log script block invocation start / stop events:                                                               |                                                     False |
| Turn on Script Execution                                                                                         |                                                   Enabled |
| **Windows Components > Windows Logon Options**                                                                   |                                                           |
| Disable or enable software Secure Attention Sequence                                                             |                                                  Disabled |
| Sign-in and lock last interactive user automatically after a restart                                             |                                                  Disabled |
| **Windows Components > Store**                                                                                   |                                                           |
| Turn off the Store application                                                                                   |                                                   Enabled |
| **Windows Components > Sound Recorder**                                                                          |                                                           |
| Do not allow Sound Recorder to run                                                                               |                                                   Enabled |
| **Windows Components > RSS Feeds**                                                                               |                                                           |
| Prevent downloading of enclosures                                                                                |                                                   Enabled |
| **Windows Components > Remote Desktop Services > Remote Desktop Session Host > Security**                        |                                                           |
| - Encryption Level                                                                                               |                                                High Level |
| Always prompt for password upon connection                                                                       |                                                   Enabled |
| Do not allow local administrators to customize permissions                                                       |                                                   Enabled |
| Require secure RPC communication                                                                                 |                                                   Enabled |
| Require use of specific security layer for remote (RDP) connections                                              |                                                   Enabled |
| - Security Layer (Device)                                                                                        |                                                       SSL |
| Require user authentication for remote connections by using Network Level Authentication                         |                                                   Enabled |
| Set client connection encryption level                                                                           |                                                   Enabled |
| **Windows Components > Remote Desktop Services > Remote Desktop Session Host > Device and Resource Redirection** |                                                           |
| Do not allow Clipboard redirection                                                                               |                                                   Enabled |
| Do not allow drive redirection                                                                                   |                                                   Enabled |
| **Windows Components > Remote Desktop Services > Remote Desktop Session Host > Connections**                     |                                                           |
| Allow users to connect remotely by using Remote Desktop Services                                                 |                                                  Disabled |
| Deny logoff of an administrator logged in to the console session                                                 |                                                   Enabled |
| **Windows Components > Remote Desktop Services > Remote Desktop Connection Client**                              |                                                           |
| Configure server authentication for client                                                                       |                                                   Enabled |
| - Authentication setting: (Device)                                                                               |                    Do not connect if authentication fails |
| Do not allow passwords to be saved                                                                               |                                                   Enabled |
| **Windows Components > Network Sharing**                                                                         |                                                           |
| Prevent users from sharing files within their profile. (User)                                                    |                                                   Enabled |
| **Windows Components > Microsoft Defender Antivirus**                                                            |                                                           |
| Turn off Microsoft Defender Antivirus                                                                            |                                                  Disabled |
| **Windows Components > Microsoft Defender Antivirus > MAPS**                                                     |                                                           |
| Configure local setting override for reporting to Microsoft MAPS                                                 |                                                  Disabled |
| Configure the 'Block at First Sight' feature                                                                     |                                                   Enabled |
| Join Microsoft MAPS                                                                                              |                                                   Enabled |
| - Join Microsoft MAPS (Device)                                                                                   |                                             Advanced MAPS |
| **Windows Components > Microsoft Defender Antivirus > Quarantine**                                               |                                                           |
| Configure removal of items from Quarantine folder                                                                |                                                  Disabled |
| **Windows Components > Microsoft Defender Antivirus > Real-time Protection**                                     |                                                           |
| Scan all downloaded files and attachments                                                                        |                                                   Enabled |
| Turn off real-time protection                                                                                    |                                                  Disabled |
| Turn on behavior monitoring                                                                                      |                                                   Enabled |
| Turn on process scanning whenever real-time protection is enabled                                                |                                                   Enabled |
| **Windows Components > Microsoft Defender Antivirus > Scan**                                                     |                                                           |
| Allow users to pause scan                                                                                        |                                                  Disabled |
| Scan archive files                                                                                               |                                                   Enabled |
| Scan packed executables                                                                                          |                                                   Enabled |
| Scan removable drives                                                                                            |                                                   Enabled |
| Turn on e-mail scanning                                                                                          |                                                   Enabled |
| Turn on heuristics                                                                                               |                                                   Enabled |
| **Windows Components > Microsoft account**                                                                       |                                                           |
| Block all consumer Microsoft account user authentication                                                         |                                                   Enabled |
| **Windows Components > Location and Sensors**                                                                    |                                                           |
| Turn off location scripting                                                                                      |                                                   Enabled |
| **Windows Components > Location and Sensors > Windows Location Provider**                                        |                                                           |
| Turn off Windows Location Provider                                                                               |                                                   Enabled |
| **Windows Components > HomeGroup**                                                                               |                                                           |
| Prevent the computer from joining a homegroup                                                                    |                                                   Enabled |
| **Windows Components > File Explorer**                                                                           |                                                           |
| Configure Windows Defender SmartScreen                                                                           |                                                   Enabled |
| - Pick one of the following settings: (Device)                                                                   |                                   Warn and prevent bypass |
| Remove CD Burning features (User)                                                                                |                                                   Enabled |
| Remove Security tab (User)                                                                                       |                                                   Enabled |
| Show hibernate in the power options menu                                                                         |                                                  Disabled |
| Show sleep in the power options menu                                                                             |                                                  Disabled |
| Turn off Data Execution Prevention for Explorer                                                                  |                                                  Disabled |
| Turn off heap termination on corruption                                                                          |                                                  Disabled |
| Turn off shell protocol protected mode                                                                           |                                                  Disabled |
| **Windows Components > Event Log Service > System**                                                              |                                                           |
| - Maximum Log Size (KB)                                                                                          |                                                     65536 |
| Specify the maximum log file size (KB)                                                                           |                                                   Enabled |
| **Windows Components > Event Log Service > Security**                                                            |                                                           |
| - Maximum Log Size (KB)                                                                                          |                                                   2097152 |
| Specify the maximum log file size (KB)                                                                           |                                                   Enabled |
| **Windows Components > Event Log Service > Application**                                                         |                                                           |
| - Maximum Log Size (KB)                                                                                          |                                                     65536 |
| Specify the maximum log file size (KB)                                                                           |                                                   Enabled |
| **Windows Components > Credential User Interface**                                                               |                                                           |
| Do not display the password reveal button                                                                        |                                                   Enabled |
| Enumerate administrator accounts on elevation                                                                    |                                                  Disabled |
| Prevent the use of security questions for local accounts                                                         |                                                   Enabled |
| Require trusted path for credential entry                                                                        |                                                   Enabled |
| **Windows Components > AutoPlay Policies**                                                                       |                                                           |
| - Turn off Autoplay on:                                                                                          |                                                All drives |
| Disallow Autoplay for non-volume devices                                                                         |                                                   Enabled |
| Set the default behavior for AutoRun                                                                             |                                                   Enabled |
| - Default AutoRun Behavior                                                                                       |                       Do not execute any autorun commands |
| Turn off Autoplay                                                                                                |                                                   Enabled |
| **Windows Components > Attachment Manager**                                                                      |                                                           |
| Do not preserve zone information in file attachments (User)                                                      |                                                  Disabled |
| Hide mechanisms to remove zone information (User)                                                                |                                                   Enabled |
| **Windows Components > Application Compatibility**                                                               |                                                           |
| Turn off Inventory Collector                                                                                     |                                                   Enabled |
| Turn off Steps Recorder                                                                                          |                                                   Enabled |
| **System > Troubleshooting and Diagnostics > Microsoft Support Diagnostic Tool**                                 |                                                           |
| Microsoft Support Diagnostic Tool: Turn on MSDT interactive communication with support provider                  |                                                  Disabled |
| **System > Power Management > Sleep Settings**                                                                   |                                                           |
| - System Sleep Timeout (seconds):                                                                                |                                                         0 |
| Allow standby states (S1-S3) when sleeping (on battery)                                                          |                                                  Disabled |
| Allow standby states (S1-S3) when sleeping (plugged in)                                                          |                                                  Disabled |
| Require a password when a computer wakes (on battery)                                                            |                                                   Enabled |
| Require a password when a computer wakes (plugged in)                                                            |                                                   Enabled |
| Specify the system hibernate timeout (on battery)                                                                |                                                   Enabled |
| - System Hibernate Timeout (seconds):                                                                            |                                                         0 |
| Specify the system hibernate timeout (plugged in)                                                                |                                                   Enabled |
| - System Hibernate Timeout (seconds):                                                                            |                                                         0 |
| Specify the system sleep timeout (on battery)                                                                    |                                                   Enabled |
| - System Sleep Timeout (seconds):                                                                                |                                                         0 |
| Specify the system sleep timeout (plugged in)                                                                    |                                                   Enabled |
| **System > Internet Communication Management > Internet Communication settings**                                 |                                                           |
| Turn off access to the Store                                                                                     |                                                   Enabled |
| **System > Device Installation > Device Installation Restrictions**                                              |                                                           |
| - Prevented Classes                                                                                              |                    {d48179be-ec20-11d1-b6b8-00c04fa372a7} |
| - Also apply to matching devices that are already installed.                                                     |                                                      True |
| Prevent installation of devices that match any of these device IDs                                               |                                                   Enabled |
| - Also apply to matching devices that are already installed.                                                     |                                                      True |
| - Prevented device IDs                                                                                           |                                PCI\CC_0C0010, PCI\CC_0C0A |
| Prevent installation of devices using drivers that match these device setup classes                              |                                                   Enabled |
| **Start Menu and Taskbar > Notifications**                                                                       |                                                           |
| Turn off toast notifications on the lock screen (User)                                                           |                                                   Enabled |
| **Network > Windows Connection Manager**                                                                         |                                                           |
| Prohibit connection to non-domain networks when connected to domain authenticated network                        |                                                   Enabled |
| **Network > Network Provider**                                                                                   |                                                           |
| Hardened UNC Paths                                                                                               |                                                   Enabled |
| - Value                                                                                                          |         RequireMutualAuthentication=1, RequireIntegrity=1 |
| - Name                                                                                                           |                                              \\*\NETLOGON |
| - Value                                                                                                          |         RequireMutualAuthentication=1, RequireIntegrity=1 |
| - Name                                                                                                           |                                                \\*\SYSVOL |
| **Network > Network Connections**                                                                                |                                                           |
| - Select from the following states: (Device)                                                                     |                                             Enabled State |
| Prohibit installation and configuration of Network Bridge on your DNS domain network                             |                                                   Enabled |
| Prohibit use of Internet Connection Sharing on your DNS domain network                                           |                                                   Enabled |
| Route all traffic through the internal network                                                                   |                                                   Enabled |
| **Network > DNS Client**                                                                                         |                                                           |
| Turn off multicast name resolution                                                                               |                                                   Enabled |
| **Control Panel > Personalization**                                                                              |                                                           |
| - Seconds: (User)                                                                                                |                                                       900 |
| Enable screen saver (User)                                                                                       |                                                   Enabled |
| Password protect the screen saver (User)                                                                         |                                                   Enabled |
| Prevent enabling lock screen camera                                                                              |                                                   Enabled |
| Prevent enabling lock screen slide show                                                                          |                                                   Enabled |
| Screen saver timeout (User)                                                                                      |                                                   Enabled |

#### Auditing

| Item                                                     |            Value |
| -------------------------------------------------------- | ---------------: |
| Account Logon Logoff Audit Account Lockout               |          Failure |
| Account Logon Logoff Audit Group Membership              |          Success |
| Account Logon Logoff Audit Logoff                        |          Success |
| Account Logon Logoff Audit Logon                         | Success+ Failure |
| Account Management Audit Computer Account Management     | Success+ Failure |
| Account Management Audit Other Account Management Events | Success+ Failure |
| Audit Changes to Audit Policy                            |  Success+Failure |
| Audit File Share Access                                  |  Success+Failure |
| Audit Other Logon Logoff Events                          |  Success+Failure |
| Audit Security Group Management                          |  Success+Failure |
| Audit Special Logon                                      |  Success+Failure |
| Audit User Account Management                            |  Success+Failure |
| Detailed Tracking Audit Process Creation                 |          Success |
| Detailed Tracking Audit Process Termination              |          Success |
| Object Access Audit File System                          | Success+ Failure |
| Object Access Audit Kernel Object                        | Success+ Failure |
| Object Access Audit Other Object Access Events           | Success+ Failure |
| Object Access Audit Registry                             | Success+ Failure |
| Policy Change Audit Other Policy Change Events           | Success+ Failure |
| System Audit System Integrity                            | Success+ Failure |

#### Browser

| Item                                            |   Value |
| ----------------------------------------------- | ------: |
| Allow Developer Tools                           |   Block |
| Allow Do Not Track                              |   Allow |
| Allow Flash                                     |   Block |
| Allow Password Manager                          |   Block |
| Allow Popups                                    |   Allow |
| Allow Smart Screen                              |   Allow |
| Prevent Access To About Flags In Microsoft Edge | Enabled |
| Prevent Smart Screen Prompt Override            | Enabled |
| Prevent Smart Screen Prompt Override For Files  | Enabled |

#### Defender

| Item                      |                            Value |
| ------------------------- | -------------------------------: |
| Cloud Block Level         |                             High |
| Cloud Extended Timeout    |                               50 |
| Enable Network Protection |             Enabled (block mode) |
| Submit Samples Consent    | Send safe samples automatically. |

#### Device Guard

| Item                               |                                                                                        Value |
| ---------------------------------- | -------------------------------------------------------------------------------------------: |
| Configure System Guard Launch      |                                     Unmanaged Enables Secure Launch if supported by hardware |
| Require Platform Security Features | Turns on VBS with Secure Boot and direct memory access (DMA). DMA requires hardware support. |

#### Experience

| Item                                                        |   Value |
| ----------------------------------------------------------- | ------: |
| Allow Cortana                                               |   Block |
| Allow Windows Spotlight (User)                              |   Allow |
| - Allow Third Party Suggestions In Windows Spotlight (User) |   Block |
| - Allow Windows Consumer Features                           |   Block |
| Show Lock On User Tile                                      | Enabled |

#### Lanman Workstation

| Item                         |    Value |
| ---------------------------- | -------: |
| Enable Insecure Guest Logons | Disabled |

#### Local Policies Security Options

| Item                                                                                            |                                                                                    Value |
| ----------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------: |
| Accounts Block Microsoft Accounts                                                               |                                        Users can't add or log on with Microsoft accounts |
| Accounts Enable Administrator Account Status                                                    |                                                                                  Disable |
| Accounts Enable Guest Account Status                                                            |                                                                                  Disable |
| Accounts Limit Local Account Use Of Blank Passwords To Console Logon Only                       |                                                                                  Enabled |
| Devices Prevent Users From Installing Printer Drivers When Connecting To Shared Printers        |                                                                                   Enable |
| Interactive Logon Do Not Require CTRLALTDEL                                                     |                                                                                 Disabled |
| Interactive Logon Machine Inactivity Limit                                                      |                                                                                      900 |
| Microsoft Network Client Digitally Sign Communications Always                                   |                                                                                   Enable |
| Microsoft Network Client Digitally Sign Communications If Server Agrees                         |                                                                                   Enable |
| Microsoft Network Client Send Unencrypted Password To Third Party SMB Servers                   |                                                                                  Disable |
| Microsoft Network Server Digitally Sign Communications Always                                   |                                                                                   Enable |
| Microsoft Network Server Digitally Sign Communications If Client Agrees                         |                                                                                   Enable |
| Network Access Do Not Allow Anonymous Enumeration Of SAM Accounts                               |                                                                                  Enabled |
| Network Access Do Not Allow Anonymous Enumeration Of Sam Accounts And Shares                    |                                                                                  Enabled |
| Network Access Restrict Anonymous Access To Named Pipes And Shares                              |                                                                                   Enable |
| Network Access Restrict Clients Allowed To Make Remote Calls To SAM                             |                                                                 "O:BAG:BAD:(A;;RC;;;BA)" |
| Network Security Allow Local System To Use Computer Identity For NTLM                           |                                                                                    Allow |
| Network Security Allow PKU2U Authentication Requests                                            |                                                                                    Block |
| Network Security Do Not Store LAN Manager Hash Value On Next Password Change                    |                                                                                   Enable |
| Network Security LAN Manager Authentication Level                                               |                                    Send LM and NTLMv2 responses only. Refuse LM and NTLM |
| Network Security Minimum Session Security For NTLMSSP Based Clients                             |                                                      Require NTLM and 128-bit encryption |
| Network Security Minimum Session Security For NTLMSSP Based Servers                             |                                                      Require NTLM and 128-bit encryption |
| User Account Control Allow UI Access Applications To Prompt For Elevation                       |                                                                                 disabled |
| User Account Control Behavior Of The Elevation Prompt For Administrators                        |                                             Prompt for credentials on the secure desktop |
| User Account Control Behavior Of The Elevation Prompt For Standard Users                        |                                                    Automatically deny elevation requests |
| User Account Control Detect Application Installations And Prompt For Elevation                  |                                                                                   Enable |
| User Account Control Only Elevate UI Access Applications That Are Installed In Secure Locations | Enabled: Application runs with UIAccess integrity only if it resides in secure location. |
| User Account Control Run All Administrators In Admin Approval Mode                              |                                                                                  Enabled |
| User Account Control Switch To The Secure Desktop When Prompting For Elevation                  |                                                                                  Enabled |
| User Account Control Use Admin Approval Mode                                                    |                                                                                   Enable |
| User Account Control Virtualize File And Registry Write Failures To Per User Locations          |                                                                                  Enabled |

#### Microsoft App Store

| Item                                               |    Value |
| -------------------------------------------------- | -------: |
| Allow Game DVR                                     |    Block |
| MSI Allow User Control Over Install                | Disabled |
| MSI Always Install With Elevated Privileges        | Disabled |
| MSI Always Install With Elevated Privileges (User) | Disabled |

#### Microsoft Edge

| Item                                                                         |                                 Value |
| ---------------------------------------------------------------------------- | ------------------------------------: |
| Allow download restrictions                                                  |                               Enabled |
| - Download restrictions (Device)                                             | Block potentially dangerous downloads |
| Configure Do Not Track                                                       |                               Enabled |
| Control the mode of DNS-over-HTTPS                                           |                               Enabled |
| - Control the mode of DNS-over-HTTPS (Device)                                |                Disable DNS-over-HTTPS |
| Control where developer tools can be used                                    |                               Enabled |
| - Control where developer tools can be used (Device)                         | Don't allow using the developer tools |
| DNS interception checks enabled                                              |                              Disabled |
| **Content settings**                                                         |                                       |
| Default pop-up window setting                                                |                               Enabled |
| Default pop-up window setting (Device)                                       |  Do not allow any site to show popups |
| **Password manager and protection**                                          |                                       |
| Enable saving passwords to the password manager                              |                              Disabled |
| **SmartScreen settings**                                                     |                                       |
| Configure Microsoft Defender SmartScreen                                     |                               Enabled |
| Prevent bypassing Microsoft Defender SmartScreen prompts for sites           |                               Enabled |
| Prevent bypassing of Microsoft Defender SmartScreen warnings about downloads |                               Enabled |

#### Power

| Item                             |        Value |
| -------------------------------- | -----------: |
| Turn Off Hybrid Sleep On Battery | hybrid sleep |
| Turn Off Hybrid Sleep Plugged In | hybrid sleep |

#### Search

| Item                                     |                                                                                                                         Value |
| ---------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------: |
| Allow Indexing Encrypted Stores Or Items |                                                                                                                         Block |
| Do Not Use Web Results                   | Not allowed. Queries won't be performed on the web and web results won't be displayed when a user performs a query in Search. |

#### Smart Screen

| Item                                |   Value |
| ----------------------------------- | ------: |
| Prevent Override For Files In Shell | Enabled |

#### Storage

| Item                             |   Value |
| -------------------------------- | ------: |
| Removable Disk Deny Write Access | Enabled |

#### System

| Item                        |                                                                                                                                                                                                     Value |
| --------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| Allow Location              | Force Location Off. All Location Privacy settings are toggled off and grayed out. Users cannot change the settings, and no apps are allowed access to the Location service, including Cortana and Search. |
| Allow Telemetry             |                                                                                                                                                                                                  Security |
| Disable One Drive File Sync |                                                                                                                                                                                             Sync enabled. |

#### User Rights

| Item                                |                                                                                                        Value |
| ----------------------------------- | -----------------------------------------------------------------------------------------------------------: |
| Access From Network                 |                                                       BUILTIN\Remote Desktop Users<br>BUILTIN\Administrators |
| Allow Local Log On                  |                                                                      BUILTIN\Users<br>BUILTIN\Administrators |
| Backup Files And Directories        |                                                                                       BUILTIN\Administrators |
| Create Global Objects               | NT AUTHORITY\SERVICE<br>NT AUTHORITY\NETWORK SERVICE<br>NT AUTHORITY\LOCAL SERVICE<br>BUILTIN\Administrators |
| Create Page File                    |                                                                                       BUILTIN\Administrators |
| Debug Programs                      |                                                                                       BUILTIN\Administrators |
| Deny Access From Network            |                                                                                   NT AUTHORITY\Local account |
| Deny Remote Desktop Services Log On |                                                         NT AUTHORITY\Local account<br>BUILTIN\Administrators |
| Impersonate Client                  | NT AUTHORITY\SERVICE<br>NT AUTHORITY\NETWORK SERVICE<br>NT AUTHORITY\LOCAL SERVICE<br>BUILTIN\Administrators |
| Load Unload Device Drivers          |                                                                                       BUILTIN\Administrators |
| Manage Auditing And Security Log    |                                                                                       BUILTIN\Administrators |
| Manage Volume                       |                                                                                       BUILTIN\Administrators |
| Modify Firmware Environment         |                                                                                       BUILTIN\Administrators |
| Profile Single Process              |                                                                                       BUILTIN\Administrators |
| Remote Shutdown                     |                                                                                       BUILTIN\Administrators |
| Restore Files And Directories       |                                                                                       BUILTIN\Administrators |
| Take Ownership                      |                                                                                       BUILTIN\Administrators |

#### Wi-Fi Settings

| Item                                       | Value |
| ------------------------------------------ | ----: |
| Allow Auto Connect To Wi Fi Sense Hotspots | Block |

#### Windows Defender Security Center

| Item                                 |                                                                             Value |
| ------------------------------------ | --------------------------------------------------------------------------------: |
| Disallow Exploit Protection Override | (Enable) Local users cannot make changes in the exploit protection settings area. |

#### Windows Ink WOrkspace

| Item                        |                                                                                                 Value |
| --------------------------- | ----------------------------------------------------------------------------------------------------: |
| Allow Windows Ink Workspace | ink workspace is enabled (feature is turned on), but the user cannot access it above the lock screen. |

### Related information

#### Security & Governance

* None identified
  
#### Design

* None identified
  
#### Configuration

* None identified

#### References

* None identified