---
title: "Themes & customization"
linkTitle: "Themes & customization"
weight: 30
description: "This section describes the configuration of themes and customization settings within Microsoft Teams associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Teams admin portal at the following URL:

<https://admin.teams.microsoft.com/one-policy/settings/branding>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Allow organizer to control meeting theme

| Item                                                                                                                       | Value |
| -------------------------------------------------------------------------------------------------------------------------- | ----: |
| When this is on, meeting organizers can turn off meeting themes for specific meeting instances through the meeting options |    On |

### Meeting backgrounds

| Item                                             | Value |
| ------------------------------------------------ | ----: |
| Apply background blur when no effect is selected |   Off |
| Use background images from my organization       |   Off |

### Related information

#### Security & Governance

* None identified
  
#### Design

* [Teams]({{<ref "design/shared-services/teams/">}})
  
#### Configuration

* None identified

#### References

* [IT Admins- Manage and create custom meeting backgrounds for Teams meetings](https://learn.microsoft.com/en-au/microsoftteams/custom-meeting-backgrounds)
