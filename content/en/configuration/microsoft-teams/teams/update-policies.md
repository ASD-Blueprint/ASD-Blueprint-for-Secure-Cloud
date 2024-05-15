---
title: "Teams update policies"
weight: 50
description: "This section describes the configuration of update policies within Microsoft Teams associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* for the Microsoft Exchange Online portal blade at the following URL:

<https://admin.teams.microsoft.com/policies/updatemanagement>

The settings described on these pages should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

#### Global (Org-wide default) policy

To create a new policy click +Add

| Item                        |                                                    Value |
| --------------------------- | -------------------------------------------------------: |
| Name                        |                                Global (Org-wide default) |
| Description                 | Default policy for users who aren't assigned to a policy |
| Show Teams preview features |                On for users in Current Channel (Preview) |
| Use new Teams client        |                                     Microsoft controlled |
