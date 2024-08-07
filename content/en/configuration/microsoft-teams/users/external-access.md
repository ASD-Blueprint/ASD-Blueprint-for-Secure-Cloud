---
title: "External Access"
linkTitle: "External Access"
weight: 30
description: "This section describes the configuration of users within Microsoft Teams associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Teams admin portal at the following URL:

<https://admin.teams.microsoft.com/company-wide-settings/external-communications>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Teams and Skype for Business users in external organizations

| Item                                                    |                      Value |
| ------------------------------------------------------- | -------------------------: |
| Choose which external domains your users have access to | Block all external domains |

### Teams accounts not managed by an organization

| Item                                                                                                        | Value |
| ----------------------------------------------------------------------------------------------------------- | ----: |
| People in my organization can communicate with Teams users whose accounts aren't managed by an organization |   Off |

### Skype users

| Item                                                           | Value |
| -------------------------------------------------------------- | ----: |
| Allow users in my organization to communicate with Skype users |    On |
