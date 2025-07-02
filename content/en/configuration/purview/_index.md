---
title: "Microsoft Purview"
linkTitle: "Microsoft Purview"
weight: 050
description: "This section describes the configuration of Microsoft Purview associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Purview portal at the following URL:

<https://purview.microsoft.com>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

When using automated configuration files, organisations should note they will configure the relevant settings in a Microsoft 365 tenancy exactly as outlined in the Configuration pages of the Blueprint. Organisations should ensure they customise configuration of their Microsoft 365 tenancies in accordance with their own design decisions and requirements, deviating from the Blueprint (including automated configuration files) where appropriate.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

{{% alert title="Purview regex" color="warning" %}}

Throughout the Purview configuration guidance there are regular expressions used to match Protective Security Policy Framework (PSPF) markings, these regular expressions do not cater for the concurrent use of multiple Information Management Markers (IMM). Organisations that use multiple IMMs in the same marking should create additional configurations to suit their specific use-cases.

{{% /alert %}}

### Automated configuration deployment and assessment

#### Overview

Some of the Purview configurations can be automatically deployed using Microsoft 365 Desired State Configuration (DSC).

Some of the Purview configurations cannot be assessed using a DSC blueprint. Please refer to those configuration pages to conduct a manual assessment.

| Configuration                 | Blueprint automation provided |
| ----------------------------- | ----------------------------- |
| **Purview settings**          | No                            |
| **Audit**                     | No                            |
| **Compliance Manager**        | No                            |
| **Data Lifecycle Management** | Yes (DSC)<sup>1,2</sup>       |
| **Data Loss Prevention**      | Yes (DSC)<sup>3,4</sup>       |
| **Information Protection**    |                               |
| - Sensitivity labels          | Yes (DSC)<sup>5</sup>         |
| - Publishing policies         | Yes (DSC)<sup>6</sup>         |
| - Auto labeling policies      | Yes (DSC)<sup>3,4</sup>       |
| - Sensitive info types        | No                            |

1: Retention policies are deployed by the DSC Blueprint in a disabled stated and must be manually enabled.

2: The *Teams private channel messages 7 year hold* policy must be created manually.

3: Policy rules must be configured manually.

4: Policies are deployed in simulation mode and must be manually enabled.

5: The following sensitivity label configurations must be set manually:

* *apply a label to channel meetings*, and
* *use Microsoft Entra Conditional Access to protect labeled SharePoint sites* [authentication context]({{<ref "configuration/entra-id/protection/conditional-access/authentication-contexts">}}) for each PROTECTED label.

6: The *users and groups* setting for the *users up to PROTECTED* policy must be set to the specific groups of users permitted access to PROTECTED information.

#### Desired State Configuration

Before using the below DSC file, please refer to the [setup]({{<ref "tools/deployment-and-assessment/desired-state-configuration-setup">}}) and [automated deployment]({{<ref "tools/deployment-and-assessment/automated-deployment">}}) pages for instructions.

Do not proceed with the automated deployment instructions until you've familiarised yourself with the [addition configuration](#additional-configuration) required below.

**Desired State Configuration file**<br>Download the {{% download file="/content/files/automation/dsc/asdbpsc-dsc-purview.txt" %}} Purview DSC file {{% /download %}} and rename the linked .txt file to .ps1.

**Configuration data file**<br>Download the {{% download file="/content/files/automation/dsc/configuration-data.txt" %}} configuration data file {{% /download %}} and rename the linked .txt file to .psd1.

{{% alert title="Extra parameters" color="info"%}}

The downloaded DSC file requires the following parameters to be populated or you will be prompted for them on import:

| Parameter name  | Contents                                                                                                                                                                                       |
| --------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| PROTECTEDUsers  | The email address of an existing email-enabled security group, distribution group, or Microsoft 365 group that has all users permitted to access PROTECTED information as members<sup>1</sup>  |
| PROTECTEDGuests | The email address of an existing email-enabled security group, distribution group, or Microsoft 365 group that has all guests permitted to access PROTECTED information as members<sup>1</sup> |
| PROTECTEDDomain | The name of an external organisation's domain<sup>2</sup> used for emailing PROTECTED information                                                                                              |

