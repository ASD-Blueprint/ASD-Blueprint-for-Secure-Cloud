---
title: "Permission policies"
linkTitle: "Permission policies"
weight: 00
description: "This section describes the configuration of permission policies within Microsoft Teams associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Teams admin portal at the following URL:

<https://admin.teams.microsoft.com/policies/app-permission>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Global (Org-wide default) policy

| Item             | Value          |
| ---------------- | --------------:|
| Microsoft apps   | Allow all apps |
| Third-party apps | Block all apps |
| Custom apps      | Block all apps |

### Related information

#### Security & Governance

* None identified

#### Design

* [Organisation Wide Configuration]({{<ref "design/shared-services/teams/policies-and-settings">}})

#### Configuration

* None identified

#### References

* None identified
