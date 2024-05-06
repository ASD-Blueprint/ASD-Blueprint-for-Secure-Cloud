---
title: "Alerts"
weight: 60
description: "This section describes the design decisions associated with Alerts Microsoft 365 security features for system(s) built using ASD's Blueprint for Secure Cloud."
---

Microsoft 365 contains various out-of-the-box Alert Policies, some of which are dependent on the available Microsoft 365 licence. Alert Policies can be configured to track administrative activities, malware threats, user actions and/or data loss incidents.

Each alert can be configured with the following settings:

* **Tracked Activity** - The activity that will cause the alert to be generated. For example, sharing a file with an external user, assigning access permissions, or creating an anonymous link
* **Activity Conditions** - When a tracked activity triggers, additional conditions can be applied to filter out unnecessary alerts. For example, an alert can be triggered only if a certain user performs a task
* **When to Trigger** - When the above conditions are met, further filtering can be applied to only alert when a certain threshold is met. For example, an alert is only raised if the activity has been performed more than five times
* **Alert Category** - An alert category is assigned to assist with tracking and managing the alerts generated
* **Alert Severity** - An alert severity is assigned to assist with tracking and managing the alerts generated. The severity is displayed in the subject line of the alert email
* **Alert Notification** - An alert can be configured with a list of email addresses that should receive the alert notifications. Daily notification limits can also be configured to ensure an alert receiver is not bombarded with alert emails for the same event. Triggered alerts can also be viewed in the Security & Compliance Center

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point        | Design Decision                | Justification                                                                                                                     |
|-----------------------|--------------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| Alert Policies Status | Default Alert Policies enabled | Custom alert policies are not required for the initial phase. Custom alert policies will be considered in a future project phase. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* None identified

#### References

* [Alert policies in Microsoft 365](https://docs.microsoft.com/microsoft-365/compliance/alert-policies?view=o365-worldwide)