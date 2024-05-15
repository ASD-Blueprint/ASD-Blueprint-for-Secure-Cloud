---
Title: Meeting settings
weight: 20
description: "This section describes the configuration of meetings within Microsoft Teams associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* for the Microsoft Exchange Online portal blade at the following URL:

<https://admin.teams.microsoft.com/meetings/settings>

The settings described on these pages should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Participants

| Item                                               | Value |
| -------------------------------------------------- | -----:|
| Anonymous users can join a meeting                 | On    |
| Anonymous users can interact with apps in meetings | On    |

### Cross-cloud meetings

| Item                       | Value |
| -------------------------- | -----:|
| Microsoft Azure Government | Off   |
| Microsoft Azure China      | Off   |

### Email invitation

| Item      | Value                       |
| --------- | ---------------------------:|
| Logo URL  | *organisations logo URL*    |
| Legal URL | *organisations legal URL*   |
| Help URL  | *organisations help URL*    |
| Footer    | *organisations footer text* |

### Network

| Item                                                                | Value               |
| ------------------------------------------------------------------- | -------------------:|
| Insert Quality of Service (QoS) markers for real-time media traffic | Off                 |
| Select a port range for each type of real-time media traffic        | Specify port ranges |

| Media traffic type | Starting port | Ending port | Total ports |
| ------------------ | ------------- | ----------- | -----------:|
| Audio              | 50000         | 50019       | 20          |
| Video              | 50020         | 50039       | 20          |
| Screen Sharing     | 50040         | 50059       | 20          |
