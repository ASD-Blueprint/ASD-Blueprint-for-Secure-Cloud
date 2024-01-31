---
title: "Windows Hardening"
weight: 10
description: "This section describes the design decisions associated with Windows Defender Application Control on Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

The following design components apply to the hardening of Microsoft Windows 10 21H1 and above, including Windows 11. The Windows security settings detailed in this section are based on Microsoft best practice and ASD's [*Hardening Microsoft Windows 10 version 21H1 Workstations*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/hardening-microsoft-windows-10-version-21h1-workstations) guidance.

{{% alert title="Design Decisions" color="warning" %}}

* Attack Surface Reduction
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Attack Surface Reduction rules – Enabled
  ```(BE9BA2D9-53EA-4CDC-84E5-9B1EEEE46550,D4F940AB-401B-4EFC-AADC-AD5F3C50688A,3B576869-A4EC-4529-8536-B80A7769E899,75668C1F-73B5-4CF0-BB93-3ECF5CB7CC84,D3E037E1-3EB8-44C8-A917-57927947596D,5BEB7EFE-FD9A-4556-801D-275E5FFC04CC,92E97FA1-2EDF-4476-BDD6-9DD0B4DDDC7B,01443614-CD74-433A-B99E-2ECDC07BFC25E,C1DB55AB-C21A-4637-BB3F-A12568109D35,9E6C4E1F-7D60-472F-BA1A-A39EF669E4B2,D1E49AAC-8F56-4280-B9BA-993A6D77406C,B2B3F03D-6A65-4F7B-A9C7-1C7EF74A9BA4,26190899-1602-49E8-8B27-EB1D0A1CE869,7674BA52-37EB-4A4F-A9A1-F0F9A1619A2C,E6DB77E5-3DF2-4CF1-B95A-636979351E5B)```
* Credential caching
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Interactive logon: Number of previous logons to cache: 1 logon
  * Network access: Do not allow storage of passwords and credentials for network authentication: Enabled
  * WDigest Authentication: Disabled
  * Turn On Virtualization Based Security: Enabled
  * Select Platform Security Level: Secure Boot and DMA Protection
  * Credential Guard Configuration: Enabled with UEFI lock
* Controlled Folder Access
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Configure allowed applications: Enabled
  * Configure Controlled folder access: Enabled
  * Configure protected folders: Enabled
* Credential entry
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Do not display network selection UI: Enabled
  * Enumerate local users on domain-joined computers: Disabled
  * Do not display the password reveal button: Enabled
  * Enumerate administrator accounts on elevation: Disabled
  * Require trusted path for credential entry: Enabled
  * Prevent the use of security questions for local accounts: Enabled
  * Disable or enable software Secure Attention Sequence: Disabled
  * Sign-in last interactive user automatically after a system-initiated restart: Disabled
  * Interactive logon: Do not require CTRL+ALT+DEL: Disabled
* Early Launch Antimalware
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Boot-Start Driver Initialization Policy: Enabled
  * Choose the boot-start drivers that can be initialized: Good and unknown
* Elevating privileges
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * User Account Control
    * Admin Approval Mode for the Built-in Administrator account: Enabled
    * Allow UIAccess applications to prompt for elevation without using the secure desktop: Disabled
    * behaviour of the elevation prompt for administrators in Admin Approval Mode: Prompt for credentials on the secure desktop
    * behaviour of the elevation prompt for standard users: Automatically deny elevation requests
    * Detect application installations and prompt for elevation: Enabled
    * Only elevate UIAccess applications that are installed in secure locations: Enabled
    * Run all administrators in Admin Approval Mode: Enabled
    * Switch to the secure desktop when prompting for elevation: Enabled
    * Virtualise file and registry write failures to per-user locations: Enabled
* Exploit protection
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Use a common set of exploit protection settings: Enabled
  * Prevent users from modifying settings: Enabled
  * Turn off Data Execution Prevention for Explorer: Disabled
  * Enabled Structured Exception Handling Overwrite Protection (SEHOP): Enabled
* Local administrator accounts
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Accounts: Administrator account status: Disabled
  * Apply UAC restrictions to local accounts on network logons: Enabled
* Password policy
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Turn off picture password sign-in: Enabled
  * Turn on convenience PIN sign-in: Disabled
  * Maximum password age: 365 days
  * Minimum password length: 14 characters
  * Password must meet complexity requirements: Enabled
  * Store passwords using reversible encryption: Disabled
  * Accounts: Limit local account use of blank passwords to console logon only: Enabled
