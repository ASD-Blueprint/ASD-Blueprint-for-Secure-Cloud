---
title: "Enrolling iOS devices"
weight: 10
description: "This section describes the design decisions associated with enrolling iOS endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

Device enrolment registers the iOS devices into the corporate device management solution and ensures the device is then able to be managed by administrators.

Microsoft Intune provides a mechanism for enrolling devices into Microsoft Entra ID. Once registered the device is populated into Intune policy groups using dynamic membership. This ensures that the device meets the compliance policy, monitored, and secured to the organisations security requirements. 

Microsoft Intune provides three separate experience in enrolling the iOS devices into the organisations Azure Active directory. The enrolment experiences are: 

* **Automated device enrolment (ADE)** – Device Enrolment Program is a managed device enrolment process. The devices serial number is registered with Apple Business Manager enables Intune to bypass Assisted Setup by preconfigure device settings. The user's account will be assigned to the device. The device will be marked as a Supervised device.
* **Device Enrolment Manager (DEM)** – Device Enrolment Manager assigns a single Azure Active Directory account as the owner of the device. The end users cannot administer or purchase any apps on the device.
* **User Enrolment** – User enrolment process requires users set up the iOS device and manually install Company Portal to register the device as Intune enrolled device. The device will be marked as a BYOD device.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point   | Design Decision                                            | Justification                                                                                                                                                               |
|------------------|------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Enrolment method | Automated device enrolment through Apple Business Manager | Devices will be pre-configured before the device is handed over to the end user. This in line with ASD's iOS Secure Configuration Hardening guide for PROTECTED devices. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* None identified