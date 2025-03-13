---
title: "Access reviews settings"
linkTitle: "Access reviews settings"
weight: 20
type: docs
description: "This page describes the configuration of access review settings within Microsoft Entra ID associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Entra admin portal at the following URL:

<https://entra.microsoft.com/#view/Microsoft_AAD_ERM/DashboardBlade/~/Settings>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Delegate who can create and manage access reviews

| Item                                                                            | Value |
| ------------------------------------------------------------------------------- | ----: |
| (Preview) Group owners can create and manage access reviews for groups they own |    No |

### Related information

#### Security & Governance

* [Essential Eight - Restrict Administrative Privileges]({{<ref "security-and-governance/essential-eight/restrict-administrative-privileges.md">}})
  
#### Design

* [Identity Governance]({{<ref "governance">}})
* [Conditional Access]({{< ref "design/platform/identity/conditional-access.md">}})
  
#### Configuration

* [Microsoft Intune - Profile Configurations]({{<ref "configuration/intune/devices/configuration-policies">}})

#### References

* None identified
  