* Account lockout policy
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Account lockout duration: 0
  * Account lockout threshold: 5 invalid login attempts
  * Reset account lockout counter after: 15 minutes
* Anonymous connections
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Enable insecure guest logons: Disabled
  * Network access:
    * Allow anonymous SID/Name translation: Disabled
    * Do not allow anonymous enumeration of SAM accounts: Enabled
    * Do not allow anonymous enumeration of SAM accounts and shares: Enabled
    * Let Everyone permissions apply to anonymous users: Disabled
    * Restrict anonymous access to Named Pipes and Shares: Enabled
    * Restrict clients allowed to make remote calls to SAM - O:BAG:BAD:(A;;RC;;;BA)
  * Network security:
    * Allow Local System to use computer identity for NTLM: Enabled
    * Allow LocalSystem NULL session fallback: Disabled
  * Access this computer from the network: Administrators, Remote Desktop Users
  * Deny access to this computer from the network - NT AUTHORITY\Local Account
* Antivirus software
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Turn off Windows Defender Antivirus: Disabled
  * Configure local setting override for reporting to Microsoft MAPS: Disabled
  * Configure the 'Block at First Sight' feature: Enabled
  * Join Microsoft MAPS: Enabled (Advanced MAPS)
  * Send file samples when further analysis is required: Enabled (Send safe samples)
  * Configure extended cloud check: Enabled (High blocking level)
  * Configure removal of items from Quarantine folder: Disabled
  * Scan all downloaded files and attachments: Enabled
  * Turn off real-time protection: Disabled
  * Turn on behaviour monitoring: Enabled
  * Turn on process scanning whenever real-time protection is enabled: Enabled
  * Allow users to pause scan: Disabled
  * Check for the latest virus and spyware definitions before running a scheduled scan: Enabled
  * Scan archive files: Enabled
  * Scan packed executables: Enabled
  * Scan removable drives: Enabled
  * Turn on e-mail scanning: Enabled
  * Turn on heuristics: Enabled
* Attachment Manager
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Do not preserve zone information in file attachments: Disabled
  * Hide mechanisms to remove zone information: Enabled
* Audit event management
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Audit event management: Enabled
  * Audit Application: Enabled (65535KB)
  * Audit Security: Enabled (2097152KB)
  * Audit System: Enabled (65535KB)
  * Manage auditing and security log: Administrators
* Autoplay and AutoRun
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Disallow Autoplay for non-volume devices: Enabled
  * Set the default behaviour for AutoRun: Enabled (Default AutoRun behaviour: Do not execute any autorun commands)
  * Turn off Autoplay: Enabled (Turn off Autoplay on: All drives)
* Bridging networks
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Prohibit installation and configuration of Network Bridge on the DNS domain network: Enabled
  * Prohibit use of Internet Connection Sharing on the DNS domain network: Enabled
  * Route all traffic through the internal network: Enabled (Select from the following states: Enabled State)
  * Prohibit connection to non-domain networks when connected to domain authenticated network: Enabled
* Built-in guest accounts
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Accounts: Guest account status: Disabled
* CD burner access
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Remove CD Burning features: Enabled
* Command Prompt
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Prevent access to the command prompt: Enabled (Disable the command prompt script processing also: Yes)
* Direct Memory Access
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Prevent installation of devices that match any of these device IDs: Enabled
    * Prevent installation of devices that match any of these Device IDs: `PCI\CC_0C0010, PCI\CC_0C0A`
    * Also apply to matching devices that are already installed.
  * Prevent installation of devices using drivers that match these device setup classes: Enabled
    * Prevent installation of devices using drivers for these device setup classes: `{d48179be-ec20-11d1-b6b8-00c04fa372a7}`
    * Also apply to matching devices that are already installed.
