---
title: "Audit and Logging"
weight: 60
description: "This section describes the design decisions associated with Audit and Logging Microsoft 365 security features for system(s) built using ASD's Blueprint for Secure Cloud."
---

Microsoft 365 Purview provides the ability to monitor and review user and administrator activities across the Office 365 applications from the past 180 days.

Audit logs are kept by default for 180 days but are configurable up to one year by default for E5 licensing.

When an event occurs for the respective application it will take anywhere from 30 minutes up to 24 hours before it can be viewed in the audit log search.

The Microsoft 365 Management Activity API enables third-party applications to consume audit logs from Office 365. If audit logging is disabled, third-party applications can still consume audit logs from the Microsoft 365 Management Activity API.

A list of Office 365 applications, their auditing capabilities and duration wait time once an event occurs.

| Application                                                      | User Activity | Admin Activity | Duration wait time |
| ---------------------------------------------------------------- | :-----------: | :------------: | ------------------ |
| Exchange Online                                                  |       x       |       x        | 30 minutes         |
| OneDrive for Business                                            |       x       |                | 30 minutes         |
| SharePoint Online                                                |       x       |       x        | 30 minutes         |
| Sway                                                             |       x       |       x        | 24 hours           |
| Power Bi                                                         |       x       |       x        | 30 minutes         |
| Workplace Analytics                                              |               |       x        | 30 minutes         |
| Dynamics 365                                                     |       x       |       x        | 24 hours           |
| Yammer                                                           |       x       |       x        | 24 hours           |
| Microsoft Power Apps                                             |       x       |       x        | 24 hours           |
| Microsoft Power Automate                                         |       x       |       x        | 24 hours           |
| Microsoft Stream                                                 |       x       |       x        | 30 minutes         |
| Microsoft Teams                                                  |       x       |       x        | 30 minutes         |
| Microsoft Forms                                                  |       x       |       x        | 30 minutes         |
| Entra ID                                                         |               |       x        | 24 hours           |
| eDiscovery activities in Office 365 Security & Compliance Center |       x       |       x        | 30 minutes         |

Audit logging is not enabled by default and must be turned on first within Microsoft Purview before user or administrator activities can be audited.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point        | Design Decision               | Justification                                                                                 |
| --------------------- | ----------------------------- | --------------------------------------------------------------------------------------------- |
| Unified Audit Logging | Enabled<br>One-year retention | To provide visibility into the actions being undertaken within the Microsoft 365 environment. |

{{% /alert %}}

{{% alert title="Note" color="info" %}}

Organisations implementing Microsoft 365 should review their alignment with ASD's [*Information Security Manual*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism) for logging and auditing. Where required organisations may need to implement long term logging storage such as that offered through [Microsoft Purview Premium](https://learn.microsoft.com/purview/audit-premium?view=o365-worldwide#long-term-retention-of-audit-logs) 

{{% /alert %}}

### Related information

#### Security & Governance

* [System Management]({{<ref "system-management.md">}})
* [System Monitoring]({{<ref "system-monitoring.md">}})
* [Application Control]({{<ref "security-and-governance/essential-eight/application-control.md">}})

#### Design

* [Audit and logging]({{<ref "design/shared-services/power-platform/audit-logging.md">}})

#### Configuration

* None identified

#### References

* [Set up Basic Audit in Microsoft 365](https://docs.microsoft.com/microsoft-365/compliance/set-up-basic-audit?view=o365-worldwide)
* [Microsoft Purview Audit (Premium)](https://learn.microsoft.com/purview/audit-premium?view=o365-worldwide)