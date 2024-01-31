---
title: "Windows Deployment"
weight: 5
description: "This section describes the design decisions associated with deployment of Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

The type of deployment methods used for the Standard Operating Environment (SOE) will vary depending on the use of either a cloud native or hybrid configuration. Cloud native will typically utilise pre-installed or offline custom images with Windows Autopilot for the deployment method and utilise Intune as the ongoing management method.

Hybrid can benefit from enabling the Microsoft Endpoint Configuration Manager (MECM) Co-management feature. Once enabled this allows additional deployment methods which can be utilised to ensure images remain light weight. Co-management provides a more staged approach to moving workloads into the cloud that may assist existing larger environments to complete a more gradual transition.

Windows 10 and 11 can be deployed via Intune or MECM, or a combination of both. The configuration of a Windows deployment will depend upon which technologies are available to organisations and whether a hybrid deployment is required.

Windows deployments will be based on either a deployment which is cloud native or hybrid.

* **Cloud native** – Image on the workstation will be modified using Windows Autopilot and Intune. The Original Equipment Manufacturers (OEMs) image in use should be from a trusted vendor or custom-built by the organisation and provided to the OEM vendor for implementation prior to being dispatched to the organisation. Alternatively, an offline image will need to be created by the organisation and applied to the workstation prior to Windows Autopilot and Intune. The offline image should be light weight consisting of the base Windows image and required base drivers only.
* **Hybrid** – OEM image or MECM task sequence should be used as the base for Windows 10, with Intune and Windows Autopilot applied over the top of the image for further customisation. The OEM image in use should be from a trusted vendor or custom built by the organisation and provided to the OEM vendor for implementation prior to being dispatched to the organisation. Alternatively, an organisation specific MECM task sequence including the Windows image and base drivers. This image will then be further customised with Intune and Windows Autopilot.

### Cloud native deployments

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point    | Design Decision                                                                                                | Justification                                                                                                                                                                                   |
|-------------------|----------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Deployment method | Organisation light weight base image with Windows Autopilot and Intune deployments applied as during enrolment | An organisation specific light weight base image provides the benefit of removing all OEM applications and firmware prior to onboarding to the organisation through Intune & Windows Autopilot. |

{{% /alert %}}

### Hybrid deployments

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point    | Design Decision                                                   | Justification                                                                                                                                                             |
|-------------------|-------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Deployment method | Organisation light-weight base image with MECM deployment applied | An organisation specific light weight base image provides the benefit of removing all OEM applications and firmware prior to onboarding to the organisation through MECM. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* None identified