---
title: "Team policies"
linkTitle: "Team policies"
weight: 20
description: "This section describes the configuration of teams policies within Microsoft Teams associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Teams admin portal at the following URL:

<https://admin.teams.microsoft.com/policies/channels>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

To create a new policy click +Add

| Item                                     |                     Value |
| ---------------------------------------- | ------------------------: |
| Name                                     | Global (Org-wide default) |
| Description                              |      *Custom Description* |
| Create private Channels                  |                        On |
| Create Shared Channels                   |                        On |
| Invite external users to shared channels |                       Off |
| Join external shared channels            |                       Off |

### Related information

#### Security & Governance

* None identified

#### Design

* [Organisation Wide Configuration]({{<ref "design/shared-services/teams/policies-and-settings">}})

#### Configuration

* None identified

#### References

* None identified