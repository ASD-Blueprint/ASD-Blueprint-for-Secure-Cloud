---
title: "Firmware Configuration"
weight: 15
description: "This section describes the design decisions associated with firmware configuration on Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

The firmware is the software that provides the interface between the hardware and the operating system. Firmware configuration and capabilities can directly influence the security features of an operating system.
Important firmware security capabilities are detailed below:

* **UEFI** - Unified Extensible Firmware Interface (UEFI) is a replacement for the older Basic Input / Output System (BIOS) firmware interface and the Extensible Firmware Interface (EFI) 1.10 specifications.
* **Secure Boot** - Secure Boot ensures that the device boots using only software that is trusted by the PC manufacturer. When the PC starts, the firmware checks the signature of each piece of boot software, including firmware drivers (Option ROMs) and the operating system. If the signatures are valid, the PC boots, and the firmware gives control to the operating system.
* **Trusted Boot** - Trusted Boot provides an additional level of protection for the Windows kernel by verifying its digital signature. Once the signature is verified the kernel is loaded, which then in turn verifies the remaining components of the Windows startup process. These components include boot drivers, startup files, and Early Launch Anti-Malware (ELAM).
* **Measured Boot** - Measured Boot provides a capability to detect if the firmware, bootloader, or boot drivers have been modified by comparing their hashes to those stored in the TPM. Measured Boot uses a trusted server - known as an attestation server - to determine if a client is healthy and can be permitted to access network resources or should be placed in a quarantine zone.

Firmware that meets the UEFI 2.3.1 or newer specifications provides the following benefits:

* Faster boot and faster resume times.
* Use of security features such as Secure Boot and factory encrypted drives help prevent suspicious code from running before the operating system is loaded.
* Able to support 2 terabytes and greater hard drives with more than four partitions.
* Some UEFI-based PCs have a Compatibility Support Module (CSM) that can emulate earlier BIOS which provide greater flexibility and compatibility for end users.

Note: Secure Boot must be disabled in order to use CSM.

* Capable of Multicast deployment whereby a PC image from a PC manufacturer can be received by multiple PCs without saturating the network or source image server.
* Support for UEFI firmware drivers, Option ROMs and applications.

UEFI 2.3.1 is a requirement for the use of Device Guard.

Secure Boot is required for the use of Credential Guard.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                                               | Design decision            | Justification                                                                                                            |
|--------------------------------------------------------------|----------------------------|--------------------------------------------------------------------------------------------------------------------------|
| UEFI version                                                 | At least 2.3.1             | This is minimum UEFI version required for Device Guard.                                                                  |
| Secure Boot                                                  | Enabled                    | Secure Boot is a requirement for the use of Windows Credential Guard and provides greater security protection for users. |
| Secure Boot Configuration Method                             | Configured via MEM or MECM | To align with ASD's [*Hardening Microsoft Windows 10 version 21H1 Workstations*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/hardening-microsoft-windows-10-version-21h1-workstations) guidance.                                                                       |
| Trusted Boot                                                 | Enabled                    | To provide additional protection from rootkits.                                                                          |
| Measured Boot                                                | Not configured             | Requires an attestation server that is not in scope of the Blueprint.                                                    |
| UEFI Password                                                | Configured                 | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                       |
| USB Boot                                                     | Disabled                   | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                       |
| SD Card Boot                                                 | Disabled                   | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                       |
| Allow boot locations other than the internal hard disk drive | Require password           | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                       |

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