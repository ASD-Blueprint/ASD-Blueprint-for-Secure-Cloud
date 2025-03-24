---
title: "Data Loss Prevention"
linkTitle: "Data Loss Prevention"
weight: 30
description: "This section describes the design decisions associated with Data Loss Prevention with Microsoft Purview for system(s) built using ASD's Blueprint for Secure Cloud."
---

### Data Loss Prevention

Data Loss Prevention (DLP) helps organisations protect sensitive and security classified information by enforcing policy-based controls upon information at rest, in use, and in motion. Creating an effective policy can be complex due to the large number of options available within policy configurations, the interactions between policies and other Microsoft 365 services (for example, Exchange Transport Rules) and the interactions between policies and other Purview capabilities (for example, auto-labelling).

#### Policy rules

DLP policies are made up of rules containing four main components:

* **Conditions** define what a rule applies to, and can be grouped by boolean operators (AND, OR, NOT) to focus on specific scenarios
* **Actions** define what happens as a consequence of a condition being met
* **User notifications** define the end-user emails or in-application prompts for when conditions are met
* **Administrative alerts and reports** define the admin-user emails and dashboard notices for when conditions are met

Rules are evaluated in priority order and if information matches multiple rules, the rule with the most restrictive action is enforced.

{{% alert title="DLP on incoming and outgoing data flows" color="info" %}}

DLP rules can be used to on both incoming and outgoing data flows.

{{% /alert %}}

### DLP policies

{{% alert title="Design decisions" color="warning" %}}

| Decision point            | Design decision                                             | Justification                                                                                        |
| ------------------------- | ----------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| Implementing DLP policies | Block SECRET and TOP SECRET emails                          | Prevent access to emails marked as highly classified                                                 |
| Implementing DLP policies | Apply email X-header and subject marking to outgoing emails | Mark emails in-line with requirements in the Protective Security Policy Framework (PSPF)             |
| Implementing DLP policies | Block PROTECTED emails except for approved domains          | Restrict email communication to only domains approved for access to PROTECTED classified information |
| Implementing DLP policies | Block PROTECTED emails except for approved users            | Restrict email communication to only users approved for access to PROTECTED classified information   |

{{% /alert %}}

#### Block SECRET and TOP SECRET emails

The [block SECRET and TOP SECRET emails]({{<ref "configuration/purview/data-loss-prevention/policies/block-secret-and-above-emails">}}) policy blocks emails by checking for SECRET and TOP SECRET PSPF markings in the email's X-Protective-Marking X-header and subject.

The policy would only apply if a user was an intended recipient of a highly classified email, or if a user attempted to forward or reply to a pre-existing highly classified email.

#### Apply email X-header and subject marking to outgoing emails

The [add PSPF X-header and subject marking]({{<ref "configuration/purview/data-loss-prevention/policies/add-pspf-x-header-and-subject-marking">}}) policy applies the PSPF X-Protective-Marking X-header and subject marking to emails.

The policy has a large number of rules to cater for each different PSPF marking and has separate rules for applying X-header and subject markings:

* The X-header marking rules check if the sensitivity label applied to the email matches the current X-header marking, if the X-header marking doesn't exist (i.e. the email is new) or if the X-header marking is different (i.e. the email is a reply or forward and the label has been changed), the X-Protective-Marking X-header is overwritten with the correct marking. Checking if the X-header marking is different helps preserve any existing X-Protective-Marking values that were created with the original email which may include `ORIGIN=`, `EXPIRES= DOWNTO=`, or other special handling markings.
* The subject marking rules overwrite any existing subject marking according to the sensitivity label applied to the email, irrespective of whether the label is the same or not. This is done to prevent the prevent repetitively appending the subject marking on replies and forwards, for example `Re: Re: subject [SEC=OFFICIAL] [SEC=OFFICIAL] [SEC=OFFICIAL]`.

The applied markings adhere strictly to the Australian Government Email Protective Marking Standard with the exception of excluding the `ORIGIN=` marking. If the originator of an email needs to be obtained, the unified audit log can be searched with any organisation that uses Microsoft 365 services. DLP policy, auto-labelling policy, and sensitive information type configurations all use regular expressions which cater for any use of `EXPIRES= DOWNTO=` markings.

#### Block PROTECTED emails except for approved domains

The [block PROTECTED emails except for approved domains]({{<ref "configuration/purview/data-loss-prevention/policies/block-unapproved-domains">}}) policy blocks emails and attachments<sup>1</sup> with PROTECTED<sup>2</sup> sensitivity labels, except for specifically allowed internal and external organisation domains used for sending and receiving email.

