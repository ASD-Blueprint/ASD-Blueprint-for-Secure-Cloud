---
title: Policies
weight: 010
description: "This section describes the configuration of data loss prevention policies within Microsoft Purview associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Purview portal at the following URL: 

https://compliance.microsoft.com/datalossprevention/policies

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

{{% alert title="Note" color="info" %}}

The below is a base list of policies with general conditions, actions, and alerting. Organisations should implement these and other policies in accordance with their risk appetite.

{{% /alert %}}

| Policy Name                                                                                                           | Priority | Status |
|-----------------------------------------------------------------------------------------------------------------------|----------|--------:|
| [Add PSPF X-Header and Subject Marking]({{<ref "add-pspf-x-header-and-subject-marking">}})                            | 0        | On     |
| [Block un-labelled email]({{<ref "block-unlabelled-email">}})                                                         | 1        | On     |
| [Block non-permitted-classifications]({{<ref "block-nonpermitted-classifications">}})                                 | 2        | On     |
| [Block email of PROTECTED items]({{<ref "block-email-of-protected-items">}})                                          | 3        | On     |
| [Block external sharing of PROTECTED items]({{<ref "block-external-sharing-protected-items">}})                       | 4        | On     |
| [Limit internal sharing of PROTECTED items]({{<ref "limit-internal-sharing-protected-items">}})                       | 5        | On     |
| [Warn users distributing OFFICIAL: Sensitive items]({{<ref "warn-users-distributing-official-sensitive-items">}})     | 6        | On     |
| [Australia Privacy Act Enhanced]({{<ref "australian-privacy-act-enhanced">}})                                         | 7        | On     |
| [Australia Personally Identifiable Information (PII) Data]({{<ref "australia-personally-identifiable-information">}}) | 8        | On     |
| [Australia Health Records Act (HRIP Act) Enhanced]({{<ref "australia-health-records-act-enhanced">}})                 | 9        | On     |
| [Australia Financial Data]({{<ref "australia-financial-data">}})                                                      | 10       | On     |
| [Limit disclosure of potentially PROTECTED information]({{<ref "limit-disclosure-protected-information">}})           | 11       | On     |
| [Limit disclosure of sensitive information]({{<ref "limit-disclosure-sensitive-information">}})                       | 12       | On     |
| [Default policy for devices]({{<ref "default-policy-for-devices">}})                                                  | 13       | On     |
| [Default policy for Teams]({{<ref "default-policy-for-teams">}})                                                      | 14       | On     |
