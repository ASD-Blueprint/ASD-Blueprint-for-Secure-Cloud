---
title: "App launcher settings"
linkTitle: "App launcher settings"
weight: 10
description: "This page describes the configuration of app launcher settings within Microsoft Entra ID associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Entra admin portal at the following URL:

<https://entra.microsoft.com/#view/Microsoft_AAD_IAM/AppLaunchersBlade/~/Settings>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Microsoft 365 Settings

| Item                                                              | Value       |
| ----------------------------------------------------------------- | ----------: |
| Users can only see Microsoft 365 apps in the Microsoft 365 portal | Not checked |

### Related information

#### Security & Governance

* [Application Control]({{<ref "security-and-governance/essential-eight/application-control.md">}})
* [User Application Hardening]({{<ref "system-hardening-user-apps.md">}})
* [Essential Eight: Patch Applications]({{<ref "patch-applications.md">}})
* [System Monitoring]({{<ref "system-monitoring.md">}})
  
#### Design

* None identified
  
#### Configuration

* None identified

#### References

* [Application management documentation](https://learn.microsoft.com/entra/identity/enterprise-apps/)
  