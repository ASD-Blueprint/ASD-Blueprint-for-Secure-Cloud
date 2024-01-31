---
title: "Microsoft Purview Settings"
weight: 05
type: docs
description: "This section describes the configuration of Microsoft Purview associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* for the Microsoft Purview portal blade at the following URL: 
 
https://compliance.microsoft.com/compliancesettings
 
The settings described on these pages should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

### Device on-boarding

| Item              | Value |
| ----------------- | ----: |
| Device onboarding |    On |

#### Onboarding

| Item                                                |                                       Value |
| --------------------------------------------------- | ------------------------------------------: |
| Select operating system to start onboarding process |                                  Windows 10 |
| Deployment method                                   | Mobile Device Management / Microsoft Intune |

#### Offboarding

| Item                                                 |                                       Value |
| ---------------------------------------------------- | ------------------------------------------: |
| Select operating system to start offboarding process |                                  Windows 10 |
| Deployment method                                    | Mobile Device Management / Microsoft Intune |

### Co-authoring for files with sensitivity labels

| Item                                                   |   Value |
| ------------------------------------------------------ | ------: |
| Turn on co-authoring for files with sensitivity labels | Checked |

### Compliance Manager

| Item           |                                                                    Value |
| -------------- | -----------------------------------------------------------------------: |
| Testing source | Turn on automatic testing per improvement action (All sub-items checked) |

### Optical character recognition (OCR)

| Item         |       Value |
| ------------ | ----------: |
| OCR Scanning | Not checked |

{{% alert title="Note" color="info" %}}

Optical character recognition scanning bills consumers for scanned images, which is in addition to the E5 licence costs. [Learn about optical character recognition in Microsoft Purview](https://learn.microsoft.com/purview/ocr-learn-about#workflow-at-a-glance).

{{% /alert %}}

### Information protection scanner


### Just-in-time protection

| Item                               |                           Value |
| ---------------------------------- | ------------------------------: |
| Choose which locations to monitor  |                         Devices |
| Fallback action in case of failure | Allow users to complete actions |

### Related information

#### Security & Governance

* None identified
  
#### Design

* None identified
  
#### Configuration

* None identified

#### References

* [Get started with Compliance Manager](https://learn.microsoft.com/purview/compliance-manager-setup)
* [Enable co-authoring for files encrypted with sensitivity labels](https://learn.microsoft.com/purview/sensitivity-labels-coauthoring)
* [Onboard Windows devices into Microsoft 365 overview](https://learn.microsoft.com/purview/device-onboarding-overview)
* [Onboard Windows devices to Defender for Endpoint using Intune](https://learn.microsoft.com/microsoft-365/security/defender-endpoint/configure-endpoints-mdm)
* [Learn about optical character recognition in Microsoft Purview](https://learn.microsoft.com/purview/ocr-learn-about)
* [Learn about the information protection scanner](https://learn.microsoft.com/purview/deploy-scanner)