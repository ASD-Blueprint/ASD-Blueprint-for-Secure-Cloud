---
title: "External access"
linkTitle: "External access"
weight: 10
description: "This section describes the configuration of external access settings within Microsoft Teams associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Teams admin portal at the following URL:

<https://admin.teams.microsoft.com/users>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Organization settings

| Item                                                                                                                           |                      Value |
| ------------------------------------------------------------------------------------------------------------------------------ | -------------------------: |
| Teams and Skype for Business users in external organizations                                                                   | Block all external domains |
| People in my organization can communicate with unmanaged Teams accounts                                                        |                        Off |
| People in my organization can communicate with accounts in trial Teams tenant                                                  |                        Off |
| Block specific users from communicating with people in my organization                                                         |                        Off |
| People in my organization can communicate with users who are using custom applications built with Azure Communication Services |                        Off |

### Related information

#### Security & Governance

* None identified
  
#### Design

* [Teams]({{<ref "design/shared-services/teams/">}})
  
#### Configuration

* None identified

#### References

* [IT Admins - Manage external meetings and chat with people and organizations using Microsoft identities](https://learn.microsoft.com/en-au/microsoftteams/trusted-organizations-external-meetings-chat)
* [Teams apps for external attendees or guests from outside an organization](https://learn.microsoft.com/en-au/microsoftteams/apps-external-users)
