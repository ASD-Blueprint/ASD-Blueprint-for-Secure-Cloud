---
Title: Entra ID
weight: 10
description: "This section describes the configuration of Microsoft Entra ID associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Entra ID portal blade at the following URL:

https://entra.microsoft.com/
 
The settings described on these pages should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.
 
When using automated configuration files, organisations should note they will configure the relevant settings in a Microsoft 365 tenancy exactly as outlined in the Configuration pages of the Blueprint. Organisations should ensure they customise configuration of their Microsoft 365 tenancies in accordance with their own design decisions and requirements, deviating from the Blueprint (including automated configuration files) where appropriate.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Automated Configuration Deployment

#### Overview

[TODO: Group Lifecycle Policy needs manual config]: #

Some of the Entra ID configuration can be automatically deployed

| Configuration                 | Blueprint Automation Provided |
| ----------------------------- | ----------------------------- |
| **Properties**                | No                            |
| **Users**                     | No                            |
| **Groups**                    |                               |
| - General                     | No                            |
| - Expiration                  | Yes (DSC)                     |
| - Naming Policy               | Yes (DSC)                     |
| **Devices**                   | No                            |
| **Applications**              | No                            |
| **Protection**                |                               |
| - Identity Protection         | No                            |
| - Conditional Access Policies | Yes (DSC)<sup>1</sup>         |
| - Authentication Contexts     | Yes (DSC)                     |
| - Authentication Strengths    | No                            |
| - Named Locations             | Yes (DSC)<sup>2</sup>         |
| - Authentication Methods      | No                            |
| - Password Reset              | No                            |
| - Risky Activities            | No                            |
| **Identity Governance**       | No                            |
| **External Identities**       | Yes (DSC)                     |

1: The following Entra configurations must be configured manually prior to deploying the DSC:

- Authentication strengths, for the GRANT - Enforced MFA methods policy.
- An Acceptable Use policy, for the GRANT - Terms of use policy.

All Conditional Access Policies are set to report only in the DSC and will need to be enabled manually.

2: IP addresses must be configured manually. Refer to [Named Locations]({{<ref "protection/conditional-access/named-locations">}}) for configuration guidance.

#### Desired State Configuration

Before using the below Microsoft 365 Desired State Configuration (DSC) file, please refer to [Automated Deployment]({{<ref "automated-deployment">}}) for instructions.

{{% alert title="Warning" color="danger" %}}
Any existing settings in a tenancy that match the Name or UID of any settings in the DSC will be overwritten.
{{% /alert %}}

| Desired State Configuration File:                                                                                                                                                       |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Download {{% download file="/content/files/automation/dsc/asdbpsc-dsc-entra.txt"%}} Entra ID DSC {{% /download %}} (.ps1) <br> *Note: download the linked .txt file and rename to .ps1* |
| **Configuration Data File:**                                                                                                                                                            |
| The Configuration Data File can be found on the [Automated Deployment]({{<ref "automated-deployment">}}) page.                                                                          |

{{% alert title="Extra Parameters" color="info"%}}
The above DSC file requires the following parameters to be populated.

| Parameter Name     | Contents                                                                                            |
| ------------------ | --------------------------------------------------------------------------------------------------- |
| ConditionalExclude | Name of an existing security group to be used as an exclusion group for Conditional Access Policies |
| EnforcedMFA        | Name of the Authentication Strength specifying the organisation's enforced MFA methods              |
| TermsOfUse         | Name of the Acceptable Use Policy used by the Organisation                                          |

{{% /alert %}}
