---
title: "SharePoint Online"
linkTitle: "SharePoint Online"
weight: 070
description: "This section describes the configuration of SharePoint associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the SharePoint admin portal at the following URL:

<https://`<TENANT-NAME>`-admin.sharepoint.com/>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

When using automated configuration files, organisations should note they will configure the relevant settings in a Microsoft 365 tenancy exactly as outlined in the Configuration pages of the Blueprint. Organisations should ensure they customise configuration of their Microsoft 365 tenancies in accordance with their own design decisions and requirements, deviating from the Blueprint (including automated configuration files) where appropriate.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Automated Configuration Deployment and Assessment

Some of the SharePoint Online configurations can be automatically deployed using Microsoft 365 Desired State Configuration (DSC).

Some of the Sharepoint Online configurations cannot be assessed using a DSC blueprint. Please refer to those configuration pages to conduct a manual assessment.

| Configuration | Blueprint automation provided |
| ------------- | ----------------------------- |
| **Policies**  | Yes                           |
| **Settings**  | Yes <sup>1</sup>              |

1: Only OneDrive settings can be automated.

#### Desired State Configuration

Before using the below DSC file, please refer to the [setup]({{<ref "tools/deployment-and-assessment/desired-state-configuration-setup">}}) and [automated deployment]({{<ref "tools/deployment-and-assessment/automated-deployment">}}) pages for instructions.

**Desired State Configuration file**<br>Download the {{% download file="/content/files/automation/dsc/asdbpsc-dsc-spo.txt" %}} Sharepoint DSC file {{% /download %}} and rename the linked .txt file to .ps1.

**Configuration data file**<br>Download the {{% download file="/content/files/automation/dsc/configuration-data.txt" %}} configuration data file {{% /download %}} and rename the linked .txt file to .psd1.

{{% alert title="Warning" color="danger" %}}

Any existing settings in a tenancy that match the name or UID of any settings in the DSC will be overwritten.

{{% /alert %}}

##### Service principal permissions

For organisations importing the DSC as per the instructions on the [automated deployment]({{<ref "tools/deployment-and-assessment/automated-deployment">}}) page, the following permissions will need to be added to the M365DSC app:

```powershell
"ODSettings", "SPOAccessControlSettings", "SPOBrowserIdleSignout", "SPOSearchManagedProperty", "SPOSearchResultSource", "SPOSharingSettings"
```
