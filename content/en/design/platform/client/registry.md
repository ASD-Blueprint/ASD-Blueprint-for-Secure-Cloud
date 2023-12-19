---
title: Registry settings
weight: 50
description: "This section describes the design decisions associated with Device Configuration for system(s) built using ASD's Blueprint for Secure Cloud."
---

Registry settings are applied to the Windows registry to modify the underlying operating system. Registry settings are typically changed in a client operating system to configure the system or increase the security of system.

There are several tools available to apply registry settings such as:

* Group Policy
* Microsoft Intune
* Microsoft Endpoint Configuration Manager (MECM)

ASD's [*Hardening Microsoft 365, Office 2021, Office 2019 and Office 2016*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/hardening-microsoft-365-office-2021-office-2019-and-office-2016) guidance defines group policy settings along with other recommendations to significantly reduce the attack surface available to malicious attacks.

### Cloud native deployments

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point          | Design Decision  | Justification                                                                                                                                                                  |
| ----------------------- | ---------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Registry Setting Method | Microsoft Intune | The organisation should use Microsoft Intune to implement and modify user and computer registry settings to comply with ASD's *Hardening Microsoft 365, Office 2021, Office 2019 and Office 2016* guidance. |

{{% /alert %}}

### Hybrid deployments

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point          | Design Decision             | Justification                                                                                                                                                                                                             |
| ----------------------- | --------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Registry Setting Method | Group Policy Objects & MECM | The organisation may utilise management solutions such as Group Policy Objects and MECM to implement and modify user and computer registry settings to comply with ASD's *Hardening Microsoft 365, Office 2021, Office 2019 and Office 2016* guidance. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* [Hardening Microsoft Windows 10](https://www.cyber.gov.au/acsc/view-all-content/publications/hardening-microsoft-windows-10-version-21h1-workstations)
* [Hardening Microsoft 365, Office 2021, Office 2019 and Office 2016](https://www.cyber.gov.au/acsc/view-all-content/publications/hardening-microsoft-365-office-2021-office-2019-and-office-2016)

