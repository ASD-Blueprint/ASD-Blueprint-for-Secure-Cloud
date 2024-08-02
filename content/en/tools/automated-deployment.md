--- 
title: "Automated Deployment"
linkTitle: "Automated Deployment"
weight: 10
description: 
---
### Overview

Files and instructions for the automated deployment of Blueprint configurations are provided per-service on each of the corresponding Configuration pages. Please refer to the relevant Configuration page for each service for more detailed guidance on automated deployment.

{{% alert title="Instruction" color="dark" %}}

Implementation of the Blueprint, including automated deployment, will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

When using automated configuration files, organisations should note they will configure the relevant settings in a Microsoft 365 tenancy exactly as outlined in the Configuration pages of the Blueprint. Organisations should ensure they customise configuration of their Microsoft 365 tenancies in accordance with their own design decisions and requirements, deviating from the Blueprint (including automated configuration files) where appropriate.

{{% /alert %}}

### Deployment Mechanism

#### Microsoft 365 Desired State Configuration (DSC)

Microsoft 365 DSC (M365DSC) is a configuration-as-code tool developed by Microsoft to automate the configuration of Microsoft 365 services. It is the primary tool used to automate the deployment of the configuration guidance in the Blueprint.

{{% alert title="Warning" color="danger" %}}
Any existing settings in a service that match the Name or UID of any settings in the DSC will be overwritten.
{{% /alert %}}

##### Prerequisites

To deploy a M365DSC configuration, the following prerequisites are required:

- Knowledge of the [M365DSC prerequisites](https://microsoft365dsc.com/user-guide/get-started/prerequisites/).
- A Windows host with connectivity to Entra ID and Microsoft 365, and with:
  - Powershell 5.1 or 7.3+ with the M365DSC module and dependencies installed. Instructions can be found [here](https://microsoft365dsc.com/user-guide/get-started/how-to-install/).
  - The WinRM service configured and running. Instructions can be found [here](https://learn.microsoft.com/en-us/windows/win32/winrm/installation-and-configuration-for-windows-remote-management/).
- The DSC file for the targeted M365 service (discussed below).
- The DSC configuration data file (discussed below).

##### 1. Copy the DSC files

- On the Windows host used for deployment, copy the DSC file for the targeted M365 service to a folder of your choosing:

| Service                                                           | Deployment Mechanism          | Deployment coverage |
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
Additional instructions for using DSC may be provided in the above-linked pages.
{{% /alert %}}

##### 2. Create certificates and keys for authentication

- Execute the following commands in an elevated PowerShell prompt to create a PFX file for authentication:

```powershell
$certname = "M365DSC"
$cert = New-SelfSignedCertificate -Subject "CN=$certname" -CertStoreLocation "Cert:\CurrentUser\My" -KeyExportPolicy Exportable -KeySpec Signature -KeyLength 2048 -KeyAlgorithm RSA -HashAlgorithm SHA256
$password = ConvertTo-SecureString -String "<password>" -Force -AsPlainText # Substitute <password>
Export-PfxCertificate -Cert $cert -FilePath "C:\<location>\M365DSC.pfx" -Password $password # Substitute <location>
```

##### 3. Import the PFX file into the Local Computer certificate store

- Double-click the ```M365DSC.pfx``` file to begin the import wizard.
- Select Local Machine and accepting the defaults, follow the prompts to complete the wizard.

##### 4. Export the leaf certificate from the Local Computer certificate store

- Open the Local Computer certificate store (Start > Manage Computer certificates) and navigate to Personal\Certificates.
- Right-click the M365DSC certificate, then select All Tasks > Export to begin the export wizard.
- Accepting the defaults, follow the prompts to complete the wizard, specifying ```C:\<location>\M365DSC.cer``` as the file name. Substitute location with the name of your working folder.

##### 5. Create a service principal

- Authenticate to your Entra ID tenant with an account with permissions to create a service principal and grant the required admin consent to the app's permissions:

```powershell
$creds = Get-Credential
```

- Create the service principal, specifying the exported certificate to be used for authentication:

```powershell
Update-M365DSCAzureAdApplication -ApplicationName 'M365DSC' -Type Certificate -CertificatePath "C:\<location>\M365DSC.cer" -Permissions @( @{Api='Graph';PermissionName='Organization.Read.All'} ) -AdminConsent -Credential $creds # Substitute <location>
```

##### 6. Copy and edit the configuration data file

- Copy the configuration data file to the same location as the DSC file:

| Configuration data file                                                                                                                                                               |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| {{% download file="/content/files/automation/dsc/ConfigurationData.txt" %}} Configuration Data {{% /download %}} (.psd1)<br>*Note: download the linked .txt file and rename to .psd1* |

- Edit the configuration data file to suit:

```powershell
# Your Entra tenant ID
TenantId = "<GUID>"

# Your Entra primary domain name
OrganizationName = "<organisation>.onmicrosoft.com"

# The Application Id of your service principal
ApplicationId = "<GUID>"

# The Thumbprint of the certificate to authenticate with your service principal
# This can be found in the certificates and secrets section of your service principal or
#     in the the details tab of the exported CER file.
CertificateThumbprint = "<thumbprint hash>"
```

##### 7. Determine the required permissions for the targeted M365 service

The service principal will require administrative permissions to the targeted M365 service's APIs. The components specific to the Blueprint that require administrative permissions are listed on the targeted service's index page (where the service's DSC file was downloaded from).

- Update the service principal with the permissions required for the targeted M365 service. Substitute list of components with those of your targeted service:

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

##### 8. Compile the MOF file

- Execute the DSC script in an elevated PowerShell prompt to compile the MOF file. For example:

```powershell
PS C:\DSC> .\entradsc.ps1

    Directory: C:\DSC\M365TenantConfig


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----               #####                 108984 localhost.mof
```

This will create a folder named M365TenantConfig in which the MOF file will be placed.

##### 9. Deploy the configuration

- Execute the following command to deploy the configuration. Substitute MOF folder location for the full path of the M365TenantConfig folder:

```powershell
Start-DSCConfiguration -Path <MOF folder location> -Wait -Verbose -Force
```

- After the configuration has finished deploying, run the following commands to stop the M365DSC process:

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

If significant or reoccurring errors are encountered, please feel free to contact us using the details in the footer of this page.

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
- [WinRM setup](https://learn.microsoft.com/en-us/windows/win32/winrm/installation-and-configuration-for-windows-remote-management)
- [Microsoft365DSC prerequisites](https://microsoft365dsc.com/user-guide/get-started/prerequisites/)
- [Microsoft app-only access guidance](https://learn.microsoft.com/en-us/entra/identity-platform/app-only-access-primer)
- [M365DSC authentication and permissions](https://microsoft365dsc.com/user-guide/get-started/authentication-and-permissions/)
- [M365DSC export tool](https://export.microsoft365dsc.com/)
