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

### Automated Configuration Deployment

#### Overview

Some of the Exchange Online configurations can be automatically deployed using Microsoft 365 Desired State Configuration (DSC).

| Configuration     | Blueprint Automation Provided |
| ----------------- | ----------------------------- |
| **Mail Flow**     |                               |
| - Transport Rules | Yes (DSC)<sup>1</sup>         |
| - Remote Domains  | Yes (DSC)                     |
| - Connectors      | No                            |
| **Roles**         | Yes (DSC)                     |
| **Settings**      | No                            |

1: The words or phrases setting in the *Require TLS for sensitive items* rule must be configured manually. Refer to [Transport Rules]({{<ref "transport-rules">}}) for configuration guidance.

#### Desired State Configuration

Before using the below Microsoft 365 Desired State Configuration (DSC) file, please refer to [Automated Deployment]({{<ref "automated-deployment">}}) for instructions.

{{% alert title="Warning" color="danger" %}}
Any existing settings in a tenancy that match the Name or UID of any settings in the DSC will be overwritten.
{{% /alert %}}

| Desired State Configuration File                                                                                                                                                             |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Download {{% download file="/content/files/automation/dsc/asdbpsc-dsc-exo.txt"%}} Exchange Online DSC {{% /download %}} (.ps1) <br> *Note: download the linked .txt file and rename to .ps1* |
| **Configuration Data File:**                                                                                                                                                                 |
| The Configuration Data File can be found on the [Automated Deployment]({{<ref "automated-deployment">}}) page.                                                                               |

##### Service Principal permissions

To import the DSC as per the instructions on the [Automated Deployment]({{<ref "automated-deployment">}}) page, the following permissions will need to be added to the Service Principal:

```powershell
"EXOOwaMailboxPolicy", "EXORemoteDomain", "EXOTransportConfig", "EXOTransportRule"
```

{{% alert title="Note" color="warning" %}}
The Exchange Administrator role must be also given to the Service Principal if Exchange Online is the intended DSC target.
{{% /alert %}}
