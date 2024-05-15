---
title: "Team settings"
weight: 10
description: "This section describes the configuration of teams within Microsoft Teams associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* for the Microsoft Exchange Online portal blade at the following URL: 
 
https://admin.teams.microsoft.com/company-wide-settings/teams-settings

The settings described on these pages should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

### Notification and Feeds

| Item                                                 | Value |
| ---------------------------------------------------- | ----: |
| Suggested feeds can appear in a user's activity feed |    On |

### Tagging

| Item                                       |          Value |
| ------------------------------------------ | -------------: |
| Who can manage tags                        |    Team Owners |
| Team owners can change who can manage tags |             On |
| Suggested tags                             | *Custom input* |
| Custom tags                                |             On |
| Shifts app can apply tags                  |             On |

### Email Integration

| Item                                             |          Value |
| ------------------------------------------------ | -------------: |
| Users can send emails to a channel email address |             On |
| Accept channel email from these SMTP domains     | *Custom input* |

### Files

| Item         | Value |
| ------------ | ----: |
| Citrix files |   Off |
| DropBox      |   Off |
| Box          |   Off |
| Google Drive |   Off |
| Egnyte       |   Off |

### Organization

| Item                            | Value |
| ------------------------------- | ----: |
| Show organisation tab for users |    On |

### Devices

| Item                                                                 |                                  Value |
| -------------------------------------------------------------------- | -------------------------------------: |
| Require a secondary form of authentication to access meeting content |                              No Access |
| Set content pin                                                      | Required for outside scheduled meeting |
| Surface Hub accounts can send emails                                 |                                     On |

### Search by name  

| Item                                                         | Value |
| ------------------------------------------------------------ | ----: |
| Scope directory search using an Exchange address book policy |    On |

### Safety and communications   

| Item                        | Value |
| --------------------------- | ----: |
| Role-based chat permissions |   Off |

### Shared Channels

| Item                                      | Value |
| ----------------------------------------- | ----: |
| Provide a link to my support request page |   Off |