1: These groups must have the PROTECTED sensitivity label applied following the import of the DSC Blueprint. The same groups should also be set for the publishing policies mentioned in footnote 6 above.

2: Only one domain name is currently supported by DSC Blueprints, additional domain names must be configured manually.

{{% /alert %}}

{{% alert title="Warning" color="danger" %}}

Any existing settings in a tenancy that match the name or UID of any settings in the DSC will be overwritten.

{{% /alert %}}

##### Additional configuration

The following instructions replace *step 4 Determine the required permissions for the targeted M365 service*, on the [automated deployment]({{<ref "tools/deployment-and-assessment/automated-deployment">}}) page, and use configurations from the M365DSC app created during the initial setup:

1. On the Windows host used for deployment, in an elevated PowerShell prompt, install the Exchange Online PowerShell module if not already installed:

```powershell
Install-Module ExchangeOnlineManagement
```

2. Connect to Security & Compliance PowerShell with an account with permissions to configure roles:

```powershell
Connect-IPPSsession
```

3. Create a reference to the M365DSC service principal in Exchange Online, substituting the M365DSC app's app ID and object ID:

```powershell
New-ServicePrincipal -AppId '<App ID GUID>' -ObjectId '<Object ID GUID>' -DisplayName 'M365DSC'
```

4. Add the M365DSC service principal to the eDiscovery Manager role group, substituting the M365DSC app's object ID:

```powershell
Add-RoleGroupMember -Identity eDiscoveryManager -Member '<Object ID GUID>'
```

5. Add the M365DSC service principal to the list of eDiscovery Administrators, substituting the M365DSC app's object ID:

```powershell
Add-eDiscoveryCaseAdmin -User '<Object ID GUID>'
```

6. If significant time has passed since performing the initial setup, you may need to re-authenticate before proceeding. Authenticate to your Entra ID tenant with an account with permissions to update the M365DSC app's permissions:

```powershell
$creds = Get-Credential
```

7. Update the M365DSC app with the *Exchange ManageAsApp* permission, substituting location with the name of your working folder used in the DSC setup:

```powershell
Update-M365DSCAzureAdApplication -ApplicationName 'M365DSC' -Type Certificate -CertificatePath 'C:\<location>\M365DSC.cer' -Permissions @( @{Api='Exchange';PermissionName='Exchange.ManageAsApp'} ) -AdminConsent -Credential $creds
```

{{% alert title="Grant admin consent" color="info" %}}

You will be required to manually grant admin consent to provide the M365DSC app with the required permissions which can be done in the Entra portal under the API permissions section. The *Graph ReadAll* permission used in the DSC setup is not required and can be removed if prompted.

There may also be a delay in updating the permissions via Powershell and  them appearing in the Entra portal.

{{% /alert %}}

8. Assign the Entra, Compliance Administrator role to the M365DSC service principal.

9. A one-time procedure is required to enable sensitivity labels for containers and to synchronise labels to Entra ID. Instructions for this procedure can be found [here](https://learn.microsoft.com/en-au/purview/sensitivity-labels-teams-groups-sites#how-to-enable-sensitivity-labels-for-containers-and-synchronize-labels).

10. A one-time procedure is required to turn on auditing. Confirm the status of auditing in the [Purview portal](https://purview.microsoft.com/audit/auditpolicies) by checking for the presence of a banner labelled "start recording user and admin activity" - select the banner to enable auditing. If no banner is present, auditing is already enabled. Alternative instructions for using PowerShell can be found [here](https://learn.microsoft.com/en-au/purview/audit-log-enable-disable?tabs=microsoft-purview-portal#turn-on-auditing).
