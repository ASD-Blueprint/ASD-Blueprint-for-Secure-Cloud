---
title: "Distribution Lists"
weight: 35
description: "This section describes the design decisions associated with distribution lists for system(s) built using ASD's Blueprint for Secure Cloud."
---

A distribution list is a grouping of mail recipients that is addressed as a single recipient. Distribution lists are used to send e-mail to groups of people without having to enter each recipient's individual address. Distributions lists can be established to receive and distribute internal, external, or internal and external email.

This saves the sender from needing to enter each individual email address when emailing a group. These groups/lists are generally leveraged for emailing an entire team or project. Only internal staff can send emails to the "Organisation-all" distribution list.

Distribution lists are created in different ways depending on the Exchange architecture:

* **Cloud Deployments** - For cloud only deployments, distribution lists are created within Office 365
* **Hybrid Deployments** - For hybrid deployments, distribution lists can be created both within Office 365 and on-premises. On-premises lists are then synchronised to Office 365. The on-premises method has the benefit of living with the user identity source of truth, however, it does create complexity when it is not managed in the same location as Exchange

Management of distribution lists can be streamlined through the enforcement of a Naming Policy. A distribution list Naming Policy enables the enforcement of a consistent naming strategy across Office 365 Groups. It consists of two parts:

* **Prefix-Suffix Naming Policy** – Setting of prefixes or suffixes for groups names. The prefixes/suffixes can be either fixed strings or user attributes
* **Custom Blocked Words** – Blocking of words in the name based on a custom list


### Cloud native deployments

{{% alert title="Design decisions" color="warning" %}}

| Decision point               | Design decision | Justification                                                                                                                                                                                         |
|------------------------------|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Distribution Groups creation | Cloud Created   | Management activities for Exchange Online will occur within the portal. The use of cloud created distribution groups also enables groups to be upgraded to Office 365 groups at a later stage. |
| Distribution Naming Policy   | Configured      | Naming policies streamline the management of distribution lists and enable groups to be easily sorted.<br>Suggested naming convention is `OrganisationName-PolicyName`                             |

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