* Drive encryption
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance. Note, the encryption key strength exceeds the requirements of the ASD guidance.
  * BitLocker Drive Encryption:
    * Choose drive encryption method and cipher strength: Enabled (XTS-AES 256-bit) 
    * Disable new DMA devices when this computer is locked: Enabled
    * Prevent memory overwrite on restart: Disabled
  * Fixed Data Drives:
    * Choose how BitLocker-protected fixed drives can be recovered: Enabled (Allow data recovery agent)
    * Configure use of passwords for fixed data drives: Enabled (Require password for fixed data drive)
    * Deny write access to fixed drives not protected by BitLocker: Enabled
    * Enforce drive encryption type on fixed data drives: Enabled (Full encryption)
  * Operating System Drives
    * Allow devices compliant with InstantGo or HSTI to opt out of pre-boot PIN: Disabled
    * Allow enhanced PINs for startup: Enabled
    * Allow network unlocked at startup: Enabled
    * Allow Secure Boot for integrity validation: Enabled
    * Choose how BitLocker-protected operating system drives can be recovered: Enabled (Allow data recovery agent)
    * Configure minimum PIN length for startup: Enabled
    * Configure use of passwords for operating system drives: Enabled
    * Disallow standard users from changing the PIN or password: Disabled
    * Enforce drive encryption type on operating system drives: Enabled (Fully encryption)
    * Require additional authentication at startup: Enabled (Allow BitLocker without a compatible TPM)
    * Reset platform validation data after BitLocker recovery: Enabled
  * Removable Data Drives
    * Choose how BitLocker-protected removable drives can recovered: Enabled (Allow data recovery agent)
    * Configure use of passwords for removable data drives: Enabled
    * Control use of BitLocker on removable drives: Enabled
    * Deny write access to removable drives not protected by BitLocker: Enabled
    * Enforce drive encryption type on removable data drives: Enabled (Fully encryption)
  * Account Lockout Policy
    * Interactive logon Machine account lockout threshold: 10
* Endpoint device control
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * All Removable Storage classes: 
    * Deny all access: Enabled
  * CD and DVD:
    * Deny execute access: Enabled
    * Deny read access: Disabled
    * Deny write access: Enabled
  * Custom Classes:
    * Deny read access: Disabled
    * Deny write access: Enabled
  * Floppy Drives:
    * Deny execute access: Enabled
    * Deny read access: Disabled
    * Deny write access: Enabled
  * Removable Disks:
    * Deny execute access: Enabled
    * Deny read access: Disabled
    * Deny write access: Enabled
  * Tape Drives:
    * Deny execute access: Enabled
    * Deny read access: Disabled
    * Deny write access: Enabled
  * WPD Devices:
    * Deny read access: Disabled
    * Deny write access: Enabled
* File and print sharing
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Prevent the computer from joining a homegroup: Enabled
  * Prevent users from sharing files within their profile: Enabled
* Installing applications and drivers
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Configure Windows Defender SmartScreen: Enabled (Warn and prevent bypass)
  * Allow user control over installs: Disabled
  * Always install with elevated privileges: Disabled
  * Devices: Prevent users from installing printer drivers: Enabled
  * Always install with elevated privileges: Disabled
* Legacy and run once lists
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Do not process the legacy run list: Enabled
  * Do not process the run once list: Enabled
  * Run these programs at user logon: Disabled
* Microsoft accounts
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Block all consumer Microsoft account user authentication: Enabled
  * Prevent the usage of OneDrive for file storage: Enabled
  * Accounts: Block Microsoft accounts: Users can't add or log on with Microsoft accounts
* MSS settings
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * IP source routing protection level: Enabled
  * Allow ICMP redirects to override OSPF generated routes: Disabled
  * Allow the computer to ignore NetBIOS name release requests except from WINS servers: Enabled
* Network authentication
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Configure encryption types allowed for Kerberos: AES128_HMAC_SHA1, AES256_HMAC_SHA1
  * LAN Manager authentication level: Send NTLMv2 response only. Refuse LM & NTLM
  * Minimum session security for NTLM SSP based clients: Require NTLMv2 session security, Require 128-bit encryption
  * Minimum session security for NTLM SSP based servers: Require NTLMv2 session security, Require 128-bit encryption
* No LM Hash policy
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Do not store LAN Manager hash value on next password change: Enabled
* PowerShell
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Turn on PowerShell Script Block Logging: Enabled
  * Turn on Script Execution: Enabled (Allow only signed scripts)
* Registry editing tools
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Prevent access to registry editing tools: Enabled (Disable regedit from running silently: Yes)
* Remote Assistance
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Configure Offer Remote Assistance: Disabled
  * Configure Solicited Remote Assistance: Disabled
* Remote Desktop Services
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Allow users to connect remotely by using Remote Desktop Services: Disabled
  * Allow log on through Remote Desktop Services: blank
  * Deny log on through Remote Desktop Services: Administrators, NT AUTHORITY\Local Account
