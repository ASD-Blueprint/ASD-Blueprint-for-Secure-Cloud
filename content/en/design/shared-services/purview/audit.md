---
title: "Audit"
linkTitle: "Audit"
weight: 70
description: "This section describes the design decisions associated with Audit with Microsoft Purview for system(s) built using ASD's Blueprint for Secure Cloud."
---

Purview Audit allows organisations to investigate data captured about operations performed in Microsoft 365 services and retained in the unified audit log. Deciding what data to retain and how long to retain it are key considerations:

* Audit data is retained for 180 days by default (or one year for certain record types) and can be retained for up to ten years with E5 licensing and a licensing add-on. ASD's *Information Security Manual* (ISM) recommends that certain types of log data be retained for at least seven years, which is complimented by other guidance and publications from ASD's Australian Cyber Security Centre recommending that retention periods be informed by risk assessments and compliance with organisational regulatory requirements. It is also possible to use Microsoft 365 APIs to enable third-party applications to ingest audit data which may provide additional benefits for cost and long term retention.
* Which data to retain is largely dictated by *record type* policy settings related to the features that are enabled for relevant Microsoft 365 services. This data can be further broken down into the specific actions performed relative to the record type. While organisations can customise data types and actions to cater for specific use cases, for simplicity, it can be useful to leave record type policy settings blank which will capture all record types and actions to the unified audit log.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point         | Design Decision                   | Justification                                 |
| ---------------------- | --------------------------------- | --------------------------------------------- |
| Audit retention period | Retain audit data for seven years | Log information in-line with ISM requirements |
| Audit data selection   | Retail all audit data             | Simplify audit logging management             |

{{% /alert %}}

### Operational considerations

The following should be considered before using Purview Audit:

#### Licensing

Advanced auditing features are available with E5 equivalent licensing with the Audit (Premium) licensing add-on. To take advantage of these features, the *Advanced Auditing app* license must be applied per user. In mixed-license environments, activities will only be logged and searchable up to what the license permits for each user. Similarly, while it may be possible to create audit policies based on Audit (Premium) features, like ten year retention, only activities up to what the user license permits will be retained.

Audit policies and licensing are not retroactive, logs generated before the application of a policy or license will not be retained according to the new policy.

#### Activity lag

It can take up to 24 hours for activities to appear in the unified audit log. This delay should be taken into account when running searches.

Some activities can appear earlier in an individual service's audit logs, for example user login activities may be searchable in Intra ID audit logs before being available in the unified audit log.

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* [Audit]({{<ref "configuration/purview/audit">}})

#### References

* [Audit log activities](https://learn.microsoft.com/en-us/purview/audit-log-activities)
* [Audit log considerations for Australian Government compliance with PSPF](https://learn.microsoft.com/en-us/compliance/anz/pspf-audit-log)
* [Best practices for event logging and threat detection](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-monitoring/best-practices-event-logging-threat-detection)
* [Information Security Manual (ISM)](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism)
* [Learn about auditing solutions in Microsoft Purview](https://learn.microsoft.com/en-us/purview/audit-solutions-overview)
* [Microsoft services that support auditing](https://learn.microsoft.com/en-us/purview/audit-supported-services)
