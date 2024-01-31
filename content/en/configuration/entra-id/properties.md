---
title: "Properties"
linkTitle: "Properties"
weight: 10
type: docs
description: "This page describes the configuration of properties within Microsoft Entra ID associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Entra ID portal blade at the following URL: 

https://entra.microsoft.com/#view/Microsoft_AAD_IAM/TenantOverview.ReactView
 
The settings described on these pages should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

| Item                                  |                           Value |
| ------------------------------------- | ------------------------------: |
| Name                                  |             *organisation name* |
| Country or region                     |                       Australia |
| Data location                         |           Australia datacenters |
| Notification language                 |                         English |
| Tenant ID                             |                                 |
| Technical contact                     |       *Technical contact email* |
| Global privacy contact                |         *Privacy contact email* |
| Privacy statement URL                 | *Privacy statement web address* |
| Access management for Azure resources |                              No |

### Related information

#### Security & Governance

* None identified

#### Design

* [Identity]({{<ref "design/platform/identity">}})
* [Identity security]({{<ref "identity-security">}})

#### Configuration

* None identified

#### References

* [Learn Entra](https://learn.microsoft.com/entra/)
