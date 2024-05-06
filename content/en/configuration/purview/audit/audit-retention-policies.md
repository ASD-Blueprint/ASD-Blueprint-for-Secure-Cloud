---
Title: Audit retention policies
weight: 010
description: "This section describes the configuration of audit retention policies within Microsoft Purview associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables configuration outlines the *as built* configuration for ASD's *Blueprint for Secure Cloud* for the Microsoft Purview portal blade at the following URL: 
 
https://compliance.microsoft.com/auditlogsearch?viewid=Retention
 
The settings described in these tables should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

{{% alert title="Note" color="info" %}}

The below configuration is an example. Organisations should review audit logging retention settings and implement a more granular set of policies as necessary to meet Information Security Manual (ISM) and organisational requirements.

{{% /alert %}}

| Item               |                                     Value |
| ------------------ | ----------------------------------------: |
| Policy name        |                          7 year audit log |
| Policy description | Retains all audit log records for 7 years |
| Record Type        |                                       All |
| Duration           |                                   7 years |
| Priority           |                                         1 |
| Enabled            |                                      True |

{{% alert title="Note" color="info" %}}

Whilst retention policies offer some protection against data loss and associated risks, they should not be used in place of an adequate backup solution.

{{% /alert %}}

### Related information

#### Security & Governance

* [Regular Backups]({{<ref "security-and-governance/essential-eight/regular-backups.md">}})

#### Design

* [Backup and Operational Management]({{<ref "design/platform/backup">}})
* [Retention policies]({{<ref "design/shared-services/purview/retention-policies.md">}})
* [Audit and logging]({{<ref "design/shared-services/defender/audit-and-logging.md">}})

#### Configuration

* [Retention policies]({{<ref "configuration/purview/data-lifecycle-management/retention-policies">}})

#### References

* [Manage audit log retention policies](https://learn.microsoft.com/purview/audit-log-retention-policies)
