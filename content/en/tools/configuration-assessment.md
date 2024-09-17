--- 
title: "Configuration assessment"
linkTitle: "Configuration assessment"
weight: 30
description: "This page describes methods used to assess configuration drift in a Microsoft 365 service."
---

{{% alert title="Instruction" color="dark" %}}

Implementation of the Blueprint, including automated assessment, will differ depending on an organisation’s operating context and culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

When using automated configuration files, organisations should note they will configure the relevant settings in a Microsoft 365 tenancy exactly as outlined in the Configuration pages of the Blueprint. Organisations should ensure they customise configuration of their Microsoft 365 services in accordance with their own design decisions and requirements, deviating from the Blueprint configurations where appropriate.

{{% /alert %}}

### Overview

Microsoft 365 Desired State Configuration (M365DSC) is a configuration-as-code tool developed by Microsoft to automate the configuration of Microsoft 365 services. M365DSC can also be used to undertake automated assessment of an M365 configuration in order to complement manual and other automated assessment tools.

Manual assessment of configurations should be the primary assessment method, or it should be used in conjunction with an automated tool to address any gaps in tool coverage and for validating assessment tool reports.

When comparing your targeted M365 service against the guidance in the Blueprint's [configuration]({{<ref "/configuration">}}) pages, consideration should be given to the reasons behind any deviations, and if the deviations are appropriate in the current context.

The mechanism described below will automatically assess approximately half of the Blueprint configurations, the remainder will require manual assessment.

#### Automated Microsoft 365 Desired State Configuration Assessment

M365DSC performs an assessment by comparing an M365 service’s configuration to a DSC *Blueprint*. A DSC *Blueprint* is a file with a .ps1 extension that includes a set of configuration / a configuration profile. By using the DSC files published in the Blueprint as the DSC *Blueprint* files, a user can perform an assessment of the configuration of an M365 service against the Blueprint.

While these DSC *Blueprints* can be extended to include complementary metadata to contextualise an assessment report (rather than linking directly to the relevant Blueprint Design Decision), this is not currently in scope.

##### 1. Complete the prerequisite tasks

- A Windows host and specific credentials are required to use DSC, instructions on setting these up are in the [DSC setup]({{<ref "tools/desired-state-configuration-setup">}}) page.

##### 2. Copy the DSC files

- On the Windows host used for assessment, copy the DSC file for the targeted M365 service to your working folder and rename it to have a *.M365* extension. The DSC file is a .ps1 file and can be found on each services page below:

| Service                                                           | Automated assessment mechanism | Automated assessment coverage |
| ----------------------------------------------------------------- | ------------------------------ | ----------------------------- |
| [Entra ID]({{<ref "/configuration/entra-id">}})                   | - Desired State Configuration  | Partial                       |
| [Microsoft 365]({{<ref "/configuration/microsoft-365">}})         | - N/A                          | None                          |
| [Microsoft Intune]({{<ref "/configuration/intune">}})             | - Desired State Configuration  | Partial                       |
| [Microsoft Defender]({{<ref "/configuration/defender">}})         | - Desired State Configuration  | Partial                       |
| [Microsoft Purview]({{<ref "/configuration/purview">}})           | - Desired State Configuration  | Partial                       |
| [Exchange Online]({{<ref "/configuration/exchange-online">}})     | - Desired State Configuration  | Partial                       |
| [SharePoint Online]({{<ref "/configuration/sharepoint-online">}}) | - Desired State Configuration  | Partial                       |
| [Microsoft Teams]({{<ref "/configuration/microsoft-teams">}})     | - Desired State Configuration  | Full                          |
| [Power Platform]({{<ref "/configuration/power-platform">}})       | - N/A                          | None                          |

{{% alert title="DSC instructions" color="info" %}}

Additional instructions for using DSC are provided in the above-linked pages.

{{% /alert %}}

##### 3. Assess the configuration

- Authenticate to your Entra ID tenant with an account with permissions to read the target M365 service's configurations:

```powershell
$creds = Get-Credential
```

- Execute the following command to assess the configuration, substituting the full file and folder paths:

```powershell
Assert-M365DSCBlueprint -BluePrintUrl <path to .M365 file> -OutputReportPath <path to HTML folder> -Credentials $creds
```

This will generate a HTML report comparing the targeted M365 service's configuration to the DSC *Blueprint* file.

###### 3a. Assess the configuration - alternative

It is also possible to execute the ```Assert-M365DSCBlueprint``` command using the credentials created during the DSC setup process. This can be useful if a less-interactive execution of an assessment is required, or when delegating execution of an assessment to another user.

With additional arguments, the parameters used in the [configuration data file]({{<ref "/tools/desired-state-configuration-setup#cdf">}}) can replace the ```-Credentials $creds``` part of the command:

- substitute `<organisation.onmicrosoft.com>` for the primary domain name of the tenant to assess
- substitute `<GUID>` for the application ID of the service principal used for assessment
- substitute `<thumbprint hash>` for the thumbprint of the certificate used to authenticate the service principal

```powershell
Assert-M365DSCBlueprint -BluePrintUrl <path to .M365 file> -OutputReportPath <path to HTML folder> -TenantId <organisation.onmicrosoft.com> -ApplicationId <GUID> -CertificateThumbprint <thumbprint hash>
```

##### 4. Manually assess configurations and evaluate deviations

- Verify the M365 service's configurations against the Blueprint's [configuration]({{<ref "/configuration">}}) pages, noting where the generated HTML provides assessment coverage.
- Evaluate configuration deviations and modify as required.

### Related information

#### Configuration

- [Entra ID]({{<ref "/configuration/entra-id">}})
- [Microsoft Intune]({{<ref "/configuration/intune">}})
- [Microsoft Defender]({{<ref "/configuration/defender">}})
- [Microsoft Purview]({{<ref "/configuration/purview">}})
- [Exchange Online]({{<ref "/configuration/exchange-online">}})
- [SharePoint Online]({{<ref "/configuration/sharepoint-online">}})
- [Microsoft Teams]({{<ref "/configuration/microsoft-teams">}})

#### Tools

- [Automated deployment]({{<ref "/tools/automated-deployment">}})
- [Desired State Configuration setup]({{<ref "/tools/desired-state-configuration-setup">}})

#### References

- [M365DSC Blueprints](https://microsoft365dsc.com/user-guide/advanced/create-blueprint)
- [M365DSC user guide](https://microsoft365dsc.com/user-guide/get-started/how-to-install)
- [WinRM setup](https://learn.microsoft.com/en-us/windows/win32/winrm/installation-and-configuration-for-windows-remote-management)
- [M365DSC prerequisites](https://microsoft365dsc.com/user-guide/get-started/prerequisites)
- [Entra app-only access](https://learn.microsoft.com/en-us/entra/identity-platform/app-only-access-primer)
- [M365DSC authentication and permissions](https://microsoft365dsc.com/user-guide/get-started/authentication-and-permissions)
- [M365DSC export tool](https://export.microsoft365dsc.com)
