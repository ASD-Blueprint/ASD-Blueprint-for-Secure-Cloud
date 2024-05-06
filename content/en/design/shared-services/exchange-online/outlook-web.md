---
title: "Outlook on the Web Policies"
weight: 35
description: "This section describes the design decisions associated with Outlook on the Web Policies for system(s) built using ASD's Blueprint for Secure Cloud."
---

Formerly known as Outlook Web App or Outlook Web Access, Outlook on the Web (OWA) policies, are used to control the availability of features and settings in Outlook on the Web. There are no security concerns with enabling OWA however organisations may wish to consider internal organisation policies to inform decisions. A decision to disable OWA will not alter an organisation's cyber security posture.

A mailbox can only be assigned one OWA policy and every mailbox must have a policy assigned.

Features and settings which can be controlled by an OWA policy include:

* Third party file provider integration
* Office 365 group creation from within Outlook on the Web
* Microsoft Satisfaction survey prompts

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                        | Design Decision | Justification                                                                                                                                                                 |
|---------------------------------------|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Outlook on the Web                    | Enabled         | OWA will be enabled to allow users to access their email in a flexible manner                                                                                                 |
| Third party file provider integration | Disabled        | Only Microsoft file providers are approved for integration, no third-party file providers will be configured. This decreases security risk associated with third-party tools. |
| Office 365 group creation by users    | Disabled        | Groups can only be created by administrators, not users. This will ensure that the GAL is the most up to date and that there is a consistent naming convention utilised.      |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* None identified

#### References

* None identified