---
title: "Audit policies"
linkTitle: "Audit policies"
weight: 010
description: "This section describes the configuration of audit policies within Microsoft Purview associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables configuration outlines the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Purview portal at the following URL:

<https://purview.microsoft.com/audit/auditpolicies>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

{{% alert title="Turn auditing on" color="info" %}}

Prior to configuring auditing policies, an additional one-time procedure is required to turn auditing on. Administrators can select the banner labelled "start recording user and admin activity" or follow the instructions for using PowerShell [here](https://learn.microsoft.com/en-au/purview/audit-log-enable-disable?tabs=microsoft-purview-portal#turn-on-auditing).

{{% /alert %}}

### Policies

| Item               |                                     Value |
| ------------------ | ----------------------------------------: |
| Policy name        |                          7 year audit log |
| Policy description | Retains all audit log records for 7 years |
| Record Type        | *Select none to include all record types* |
| Duration           |                                   7 years |
| Priority           |                                         1 |

### Related information

#### Security & Governance

- [Regular Backups]({{<ref "security-and-governance/essential-eight/regular-backups">}})

#### Design

- [Audit]({{<ref "design/shared-services/purview/audit">}})
- [Backup and Operational Management]({{<ref "design/platform/backup">}})
- [Retention policies]({{<ref "design/shared-services/purview/data-lifecycle-management">}})

#### Configuration

- None identified

#### References

- [Manage audit log retention policies](https://learn.microsoft.com/purview/audit-log-retention-policies)
