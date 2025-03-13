---
title: "Microsoft Intune"
linkTitle: "Microsoft Intune"
weight: 030
description: "This section describes the configuration of Microsoft Intune associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Intune portal at the following URL:

<https://intune.microsoft.com>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

When using automated configuration files, organisations should note they will configure the relevant settings in a Microsoft 365 tenancy exactly as outlined in the Configuration pages of the Blueprint. Organisations should ensure they customise configuration of their Microsoft 365 tenancies in accordance with their own design decisions and requirements, deviating from the Blueprint (including automated configuration files) where appropriate.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Automated Configuration Deployment and Assessment

#### Overview

Some of the Intune configurations can be automatically deployed using Microsoft 365 Desired State Configuration (DSC).

Some of the Intune configurations cannot be assessed using a DSC blueprint. Please refer to those configuration pages to conduct a manual assessment.

| Configuration              | Blueprint automation provided |
| -------------------------- | ----------------------------- |
| **Devices**                |                               |
| - Configuration Policies   | Yes (DSC, JSON)<sup>1,2</sup> |
| - Compliance Policies      | Yes (DSC)                     |
| - Scripts                  | No                            |
| - Apple updates            | No                            |
| **Apps**                   | No                            |
| **Endpoint Security**      |                               |
| - Security Baselines       | No                            |
| - Attack Surface Reduction | Yes (DSC)                     |

1: The [ASD iOS Hardening and iOS Microsoft Enterprise SSO Plugin]({{<ref "configuration/intune/devices/configuration-policies/ios-microsoft-enterprise-sso-plugin">}}) configuration policy needs to be created manually.

2: The [ASD Windows Hardening Guidelines - User Rights Assignment]({{<ref "configuration/intune/devices/configuration-policies/asd-windows-hardening-guidelines-user-rights-management">}}) configuration policy needs to be created manually or or the corresponding JSON file imported.

#### Desired State Configuration

Before using the below DSC file, please refer to the [automated deployment]({{<ref "tools/deployment-and-assessment/automated-deployment">}}) page for instructions.

{{% alert title="Warning" color="danger" %}}

Any existing settings in a tenancy that match the name or UID of any settings in the DSC will be overwritten.

{{% /alert %}}

| Desired State Configuration file                                                                                                                                             |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Download {{% download file="/content/files/automation/dsc/asdbpsc-dsc-intune.txt" %}} Intune DSC {{% /download %}} (.ps1) <br>*The linked .txt file must be renamed to .ps1* |
| **Configuration Data File:**                                                                                                                                                 |
| The configuration data file can be found on the [DSC setup]({{<ref "tools/deployment-and-assessment/desired-state-configuration-setup">}}) page.                             |

##### Service principal permissions

For organisations importing the DSC as per the instructions on the [automated deployment]({{<ref "tools/deployment-and-assessment/automated-deployment">}}) page, the following permissions will need to be added to the M365DSC app:

```powershell
"IntuneAccountProtectionPolicy", "IntuneAppConfigurationPolicy", "IntuneApplicationControlPolicyWindows10", "IntuneAppProtectionPolicyAndroid", "IntuneAppProtectionPolicyiOS", "IntuneASRRulesPolicyWindows10", "IntuneAttackSurfaceReductionRulesPolicyWindows10ConfigManager", "IntuneDeviceCompliancePolicyAndroid", "IntuneDeviceCompliancePolicyAndroidDeviceOwner", "IntuneDeviceCompliancePolicyAndroidWorkProfile", "IntuneDeviceCompliancePolicyiOs", "IntuneDeviceCompliancePolicyMacOS", "IntuneDeviceCompliancePolicyWindows10", "IntuneDeviceConfigurationCustomPolicyWindows10", "IntuneDeviceConfigurationDefenderForEndpointOnboardingPolicyWindows10", "IntuneDeviceConfigurationDeliveryOptimizationPolicyWindows10", "IntuneDeviceConfigurationDomainJoinPolicyWindows10", "IntuneDeviceConfigurationEmailProfilePolicyWindows10", "IntuneDeviceConfigurationEndpointProtectionPolicyWindows10", "IntuneDeviceConfigurationFirmwareInterfacePolicyWindows10", "IntuneDeviceConfigurationHealthMonitoringConfigurationPolicyWindows10", "IntuneDeviceConfigurationIdentityProtectionPolicyWindows10", "IntuneDeviceConfigurationImportedPfxCertificatePolicyWindows10", "IntuneDeviceConfigurationKioskPolicyWindows10", "IntuneDeviceConfigurationNetworkBoundaryPolicyWindows10", "IntuneDeviceConfigurationPkcsCertificatePolicyWindows10", "IntuneDeviceConfigurationPolicyAndroidDeviceAdministrator", "IntuneDeviceConfigurationPolicyAndroidDeviceOwner", "IntuneDeviceConfigurationPolicyAndroidOpenSourceProject", "IntuneDeviceConfigurationPolicyAndroidWorkProfile", "IntuneDeviceConfigurationPolicyiOS", "IntuneDeviceConfigurationPolicyMacOS", "IntuneDeviceConfigurationPolicyWindows10", "IntuneDeviceConfigurationSCEPCertificatePolicyWindows10", "IntuneDeviceConfigurationSecureAssessmentPolicyWindows10", "IntuneDeviceConfigurationSharedMultiDevicePolicyWindows10", "IntuneDeviceConfigurationTrustedCertificatePolicyWindows10", "IntuneDeviceConfigurationVpnPolicyWindows10", "IntuneDeviceConfigurationWindowsTeamPolicyWindows10", "IntuneDeviceConfigurationWiredNetworkPolicyWindows10", "IntuneDeviceEnrollmentPlatformRestriction", "IntuneExploitProtectionPolicyWindows10SettingCatalog", "IntuneSettingCatalogASRRulesPolicyWindows10", "IntuneSettingCatalogCustomPolicyWindows10", "IntuneWiFiConfigurationPolicyAndroidDeviceAdministrator", "IntuneWifiConfigurationPolicyAndroidEnterpriseDeviceOwner", "IntuneWifiConfigurationPolicyAndroidEnterpriseWorkProfile", "IntuneWifiConfigurationPolicyAndroidForWork", "IntuneWifiConfigurationPolicyAndroidOpenSourceProject", "IntuneWifiConfigurationPolicyIOS", "IntuneWifiConfigurationPolicyMacOS", "IntuneWifiConfigurationPolicyWindows10", "IntuneWindowsInformationProtectionPolicyWindows10MdmEnrolled"
```

#### Importing JSON configurations

Some Intune configurations can be set by importing a configuration policy in JSON format via the Intune admin center. The specific [configuration policy]({{<ref "configuration/intune/devices/configuration-policies">}}) pages have instructions where applicable.
