---
title: "Migrating to Teams"
linkTitle: "Migrating to Teams"
weight: 43
description: "This section describes the configuration of migration settings within Microsoft Teams associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Teams admin portal at the following URL:

<https://admin.teams.microsoft.com/one-policy/settings/teams-upgrade>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Coexistence mode

| Item                                                                  |      Value |
| --------------------------------------------------------------------- | ---------: |
| Coexistence mode                                                      | Teams only |
| Notify Skype for Business users that an upgrade to Teams is available |        Off |

### App preferences

| Item                                                                  |              Value |
| --------------------------------------------------------------------- | -----------------: |
| Preferred app for users to join Skype for Business meetings           | Skype for Business |
| Download the Teams app in the background for Skype for Business users |                 On |

### Related information

#### Security & Governance

* None identified
  
#### Design

* [Teams]({{<ref "design/shared-services/teams/">}})
  
#### Configuration

* None identified

#### References

* [Coexistence modes - Reference](https://learn.microsoft.com/en-au/microsoftteams/migration-interop-guidance-for-teams-with-skype)
* [Teams settings and policies reference](https://learn.microsoft.com/en-au/microsoftteams/settings-policies-reference)