The policy would match incoming emails from external organisations even though the emails would not have an *internal* organisation specific sensitivity label applied, this is because an auto-labelling policy would be triggered (and apply a label) before the DLP policy, thereby enabling the DLP policy to meet its condition. The ordering of DLP and auto-labelling is discussed in more detail in the [email handling]({{<ref "design/shared-services/purview/email-handling">}}) page.

1: The policy will not block PROTECTED attachments from external organisation where the email is not also marked as PROTECTED. This would be mitigated by the external organisations enabling the *email inherits highest priority label from attachments* setting in their [label publishing policies]({{<ref "configuration/purview/information-protection/policies/publishing-policies">}})).

2: Including associated special handing and information management markings.

#### Block PROTECTED emails except for approved users

The [block PROTECTED emails except for approved users]({{<ref "configuration/purview/data-loss-prevention/policies/block-unapproved-users">}}) policy blocks emails and attachments with PROTECTED<sup>1</sup> sensitivity labels, except for specifically allowed group members.

The policy is not able to cater for groups that are configured in external organisations. The policy should use the same groups as used for [publishing PROTECTED labels]({{<ref "design/shared-services/purview/labelling-and-classification#label-publishing">}}) and set in the [users up to PROTECTED]({{<ref "configuration/purview/information-protection/policies/publishing-policies/users-up-to-p-policy">}}) publishing policy configuration.

While the *users up to PROTECTED* publishing policy ensures that only specific users have access to apply PROTECTED labels and to a degree, access PROTECTED labelled information, the DLP policy ensures that if users excluded from the publishing policy do access PROTECTED labelled information, they cannot email it.

1: Including associated special handing and information management markings.

### Endpoint DLP

DLP capabilities can be extended to certain Windows desktop and server and MacOS operating systems, including virtualised environments and browsers. Endpoint DLP enables the monitoring and control of a number of actions such as copying, uploading and printing, and domain-based restrictions.

Implementing endpoint DLP policies may require the deployment of the Purview Information Protection client or browser plugins, and will require some organisational specific knowledge about user behaviour. Implementation is recommended and can be started by onboarding devices and observing events in [Activity Explorer](https://learn.microsoft.com/en-us/purview/data-classification-activity-explorer) before creating policies.

{{% alert title="Design decisions" color="warning" %}}

| Decision point            | Design decision                                | Justification                                                                                            |
| ------------------------- | ---------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| Implementing endpoint DLP | Onboard endpoints to enable policy development | Extend the protection of sensitive and security classified information to operating systems and browsers |

{{% /alert %}}

### Using sensitive information types

Each DLP policy could be complimented by the use of sensitive information types (or other classifiers) to improve the conditional matching of information. However, due to the requirements to [implement sensitive information types]({{<ref "design/shared-services/purview/labelling-and-classification#label-#implementing-sensitive-information-types">}}), capabilities based on them types must be developed and implemented only within an organisation specific context.

### User notifications

Each DLP policy rule defines user notifications in terms of policy tips displayed while using an application to perform an action, or email notifications sent after an action has taken place. As with other Purview solutions, the user experience can depend on the applications used. For example, some applications cannot show policy tips and others can be slow to show policy tips which can result in actions being performed before tips are displayed<sup>1</sup>. Using both policy tips and email notifications can help ensure users are made aware of their actions regardless of the application used, email notifications are also able to be sent to external organisations for certain actions.

1: This can be partially remediated by using the *dlpwaitonsendtimeout* Registry key.

### Related information

#### Security & Governance

* [Guidelines for email]({{<ref "content\en\security-and-governance\system-security-plan\email.md">}})

#### Design

* [Email handling]({{<ref "design/shared-services/purview/email-handling">}})
* [Labelling and classification]({{<ref "design/shared-services/purview/labelling-and-classification">}})

#### Configuration

* [Auto-labeling policies]({{<ref "configuration/purview/information-protection/policies/auto-labeling-policies">}}))
* [Data Loss Prevention policies]({{<ref "configuration/purview/data-loss-prevention/policies">}})
* [Sensitive info types]({{<ref "configuration/purview/information-protection/classifiers/sensitive-info-types">}})
* [Sensitivity label publishing policies]({{<ref "configuration/purview/information-protection/policies/publishing-policies">}})).

#### References

* [Australian Government Email Protective Marking Standard](https://www.protectivesecurity.gov.au/publications-library/australian-government-email-protective-marking-standard)
* [Data Loss Prevention policy reference](https://learn.microsoft.com/en-us/purview/dlp-policy-reference)
* [Learn about data loss prevention](https://docs.microsoft.com/microsoft-365/compliance/dlp-learn-about-dlp?view=o365-worldwide)
* [Learn about Endpoint data loss prevention](https://learn.microsoft.com/en-au/purview/endpoint-dlp-learn-about)
