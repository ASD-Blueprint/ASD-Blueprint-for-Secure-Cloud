---
title: "Rules"
linkTitle: "Rules"
weight: 30
description: "This section describes the configuration of remote connectors within Exchange Online associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Exchange admin portal at the following URL:

<https://admin.exchange.microsoft.com/#/transportrules>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Rule conditions

| Item                          | Value                                                   |
|-------------------------------|--------------------------------------------------------:|
| Name                          | Require TLS for sensitive items                         |
| **Apply this rule if**        |                                                         |
| - The recipient               | is external/internal                                    |
| - The recipient is located    | Outside the organisation                                |
| **And**                       |                                                         |
| - The message headers...      | includes any of these words                             |
| - Header Name                 | msip_labels                                             |
| - Words or phrases            | *All OFFICIAL Sensitive GUIDs*<br>*All PROTECTED GUIDs* |
| **Do the following**          |                                                         |
| - Modify the message security | Require TLS encryption                                  |

### Rule settings

| Item                            | Value                   |
|---------------------------------|-------------------------|
| Priority                        | 0                       |
| Rule mode                       | Enforce                 |
| Severity                        | <Organisation decision> |
| Match sender address in message | Header                  |

{{% alert title="Note" color="info" %}}

To obtain a list of all sensitivity label GUIDs for the above rule, organisations can use the [Security & Compliance PowerShell](https://learn.microsoft.com/powershell/exchange/connect-to-scc-powershell?view=exchange-ps). The following command will publish the label name and its associated GUID.

```powershell
Get-label | Select displayname,guid
```

{{% /alert %}}

### Related information

#### Security & Governance

* None identified
  
#### Design

* [Policy Filtering]({{<ref "design/shared-services/defender/policy-filtering.md">}})
* [Microsoft 365 Connectivity]({{<ref "design/shared-services/microsoft-365/microsoft365-connectivity.md">}})
  
#### Configuration

* None identified

#### References

* [Security & Compliance PowerShell](https://learn.microsoft.com/powershell/exchange/connect-to-scc-powershell?view=exchange-ps)
