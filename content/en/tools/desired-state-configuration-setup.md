--- 
title: "Desired State Configuration setup"
linkTitle: "Desired State Configuration setup"
weight: 10
description: "This page describes the setup of Microsoft 365 Dynamic State Configuration"
---
### Overview

Microsoft 365 DSC (M365DSC) is a configuration-as-code tool developed by Microsoft to automate the configuration of Microsoft 365 services. It is the primary tool used to automate the deployment of the configuration guidance in the Blueprint.

After following the steps below, please refer to [Automated Deployment]({{<ref "tools/automated-deployment">}}) and [Automated Assessment]({{<ref "tools/configuration-assessment">}}) for further instructions.

#### Prerequisites

To deploy or assess an M365DSC configuration, the following prerequisites are required:

- Knowledge of the [M365DSC prerequisites](https://microsoft365dsc.com/user-guide/get-started/prerequisites/).
- A Windows host with connectivity to Entra ID and Microsoft 365, and with:
  - Powershell 5.1 or 7.3+ with the M365DSC module and dependencies installed. Instructions can be found [here](https://microsoft365dsc.com/user-guide/get-started/how-to-install/).
  - The WinRM service configured and running. Instructions can be found [here](https://learn.microsoft.com/en-us/windows/win32/winrm/installation-and-configuration-for-windows-remote-management/).
- The DSC file for the targeted M365 service (discussed below).
- The DSC configuration data file (discussed below).

#### 1. Create certificates and keys for authentication

- On the Windows host used for deployment, execute the following commands in an elevated PowerShell prompt to create a PFX file for authentication:

```powershell
$certname = "M365DSC"
$cert = New-SelfSignedCertificate -Subject "CN=$certname" -CertStoreLocation "Cert:\CurrentUser\My" -KeyExportPolicy Exportable -KeySpec Signature -KeyLength 2048 -KeyAlgorithm RSA -HashAlgorithm SHA256
$password = ConvertTo-SecureString -String "<password>" -Force -AsPlainText # Substitute <password>
Export-PfxCertificate -Cert $cert -FilePath "C:\<location>\M365DSC.pfx" -Password $password # Substitute <location>
```

#### 2. Import the PFX file into the Local Computer certificate store

- Double-click the ```M365DSC.pfx``` file to begin the import wizard.
- Select Local Machine and accepting the defaults, follow the prompts to complete the wizard.

#### 3. Export the leaf certificate from the Local Computer certificate store

- Open the Local Computer certificate store (Start > Manage Computer certificates) and navigate to Personal\Certificates.
- Right-click the M365DSC certificate, then select All Tasks > Export to begin the export wizard.
- Accepting the defaults, follow the prompts to complete the wizard, specifying ```C:\<location>\M365DSC.cer``` as the file name. Substitute `<location>` with the name of your working folder.

#### 4. Create a service principal

- Authenticate to your Entra ID tenant with an account with permissions to create a service principal and grant the required admin consent to the app's permissions:

```powershell
$creds = Get-Credential
```

- Create the service principal, specifying the exported certificate to be used for authentication:

```powershell
Update-M365DSCAzureAdApplication -ApplicationName 'M365DSC' -Type Certificate -CertificatePath "C:\<location>\M365DSC.cer" -Permissions @( @{Api='Graph';PermissionName='Organization.Read.All'} ) -AdminConsent -Credential $creds # Substitute <location>
```

#### 5. Copy and edit the configuration data file {#cdf}

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

# The Application ID of your service principal
ApplicationId = "<GUID>"

# The Thumbprint of the certificate to authenticate with your service principal
# This can be found in the certificates and secrets section of your service principal or
#     in the the details tab of the exported CER file.
CertificateThumbprint = "<thumbprint hash>"
```

Refer to the [automated deployment]({{<ref "/tools/automated-deployment">}}) or [automated assessment]({{<ref "/tools/configuration-assessment">}}) pages for further instructions.

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
- [Automated assessment]({{<ref "/tools/configuration-assessment">}})

#### References

- [M365DSC user guide](https://microsoft365dsc.com/user-guide/get-started/how-to-install)
- [WinRM setup](https://learn.microsoft.com/en-us/windows/win32/winrm/installation-and-configuration-for-windows-remote-management)
- [M365DSC prerequisites](https://microsoft365dsc.com/user-guide/get-started/prerequisites)
- [Entra app-only access](https://learn.microsoft.com/en-us/entra/identity-platform/app-only-access-primer)
- [M365DSC authentication and permissions](https://microsoft365dsc.com/user-guide/get-started/authentication-and-permissions)
- [M365DSC export tool](https://export.microsoft365dsc.com)