* Remote Procedure Call
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Restrict Unauthenticated RPC clients: Enabled (RPC Runtime Unauthenticated Client Restriction to Apply: Authenticated)
* Reporting system information
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  Note, additional telemetry is required for [Desktop Analytics]({{< ref "endpoint-analytics">}}) and organisations may choose to enable it to aid in Microsoft Support troubleshooting.
  * Microsoft Support Diagnostic Tool:
    * Turn on MSDT interactive communication with support provider: Disabled
  * Turn off Inventory Collector: Enabled
  * Turn off Steps Recorder: Enabled
  * Allow Telemetry: Enabled (0: Security)
  * Configure Corporate Windows Error Reporting: Enabled
* Safe Mode
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * SafeModeBlockNonAdmins: `REG_DWORD 0x00000001 (1)`
* Secure channel communications
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Digitally encrypt or sign secure channel data (always): Enabled
  * Digitally encrypt secure channel data (when possible): Enabled
  * Digitally sign secure channel data (when possible): Enabled
  * Require strong (Windows 2000 or later) session key: Enabled
* Security policies
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Turn off multicast name resolution: Enabled
  * Allow Windows to automatically connect to suggested open hotspots, to networks shared by contacts, and to hotspots offering paid services: Disabled
  * Turn off Microsoft consumer experiences: Enabled
  * Turn off heap termination on corruption: Disabled
  * Turn off shell protocol protected mode: Disabled
  * Prevent downloading of enclosures: Enabled
  * Allow indexing of encrypted files: Disabled
  * Enables or disables Windows Game Recording and Broadcasting: Disabled
  * Disable machine account password changes: Disabled
  * Maximum machine account password age: 30 days
  * Allow PKU2U authentication requests to this computer to use online identities: Disabled
  * Force logoff when logon hours expire: Enabled
  * LDAP client signing requirements: Negotiate signing
  * Require case insensitivity for non-Windows subsystems: Enabled
  * Strengthen default permissions of internal system objects: Enabled
* Server Message Block sessions
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Configure SMB v1 client driver: Enabled (Configure MrxSmb10 driver: Disable driver)
  * Configure SMB v1 server: Disabled
  * Digitally sign communications (always): Enabled
  * Digitally sign communications (if server agrees): Enabled
  * Send unencrypted password to third-party SMB servers: Disabled
  * Amount of idle time required before suspending session: 15 minutes
* Session locking
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Prevent enabling lock screen camera: Enabled
  * Prevent enabling lock screen slide show: Enabled
  * Allow users to select when a password is required when resuming from connected standby: Disabled
  * Turn off app notifications on the lock screen: Enabled
  * Show lock in the user tile menu: Enabled
  * Allow Windows Ink Workspace: Enabled (On, but disallow access above lock)
  * Machine inactivity limit: 900 seconds
  * Enable screen saver: Enabled
  * Password protect the screen saver: Enabled
  * Screen saver timeout: Enabled (Seconds: 900)
  * Turn off toast notifications on the lock screen: Enabled
  * Do not suggest third-party content in Windows spotlight: Enabled
* Sound Recorder
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Do not allow Sound Recorder to run: Enabled
* System backup and restore
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Back up files and directories: Administrators
  * Restore files and directories: Administrators
* System cryptography
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Force strong key protection for user keys stored on the computer: User must enter a password each time they use a key
  * Use FIPS compliant algorithms for encryption, hashing, and signing: Enabled
* User rights policies
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Access Credential Manager as a trusted caller: blank
  * Act as part of the operating system: blank
  * Allow log on locally: Administrators, Users
  * Create a pagefile: Administrators
  * Create a token object: blank
  * Create global objects: Administrators, LOCAL SERVICE, NETWORK SERVICE, SERVICE
  * Create permanent shared objects: blank
  * Debug programs: Administrators
  * Enable computer and user accounts to be trusted for delegation: blank
  * Force shutdown from a remote system: Administrators
  * Impersonate a client after authentication: Administrators, LOCAL SERVICE, NETWORK SERVICE, SERVICE
  * Load and unload device drivers: Administrators
  * Lock pages in memory: blank
  * Modify firmware environment values: Administrators
  * Perform volume maintenance tasks: Administrators
  * Profile single process: Administrators
  * Take ownership of files or other objects: Administrators
* Windows Remote Management
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Allow Basic authentication: Disabled
  * Allow unencrypted traffic: Disabled
  * Disallow Digest authentication: Enabled
  * Disallow WinRM from storing RunAs credentials: Enabled
* Windows Remote Shell access
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Allow Remote Shell Access: Disabled
* Windows Search and Cortana
  * Justification: To align with the ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations*guidance.
  * Allow Cortana: Disabled

  {{% /alert %}}

  ### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* None identified