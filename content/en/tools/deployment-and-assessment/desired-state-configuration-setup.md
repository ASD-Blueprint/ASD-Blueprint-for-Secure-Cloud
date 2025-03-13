--- 
title: "Desired State Configuration setup"
linkTitle: "Desired State Configuration setup"
weight: 10
description: "This page describes the setup of Microsoft 365 Dynamic State Configuration (DSC)"
---
### Overview

Microsoft 365 Desired State Configuration (M365DSC) is a configuration-as-code tool developed by Microsoft to automate the configuration of Microsoft 365 services. It is the primary tool used to automate the deployment of the configuration guidance in the Blueprint.

After following the steps below, please refer to the [automated deployment]({{<ref "tools/deployment-and-assessment/automated-deployment">}}) or [configuration assessment]({{<ref "tools/deployment-and-assessment/configuration-assessment">}}) pages for further instructions.

#### Prerequisites

To deploy or assess an M365DSC configuration, the following prerequisites are required:

* Knowledge of the [Microsoft M365DSC prerequisites](https://microsoft365dsc.com/user-guide/get-started/prerequisites/).
* An admin account on a Windows host with connectivity to Entra ID and Microsoft 365, and with:
  * Powershell 5.1 or 7.3+ with the M365DSC module and dependencies installed. Instructions can be found [here](https://microsoft365dsc.com/user-guide/get-started/how-to-install/).
  * The WinRM service configured and running. Instructions can be found [here](https://learn.microsoft.com/en-us/windows/win32/winrm/installation-and-configuration-for-windows-remote-management/).
* The DSC file for the targeted M365 service (discussed below).
* A DSC configuration data file from a [configuration index](#configuration) page.

#### 1. Create certificates and keys for authentication

On the Windows host used for deployment, execute the following commands in an elevated PowerShell prompt to create a PFX file that will be used for authentication, substituting a password of your choice and the location of your working folder:

```powershell
$certname = 'M365DSC'
$cert = New-SelfSignedCertificate -Subject "CN=$certname" -CertStoreLocation 'Cert:\CurrentUser\My' -KeyExportPolicy Exportable -KeySpec Signature -KeyLength 2048 -KeyAlgorithm RSA -HashAlgorithm SHA256
$password = ConvertTo-SecureString -String '<password>' -Force -AsPlainText
Export-PfxCertificate -Cert $cert -FilePath 'C:\<location>\M365DSC.pfx' -Password $password
```

#### 2. Import the PFX file into the Local Computer certificate store

* Double-click the ```M365DSC.pfx``` file to begin the import wizard.
* Select *Local Machine* and accepting the defaults, follow the prompts to complete the wizard.

#### 3. Export the leaf certificate from the Local Computer certificate store

* Open the Local Computer certificate store (*Start > Manage Computer certificates*) and navigate to *Personal\Certificates*.
* Right-click the M365DSC certificate, then select *All Tasks > Export* to begin the export wizard.
* Accepting the defaults, follow the prompts to complete the wizard, specifying ```C:\<location>\M365DSC.cer``` as the file name, substituting location with the name of your working folder.

#### 4. Register an app and service principal in Entra

Authenticate to your Entra tenant with an account with permissions to register an app and update the app's permissions:

```powershell
$creds = Get-Credential
```

Create the app, specifying the exported certificate to be used for authentication, substituting location with the name of your working folder:

```powershell
Update-M365DSCAzureAdApplication -ApplicationName 'M365DSC' -Type Certificate -CertificatePath 'C:\<location>\M365DSC.cer' -Permissions @( @{Api='Graph';PermissionName='Organization.Read.All'} ) -Credential $creds
```

{{% alert title="Grant admin consent" color="info" %}}

You will be required to manually grant admin consent to the app's permissions, this can be done in the Entra portal under the API permissions section of the M365DSC app. This process will also create a service principal named M365DSC.

There may also be a delay in updating the permissions via Powershell and having them appear in the portal.

{{% /alert %}}

{{% alert title="Remove permissions" color="warning" %}}

Permissions should always be removed after DSC operations.

{{% /alert %}}

#### 5. Download and edit the configuration data file {#cdf}

* Download the {{% download file="static/content/files/automation/dsc/configuration-data.txt"%}} configuration data {{% /download %}} file, renaming the linked .txt file to .psd1.
* Edit the configuration data file to suit, substituting your Entra tenant and M365DSC app configurations:

```powershell
# Your Entra tenant ID
TenantId = '<GUID>'

# Your Entra primary domain name
OrganizationName = '<organisation>.onmicrosoft.com'

# The Application ID of your app
ApplicationId = '<GUID>'

# The thumbprint of the certificate to authenticate your app
# This can be found in the certificates and secrets section of your app or in the the details tab of the exported CER file.
CertificateThumbprint = '<thumbprint hash>'
```

Refer to the [automated deployment]({{<ref "tools/deployment-and-assessment/automated-deployment">}}) or [configuration assessment]({{<ref "tools/deployment-and-assessment/configuration-assessment">}}) pages for further instructions.

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

* [Automated deployment]({{<ref "tools/deployment-and-assessment/automated-deployment">}})
* [Configuration assessment]({{<ref "tools/deployment-and-assessment/configuration-assessment">}})

#### References

* [M365DSC authentication and permissions](https://microsoft365dsc.com/user-guide/get-started/authentication-and-permissions)
* [M365DSC blueprints](https://microsoft365dsc.com/user-guide/advanced/create-blueprint)
* [M365DSC export tool](https://export.microsoft365dsc.com)
* [M365DSC prerequisites](https://microsoft365dsc.com/user-guide/get-started/prerequisites)
* [M365DSC user guide](https://microsoft365dsc.com/user-guide/get-started/how-to-install)
* [Understanding application-only access](https://learn.microsoft.com/en-us/entra/identity-platform/app-only-access-primer)
* [WinRM setup](https://learn.microsoft.com/en-us/windows/win32/winrm/installation-and-configuration-for-windows-remote-management)
