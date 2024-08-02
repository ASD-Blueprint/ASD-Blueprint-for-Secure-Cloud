---
title: "Microsoft Purview"
linkTitle: "Microsoft Purview"
weight: 050
description: "This section describes the configuration of Microsoft Purview associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* for the Microsoft Purview portal at the following URL:

<https://compliance.microsoft.com>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

When using automated configuration files, organisations should note they will configure the relevant settings in a Microsoft 365 tenancy exactly as outlined in the Configuration pages of the Blueprint. Organisations should ensure they customise configuration of their Microsoft 365 tenancies in accordance with their own design decisions and requirements, deviating from the Blueprint (including automated configuration files) where appropriate.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Automated Configuration Deployment

#### Overview

Some of the Purview configurations can be automatically deployed using Microsoft 365 Desired State Configuration (DSC).

| Configuration                 | Blueprint Automation Provided |
| ----------------------------- | ----------------------------- |
| **Purview Settings**          | No                            |
| **Compliance Manager**        | No                            |
| **Data Classification**       | No                            |
| **Audit**                     | No                            |
| **Data Loss Prevention**      | Yes (DSC)<sup>1</sup>         |
| **Data Lifecycle Management** | Yes (DSC)                     |
| **Information Protection**    |                               |
| - Labels                      | Yes (DSC)<sup>2</sup>         |
| - Label Policies              | Yes (DSC)<sup>3</sup>         |
| - Auto-Labeling               | No                            |
| - Records Management          | No                            |

1: The Data Loss Prevention policies are created automatically, but the advanced rules must be manually configured. Refer to [Data Loss Prevention Policies]({{<ref "data-loss-prevention/policies">}}) for configuration guidance.

2: The Protected Label encryption settings must be configured manually. Refer to [Protected Label]({{<ref "information-protection/labels/p-protected">}}) for configuration guidance.

3: The Test and Protected Label Policy must be changed to apply to test and protected user groups respectively. Refer to [Test Policy]({{<ref "information-protection/label-policies/test-policy">}}) and [Protected Policy]({{<ref "information-protection/label-policies/protected-policy">}}) for configuration guidance.

#### Desired State Configuration

Before using the below DSC file, please refer to [Automated Deployment]({{<ref "automated-deployment">}}) for instructions.

{{% alert title="Warning" color="danger" %}}
Any existing settings in a tenancy that match the Name or UID of any settings in the DSC will be overwritten.
{{% /alert %}}

| Desired State Configuration File                                                                                                                                                         |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Download {{% download file="/content/files/automation/dsc/asdbpsc-dsc-purview.txt"%}} Purview DSC {{% /download %}} (.ps1)<br>*Note: download the linked .txt file and rename to .ps1* |
| **Configuration Data File:**                                                                                                                                                             |
| The Configuration Data File can be found on the [Automated Deployment]({{<ref "automated-deployment">}}) page.                                                                           |

##### Service Principal permissions

To import the DSC as per the instructions on the [Automated Deployment]({{<ref "automated-deployment">}}) page, the following permissions will need to be added to the Service Principal:

```powershell
"SCCaseHoldPolicy", "SCDLPCompliancePolicy", "SCLabelPolicy", "SCRetentionCompliancePolicy", "SCRetentionComplianceRule", "SCSensitivityLabel"
```
