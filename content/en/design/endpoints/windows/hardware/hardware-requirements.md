---
title: "Hardware Requirements"
weight: 5
description: "This section describes the design decisions associated with hardware requirements for Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

The hardware platform chosen to support the SOE is key to its stability and provides the components that can be configured by the operating system and applications.

The selected processor architecture and associated firmware capability directly influence the supportability of applications and security features of an operating system. The minimum hardware requirements listed below will ensure that the system runs reliably and is supported by the vendor, Microsoft.

Organisations should select a reputable hardware platform that supports enterprise features, such as having an interface to provision zero-touch UEFI configuration and updates.

{{% alert title="Note" color="info" %}}

Organisations wishing to implement virtual desktops or VDI (Virtual Desktop Infrastructure) should assess the chosen virtualisation or hypervisor (including cloud platforms) platform to determine the features available meet the desired security risk profile for the organisation.

{{% /alert %}}

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point | Design Decision                                                                         | Justification                      |
|----------------|-----------------------------------------------------------------------------------------|------------------------------------|
| Laptop Model   | Any device that meets the below requirements and the organisation procurement processes | To meet organisation requirements. |
| Desktop Model  | Any device that meets the below requirements and the organisation procurement processes | To meet organisation requirements. |

{{% /alert %}}

Minimum physical hardware configuration for the Windows 10 SOE applicable to all organisations and implementation types.

| Component         | Description                                                                                                                               | Justification                                                                                                                                                                                                          |
|-------------------|-------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Architecture      | x64                                                                                                                                       | Required to Support more than 4GB RAM.                                                                                                                                                                                 |
| Processor         | At least 4 logical processors, VT-x (Intel) or AMD-V CPU extensions, 2 GHz or higher with Second Level Address Translation (SLAT) support | SLAT is required to support Virtualization-based Securities (VBS).                                                                                                                                                        |
| RAM               | 8GB                                                                                                                                       | To meet design specifications.                                                                                                                                                                                         |
| Graphics Card     | DirectX 9 WDDM 1.0                                                                                                                        | To meet design specifications. Integrated or dedicated.                                                                                                                                                                |
| Input Device(s)   | Keyboard<br>Mouse<br>Multi-touch display screen to enable Windows 10 touch screen features (optional)                                     | Keyboard and mouse may be built into a laptop, but touch screens are optional.                                                                                                                                         |
| Minimum HDD Space | 128GB                                                                                                                                     | To meet design specifications.                                                                                                                                                                                         |
| Microphone        | Required for speech recognition (optional)                                                                                                | Speech recognition is not required to be enabled but may be needed for organisations with accessibility requirements.                                                                                                       |
| BIOS              | Minimum UEFI 2.3.1                                                                                                                        | Required to support Secure Boot, Windows Defender Device Guard, Windows Defender Credential Guard, Windows Defender Exploit Guard and Kernel DMA Protection.                                                           |
| TPM               | Minimum version 2.0 (with device attestation preferred)                                                                                   | Required to support Microsoft Intune Windows Autopilot and MECM. Note: TPM device attestation is preferred to enable [Windows Autopilot Self-deploying mode](https://learn.microsoft.com/mem/autopilot/self-deploying). |

In addition for Windows 11 SOEs, the processor must be selected from the supported list for [Windows Processor Requirements](https://learn.microsoft.com/windows-hardware/design/minimum/windows-processor-requirements).

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* None identified

#### References

* None identified