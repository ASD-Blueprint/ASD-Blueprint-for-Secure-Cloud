---
title: "Exchange Online"
linkTitle: "Exchange Online"
weight: 060
description: "This section describes the configuration of Exchange Online associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Exchange admin portal at the following URL:

<https://admin.exchange.microsoft.com/>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

When using automated configuration files, organisations should note they will configure the relevant settings in a Microsoft 365 tenancy exactly as outlined in the Configuration pages of the Blueprint. Organisations should ensure they customise configuration of their Microsoft 365 tenancies in accordance with their own design decisions and requirements, deviating from the Blueprint (including automated configuration files) where appropriate.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Automated Configuration Deployment and Assessment

#### Overview

Some of the Exchange Online configurations can be automatically deployed using Microsoft 365 Desired State Configuration (DSC).

Some of the Exchange Online configurations cannot be assessed using a DSC blueprint. Please refer to those configuration pages to conduct a manual assessment.

| Configuration    | Blueprint automation provided |
| ---------------- | ----------------------------- |
| **Mail Flow**    |                               |
| - Rules          | Yes (DSC)<sup>1</sup>         |
| - Remote Domains | Yes (DSC)                     |
| - Connectors     | No                            |
| **Roles**        | Yes (DSC)                     |
| **Settings**     | No                            |

1: The words or phrases setting in the *Require TLS for sensitive items* rule must be configured manually. Refer to [Rules]({{<ref "mail-flow/rules">}}) for configuration guidance.

#### Desired State Configuration

Before using the below DSC file, please refer to the [setup]({{<ref "tools/deployment-and-assessment/desired-state-configuration-setup">}}) and [automated deployment]({{<ref "tools/deployment-and-assessment/automated-deployment">}}) pages for instructions.

Do not proceed with the automated deployment instructions until you've familiarised yourself with the [addition configuration](#additional-configuration) required below.

**Desired State Configuration file**<br>Download the {{% download file="/content/files/automation/dsc/asdbpsc-dsc-exo.txt" %}} Exchange DSC file {{% /download %}} and rename the linked .txt file to .ps1.

**Configuration data file**<br>Download the {{% download file="/content/files/automation/dsc/configuration-data.txt" %}} configuration data file {{% /download %}} and rename the linked .txt file to .psd1.

{{% alert title="Extra parameters" color="info"%}}

The downloaded DSC file requires the following parameters to be populated or you will be prompted for them on import:

| Parameter name           | Contents                                                                     |
| ------------------------ | ---------------------------------------------------------------------------- |
| JournallingReportMailbox | Name of an existing mailbox used for sending journalling reports<sup>1</sup> |

1: This parameter is only required to import DSC, related journalling configuration settings are not provided.

{{% /alert %}}

{{% alert title="Warning" color="danger" %}}

Any existing settings in a tenancy that match the name or UID of any settings in the DSC will be overwritten.

{{% /alert %}}

##### Service Principal permissions

For organisations importing the DSC as per the instructions on the [automated deployment]({{<ref "tools/deployment-and-assessment/automated-deployment">}}) page, the following permissions will need to be added to the Service Principal:

```powershell
"EXOOwaMailboxPolicy", "EXORemoteDomain", "EXOTransportConfig", "EXOTransportRule"
```

##### Additional configuration

The following instructions must be completed before *step 6 Deploy the configuration*, on the [automated deployment]({{<ref "tools/deployment-and-assessment/automated-deployment">}}) page:

* Assign the Entra, Exchange Administrator role to the M365DSC service principal.
