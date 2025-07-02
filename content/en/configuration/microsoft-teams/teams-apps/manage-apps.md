---
title: "Manage apps"
linkTitle: "Manage apps"
weight: 10
description: "This section describes the configuration of app management settings within Microsoft Teams associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Teams admin portal at the following URL:

<https://admin.teams.microsoft.com/policies/manage-apps>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Actions > Org-wide app settings

#### Tailored apps

| Item               | Value |
| ------------------ | ----: |
| Show tailored apps |    On |

#### Microsoft apps

| Item                                                | Value |
| --------------------------------------------------- | ----: |
| Let users install and use available apps by default |    On |

#### Third-party apps

| Item                                                | Value |
| --------------------------------------------------- | ----: |
| Let users install and use available apps by default |   Off |

#### Custom apps

| Item                                                | Value |
| --------------------------------------------------- | ----: |
| Let users install and use available apps by default |   Off |
| Let users interact with custom apps in preview      |   Off |

#### User requests configuration

| Item                               | Value |
| ---------------------------------- | ----: |
| Redirect requests to external link |   Off |

### Related information

#### Security & Governance

* None identified
  
#### Design

* [Teams]({{<ref "design/shared-services/teams">}})
  
#### Configuration

* None identified

#### References

* [Overview of app management and governance in Teams admin center](https://learn.microsoft.com/en-au/microsoftteams/manage-apps)
