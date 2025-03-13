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

### Automated Configuration Deployment and Assessment

#### Overview

Some of the Entra ID configurations can be automatically deployed using Microsoft 365 Desired State Configuration (DSC).

Some of the Entra ID configurations cannot be assessed using a DSC blueprint. Please refer to those configuration pages to conduct a manual assessment.

| Configuration                 | Blueprint automation provided |
| ----------------------------- | ----------------------------- |
| **Properties**                | No                            |
| **Users**                     | No                            |
| **Groups**                    |                               |
| - General                     | No                            |
| - Expiration                  | Yes (DSC)                     |
| - Naming Policy               | No                            |
| **Devices**                   | No                            |
| **Applications**              | No                            |
| **Protection**                |                               |
| - Identity Protection         | No                            |
| - Conditional Access Policies | Yes (DSC)<sup>1,2,3,4,5</sup> |
| - Named Locations             | Yes (DSC)<sup>6</sup>         |
| - Authentication Contexts     | Yes (DSC)                     |
| - Authentication Strengths    | No<sup>7</sup>                |
| - Authentication Methods      | No                            |
| - Password Reset              | No                            |
| - Risky Activities            | No                            |
| **Identity Governance**       | No                            |
| **External Identities**       | Yes (DSC)                     |

1: All Conditional Access policies are set to report only when using the DSC Blueprint provided and will need to be enabled manually.

2: Conditional Access policies created via DSC will use a single security group as a placeholder for policy-specific exclude groups. A placeholder group *must* be created manually before performing a DSC import. You will be prompted for the name of a placeholder group when importing the DSC Blueprint.

3: A security group containing all privileged users must be created manually before performing a DSC import. You will be promoted for the name of a security group when importing the DSC Blueprint.

4: A Conditional Access *terms of use* policy must be created manually before performing a DSC import. You will be promoted for the name of a terms of use policy when importing the DSC Blueprint.

5: The Microsoft Intune Enrolment app used in the [DEV - G - Intune enrolment with strong auth]({{<ref "protection/conditional-access/policies/intune-enrolment">}}) policy is not created by default in new tenants, see the [require multifactor authentication for Intune device enrollments](https://learn.microsoft.com/en-us/mem/intune/enrollment/multi-factor-authentication#configure-intune-to-require-multifactor-authentication-at-device-enrollment) page for instructions to create it before performing a DSC import.

6: Named Location IP addresses must be set manually. Refer to [Named Locations]({{<ref "protection/conditional-access/named-locations">}}) for configuration guidance.

7: The [Phishing-resistant MFA and TAP]({{<ref "protection/conditional-access/authentication-strengths">}}) authentication strength must be created manually before performing a DSC import.

#### Desired State Configuration

Before using the below DSC file, please refer to the [automated deployment]({{<ref "tools/deployment-and-assessment/automated-deployment">}}) page for instructions.

{{% alert title="Warning" color="danger" %}}

Any existing settings in a tenancy that match the name or UID of any settings in the DSC will be overwritten.

{{% /alert %}}

| Desired State Configuration file:                                                                                                                                      |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Download {{% download file="/content/files/automation/dsc/asdbpsc-dsc-entra.txt" %}} Entra ID DSC {{% /download %}} <br>*The linked .txt file must be renamed to .ps1* |
| **Configuration Data File:**                                                                                                                                           |
| The configuration data file can be found on the [DSC setup]({{<ref "tools/deployment-and-assessment/desired-state-configuration-setup">}}) page.                       |

{{% alert title="Extra Parameters" color="info"%}}

The downloaded DSC file requires the following parameters to be populated or you will be prompted for on import:

| Parameter name     | Contents                                                                                        |
| ------------------ | ----------------------------------------------------------------------------------------------- |
| ConditionalExclude | Name of an existing security group to be used as a placeholder for Conditional Access exclusion |
| PrivUsers          | Name of an existing security group containing all privileged users                              |
| TermsOfUse         | Name of the terms of use policy used by the organisation                                        |

{{% /alert %}}

##### Service principal permissions

For organisations importing the DSC as per the instructions on the [automated deployment]({{<ref "tools/deployment-and-assessment/automated-deployment">}}) page, the following permissions will need to be added to the M365DSC app:

```powershell
"AADAdministrativeUnit", "AADAuthenticationContextClassReference", "AADAuthorizationPolicy", "AADConditionalAccessPolicy", "AADCrossTenantAccessPolicyConfigurationDefault", "AADCrossTenantAccessPolicyConfigurationPartner", "AADEntitlementManagementAccessPackage", "AADEntitlementManagementAccessPackageAssignmentPolicy", "AADEntitlementManagementAccessPackageCatalog", "AADEntitlementManagementAccessPackageCatalogResource", "AADEntitlementManagementConnectedOrganization", "AADExternalIdentityPolicy", "AADGroupLifecyclePolicy", "AADNamedLocationPolicy", "AADSocialIdentityProvider", "AADTokenLifetimePolicy"
```
