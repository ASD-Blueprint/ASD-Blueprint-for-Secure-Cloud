---
title: "All identity providers"
linkTitle: "All identity providers"
weight: 10
type: docs
description: "This page describes the configuration of External Identities within Microsoft Entra ID associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Entra ID portal blade at the following URL: 

<https://entra.microsoft.com/#view/Microsoft_AAD_IAM/CompanyRelationshipsMenuBlade/~/IdentityProviders>

The settings described in these tables should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Configured identity providers

| Item     |                   Value |
| -------- | ----------------------: |
| Provider |      Microsoft Entra ID |
| Provider |       Microsoft Account |
| Provider | Email one-time passcode |

### Related information

#### Security & Governance

* [System Management]({{<ref "system-management.md">}})
* [System Monitoring]({{<ref "system-monitoring.md">}})
  
#### Design

* [External Identities]({{<ref "design/platform/identity/external-identities">}})
* [Conditional Access]({{<ref "design/platform/identity/conditional-access.md">}})
  
#### Configuration

* [Microsoft Intune - Profile Configurations]({{<ref "configuration/intune/devices/configuration-profiles">}})

#### References

* [External Identities](https://learn.microsoft.com/entra/external-id/index-b2b)