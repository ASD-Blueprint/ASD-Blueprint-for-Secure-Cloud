--- 
title: "Automated deployment"
linkTitle: "Automated deployment"
weight: 20
description: "This page describes the use of Microsoft 365 Desired State Configuration to deploy a Blueprint configuration."
---

{{% alert title="Instruction" color="dark" %}}

Implementation of the Blueprint, including automated deployment, will differ depending on an organisation’s operating context and culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

When using automated configuration files, organisations should note they will configure the relevant settings in a Microsoft 365 tenancy exactly as outlined in the Configuration pages of the Blueprint. Organisations should ensure they customise configuration of their Microsoft 365 services in accordance with their own design decisions and requirements, deviating from the Blueprint configurations where appropriate.

{{% /alert %}}

### Overview

Microsoft 365 DSC (M365DSC) is a configuration-as-code tool developed by Microsoft to automate the configuration of Microsoft 365 services. It is the primary tool used to automate the deployment of the configuration guidance in the Blueprint.

### Deployment steps

{{% alert title="Warning" color="danger" %}}

Any existing settings in a service that match the Name or UID of any settings in the DSC will be overwritten.

{{% /alert %}}

#### 1. Complete the prerequisite tasks

- A Windows host and specific credentials are required to use DSC, instructions on setting these up are in the [DSC setup]({{<ref "tools/desired-state-configuration-setup">}}) page.

#### 2. Determine the required permissions for the targeted M365 service

The service principal used to deploy DSC will require administrative permissions to the targeted M365 service's APIs. The components specific to the Blueprint that require administrative permissions are listed on the targeted service's [configuration index page](#configuration), along with any specific instructions for using DSC to configure the service.

- On the Windows host used for deployment, update the service principal with the permissions required for the targeted M365 service. Substitute `<list of components>` with those of your targeted service:

```powershell
Update-M365DSCAzureAdApplication -ApplicationName 'M365DSC' -Permissions $(Get-M365DSCCompiledPermissionList -ResourceNameList <list of components> -PermissionType Application -AccessType Update) -AdminConsent -Credential $creds
```

{{% alert title="Grant admin consent" color="info" %}}

You may be required to manually grant admin consent which can be done in the Azure portal under the API permissions section of the service principal.
There may also be a delay in updating the permissions via Powershell and having them appear in the portal.

{{% /alert %}}

{{% alert title="Remove permissions" color="warning" %}}

Service principal permissions should always be removed after DSC operations.

{{% /alert %}}

#### 3. Copy the DSC files

- Copy the DSC file for the targeted M365 service to your working folder:

| Service                                                           | Deployment mechanism          | Deployment coverage |
| ----------------------------------------------------------------- | ----------------------------- | ------------------- |
| [Entra ID]({{<ref "/configuration/entra-id">}})                   | - Desired State Configuration | Partial             |
| [Microsoft 365]({{<ref "/configuration/microsoft-365">}})         | - N/A                         | None                |
| [Microsoft Intune]({{<ref "/configuration/intune">}})             | - Desired State Configuration | Partial             |
| [Microsoft Defender]({{<ref "/configuration/defender">}})         | - Desired State Configuration | Partial             |
| [Microsoft Purview]({{<ref "/configuration/purview">}})           | - Desired State Configuration | Partial             |
| [Exchange Online]({{<ref "/configuration/exchange-online">}})     | - Desired State Configuration | Partial             |
| [SharePoint Online]({{<ref "/configuration/sharepoint-online">}}) | - Desired State Configuration | Partial             |
| [Microsoft Teams]({{<ref "/configuration/microsoft-teams">}})     | - Desired State Configuration | Full                |
| [Power Platform]({{<ref "/configuration/power-platform">}})       | - N/A                         | None                |

{{% alert title="DSC instructions" color="info" %}}

Additional instructions for using DSC are provided in the above-linked pages.

{{% /alert %}}

#### 4. Compile the MOF file

- Execute the DSC script in an elevated PowerShell prompt to compile the MOF file. For example:

```powershell
PS C:\DSC> .\entradsc.ps1

    Directory: C:\DSC\M365TenantConfig

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----               #####                 108984 localhost.mof
```

This will create a folder named M365TenantConfig in which the MOF file will be placed.

#### 5. Deploy the configuration

- Execute the following command to deploy the configuration. Substitute `<MOF folder location>` for the full path of the M365TenantConfig folder:

```powershell
Start-DSCConfiguration -Path <MOF folder location> -Wait -Verbose -Force
```

- After the configuration has finished deploying, run the following commands to stop the M365DSC process:

```powershell
Stop-DSCConfiguration -Force
Remove-DSCConfigurationDocument -Stage Current
```

This will stop M365DSC from monitoring for configuration drift.

### Troubleshooting

#### Version of M365DSC specified in DSC file is outdated

In the DSC file, change the version parameter in the ```Import-DscResource``` command to the version currently installed.

#### Errors during DSC deployment and/or missing settings

If any settings fail to deploy automatically via Microsoft365DSC then they will require manual configuration.

If significant or reoccurring errors are encountered, please feel free to contact us using the details in the footer of this page.

### Related Information

#### Configuration

- [Entra ID]({{<ref "/configuration/entra-id">}})
- [Microsoft Intune]({{<ref "/configuration/intune">}})
- [Microsoft Defender]({{<ref "/configuration/defender">}})
- [Microsoft Purview]({{<ref "/configuration/purview">}})
- [Exchange Online]({{<ref "/configuration/exchange-online">}})
- [SharePoint Online]({{<ref "/configuration/sharepoint-online">}})
- [Microsoft Teams]({{<ref "/configuration/microsoft-teams">}})

#### Tooling

- [Automated assessment]({{<ref "/tools/configuration-assessment">}})
- [Desired State Configuration setup]({{<ref "/tools/desired-state-configuration-setup">}})

#### References

- [M365DSC user guide](https://microsoft365dsc.com/user-guide/get-started/how-to-install)
- [WinRM setup](https://learn.microsoft.com/en-us/windows/win32/winrm/installation-and-configuration-for-windows-remote-management)
- [M365DSC prerequisites](https://microsoft365dsc.com/user-guide/get-started/prerequisites)
- [Entra app-only access](https://learn.microsoft.com/en-us/entra/identity-platform/app-only-access-primer)
- [M365DSC authentication and permissions](https://microsoft365dsc.com/user-guide/get-started/authentication-and-permissions)
- [M365DSC export tool](https://export.microsoft365dsc.com)
