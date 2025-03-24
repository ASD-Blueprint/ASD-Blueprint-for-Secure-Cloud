---
title: "Power Management"
weight: 50
description: "This section describes the design decisions associated with power management on Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

The power settings in Windows can be fully managed by Intune, Microsoft Endpoint Configuration Manager (MECM), or Group Policy. Individual settings can be enforced or set as defaults that can then be changed by the user as desired.

Users can adjust power and performance options via the system tray power slider icon to:

* **Better Battery / Recommended** - Better Battery / Recommended provides extended battery life than the default settings on previous versions of Windows.
* **Better Performance** - Better Performance is the default slider mode that slightly favours performance over battery life and is appropriate for users who want to trade-off power for better performance of applications.
* **Best Performance** - Best Performance prioritizes performance over battery life.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                                        | Design decision                                  | Justification                                                                                                                                                  |
|-------------------------------------------------------|--------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Power Management technology                           | Intune, MECM or Group Policy                     | Organisation preference of technology to configure power options. <br>If using MECM or GPO, consideration should be made to migrate these to Intune in future. |
| Default Power Option Battery                          | Balanced                                         | Default setting, no requirement to change has been identified.                                                                                                 |
| Default Power Option Powered                          | Better Performance                               | Default setting, no requirement to change has been identified.                                                                                                 |
| Allow standby states when sleeping (on battery)       | Disabled                                         | To align with ASD's [*Hardening Microsoft Windows 10 version 21H1 Workstations*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/hardening-microsoft-windows-10-version-21h1-workstations) guidance.                                                                                                             |
| Allow standby states when sleeping (plugged in)       | Disabled                                         | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                                                             |
| Require a password when a computer wake (on battery)  | Enabled                                          | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                                                                |
| Require a password when a computer wakes (plugged in) | Enabled                                          | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                                                             |
| Specify system hibernate timeout (on battery)         | Enabled<br>System Hibernate Timeout (seconds): 0 | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                                                             |
| Specify system hibernate timeout (plugged in)         | Enabled<br>System Hibernate Timeout (seconds): 0 | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                                                             |
| Specify system sleep timeout (on battery)             | Enabled<br>System Sleep Timeout (seconds): 0     | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                                                             |
| Specify system sleep timeout (plugged in)             | Enabled<br>System Sleep Timeout (seconds): 0     | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                                                             |
| Specify the unattended sleep timeout (on battery)     | Enabled<br>Unattended Sleep Timeout (seconds): 0 | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                                                             |
| Specify the unattended sleep timeout (plugged in)     | Enabled<br>Unattended Sleep Timeout (seconds): 0 | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                                                             |
| Turned off hybrid sleep (on battery)                  | Enabled                                          | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                                                             |
| Turned off hybrid sleep (plugged in)                  | Enabled                                          | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                                                             |
| Show hibernate in the power options menu              | Disabled                                         | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                                                             |
| Show sleep in the power options menu                  | Disabled                                         | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                                                             |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* [ASD Windows Hardening Guidelines]({{<ref "configuration/intune/devices/configuration-policies/asd-windows-hardening-guidelines.md">}})
#### References

* None identified