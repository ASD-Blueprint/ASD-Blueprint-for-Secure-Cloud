---
title: "Enhanced encryption"
linkTitle: "Enhanced encryption"
weight: 10
description: "This section describes the configuration of encryption settings within Microsoft Teams associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Teams admin portal at the following URL:

<https://admin.teams.microsoft.com/one-policy/settings/enhancedEncryption>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### End-to-end encryption

| Item                          |                             Value |
| ----------------------------- | --------------------------------: |
| End-to-end call encryption    | Not enabled, but users can enable |
| End-to-end meeting encryption | Not enabled, but users can enable |

### Related information

#### Security & Governance

* None identified
  
#### Design

* [Teams]({{<ref "design/shared-services/teams/">}})
  
#### Configuration

* None identified

#### References

* [Use end-to-end encryption for one-to-one Microsoft Teams calls](https://learn.microsoft.com/en-au/microsoftteams/teams-end-to-end-encryption)
* [Teams settings and policies reference](https://learn.microsoft.com/en-au/microsoftteams/settings-policies-reference)
