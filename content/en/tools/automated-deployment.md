--- 
title: Automated Deployment
weight: 10
description: 
---
### Overview

Files and instructions for the automated deployment of Blueprint configurations are provided per-service on each of the corresponding Configuration pages. Please refer to the relevant Configuration page for each service for more detailed guidance on automated deployment.

{{% alert title="Instruction" color="dark" %}}

Implementation of the Blueprint, including automated deployment, will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

When using automated configuration files, organisations should note they will configure the relevant settings in a Microsoft 365 tenancy exactly as outlined in the Configuration pages of the Blueprint. Organisations should ensure they customise configuration of their Microsoft 365 tenancies in accordance with their own design decisions and requirements, deviating from the Blueprint (including automated configuration files) where appropriate.

{{% /alert %}}

| Service                                                           | Deployment Mechanism(s)       | Deployment coverage |
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

### Deployment Mechanisms

#### Microsoft 365 Desired State Configuration (M365DSC)

M365DSC is a configuration as code tool developed by Microsoft to automate the configuration of Microsoft 365 tenancies. It is the primary tool used to automate the deployment of the configuration guidance in the Blueprint.

{{% alert title="Warning" color="danger" %}}
Any existing settings in a tenancy that match the Name or UID of any settings in the DSC will be overwritten.
{{% /alert %}}

##### Prerequisites

To deploy Microsoft365DSC configuration, the following prerequisites are required:

- Microsoft365DSC PowerShell Module with dependencies installed. Instructions can be found [here](https://microsoft365dsc.com/user-guide/get-started/how-to-install/).
- Powershell 5.1 with WinRM set up. Refer to [WinRM Setup](https://learn.microsoft.com/en-us/windows/win32/winrm/installation-and-configuration-for-windows-remote-management)
- Understanding of PowerShell Desired State Configuration and Microsoft 365 Administration. Refer to [Microsoft365DSC Prerequisites](https://microsoft365dsc.com/user-guide/get-started/prerequisites/)
- DSC File for the targeted M365 service.
- A Configuration Data file. This file must be placed in the same directory as the DSC file.

| Configuration Data File                                                                                                                                                                 |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| {{% download file="/content/files/automation/dsc/ConfigurationData.txt" %}} Configuration Data {{% /download %}} (.psd1) <br> *Note: download the linked .txt file and rename to .psd1* |
| **DSC File**                                                                                                                                                                            |
| The DSC files are located in the top level configuration pages of each service as linked in the table above.                                                                            |

To deploy the configuration in each of the DSC files, the relevant .ps1 file must first be converted to a Managed Object Format (MOF) file. Before doing this, a service principal must be set up for M365DSC to use.

##### Creating the service principal

M365DSC provides a command to automate the creation of a service principal. Before this command can be used, the following components are required:

- Credentials of an existing account on the tenancy with the permissions to create a service principal and grant admin consent to the required API permissions.

```powershell
$creds = Get-Credential # Credentials of existing account

Update-M365DSCAzureAdApplication -ApplicationName 'M365DSC' -Type Certificate -CreateSelfSignedCertificate -CertificatePath .\M365DSC.cer -Permissions @( @{Api='Graph';PermissionName='Organization.Read.All'} ) -Credential $creds
```

This will create the service principal with a basic read permission along with a certificate to be used for authentication. The certificate with the private key will be stored in the current user's personal certifcate store. In order for powershell DSC to use this certificate, it must be imported with the private key into the local machine's personal certificate store.

##### Determine required permissions

The service principal will require specific Microsoft API permissions to access and update the exisitng tenancy configuration. A list of required permissions can be generated with the following powershell command

```powershell
Get-M365DSCCompiledPermissionList -ResourceNameList [List of components to be modified] -PermissionType Application -AccessType Update
```

A list of components can easily be generated using the [M365DSC Export Web UI](https://export.microsoft365dsc.com/). Before the service principal can be used, admin consent must be granted for the API permissions requested. Refer to [Microsoft app-only access guidance](https://learn.microsoft.com/en-us/entra/identity-platform/app-only-access-primer).

More information on permissions can be found on the [M365DSC Authentication and Permissions](https://microsoft365dsc.com/user-guide/get-started/authentication-and-permissions/) page.

{{% alert title="Note" color="warning" %}}
The Exchange Administrator Entra role must be given to the service principal if Exchange is the intended DSC target.
{{% /alert %}}

##### Updating the Configuration Data

The ```NonNodeData``` section of the ConfigurationData.psd1 file must be populated with the relevant details.

##### Deploying the Configuration

To convert the DSC file into a MOF file, run the .ps1 file in an elevated PowerShell window.

Once the MOF has been generated, run the following command to deploy the configuration.

```powershell
Start-DSCConfiguration -Path [Path to folder where MOF is located] -Wait -Verbose -Force
```

M365DSC will then deploy the configuration to the tenancy. This may take some time.

After the configuration has finished deploying, run the following commands to stop the M365DSC process.

```powershell
Stop-DSCConfiguration -Force
Remove-DSCConfigurationDocument -Stage Current
```

This will stop M365DSC from monitoring for configuration drift.

##### Troubleshooting

###### Version of M365DSC specified in DSC file is outdated

In the DSC file, change the version parameter in the ```Import-DscResource``` command to the version currently installed.

###### Errors during DSC deployment and/or missing settings

If any settings fail to deploy automatically via Microsoft365DSC then they will require manual configuration.

If significant or reoccurring errors are encountered, please feel free to contact us using the details in the banner at the foot of this page.

### Related Information

#### Security & Governance

- None identified

#### Design

- None identified

#### Configuration

- [Entra ID]({{<ref "/configuration/entra-id">}})
- [Microsoft 365]({{<ref "/configuration/microsoft-365">}})
- [Microsoft Intune]({{<ref "/configuration/intune">}})
- [Microsoft Defender]({{<ref "/configuration/defender">}})
- [Microsoft Purview]({{<ref "/configuration/purview">}})
- [Exchange Online]({{<ref "/configuration/exchange-online">}})
- [SharePoint Online]({{<ref "/configuration/sharepoint-online">}})
- [Microsoft Teams]({{<ref "/configuration/microsoft-teams">}})
- [Power Platform]({{<ref "/configuration/power-platform">}})

#### References

- [Microsoft 365 Desired State Configuration](https://microsoft365dsc.com/user-guide/get-started/how-to-install/)
- [WinRM Setup](https://learn.microsoft.com/en-us/windows/win32/winrm/installation-and-configuration-for-windows-remote-management)
- [Microsoft365DSC Prerequisites](https://microsoft365dsc.com/user-guide/get-started/prerequisites/)
- [Microsoft app-only access guidance](https://learn.microsoft.com/en-us/entra/identity-platform/app-only-access-primer)
- [M365DSC Authentication and Permissions](https://microsoft365dsc.com/user-guide/get-started/authentication-and-permissions/)
