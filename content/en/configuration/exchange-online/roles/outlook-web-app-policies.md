---
Title: Outlook web app policies
weight: 30
description: "This section describes the configuration of Outlook web app policies within Exchange Online associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* for the Microsoft Exchange Online portal blade at the following URL: 
 
https://admin.exchange.microsoft.com/#/owapolicies
 
The settings described on these pages should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

### OwaMailboxPolicy-Default

#### Basics

| Item |                    Value |
| ---- | -----------------------: |
| Name | OwaMailboxPolicy-Default |

#### Features

##### Communication Management

| Item                       |       Value |
| -------------------------- | ----------: |
| Instant messaging          |     Checked |
| Text messaging             |     Checked |
| Exchange ActiveSync        | Not checked |
| Contacts                   |     Checked |
| Linkedin contact sync      | Not checked |
| Mobile device contact sync |     Checked |
| All address lists          |     Checked |

##### Information management

| Item                  | Value |
| --------------------- | ----: |
| Journaling            |       |
| Notes                 |  Checked |
| Inbox rules           |  Checked |
| Recover deleted items |  Checked |

##### Security

| Item            |   Value |
| --------------- | ------: |
| Change password | Checked |

##### User experience

| Item                  |       Value |
| --------------------- | ----------: |
| Themes                |     Checked |
| Premium client        |     Checked |
| Email signature       |     Checked |
| Weather               |     Checked |
| Places                | Not checked |
| Local events          | Not checked |
| Interesting calendars | Not checked |

##### Time management

| Item                        |   Value |
| --------------------------- | ------: |
| Calendar                    | Checked |
| Tasks                       | Checked |
| Reminders and notifications | Checked |
|                             |         |

#### File access

| Item                                                                                   |       Value |
| -------------------------------------------------------------------------------------- | ----------: |
| Let users open files attached to email messages when using a public or shared computer | Not checked |
| Let users open files attached to email messages when using a private computer          |     Checked |
| Offline access                                                                         |      Always |

### Related information

#### Security & Governance

* None identified
  
#### Design

* None identified
  
#### Configuration

* None identified

#### References

* None identified