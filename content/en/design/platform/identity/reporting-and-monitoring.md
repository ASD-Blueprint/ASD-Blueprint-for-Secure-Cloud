---
title: Reporting and Monitoring
weight: 95
description: "This section describes the design decisions associated with reporting and monitoring of identities, sign ins and provisioning for system(s) built using ASD's Blueprint for Secure Cloud."
---

Reporting provides information on both:

1.  Activity:
    * **Sign ins** -- The sign ins report provides information about the usage of managed applications and user sign in activities.
    * **Audit logs** - Provides traceability through logs for all changes done by various features within Entra ID. Examples of audit logs include changes made to any resources within Entra ID like adding or removing users, apps, groups, roles and policies.

2.  Security:

    * **Risky sign ins** - A risky sign in is an indicator for a sign in attempt that might have been performed by someone who is not the legitimate owner of a user account.
    * **Users flagged for risk** - A risky user is an indicator for a user account that might have been compromised.

Users in the Security Administrator, Security Reader, Report Reader, Global Reader or Global Administrator roles are able to access these reports.

Monitoring routes activity logs to different endpoints:

* An Azure storage account.
* An Azure event hub, so the system can be integrated with Splunk and Sumologic instances.
* Azure Log Analytics workspace, wherein the data can be analysed, dashboards created, and alerts configured for specific events.
    This is used to retain them for long-term use and integrate it with the Security Information and Event Management (SIEM) tool - [Azure Sentinel](https://learn.microsoft.com/azure/sentinel/overview) - to gain insights into the environment.

Workbooks provide several pre-built reports related to common scenarios involving audit, sign in, and provisioning events. Alerts can also be configured on any of the data provided in the reports, using the steps described in the previous section.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point | Design Decision                                             | Justification                                                      |
| -------------- | ----------------------------------------------------------- | ------------------------------------------------------------------ |
| Log Routing    | Azure Monitor Logs (Log Analytics Workspace) - law-sentinel | Archive and audit solution downstream from log analytics workspace |

{{% /alert %}}

### Related information

#### Security & Governance

* [System Monitoring]({{<ref "system-monitoring.md">}})
* [Essential Eight: Multi-factor Authentication]({{<ref "security-and-governance/essential-eight/multi-factor-authentication.md">}})

#### Design

* [Identity security monitoring]({{<ref "identity-security">}})
* [Platform monitoring]({{<ref "platform-monitoring-auditing">}})
* [Endpoint Monitoring]({{<ref "design/platform/client/endpoint-monitoring.md">}})

#### Configuration

* [Sign-in risk policy]({{<ref "sign-in-risk-policy.md">}})
* [MFA for Risky Sign-ins]({{<ref "configuration/entra-id/protection/conditional-access/policies/reauthentication-for-risky-sign-ins.md">}})
  
#### References

* [What is Microsoft Entra monitoring and health](https://learn.microsoft.com/entra/identity/monitoring-health/overview-monitoring-health)
