---
title: "Address Book"
weight: 40
description: "This section describes the design decisions associated with Exchange Online for system(s) built using ASD's Blueprint for Secure Cloud."
---

The Outlook Address Lists, Global Address List (GAL), and Offline Address Book (OAB) are collections of mail-enabled objects. They are leveraged for recipient lookup operations (i.e. When a user leverages either the Address book or Check names tools in Outlook). The types of mail-enabled object collections are as follows:

* **GAL** – The GAL is automatically created by Exchange and lists all mail-enabled objects. (The GAL is available by default to all users).
* **OAB** – The OAB is an offline version of the GAL leveraged by clients in Cached Mode.
* **Outlook Address List** - An Outlook Address List is a subset of the mail-enabled objects. By default, a number of Address Lists are created, however, additional Address Lists can be created as required.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point       | Design Decision | Justification                                                                                                                                             |
|----------------------|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| Custom Address Lists | Configured      | Custom address lists can be configured by organisation administrators, however one initial custom list, OrganisationName-All, should be manually created. |
| GAL and OAB          | Generated       | These will be generated so that users can send emails within the organisation in accordance with Microsoft best practice.                                 |

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