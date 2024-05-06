---
title: "Drivers and Peripherals"
weight: 5
description: "This section describes the design decisions associated with drivers and peripherals on Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

Drivers enable hardware and software to function within a SOE. Drivers are essentially written code that enable Windows to recognise physical components of a computer such as printers, keyboards, mouse, graphics cards and peripherals. It is critical these drivers are supported on the Operating System version and are deployed at the right time.

Drivers that are essential to the hardware platform can be deployed in the base reference image, during device deployment task sequence through MECM, via Microsoft Intune or later by Microsoft Windows Update. Drivers such as network drivers are critical during the deployment phase, whereas a microphone driver is not. The more generic a reference image, the lower the deployment and maintenance costs.

Other drivers like printer drivers can be deployed after the end user has logged onto the device using either a "Follow Me Print" or "Defined print queue list" selected by the end user.

Peripheral installation can natively be controlled through Group Policies or Intune (administrative templates or the [Device installation CSP](https://learn.microsoft.com/windows/client-management/mdm/policy-csp-deviceinstallation)). As device identifiers may be spoofed, a defence in depth approach should be followed using additional methods of protection such as:

* Denying write to removable media unless the device is encrypted by BitLocker.
* Blocking of unsigned and untrusted executables.
* Ensuring Microsoft Defender is actively scanning for threats on removable media.

When restricting the installation of peripherals, there are many common human input devices (HID) (e.g. mice, keyboards etc.) where a blanket allow approach may be taken to avoid additional operational overheads, see [System-Defined Device Setup Classes](https://learn.microsoft.com/windows-hardware/drivers/install/system-defined-device-setup-classes-available-to-vendors). 

Bluetooth pairing and allowed services are also controllable. The default state of Windows allows all services, thus care should be taken to define only the [Bluetooth services](https://learn.microsoft.com/windows/client-management/mdm/policy-csp-bluetooth#servicesallowedlist-usage-guide) required.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                | Design Decision | Justification                                                                                                                                                                                                                                                                                                      |
|-------------------------------|-----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Driver Integration            | Configured      | Deployed via Microsoft Windows Update which aligns with ASD's [*Hardening Microsoft Windows 10 version 21H1 Workstations*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/hardening-microsoft-windows-10-version-21h1-workstations) guidance.                                                                                                                                                                                                                                         |
| Approved Peripheral Devices   | Configured      | The SOE will enforce a list of organisation approved peripheral devices using Intune device installation policy.                                                                                                                                                                                                   |
| Unapproved Peripheral Devices | Blocked         | The SOE will block installation of unapproved peripheral devices using Intune policy.                                                                                                                                                                                                                              |
| Signed Device Driver Store    | Configured      | Deployed via Microsoft Windows Update which aligns with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                                                                                                                                                                                         |
| Peripheral Drivers            | Configured      | Deployed via Microsoft Windows Update which aligns with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.        Unauthorised driver installation is blocked via WDAC (Windows Defender Application Control).                                                                                                                                            |
| Workstation Device Drivers    | Configured      | Deployed via Microsoft Windows Update which aligns with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance. Specific vendor updates can be deployed through Intune if Windows Update does not provide a suitable driver.                                                                                                                            |
| Printer Drivers               | Configured      | Deployed via Microsoft Windows Update which aligns with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                                                                                                                                                                                         |
| Bluetooth Restrictions        | Configured      | The organisation should define a list of approved Bluetooth services to only those necessary, using [Intune device restrictions profile](https://learn.microsoft.com/microsoft-365/security/defender-endpoint/mde-device-control-device-installation?view=o365-worldwide#limit-services-that-use-bluetooth). |

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