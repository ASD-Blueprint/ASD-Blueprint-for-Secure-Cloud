---
title: "Entra ID"
linkTitle: "Entra ID"
weight: 10
description: "This page describes the configuration of Microsoft Entra ID associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Entra admin portal at the following URL:

<https://entra.microsoft.com/>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

When using automated configuration files, organisations should note they will configure the relevant settings in a Microsoft tenancy exactly as outlined in the Configuration pages of the Blueprint. Organisations should ensure they customise configuration of their Microsoft tenancies in accordance with their own design decisions and requirements, deviating from the Blueprint (including automated configuration files) where appropriate.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Automated Configuration Deployment

#### Overview

Some of the Entra ID configurations can be automatically deployed using Microsoft 365 Desired State Configuration (DSC).

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

1: All Conditional Access policies are set to report only in the DSC and will need to be enabled manually.

2: IP addresses must be set manually. Refer to [Named Locations]({{<ref "protection/conditional-access/named-locations">}}) for configuration guidance.

#### Desired State Configuration

Before using the below DSC file, please refer to [Automated Deployment]({{<ref "automated-deployment">}}) for instructions.

{{% alert title="Warning" color="danger" %}}

Any existing settings in a tenancy that match the Name or UID of any settings in the DSC will be overwritten.

{{% /alert %}}

| Desired State Configuration File:                                                                                                                                                     |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Download {{% download file="/content/files/automation/dsc/asdbpsc-dsc-entra.txt"%}} Entra ID DSC {{% /download %}} (.ps1)<br>*Note: download the linked .txt file and rename to .ps1* |
| **Configuration Data File:**                                                                                                                                                          |
| The Configuration Data File can be found on the [Automated Deployment]({{<ref "automated-deployment">}}) page.                                                                        |

{{% alert title="Extra Parameters" color="info"%}}

The above DSC file requires the following parameters to be populated or they will be prompted for on import:

| Parameter Name     | Contents                                                                                                    |
| ------------------ | ----------------------------------------------------------------------------------------------------------- |
| ConditionalExclude | Name of an existing security group to be used as a placeholder for Conditional Access exclusion<sup>1</sup> |
| PrivUsers          | Name of an existing security group containing all privileged users                                          |
| TermsOfUse         | Name of the acceptable use policy used by the organisation                                                  |

1: Exclude groups specific to each Conditional Access policy will need to be manually configured post-DSC import.

{{% /alert %}}

##### Service Principal permissions

To import the DSC as per the instructions on the [Automated Deployment]({{<ref "automated-deployment">}}) page, the following permissions will need to be added to the Service Principal:

```powershell
"AADAdministrativeUnit", "AADAuthenticationContextClassReference", "AADAuthorizationPolicy", "AADConditionalAccessPolicy", "AADCrossTenantAccessPolicyConfigurationDefault", "AADCrossTenantAccessPolicyConfigurationPartner", "AADEntitlementManagementAccessPackage", "AADEntitlementManagementAccessPackageAssignmentPolicy", "AADEntitlementManagementAccessPackageCatalog", "AADEntitlementManagementAccessPackageCatalogResource", "AADEntitlementManagementConnectedOrganization", "AADExternalIdentityPolicy", "AADGroupLifecyclePolicy", "AADNamedLocationPolicy", "AADSocialIdentityProvider", "AADTokenLifetimePolicy"
```
