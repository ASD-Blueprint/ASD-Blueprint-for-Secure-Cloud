--- 
title: "Automated deployment"
linkTitle: "Automated deployment"
weight: 20
description: "This page describes the use of Microsoft 365 Desired State Configuration (DSC) to deploy a Blueprint configuration."
---

{{% alert title="Instruction" color="dark" %}}

Implementation of the Blueprint, including automated deployment, will differ depending on an organisation’s operating context and culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

When using automated configuration files, organisations should note they will configure the relevant settings in a Microsoft 365 tenancy exactly as outlined in the configuration pages of the Blueprint. Organisations should ensure they customise configuration of their Microsoft 365 services in accordance with their own design decisions and requirements, deviating from the Blueprint configurations where appropriate.

{{% /alert %}}

### Overview

Microsoft 365 Desired State Configuration (M365DSC) is a configuration-as-code tool developed by Microsoft to automate the configuration of Microsoft 365 services. It is the primary tool used to automate the deployment of the configuration guidance in the Blueprint.

### Deployment steps

{{% alert title="Warning" color="danger" %}}

Any existing settings in a service that match the name or UID of any settings in the DSC will be overwritten.

{{% /alert %}}

#### 1. Complete the prerequisite tasks

A Windows host and additional configurations are required for the following steps, instructions for these are in the [DSC setup]({{<ref "tools/deployment-and-assessment/desired-state-configuration-setup">}}) page.

#### 2. Copy the DSC files

On the Windows host, download the DSC file for the targeted M365 service to your working folder:

| Service                                                          | Deployment coverage |
| ---------------------------------------------------------------- | ------------------- |
| [Entra ID]({{<ref "configuration/entra-id">}})                   | Partial             |
| [Microsoft 365]({{<ref "configuration/microsoft-365">}})         | None                |
| [Microsoft Intune]({{<ref "configuration/intune">}})             | Partial             |
| [Microsoft Defender]({{<ref "configuration/defender">}})         | Partial             |
| [Microsoft Purview]({{<ref "configuration/purview">}})           | Partial             |
| [Exchange Online]({{<ref "configuration/exchange-online">}})     | Partial             |
| [SharePoint Online]({{<ref "configuration/sharepoint-online">}}) | Partial             |
| [Microsoft Teams]({{<ref "configuration/microsoft-teams">}})     | Full                |
| [Power Platform]({{<ref "configuration/power-platform">}})       | None                |

{{% alert title="DSC instructions" color="info" %}}

Additional instructions for using DSC are provided in the above-linked pages.

{{% /alert %}}

#### 3. Update the DSC version in the DSC file

The DSC file requires the same versioning as the modules used for importing, update the `ModuleVersion` parameter for the `Import-DscResource` command in the DSC file with your DSC version.

The module version can be displayed with:

```powershell
Get-Module Microsoft365DSC -ListAvailable | select ModuleBase, Version
```

#### 4. Determine the required resource permissions for the targeted M365 service

The M365DSC service principal created during the initial setup will require administrative permissions to the targeted M365 service's APIs. The resources specific to the Blueprint that require administrative permissions are listed on the above-linked targeted service's configuration index configuration page, along with any specific instructions for using DSC to configure the service.

If significant time has passed since performing the initial setup, you may need to re-authenticate before proceeding. Authenticate to your Entra ID tenant with an account with permissions to update the M365DSC app's permissions:

```powershell
$creds = Get-Credential
```

On the Windows host used for deployment, in an elevated PowerShell prompt, update the app with the permissions required for the targeted M365 service, substituting the resource permissions required for your targeted service:

```powershell
Update-M365DSCAzureAdApplication -ApplicationName 'M365DSC' -Permissions $(Get-M365DSCCompiledPermissionList -ResourceNameList <resource permissions> -PermissionType Application -AccessType Update) -Credential $creds
```

{{% alert title="Grant admin consent" color="info" %}}

You will be required to manually grant admin consent to provide the M365DSC app with the required permissions which can be done in the Entra portal under the API permissions section.

There may also be a delay in updating the permissions via Powershell and having them appear in the portal.

{{% /alert %}}

#### 5. Compile the MOF file

Execute the DSC script to compile a MOF file, for example:

```powershell
PS C:\DSC> .\entradsc.ps1

    Directory: C:\DSC\M365TenantConfig

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----               #####                 108984 localhost.mof
```

This will create a folder named *M365TenantConfig* in which the MOF file will be placed.

#### 6. Deploy the configuration

Execute the following command to deploy the configuration to the targeted M365 service, substituting the full path of the M365TenantConfig folder:

```powershell
Start-DSCConfiguration -Path <M365TenantConfig folder> -Wait -Verbose -Force
```

After the configuration has finished deploying, execute the following commands to stop the M365DSC process:

```powershell
Stop-DSCConfiguration -Force
Remove-DSCConfigurationDocument -Stage Current
```

This will stop M365DSC from monitoring for configuration drift.

##### 7. Remove permissions

Remove all app permissions, and any service principal role assignments or other service-specific permissions, after DSC operations.

### Troubleshooting

If any settings fail to deploy automatically then they will require manual configuration.

If significant or reoccurring errors are encountered, please feel free to contact us using the details in the footer of this page.

### Related information

#### Configuration

* [Microsoft Defender]({{<ref "configuration/defender">}})
* [Microsoft Entra ID]({{<ref "configuration/entra-id">}})
* [Microsoft Exchange Online]({{<ref "configuration/exchange-online">}})
* [Microsoft Intune]({{<ref "configuration/intune">}})
* [Microsoft Purview]({{<ref "configuration/purview">}})
* [Microsoft SharePoint Online]({{<ref "configuration/sharepoint-online">}})
* [Microsoft Teams]({{<ref "configuration/microsoft-teams">}})

#### Tools

* [Configuration assessment]({{<ref "tools/deployment-and-assessment/configuration-assessment">}})
* [Desired State Configuration setup]({{<ref "tools/deployment-and-assessment/desired-state-configuration-setup">}})

#### References

* [M365DSC authentication and permissions](https://microsoft365dsc.com/user-guide/get-started/authentication-and-permissions)
* [M365DSC blueprints](https://microsoft365dsc.com/user-guide/advanced/create-blueprint)
* [M365DSC export tool](https://export.microsoft365dsc.com)
* [M365DSC prerequisites](https://microsoft365dsc.com/user-guide/get-started/prerequisites)
* [M365DSC user guide](https://microsoft365dsc.com/user-guide/get-started/how-to-install)
* [Understanding application-only access](https://learn.microsoft.com/en-us/entra/identity-platform/app-only-access-primer)
* [WinRM setup](https://learn.microsoft.com/en-us/windows/win32/winrm/installation-and-configuration-for-windows-remote-management)
