---
title: "Screen Saver"
weight: 90
description: "This section describes the design decisions associated with screen savers on Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

The screen saver was originally designed to prevent burn-in on Cathode Ray Tube (CRT) and plasma screens. Modern usage of the screen saver enables the operating system to detect a period of inactivity and lock or blank the screen reducing power usage.

Screensavers should be applied at regular intervals in instances that a user may walk away from their endpoint and leave their workstation unlocked. Screensavers can also be used in some circumstances as a communication mechanism to users. 

Microsoft does not recommend enabling a screen saver on devices. Instead, Microsoft recommends using automatic power plans to dim or turn off the screen as this can help reduce system power consumption. 

Configuration can be applied to restrict the end-user ability to configure or change the screen saver settings.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                       | Design Decision          | Justification                                                                                                        |
|--------------------------------------|--------------------------|----------------------------------------------------------------------------------------------------------------------|
| Screen Saver                         | Disabled                 | Not required, the device will be configured to sleep after 15 minutes.                                               |
| Machine Inactivity                   | Configured – 900 seconds | To align with ASD's [*Hardening Microsoft Windows 10 version 21H1 Workstations*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/hardening-microsoft-windows-10-version-21h1-workstations) guidance.                                                                   |
| Users Can Configure the Screen Saver | No                       | Disable the ability for users to configure the screen saver for all Windows SOE devices.                             |
| Require Password on Wake             | Configured               | Users will be required to enter their password on machine wake up to align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* [ASD Windows Hardening Guidelines]({{<ref "configuration/intune/devices/configuration-profiles/asd-windows-hardening-guidelines.md">}})

#### References

* None identified