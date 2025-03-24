---
title: "Operating System"
weight: 20
description: "This section describes the design decisions associated with Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

The operating system enables software applications to interface with the hardware. The operating system manages input and output device components like the mouse, keyboard, network and storage.
Windows 10 and 11 are available in several editions, including:

* **Home** – minimal management and deployment features and cannot be joined to either an on-premises or Microsoft Entra ID domain. It is targeted from home use only.
* **Professional** – this edition includes management and deployment features and can be joined to both an on-premises and Microsoft Entra ID domain.
* **Enterprise** – this edition has additional enterprise security features as well as the UE-V and App-V clients built in and only distributable through Microsoft's Volume Licensing Program.

Servicing of Windows 10 and 11 falls into three distinct channels (previously known as rings):

* **Windows Insider Program** – Windows Insider Program receive feature updates immediately enabling pilot machines to evaluate builds earlier than the General Availability channel. A business must opt-in for this service and install a specific Windows Insider Program for Business Preview build.
* **General Availability** – General Availability Channel receives feature update annually and is designed for the broad population of general-purpose devices within organisations. The General Availability Channel is the default servicing channel for all Windows 10 and 11 devices with the exception of Long Term Servicing Channel (LTSC) release of Windows 10 and 11 Enterprise.
* **Long-Term Servicing Channel** – Long-Term Servicing Channel (LTSC) receives releases much more gradually (expected every 2 - 3 years) and is designed for special purpose devices such as those used in Point of Sale (POS) systems or controlling factory or medical equipment, and those machines without Microsoft Office. Additionally, a number of applications are not supported on LTSC Windows devices, for example Microsoft Edge, Microsoft Store, and Microsoft Mail, amongst others.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                  | Design decision              | Justification                                                                                                                                                                                                                 |
|---------------------------------|------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Windows 10/11 Edition           | Enterprise (64-bit)          | Enterprise is required to support BitLocker.<br>The 64-bit edition of Windows is required to support security such as BitLocker and Windows Defender Application Control (WDAC) as specified by ASD's [*Hardening Microsoft Windows 10 version 21H1 Workstations*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/hardening-microsoft-windows-10-version-21h1-workstations) guidance. |
| Windows 10/11 Servicing Channel | General Availability Channel | The General Availability Channel is the recommended ring to deploy to most enterprise clients, especially those with Office 365.                                                                                              |
| Windows 10 Build                | 22H2                         | Microsoft recommends deploying the latest General Availability version, please refer to ([Windows 10 release information](https://learn.microsoft.com/windows/release-health/release-information)).                     |
| Windows 11 Build                | 22H2                         | Microsoft recommends deploying the latest General Availability version, please refer to ([Windows 11 release information](https://learn.microsoft.com/windows/release-health/windows11-release-information)).           |
 
{{% /alert %}}

### Related information

#### Security & Governance

* [Operating System Hardening]({{<ref "security-and-governance/system-security-plan/system-hardening-os.md">}})
* [Essential Eight: Patch Operating Systems]({{< ref "patch-os.md">}})

#### Design

* [Windows]({{<ref "design/endpoints/windows">}})
* [Windows Update and Patching]({{<ref "design/endpoints/windows/configuration/windows-update-and-patching.md">}})

#### Configuration

* None identified

#### References

* None identified