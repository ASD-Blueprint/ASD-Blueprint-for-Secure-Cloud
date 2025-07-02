---
title: "Add PSPF X-header and subject marking"
linkTitle: "Add PSPF X-header and subject marking"
weight: 010
description: "This section describes the configuration of Data Loss Prevention policies within Microsoft Purview associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Purview portal at the following URL:

<https://purview.microsoft.com/datalossprevention/policies>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

[//]: # (                                         * * * * * Note * * * * *                                                           )
[//]: # (                                                                                                                            )
[//]: # ( Regular expressions in tables include extra escape characters for formatting, do not copy and paste them from raw markdown )
[//]: # (                                                                                                                            )
[//]: # (                                         * * * * * Note * * * * *                                                           )

### Name

#### Name your DLP policy

| Item        |                                                                            Value |
| ----------- | -------------------------------------------------------------------------------: |
| Name        |                                  Add PSPF X-header and subject marking to emails |
| Description | Apply PSPF markings to the email X-Protective-Marking X-header and email subject |

### Admin units

#### Assign admin units

| Item        |          Value |
| ----------- | -------------: |
| Admin units | Full directory |

### Locations

#### Choose where to apply the policy

| Item                            |       Value |
| ------------------------------- | ----------: |
| Exchange email                  |  All groups |
| SharePoint sites                | Not checked |
| OneDrive accounts               | Not checked |
| Teams chat and channel messages | Not checked |
| Devices                         | Not checked |
| Instances                       | Not checked |
| On-premises repositories        | Not checked |
| Fabric and Power BI workspaces  | Not checked |
| Microsoft 365 Copilot (preview) | Not checked |

### Policy settings

| Item                   |                                  Value |
| ---------------------- | -------------------------------------: |
| Define policy settings | Create or customize advanced DLP rules |

#### Advanced DLP rules

{{% alert title="Subject replacement text" color="warning" %}}

1: The *modify subject* replacement text values must have a leading whitespace character before the `[SEC=`.

{{% /alert %}}

{{% alert title="Regular expressions in DLP rules" color="info" %}}

Unlike other Purview configurations, DLP rules do not support the use of commas in regular expressions: commas (`,`) have been replaced by the unicode expression `\u002C`.

{{% /alert %}}

***Rule index:***

* [Mark UNOFFICIAL X-header](#mark-unofficial-x-header)
* [Mark UNOFFICIAL subject](#mark-unofficial-subject)
* [Mark OFFICIAL X-header](#mark-official-x-header)
* [Mark OFFICIAL subject](#mark-official-subject)
* [Mark OS X-header](#mark-os-x-header)
* [Mark OS subject](#mark-os-subject)
* [Mark OS PP X-header](#mark-os-pp-x-header)
* [Mark OS PP subject](#mark-os-pp-subject)
* [Mark OS LP X-header](#mark-os-lp-x-header)
* [Mark OS LP subject](#mark-os-lp-subject)
* [Mark OS LS X-header](#mark-os-ls-x-header)
* [Mark OS LS subject](#mark-os-ls-subject)
* [Mark OS NC X-header](#mark-os-nc-x-header)
* [Mark OS NC subject](#mark-os-nc-subject)
* [Mark OS NC PP X-header](#mark-os-nc-pp-x-header)
* [Mark OS NC PP subject](#mark-os-nc-pp-subject)
* [Mark OS NC LP X-header](#mark-os-nc-lp-x-header)
* [Mark OS NC LP subject](#mark-os-nc-lp-subject)
* [Mark OS NC LS X-header](#mark-os-nc-ls-x-header)
* [Mark OS NC LS subject](#mark-os-nc-ls-subject)
* [Mark PROTECTED X-header](#mark-protected-x-header)
* [Mark PROTECTED subject](#mark-protected-subject)
* [Mark P PP X-header](#mark-p-pp-x-header)
* [Mark P PP subject](#mark-p-pp-subject)
* [Mark P LP X-header](#mark-p-lp-x-header)
* [Mark P LP subject](#mark-p-lp-subject)
* [Mark P LS X-header](#mark-p-ls-x-header)
* [Mark P LS subject](#mark-p-ls-subject)
* [Mark P NC X-header](#mark-p-nc-x-header)
* [Mark P NC subject](#mark-p-nc-subject)
* [Mark P NC PP X-header](#mark-p-nc-pp-x-header)
* [Mark P NC PP subject](#mark-p-nc-pp-subject)
* [Mark P NC LP X-header](#mark-p-nc-lp-x-header)
* [Mark P NC LP subject](#mark-p-nc-lp-subject)
* [Mark P NC LS X-header](#mark-p-nc-ls-x-header)
* [Mark P NC LS subject](#mark-p-nc-ls-subject)
* [Mark P C X-header](#mark-p-c-x-header)
* [Mark P C subject](#mark-p-c-subject)
* [Mark P C PP X-header](#mark-p-c-pp-x-header)
* [Mark P C PP subject](#mark-p-c-pp-subject)
* [Mark P C LP X-header](#mark-p-c-lp-x-header)
* [Mark P C LP subject](#mark-p-c-lp-subject)
* [Mark P C LS X-header](#mark-p-c-ls-x-header)
* [Mark P C LS subject](#mark-p-c-ls-subject)

##### Mark UNOFFICIAL X-header

| Item                                                                                                                                |                                                         Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------: |
| Name                                                                                                                                |                                      Mark UNOFFICIAL X-header |
| Description                                                                                                                         |                                                        *None* |
| **Conditions**                                                                                                                      |                                                               |
| Content contains                                                                                                                    |                                                               |
| - Group name                                                                                                                        |                                                       Default |
| - Group operator                                                                                                                    |                                                  Any of these |
| - Sensitivity labels                                                                                                                |                                                    UNOFFICIAL |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                         Message or attachment |
| Condition group **AND**                                                                                                             |                                                               |
| **NOT**                                                                                                                             |                                                               |
| **Conditions**                                                                                                                      |                                                               |
| Header matches patterns                                                                                                             |                      X-Protective-Marking<br>`SEC=UNOFFICIAL` |
| **Actions**                                                                                                                         |                                                               |
| Set headers                                                                                                                         | `X-Protective-Marking: VER=2024.1, NS=gov.au, SEC=UNOFFICIAL` |
| **User notifications**                                                                                                              |                                                               |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                           Off |
| **Incident reports**                                                                                                                |                                                               |
| Use this severity level in admin alerts and reports:                                                                                |                                                           Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                           Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                           Off |
| **Additional options**                                                                                                              |                                                               |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                   Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                           Off |
| Priority                                                                                                                            |                                                             0 |

##### Mark UNOFFICIAL subject

| Item                                                                                                                                |                                                 Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------: |
| Name                                                                                                                                |                               Mark UNOFFICIAL subject |
| Description                                                                                                                         |                                                *None* |
| **Conditions**                                                                                                                      |                                                       |
| Content contains                                                                                                                    |                                                       |
| - Group name                                                                                                                        |                                               Default |
| - Group operator                                                                                                                    |                                          Any of these |
| - Sensitivity labels                                                                                                                |                                            UNOFFICIAL |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                 Message or attachment |
| **Actions**                                                                                                                         |                                                       |
| Modify subject                                                                                                                      |                                                       |
| - Remove text that matches                                                                                                          |                                     `\s*?\[SEC=.*?\]` |
| - Insert this replacement text                                                                                                      |                  &nbsp;`[SEC=UNOFFICIAL]`<sup>1</sup> |
| - Position                                                                                                                          | Remove matches and append replacement text to subject |
| **User notifications**                                                                                                              |                                                       |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                   Off |
| **Incident reports**                                                                                                                |                                                       |
| Use this severity level in admin alerts and reports:                                                                                |                                                   Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                   Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                   Off |
| **Additional options**                                                                                                              |                                                       |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                           Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                   Off |
| Priority                                                                                                                            |                                                     1 |

##### Mark OFFICIAL X-header

| Item                                                                                                                                |                                                       Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------: |
| Name                                                                                                                                |                                      Mark OFFICIAL X-header |
| Description                                                                                                                         |                                                      *None* |
| **Conditions**                                                                                                                      |                                                             |
| Content contains                                                                                                                    |                                                             |
| - Group name                                                                                                                        |                                                     Default |
| - Group operator                                                                                                                    |                                                Any of these |
| - Sensitivity labels                                                                                                                |                                                    OFFICIAL |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                       Message or attachment |
| Condition group **AND**                                                                                                             |                                                             |
| **NOT**                                                                                                                             |                                                             |
| **Conditions**                                                                                                                      |                                                             |
| Header matches patterns                                                                                                             |        X-Protective-Marking<br>`SEC=OFFICIAL(?!:Sensitive)` |
| **Actions**                                                                                                                         |                                                             |
| Set headers                                                                                                                         | `X-Protective-Marking: VER=2024.1, NS=gov.au, SEC=OFFICIAL` |
| **User notifications**                                                                                                              |                                                             |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                         Off |
| **Incident reports**                                                                                                                |                                                             |
| Use this severity level in admin alerts and reports:                                                                                |                                                         Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                         Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                         Off |
| **Additional options**                                                                                                              |                                                             |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                 Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                         Off |
| Priority                                                                                                                            |                                                           2 |

##### Mark OFFICIAL subject

| Item                                                                                                                                |                                                 Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------: |
| Name                                                                                                                                |                                 Mark OFFICIAL subject |
| Description                                                                                                                         |                                                *None* |
| **Conditions**                                                                                                                      |                                                       |
| Content contains                                                                                                                    |                                                       |
| - Group name                                                                                                                        |                                               Default |
| - Group operator                                                                                                                    |                                          Any of these |
| - Sensitivity labels                                                                                                                |                                              OFFICIAL |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                 Message or attachment |
| **Actions**                                                                                                                         |                                                       |
| Modify subject                                                                                                                      |                                                       |
| - Remove text that matches                                                                                                          |                                     `\s*?\[SEC=.*?\]` |
| - Insert this replacement text                                                                                                      |                    &nbsp;`[SEC=OFFICIAL]`<sup>1</sup> |
| - Position                                                                                                                          | Remove matches and append replacement text to subject |
| **User notifications**                                                                                                              |                                                       |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                   Off |
| **Incident reports**                                                                                                                |                                                       |
| Use this severity level in admin alerts and reports:                                                                                |                                                   Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                   Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                   Off |
| **Additional options**                                                                                                              |                                                       |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                           Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                   Off |
| Priority                                                                                                                            |                                                     3 |

##### Mark OS X-header

| Item                                                                                                                                |                                                                                                Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                                                     Mark OS X-header |
| Description                                                                                                                         |                                                                                               *None* |
| **Conditions**                                                                                                                      |                                                                                                      |
| Content contains                                                                                                                    |                                                                                                      |
| - Group name                                                                                                                        |                                                                                              Default |
| - Group operator                                                                                                                    |                                                                                         Any of these |
| - Sensitivity labels                                                                                                                |                                                        OFFICIAL Sensitive (group)/OFFICIAL Sensitive |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                                                Message or attachment |
| Condition group **AND**                                                                                                             |                                                                                                      |
| **NOT**                                                                                                                             |                                                                                                      |
| **Conditions**                                                                                                                      |                                                                                                      |
| Header matches patterns                                                                                                             | X-Protective-Marking<br>`SEC=OFFICIAL:Sensitive(?!\u002C CAVEAT=\|[a-zA-Z\u002C= /]*\u002C ACCESS=)` |
| **Actions**                                                                                                                         |                                                                                                      |
| Set headers                                                                                                                         |                                `X-Protective-Marking: VER=2024.1, NS=gov.au, SEC=OFFICIAL:Sensitive` |
| **User notifications**                                                                                                              |                                                                                                      |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                                                  Off |
| **Incident reports**                                                                                                                |                                                                                                      |
| Use this severity level in admin alerts and reports:                                                                                |                                                                                                  Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                                                  Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                                                  Off |
| **Additional options**                                                                                                              |                                                                                                      |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                                          Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                                                  Off |
| Priority                                                                                                                            |                                                                                                    4 |

##### Mark OS subject

| Item                                                                                                                                |                                                 Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------: |
| Name                                                                                                                                |                                       Mark OS subject |
| Description                                                                                                                         |                                                *None* |
| **Conditions**                                                                                                                      |                                                       |
| Content contains                                                                                                                    |                                                       |
| - Group name                                                                                                                        |                                               Default |
| - Group operator                                                                                                                    |                                          Any of these |
| - Sensitivity labels                                                                                                                |         OFFICIAL Sensitive (group)/OFFICIAL Sensitive |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                 Message or attachment |
| **Actions**                                                                                                                         |                                                       |
| Modify subject                                                                                                                      |                                                       |
| - Remove text that matches                                                                                                          |                                     `\s*?\[SEC=.*?\]` |
| - Insert this replacement text                                                                                                      |          &nbsp;`[SEC=OFFICIAL:Sensitive]`<sup>1</sup> |
| - Position                                                                                                                          | Remove matches and append replacement text to subject |
| **User notifications**                                                                                                              |                                                       |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                   Off |
| **Incident reports**                                                                                                                |                                                       |
| Use this severity level in admin alerts and reports:                                                                                |                                                   Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                   Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                   Off |
| **Additional options**                                                                                                              |                                                       |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                           Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                   Off |
| Priority                                                                                                                            |                                                     5 |

##### Mark OS PP X-header

| Item                                                                                                                                |                                                                                              Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                                                Mark OS PP X-header |
| Description                                                                                                                         |                                                                                             *None* |
| **Conditions**                                                                                                                      |                                                                                                    |
| Content contains                                                                                                                    |                                                                                                    |
| - Group name                                                                                                                        |                                                                                            Default |
| - Group operator                                                                                                                    |                                                                                       Any of these |
| - Sensitivity labels                                                                                                                |                                                        OFFICIAL Sensitive (group)/Personal Privacy |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                                              Message or attachment |
| Condition group **AND**                                                                                                             |                                                                                                    |
| **NOT**                                                                                                                             |                                                                                                    |
| **Conditions**                                                                                                                      |                                                                                                    |
| Header matches patterns                                                                                                             | X-Protective-Marking<br>`SEC=OFFICIAL:Sensitive(?!\u002C CAVEAT=).*\u002C ACCESS=Personal-Privacy` |
| **Actions**                                                                                                                         |                                                                                                    |
| Set headers                                                                                                                         |     `X-Protective-Marking: VER=2024.1, NS=gov.au, SEC=OFFICIAL:Sensitive, ACCESS=Personal-Privacy` |
| **User notifications**                                                                                                              |                                                                                                    |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                                                Off |
| **Incident reports**                                                                                                                |                                                                                                    |
| Use this severity level in admin alerts and reports:                                                                                |                                                                                                Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                                                Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                                                Off |
| **Additional options**                                                                                                              |                                                                                                    |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                                        Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                                                Off |
| Priority                                                                                                                            |                                                                                                  6 |

##### Mark OS PP subject

| Item                                                                                                                                |                                                                 Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------: |
| Name                                                                                                                                |                                                    Mark OS PP subject |
| Description                                                                                                                         |                                                                *None* |
| **Conditions**                                                                                                                      |                                                                       |
| Content contains                                                                                                                    |                                                                       |
| - Group name                                                                                                                        |                                                               Default |
| - Group operator                                                                                                                    |                                                          Any of these |
| - Sensitivity labels                                                                                                                |                           OFFICIAL Sensitive (group)/Personal Privacy |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                 Message or attachment |
| **Actions**                                                                                                                         |                                                                       |
| Modify subject                                                                                                                      |                                                                       |
| - Remove text that matches                                                                                                          |                                                     `\s*?\[SEC=.*?\]` |
| - Insert this replacement text                                                                                                      | &nbsp;`[SEC=OFFICIAL:Sensitive, ACCESS=Personal-Privacy]`<sup>1</sup> |
| - Position                                                                                                                          |                 Remove matches and append replacement text to subject |
| **User notifications**                                                                                                              |                                                                       |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                   Off |
| **Incident reports**                                                                                                                |                                                                       |
| Use this severity level in admin alerts and reports:                                                                                |                                                                   Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                   Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                   Off |
| **Additional options**                                                                                                              |                                                                       |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                           Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                   Off |
| Priority                                                                                                                            |                                                                     7 |

##### Mark OS LP X-header

| Item                                                                                                                                |                                                                                             Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                                               Mark OS LP X-header |
| Description                                                                                                                         |                                                                                            *None* |
| **Conditions**                                                                                                                      |                                                                                                   |
| Content contains                                                                                                                    |                                                                                                   |
| - Group name                                                                                                                        |                                                                                           Default |
| - Group operator                                                                                                                    |                                                                                      Any of these |
| - Sensitivity labels                                                                                                                |                                                        OFFICIAL Sensitive (group)/Legal Privilege |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                                             Message or attachment |
| Condition group **AND**                                                                                                             |                                                                                                   |
| **NOT**                                                                                                                             |                                                                                                   |
| **Conditions**                                                                                                                      |                                                                                                   |
| Header matches patterns                                                                                                             | X-Protective-Marking<br>`SEC=OFFICIAL:Sensitive(?!\u002C CAVEAT=).*\u002C ACCESS=Legal-Privilege` |
| **Actions**                                                                                                                         |                                                                                                   |
| Set headers                                                                                                                         |     `X-Protective-Marking: VER=2024.1, NS=gov.au, SEC=OFFICIAL:Sensitive, ACCESS=Legal-Privilege` |
| **User notifications**                                                                                                              |                                                                                                   |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                                               Off |
| **Incident reports**                                                                                                                |                                                                                                   |
| Use this severity level in admin alerts and reports:                                                                                |                                                                                               Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                                               Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                                               Off |
| **Additional options**                                                                                                              |                                                                                                   |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                                       Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                                               Off |
| Priority                                                                                                                            |                                                                                                 8 |

##### Mark OS LP subject

| Item                                                                                                                                |                                                                Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------: |
| Name                                                                                                                                |                                                   Mark OS LP subject |
| Description                                                                                                                         |                                                               *None* |
| **Conditions**                                                                                                                      |                                                                      |
| Content contains                                                                                                                    |                                                                      |
| - Group name                                                                                                                        |                                                              Default |
| - Group operator                                                                                                                    |                                                         Any of these |
| - Sensitivity labels                                                                                                                |                           OFFICIAL Sensitive (group)/Legal Privilege |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                Message or attachment |
| **Actions**                                                                                                                         |                                                                      |
| Modify subject                                                                                                                      |                                                                      |
| - Remove text that matches                                                                                                          |                                                    `\s*?\[SEC=.*?\]` |
| - Insert this replacement text                                                                                                      | &nbsp;`[SEC=OFFICIAL:Sensitive, ACCESS=Legal-Privilege]`<sup>1</sup> |
| - Position                                                                                                                          |                Remove matches and append replacement text to subject |
| **User notifications**                                                                                                              |                                                                      |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                  Off |
| **Incident reports**                                                                                                                |                                                                      |
| Use this severity level in admin alerts and reports:                                                                                |                                                                  Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                  Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                  Off |
| **Additional options**                                                                                                              |                                                                      |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                          Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                  Off |
| Priority                                                                                                                            |                                                                    9 |

##### Mark OS LS X-header

| Item                                                                                                                                |                                                                                                 Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                                                   Mark OS LS X-header |
| Description                                                                                                                         |                                                                                                *None* |
| **Conditions**                                                                                                                      |                                                                                                       |
| Content contains                                                                                                                    |                                                                                                       |
| - Group name                                                                                                                        |                                                                                               Default |
| - Group operator                                                                                                                    |                                                                                          Any of these |
| - Sensitivity labels                                                                                                                |                                                        OFFICIAL Sensitive (group)/Legislative Secrecy |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                                                 Message or attachment |
| Condition group **AND**                                                                                                             |                                                                                                       |
| **NOT**                                                                                                                             |                                                                                                       |
| **Conditions**                                                                                                                      |                                                                                                       |
| Header matches patterns                                                                                                             | X-Protective-Marking<br>`SEC=OFFICIAL:Sensitive(?!\u002C CAVEAT=).*\u002C ACCESS=Legislative-Secrecy` |
| **Actions**                                                                                                                         |                                                                                                       |
| Set headers                                                                                                                         |     `X-Protective-Marking: VER=2024.1, NS=gov.au, SEC=OFFICIAL:Sensitive, ACCESS=Legislative-Secrecy` |
| **User notifications**                                                                                                              |                                                                                                       |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                                                   Off |
| **Incident reports**                                                                                                                |                                                                                                       |
| Use this severity level in admin alerts and reports:                                                                                |                                                                                                   Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                                                   Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                                                   Off |
| **Additional options**                                                                                                              |                                                                                                       |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                                           Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                                                   Off |
| Priority                                                                                                                            |                                                                                                    10 |

##### Mark OS LS subject

| Item                                                                                                                                |                                                                    Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | -----------------------------------------------------------------------: |
| Name                                                                                                                                |                                                       Mark OS LS subject |
| Description                                                                                                                         |                                                                   *None* |
| **Conditions**                                                                                                                      |                                                                          |
| Content contains                                                                                                                    |                                                                          |
| - Group name                                                                                                                        |                                                                  Default |
| - Group operator                                                                                                                    |                                                             Any of these |
| - Sensitivity labels                                                                                                                |                           OFFICIAL Sensitive (group)/Legislative Secrecy |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                    Message or attachment |
| **Actions**                                                                                                                         |                                                                          |
| Modify subject                                                                                                                      |                                                                          |
| - Remove text that matches                                                                                                          |                                                        `\s*?\[SEC=.*?\]` |
| - Insert this replacement text                                                                                                      | &nbsp;`[SEC=OFFICIAL:Sensitive, ACCESS=Legislative-Secrecy]`<sup>1</sup> |
| - Position                                                                                                                          |                    Remove matches and append replacement text to subject |
| **User notifications**                                                                                                              |                                                                          |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                      Off |
| **Incident reports**                                                                                                                |                                                                          |
| Use this severity level in admin alerts and reports:                                                                                |                                                                      Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                      Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                      Off |
| **Additional options**                                                                                                              |                                                                          |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                              Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                      Off |
| Priority                                                                                                                            |                                                                       11 |

##### Mark OS NC X-header

| Item                                                                                                                                |                                                                                                                 Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                                                                   Mark OS NC X-header |
| Description                                                                                                                         |                                                                                                                *None* |
| **Conditions**                                                                                                                      |                                                                                                                       |
| Content contains                                                                                                                    |                                                                                                                       |
| - Group name                                                                                                                        |                                                                                                               Default |
| - Group operator                                                                                                                    |                                                                                                          Any of these |
| - Sensitivity labels                                                                                                                |                                       OFFICIAL Sensitive NATIONAL CABINET (group)/OFFICIAL Sensitive NATIONAL CABINET |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                                                                 Message or attachment |
| Condition group **AND**                                                                                                             |                                                                                                                       |
| **NOT**                                                                                                                             |                                                                                                                       |
| **Conditions**                                                                                                                      |                                                                                                                       |
| Header matches patterns                                                                                                             | X-Protective-Marking<br>`SEC=OFFICIAL:Sensitive\u002C CAVEAT=SH:NATIONAL-CABINET(?![a-zA-Z\u002C= /]*\u002C ACCESS=)` |
| **Actions**                                                                                                                         |                                                                                                                       |
| Set headers                                                                                                                         |                     `X-Protective-Marking: VER=2024.1, NS=gov.au, SEC=OFFICIAL:Sensitive, CAVEAT=SH:NATIONAL-CABINET` |
| **User notifications**                                                                                                              |                                                                                                                       |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                                                                   Off |
| **Incident reports**                                                                                                                |                                                                                                                       |
| Use this severity level in admin alerts and reports:                                                                                |                                                                                                                   Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                                                                   Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                                                                   Off |
| **Additional options**                                                                                                              |                                                                                                                       |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                                                           Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                                                                   Off |
| Priority                                                                                                                            |                                                                                                                    12 |

##### Mark OS NC subject

| Item                                                                                                                                |                                                                           Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                              Mark OS NC subject |
| Description                                                                                                                         |                                                                          *None* |
| **Conditions**                                                                                                                      |                                                                                 |
| Content contains                                                                                                                    |                                                                                 |
| - Group name                                                                                                                        |                                                                         Default |
| - Group operator                                                                                                                    |                                                                    Any of these |
| - Sensitivity labels                                                                                                                | OFFICIAL Sensitive NATIONAL CABINET (group)/OFFICIAL Sensitive NATIONAL CABINET |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                           Message or attachment |
| **Actions**                                                                                                                         |                                                                                 |
| Modify subject                                                                                                                      |                                                                                 |
| - Remove text that matches                                                                                                          |                                                               `\s*?\[SEC=.*?\]` |
| - Insert this replacement text                                                                                                      |        &nbsp;`[SEC=OFFICIAL:Sensitive, CAVEAT=SH:NATIONAL-CABINET]`<sup>1</sup> |
| - Position                                                                                                                          |                           Remove matches and append replacement text to subject |
| **User notifications**                                                                                                              |                                                                                 |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                             Off |
| **Incident reports**                                                                                                                |                                                                                 |
| Use this severity level in admin alerts and reports:                                                                                |                                                                             Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                             Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                             Off |
| **Additional options**                                                                                                              |                                                                                 |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                     Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                             Off |
| Priority                                                                                                                            |                                                                              13 |

##### Mark OS NC PP X-header

| Item                                                                                                                                |                                                                                                                      Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                                                                     Mark OS NC PP X-header |
| Description                                                                                                                         |                                                                                                                     *None* |
| **Conditions**                                                                                                                      |                                                                                                                            |
| Content contains                                                                                                                    |                                                                                                                            |
| - Group name                                                                                                                        |                                                                                                                    Default |
| - Group operator                                                                                                                    |                                                                                                               Any of these |
| - Sensitivity labels                                                                                                                |                                                               OFFICIAL Sensitive NATIONAL CABINET (group)/Personal Privacy |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                                                                      Message or attachment |
| Condition group **AND**                                                                                                             |                                                                                                                            |
| **NOT**                                                                                                                             |                                                                                                                            |
| **Conditions**                                                                                                                      |                                                                                                                            |
| Header matches patterns                                                                                                             |          X-Protective-Marking<br>`SEC=OFFICIAL:Sensitive\u002C CAVEAT=SH:NATIONAL-CABINET.*\u002C ACCESS=Personal-Privacy` |
| **Actions**                                                                                                                         |                                                                                                                            |
| Set headers                                                                                                                         | `X-Protective-Marking: VER=2024.1, NS=gov.au, SEC=OFFICIAL:Sensitive, CAVEAT=SH:NATIONAL-CABINET, ACCESS=Personal-Privacy` |
| **User notifications**                                                                                                              |                                                                                                                            |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                                                                        Off |
| **Incident reports**                                                                                                                |                                                                                                                            |
| Use this severity level in admin alerts and reports:                                                                                |                                                                                                                        Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                                                                        Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                                                                        Off |
| **Additional options**                                                                                                              |                                                                                                                            |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                                                                Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                                                                        Off |
| Priority                                                                                                                            |                                                                                                                         14 |

##### Mark OS NC PP subject

| Item                                                                                                                                |                                                                                             Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                                             Mark OS NC PP subject |
| Description                                                                                                                         |                                                                                            *None* |
| **Conditions**                                                                                                                      |                                                                                                   |
| Content contains                                                                                                                    |                                                                                                   |
| - Group name                                                                                                                        |                                                                                           Default |
| - Group operator                                                                                                                    |                                                                                      Any of these |
| - Sensitivity labels                                                                                                                |                                      OFFICIAL Sensitive NATIONAL CABINET (group)/Personal Privacy |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                                             Message or attachment |
| **Actions**                                                                                                                         |                                                                                                   |
| Modify subject                                                                                                                      |                                                                                                   |
| - Remove text that matches                                                                                                          |                                                                                 `\s*?\[SEC=.*?\]` |
| - Insert this replacement text                                                                                                      | &nbsp;`[SEC=OFFICIAL:Sensitive, CAVEAT=SH:NATIONAL-CABINET, ACCESS=Personal-Privacy]`<sup>1</sup> |
| - Position                                                                                                                          |                                             Remove matches and append replacement text to subject |
| **User notifications**                                                                                                              |                                                                                                   |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                                               Off |
| **Incident reports**                                                                                                                |                                                                                                   |
| Use this severity level in admin alerts and reports:                                                                                |                                                                                               Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                                               Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                                               Off |
| **Additional options**                                                                                                              |                                                                                                   |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                                       Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                                               Off |
| Priority                                                                                                                            |                                                                                                15 |

##### Mark OS NC LP X-header

| Item                                                                                                                                |                                                                                                                     Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                                                                    Mark OS NC LP X-header |
| Description                                                                                                                         |                                                                                                                    *None* |
| **Conditions**                                                                                                                      |                                                                                                                           |
| Content contains                                                                                                                    |                                                                                                                           |
| - Group name                                                                                                                        |                                                                                                                   Default |
| - Group operator                                                                                                                    |                                                                                                              Any of these |
| - Sensitivity labels                                                                                                                |                                                               OFFICIAL Sensitive NATIONAL CABINET (group)/Legal Privilege |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                                                                     Message or attachment |
| Condition group **AND**                                                                                                             |                                                                                                                           |
| **NOT**                                                                                                                             |                                                                                                                           |
| **Conditions**                                                                                                                      |                                                                                                                           |
| Header matches patterns                                                                                                             |          X-Protective-Marking<br>`SEC=OFFICIAL:Sensitive\u002C CAVEAT=SH:NATIONAL-CABINET.*\u002C ACCESS=Legal-Privilege` |
| **Actions**                                                                                                                         |                                                                                                                           |
| Set headers                                                                                                                         | `X-Protective-Marking: VER=2024.1, NS=gov.au, SEC=OFFICIAL:Sensitive, CAVEAT=SH:NATIONAL-CABINET, ACCESS=Legal-Privilege` |
| **User notifications**                                                                                                              |                                                                                                                           |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                                                                       Off |
| **Incident reports**                                                                                                                |                                                                                                                           |
| Use this severity level in admin alerts and reports:                                                                                |                                                                                                                       Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                                                                       Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                                                                       Off |
| **Additional options**                                                                                                              |                                                                                                                           |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                                                               Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                                                                       Off |
| Priority                                                                                                                            |                                                                                                                        16 |

##### Mark OS NC LP subject

| Item                                                                                                                                |                                                                                            Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | -----------------------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                                            Mark OS NC LP subject |
| Description                                                                                                                         |                                                                                           *None* |
| **Conditions**                                                                                                                      |                                                                                                  |
| Content contains                                                                                                                    |                                                                                                  |
| - Group name                                                                                                                        |                                                                                          Default |
| - Group operator                                                                                                                    |                                                                                     Any of these |
| - Sensitivity labels                                                                                                                |                                      OFFICIAL Sensitive NATIONAL CABINET (group)/Legal Privilege |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                                            Message or attachment |
| **Actions**                                                                                                                         |                                                                                                  |
| Modify subject                                                                                                                      |                                                                                                  |
| - Remove text that matches                                                                                                          |                                                                                `\s*?\[SEC=.*?\]` |
| - Insert this replacement text                                                                                                      | &nbsp;`[SEC=OFFICIAL:Sensitive, CAVEAT=SH:NATIONAL-CABINET, ACCESS=Legal-Privilege]`<sup>1</sup> |
| - Position                                                                                                                          |                                            Remove matches and append replacement text to subject |
| **User notifications**                                                                                                              |                                                                                                  |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                                              Off |
| **Incident reports**                                                                                                                |                                                                                                  |
| Use this severity level in admin alerts and reports:                                                                                |                                                                                              Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                                              Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                                              Off |
| **Additional options**                                                                                                              |                                                                                                  |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                                      Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                                              Off |
| Priority                                                                                                                            |                                                                                               17 |

##### Mark OS NC LS X-header

| Item                                                                                                                                |                                                                                                                         Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                                                                        Mark OS NC LS X-header |
| Description                                                                                                                         |                                                                                                                        *None* |
| **Conditions**                                                                                                                      |                                                                                                                               |
| Content contains                                                                                                                    |                                                                                                                               |
| - Group name                                                                                                                        |                                                                                                                       Default |
| - Group operator                                                                                                                    |                                                                                                                  Any of these |
| - Sensitivity labels                                                                                                                |                                                               OFFICIAL Sensitive NATIONAL CABINET (group)/Legislative Secrecy |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                                                                         Message or attachment |
| Condition group **AND**                                                                                                             |                                                                                                                               |
| **NOT**                                                                                                                             |                                                                                                                               |
| **Conditions**                                                                                                                      |                                                                                                                               |
| Header matches patterns                                                                                                             |          X-Protective-Marking<br>`SEC=OFFICIAL:Sensitive\u002C CAVEAT=SH:NATIONAL-CABINET.*\u002C ACCESS=Legislative-Secrecy` |
| **Actions**                                                                                                                         |                                                                                                                               |
| Set headers                                                                                                                         | `X-Protective-Marking: VER=2024.1, NS=gov.au, SEC=OFFICIAL:Sensitive, CAVEAT=SH:NATIONAL-CABINET, ACCESS=Legislative-Secrecy` |
| **User notifications**                                                                                                              |                                                                                                                               |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                                                                           Off |
| **Incident reports**                                                                                                                |                                                                                                                               |
| Use this severity level in admin alerts and reports:                                                                                |                                                                                                                           Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                                                                           Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                                                                           Off |
| **Additional options**                                                                                                              |                                                                                                                               |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                                                                   Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                                                                           Off |
| Priority                                                                                                                            |                                                                                                                            18 |

##### Mark OS NC LS subject

| Item                                                                                                                                |                                                                                                Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                                                Mark OS NC LS subject |
| Description                                                                                                                         |                                                                                               *None* |
| **Conditions**                                                                                                                      |                                                                                                      |
| Content contains                                                                                                                    |                                                                                                      |
| - Group name                                                                                                                        |                                                                                              Default |
| - Group operator                                                                                                                    |                                                                                         Any of these |
| - Sensitivity labels                                                                                                                |                                      OFFICIAL Sensitive NATIONAL CABINET (group)/Legislative Secrecy |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                                                Message or attachment |
| **Actions**                                                                                                                         |                                                                                                      |
| Modify subject                                                                                                                      |                                                                                                      |
| - Remove text that matches                                                                                                          |                                                                                    `\s*?\[SEC=.*?\]` |
| - Insert this replacement text                                                                                                      | &nbsp;`[SEC=OFFICIAL:Sensitive, CAVEAT=SH:NATIONAL-CABINET, ACCESS=Legislative-Secrecy]`<sup>1</sup> |
| - Position                                                                                                                          |                                                Remove matches and append replacement text to subject |
| **User notifications**                                                                                                              |                                                                                                      |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                                                  Off |
| **Incident reports**                                                                                                                |                                                                                                      |
| Use this severity level in admin alerts and reports:                                                                                |                                                                                                  Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                                                  Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                                                  Off |
| **Additional options**                                                                                                              |                                                                                                      |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                                          Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                                                  Off |
| Priority                                                                                                                            |                                                                                                   19 |

##### Mark PROTECTED X-header

| Item                                                                                                                                |                                                                                       Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                                     Mark PROTECTED X-header |
| Description                                                                                                                         |                                                                                      *None* |
| **Conditions**                                                                                                                      |                                                                                             |
| Content contains                                                                                                                    |                                                                                             |
| - Group name                                                                                                                        |                                                                                     Default |
| - Group operator                                                                                                                    |                                                                                Any of these |
| - Sensitivity labels                                                                                                                |                                                                 PROTECTED (group)/PROTECTED |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                                       Message or attachment |
| Condition group **AND**                                                                                                             |                                                                                             |
| **NOT**                                                                                                                             |                                                                                             |
| **Conditions**                                                                                                                      |                                                                                             |
| Header matches patterns                                                                                                             | X-Protective-Marking<br>`SEC=PROTECTED(?!\u002C CAVEAT=\|[a-zA-Z\u002C= /]*\u002C ACCESS=)` |
| **Actions**                                                                                                                         |                                                                                             |
| Set headers                                                                                                                         |                                `X-Protective-Marking: VER=2024.1, NS=gov.au, SEC=PROTECTED` |
| **User notifications**                                                                                                              |                                                                                             |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                                         Off |
| **Incident reports**                                                                                                                |                                                                                             |
| Use this severity level in admin alerts and reports:                                                                                |                                                                                         Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                                         Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                                         Off |
| **Additional options**                                                                                                              |                                                                                             |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                                 Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                                         Off |
| Priority                                                                                                                            |                                                                                          20 |

##### Mark PROTECTED subject

| Item                                                                                                                                |                                                 Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------: |
| Name                                                                                                                                |                                Mark PROTECTED subject |
| Description                                                                                                                         |                                                *None* |
| **Conditions**                                                                                                                      |                                                       |
| Content contains                                                                                                                    |                                                       |
| - Group name                                                                                                                        |                                               Default |
| - Group operator                                                                                                                    |                                          Any of these |
| - Sensitivity labels                                                                                                                |                           PROTECTED (group)/PROTECTED |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                 Message or attachment |
| **Actions**                                                                                                                         |                                                       |
| Modify subject                                                                                                                      |                                                       |
| - Remove text that matches                                                                                                          |                                     `\s*?\[SEC=.*?\]` |
| - Insert this replacement text                                                                                                      |                   &nbsp;`[SEC=PROTECTED]`<sup>1</sup> |
| - Position                                                                                                                          | Remove matches and append replacement text to subject |
| **User notifications**                                                                                                              |                                                       |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                   Off |
| **Incident reports**                                                                                                                |                                                       |
| Use this severity level in admin alerts and reports:                                                                                |                                                   Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                   Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                   Off |
| **Additional options**                                                                                                              |                                                       |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                           Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                   Off |
| Priority                                                                                                                            |                                                    21 |

##### Mark P PP X-header

| Item                                                                                                                                |                                                                                    Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                                       Mark P PP X-header |
| Description                                                                                                                         |                                                                                   *None* |
| **Conditions**                                                                                                                      |                                                                                          |
| Content contains                                                                                                                    |                                                                                          |
| - Group name                                                                                                                        |                                                                                  Default |
| - Group operator                                                                                                                    |                                                                             Any of these |
| - Sensitivity labels                                                                                                                |                                                       PROTECTED (group)/Personal Privacy |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                                    Message or attachment |
| Condition group **AND**                                                                                                             |                                                                                          |
| **NOT**                                                                                                                             |                                                                                          |
| **Conditions**                                                                                                                      |                                                                                          |
| Header matches patterns                                                                                                             | X-Protective-Marking<br>`SEC=PROTECTED(?!\u002C CAVEAT).*\u002C ACCESS=Personal-Privacy` |
| **Actions**                                                                                                                         |                                                                                          |
| Set headers                                                                                                                         |    `X-Protective-Marking: VER=2024.1, NS=gov.au, SEC=PROTECTED, ACCESS=Personal-Privacy` |
| **User notifications**                                                                                                              |                                                                                          |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                                      Off |
| **Incident reports**                                                                                                                |                                                                                          |
| Use this severity level in admin alerts and reports:                                                                                |                                                                                      Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                                      Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                                      Off |
| **Additional options**                                                                                                              |                                                                                          |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                              Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                                      Off |
| Priority                                                                                                                            |                                                                                       22 |

##### Mark P PP subject

| Item                                                                                                                                |                                                        Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | -----------------------------------------------------------: |
| Name                                                                                                                                |                                            Mark P PP subject |
| Description                                                                                                                         |                                                       *None* |
| **Conditions**                                                                                                                      |                                                              |
| Content contains                                                                                                                    |                                                              |
| - Group name                                                                                                                        |                                                      Default |
| - Group operator                                                                                                                    |                                                 Any of these |
| - Sensitivity labels                                                                                                                |                           PROTECTED (group)/Personal Privacy |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                        Message or attachment |
| **Actions**                                                                                                                         |                                                              |
| Modify subject                                                                                                                      |                                                              |
| - Remove text that matches                                                                                                          |                                            `\s*?\[SEC=.*?\]` |
| - Insert this replacement text                                                                                                      | &nbsp;`[SEC=PROTECTED, ACCESS=Personal-Privacy]`<sup>1</sup> |
| - Position                                                                                                                          |        Remove matches and append replacement text to subject |
| **User notifications**                                                                                                              |                                                              |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                          Off |
| **Incident reports**                                                                                                                |                                                              |
| Use this severity level in admin alerts and reports:                                                                                |                                                          Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                          Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                          Off |
| **Additional options**                                                                                                              |                                                              |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                  Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                          Off |
| Priority                                                                                                                            |                                                           23 |

##### Mark P LP X-header

| Item                                                                                                                                |                                                                                   Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                                      Mark P LP X-header |
| Description                                                                                                                         |                                                                                  *None* |
| **Conditions**                                                                                                                      |                                                                                         |
| Content contains                                                                                                                    |                                                                                         |
| - Group name                                                                                                                        |                                                                                 Default |
| - Group operator                                                                                                                    |                                                                            Any of these |
| - Sensitivity labels                                                                                                                |                                                       PROTECTED (group)/Legal Privilege |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                                   Message or attachment |
| Condition group **AND**                                                                                                             |                                                                                         |
| **NOT**                                                                                                                             |                                                                                         |
| **Conditions**                                                                                                                      |                                                                                         |
| Header matches patterns                                                                                                             | X-Protective-Marking<br>`SEC=PROTECTED(?!\u002C CAVEAT).*\u002C ACCESS=Legal-Privilege` |
| **Actions**                                                                                                                         |                                                                                         |
| Set headers                                                                                                                         |    `X-Protective-Marking: VER=2024.1, NS=gov.au, SEC=PROTECTED, ACCESS=Legal-Privilege` |
| **User notifications**                                                                                                              |                                                                                         |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                                     Off |
| **Incident reports**                                                                                                                |                                                                                         |
| Use this severity level in admin alerts and reports:                                                                                |                                                                                     Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                                     Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                                     Off |
| **Additional options**                                                                                                              |                                                                                         |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                             Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                                     Off |
| Priority                                                                                                                            |                                                                                      24 |

##### Mark P LP subject

| Item                                                                                                                                |                                                       Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------: |
| Name                                                                                                                                |                                           Mark P LP subject |
| Description                                                                                                                         |                                                      *None* |
| **Conditions**                                                                                                                      |                                                             |
| Content contains                                                                                                                    |                                                             |
| - Group name                                                                                                                        |                                                     Default |
| - Group operator                                                                                                                    |                                                Any of these |
| - Sensitivity labels                                                                                                                |                           PROTECTED (group)/Legal Privilege |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                       Message or attachment |
| **Actions**                                                                                                                         |                                                             |
| Modify subject                                                                                                                      |                                                             |
| - Remove text that matches                                                                                                          |                                           `\s*?\[SEC=.*?\]` |
| - Insert this replacement text                                                                                                      | &nbsp;`[SEC=PROTECTED, ACCESS=Legal-Privilege]`<sup>1</sup> |
| - Position                                                                                                                          |       Remove matches and append replacement text to subject |
| **User notifications**                                                                                                              |                                                             |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                         Off |
| **Incident reports**                                                                                                                |                                                             |
| Use this severity level in admin alerts and reports:                                                                                |                                                         Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                         Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                         Off |
| **Additional options**                                                                                                              |                                                             |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                 Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                         Off |
| Priority                                                                                                                            |                                                          25 |

##### Mark P LS X-header

| Item                                                                                                                                |                                                                                       Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                                          Mark P LS X-header |
| Description                                                                                                                         |                                                                                      *None* |
| **Conditions**                                                                                                                      |                                                                                             |
| Content contains                                                                                                                    |                                                                                             |
| - Group name                                                                                                                        |                                                                                     Default |
| - Group operator                                                                                                                    |                                                                                Any of these |
| - Sensitivity labels                                                                                                                |                                                       PROTECTED (group)/Legislative Secrecy |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                                       Message or attachment |
| Condition group **AND**                                                                                                             |                                                                                             |
| **NOT**                                                                                                                             |                                                                                             |
| **Conditions**                                                                                                                      |                                                                                             |
| Header matches patterns                                                                                                             | X-Protective-Marking<br>`SEC=PROTECTED(?!\u002C CAVEAT).*\u002C ACCESS=Legislative-Secrecy` |
| **Actions**                                                                                                                         |                                                                                             |
| Set headers                                                                                                                         |    `X-Protective-Marking: VER=2024.1, NS=gov.au, SEC=PROTECTED, ACCESS=Legislative-Secrecy` |
| **User notifications**                                                                                                              |                                                                                             |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                                         Off |
| **Incident reports**                                                                                                                |                                                                                             |
| Use this severity level in admin alerts and reports:                                                                                |                                                                                         Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                                         Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                                         Off |
| **Additional options**                                                                                                              |                                                                                             |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                                 Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                                         Off |
| Priority                                                                                                                            |                                                                                          26 |

##### Mark P LS subject

| Item                                                                                                                                |                                                           Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------: |
| Name                                                                                                                                |                                               Mark P LS subject |
| Description                                                                                                                         |                                                          *None* |
| **Conditions**                                                                                                                      |                                                                 |
| Content contains                                                                                                                    |                                                                 |
| - Group name                                                                                                                        |                                                         Default |
| - Group operator                                                                                                                    |                                                    Any of these |
| - Sensitivity labels                                                                                                                |                           PROTECTED (group)/Legislative Secrecy |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                           Message or attachment |
| **Actions**                                                                                                                         |                                                                 |
| Modify subject                                                                                                                      |                                                                 |
| - Remove text that matches                                                                                                          |                                               `\s*?\[SEC=.*?\]` |
| - Insert this replacement text                                                                                                      | &nbsp;`[SEC=PROTECTED, ACCESS=Legislative-Secrecy]`<sup>1</sup> |
| - Position                                                                                                                          |           Remove matches and append replacement text to subject |
| **User notifications**                                                                                                              |                                                                 |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                             Off |
| **Incident reports**                                                                                                                |                                                                 |
| Use this severity level in admin alerts and reports:                                                                                |                                                             Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                             Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                             Off |
| **Additional options**                                                                                                              |                                                                 |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                     Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                             Off |
| Priority                                                                                                                            |                                                              27 |

##### Mark P NC X-header

| Item                                                                                                                                |                                                                                                        Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | -----------------------------------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                                                           Mark P NC X-header |
| Description                                                                                                                         |                                                                                                       *None* |
| **Conditions**                                                                                                                      |                                                                                                              |
| Content contains                                                                                                                    |                                                                                                              |
| - Group name                                                                                                                        |                                                                                                      Default |
| - Group operator                                                                                                                    |                                                                                                 Any of these |
| - Sensitivity labels                                                                                                                |                                                PROTECTED NATIONAL CABINET (group)/PROTECTED NATIONAL CABINET |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                                                        Message or attachment |
| Condition group **AND**                                                                                                             |                                                                                                              |
| **NOT**                                                                                                                             |                                                                                                              |
| **Conditions**                                                                                                                      |                                                                                                              |
| Header matches patterns                                                                                                             | X-Protective-Marking<br>`SEC=PROTECTED\u002C CAVEAT=SH:NATIONAL-CABINET(?![a-zA-Z\u002C= /]*\u002C ACCESS=)` |
| **Actions**                                                                                                                         |                                                                                                              |
| Set headers                                                                                                                         |                     `X-Protective-Marking: VER=2024.1, NS=gov.au, SEC=PROTECTED, CAVEAT=SH:NATIONAL-CABINET` |
| **User notifications**                                                                                                              |                                                                                                              |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                                                          Off |
| **Incident reports**                                                                                                                |                                                                                                              |
| Use this severity level in admin alerts and reports:                                                                                |                                                                                                          Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                                                          Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                                                          Off |
| **Additional options**                                                                                                              |                                                                                                              |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                                                  Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                                                          Off |
| Priority                                                                                                                            |                                                                                                           28 |

##### Mark P NC subject

| Item                                                                                                                                |                                                           Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------: |
| Name                                                                                                                                |                                               Mark P NC subject |
| Description                                                                                                                         |                                                          *None* |
| **Conditions**                                                                                                                      |                                                                 |
| Content contains                                                                                                                    |                                                                 |
| - Group name                                                                                                                        |                                                         Default |
| - Group operator                                                                                                                    |                                                    Any of these |
| - Sensitivity labels                                                                                                                |   PROTECTED NATIONAL CABINET (group)/PROTECTED NATIONAL CABINET |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                           Message or attachment |
| **Actions**                                                                                                                         |                                                                 |
| Modify subject                                                                                                                      |                                                                 |
| - Remove text that matches                                                                                                          |                                               `\s*?\[SEC=.*?\]` |
| - Insert this replacement text                                                                                                      | &nbsp;`[SEC=PROTECTED, CAVEAT=SH:NATIONAL-CABINET]`<sup>1</sup> |
| - Position                                                                                                                          |           Remove matches and append replacement text to subject |
| **User notifications**                                                                                                              |                                                                 |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                             Off |
| **Incident reports**                                                                                                                |                                                                 |
| Use this severity level in admin alerts and reports:                                                                                |                                                             Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                             Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                             Off |
| **Additional options**                                                                                                              |                                                                 |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                     Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                             Off |
| Priority                                                                                                                            |                                                              29 |

##### Mark P NC PP X-header

| Item                                                                                                                                |                                                                                                             Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                                                             Mark P NC PP X-header |
| Description                                                                                                                         |                                                                                                            *None* |
| **Conditions**                                                                                                                      |                                                                                                                   |
| Content contains                                                                                                                    |                                                                                                                   |
| - Group name                                                                                                                        |                                                                                                           Default |
| - Group operator                                                                                                                    |                                                                                                      Any of these |
| - Sensitivity labels                                                                                                                |                                                               PROTECTED NATIONAL CABINET (group)/Personal Privacy |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                                                             Message or attachment |
| Condition group **AND**                                                                                                             |                                                                                                                   |
| **NOT**                                                                                                                             |                                                                                                                   |
| **Conditions**                                                                                                                      |                                                                                                                   |
| Header matches patterns                                                                                                             |          X-Protective-Marking<br>`SEC=PROTECTED\u002C CAVEAT=SH:NATIONAL-CABINET.*\u002C ACCESS=Personal-Privacy` |
| **Actions**                                                                                                                         |                                                                                                                   |
| Set headers                                                                                                                         | `X-Protective-Marking: VER=2024.1, NS=gov.au, SEC=PROTECTED, CAVEAT=SH:NATIONAL-CABINET, ACCESS=Personal-Privacy` |
| **User notifications**                                                                                                              |                                                                                                                   |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                                                               Off |
| **Incident reports**                                                                                                                |                                                                                                                   |
| Use this severity level in admin alerts and reports:                                                                                |                                                                                                               Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                                                               Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                                                               Off |
| **Additional options**                                                                                                              |                                                                                                                   |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                                                       Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                                                               Off |
| Priority                                                                                                                            |                                                                                                                30 |

##### Mark P NC PP subject

| Item                                                                                                                                |                                                                                    Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                                     Mark P NC PP subject |
| Description                                                                                                                         |                                                                                   *None* |
| **Conditions**                                                                                                                      |                                                                                          |
| Content contains                                                                                                                    |                                                                                          |
| - Group name                                                                                                                        |                                                                                  Default |
| - Group operator                                                                                                                    |                                                                             Any of these |
| - Sensitivity labels                                                                                                                |                                      PROTECTED NATIONAL CABINET (group)/Personal Privacy |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                                    Message or attachment |
| **Actions**                                                                                                                         |                                                                                          |
| Modify subject                                                                                                                      |                                                                                          |
| - Remove text that matches                                                                                                          |                                                                        `\s*?\[SEC=.*?\]` |
| - Insert this replacement text                                                                                                      | &nbsp;`[SEC=PROTECTED, CAVEAT=SH:NATIONAL-CABINET, ACCESS=Personal-Privacy]`<sup>1</sup> |
| - Position                                                                                                                          |                                    Remove matches and append replacement text to subject |
| **User notifications**                                                                                                              |                                                                                          |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                                      Off |
| **Incident reports**                                                                                                                |                                                                                          |
| Use this severity level in admin alerts and reports:                                                                                |                                                                                      Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                                      Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                                      Off |
| **Additional options**                                                                                                              |                                                                                          |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                              Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                                      Off |
| Priority                                                                                                                            |                                                                                       31 |

##### Mark P NC LP X-header

| Item                                                                                                                                |                                                                                                            Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                                                            Mark P NC LP X-header |
| Description                                                                                                                         |                                                                                                           *None* |
| **Conditions**                                                                                                                      |                                                                                                                  |
| Content contains                                                                                                                    |                                                                                                                  |
| - Group name                                                                                                                        |                                                                                                          Default |
| - Group operator                                                                                                                    |                                                                                                     Any of these |
| - Sensitivity labels                                                                                                                |                                                               PROTECTED NATIONAL CABINET (group)/Legal Privilege |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                                                            Message or attachment |
| Condition group **AND**                                                                                                             |                                                                                                                  |
| **NOT**                                                                                                                             |                                                                                                                  |
| **Conditions**                                                                                                                      |                                                                                                                  |
| Header matches patterns                                                                                                             |          X-Protective-Marking<br>`SEC=PROTECTED\u002C CAVEAT=SH:NATIONAL-CABINET.*\u002C ACCESS=Legal-Privilege` |
| **Actions**                                                                                                                         |                                                                                                                  |
| Set headers                                                                                                                         | `X-Protective-Marking: VER=2024.1, NS=gov.au, SEC=PROTECTED, CAVEAT=SH:NATIONAL-CABINET, ACCESS=Legal-Privilege` |
| **User notifications**                                                                                                              |                                                                                                                  |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                                                              Off |
| **Incident reports**                                                                                                                |                                                                                                                  |
| Use this severity level in admin alerts and reports:                                                                                |                                                                                                              Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                                                              Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                                                              Off |
| **Additional options**                                                                                                              |                                                                                                                  |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                                                      Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                                                              Off |
| Priority                                                                                                                            |                                                                                                               32 |

##### Mark P NC LP subject

| Item                                                                                                                                |                                                                                   Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                                    Mark P NC LP subject |
| Description                                                                                                                         |                                                                                  *None* |
| **Conditions**                                                                                                                      |                                                                                         |
| Content contains                                                                                                                    |                                                                                         |
| - Group name                                                                                                                        |                                                                                 Default |
| - Group operator                                                                                                                    |                                                                            Any of these |
| - Sensitivity labels                                                                                                                |                                      PROTECTED NATIONAL CABINET (group)/Legal Privilege |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                                   Message or attachment |
| **Actions**                                                                                                                         |                                                                                         |
| Modify subject                                                                                                                      |                                                                                         |
| - Remove text that matches                                                                                                          |                                                                       `\s*?\[SEC=.*?\]` |
| - Insert this replacement text                                                                                                      | &nbsp;`[SEC=PROTECTED, CAVEAT=SH:NATIONAL-CABINET, ACCESS=Legal-Privilege]`<sup>1</sup> |
| - Position                                                                                                                          |                                   Remove matches and append replacement text to subject |
| **User notifications**                                                                                                              |                                                                                         |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                                     Off |
| **Incident reports**                                                                                                                |                                                                                         |
| Use this severity level in admin alerts and reports:                                                                                |                                                                                     Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                                     Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                                     Off |
| **Additional options**                                                                                                              |                                                                                         |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                             Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                                     Off |
| Priority                                                                                                                            |                                                                                      33 |

##### Mark P NC LS X-header

| Item                                                                                                                                |                                                                                                                Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                                                                Mark P NC LS X-header |
| Description                                                                                                                         |                                                                                                               *None* |
| **Conditions**                                                                                                                      |                                                                                                                      |
| Content contains                                                                                                                    |                                                                                                                      |
| - Group name                                                                                                                        |                                                                                                              Default |
| - Group operator                                                                                                                    |                                                                                                         Any of these |
| - Sensitivity labels                                                                                                                |                                                               PROTECTED NATIONAL CABINET (group)/Legislative Secrecy |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                                                                Message or attachment |
| Condition group **AND**                                                                                                             |                                                                                                                      |
| **NOT**                                                                                                                             |                                                                                                                      |
| **Conditions**                                                                                                                      |                                                                                                                      |
| Header matches patterns                                                                                                             |          X-Protective-Marking<br>`SEC=PROTECTED\u002C CAVEAT=SH:NATIONAL-CABINET.*\u002C ACCESS=Legislative-Secrecy` |
| **Actions**                                                                                                                         |                                                                                                                      |
| Set headers                                                                                                                         | `X-Protective-Marking: VER=2024.1, NS=gov.au, SEC=PROTECTED, CAVEAT=SH:NATIONAL-CABINET, ACCESS=Legislative-Secrecy` |
| **User notifications**                                                                                                              |                                                                                                                      |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                                                                  Off |
| **Incident reports**                                                                                                                |                                                                                                                      |
| Use this severity level in admin alerts and reports:                                                                                |                                                                                                                  Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                                                                  Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                                                                  Off |
| **Additional options**                                                                                                              |                                                                                                                      |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                                                          Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                                                                  Off |
| Priority                                                                                                                            |                                                                                                                   34 |

##### Mark P NC LS subject

| Item                                                                                                                                |                                                                                       Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                                        Mark P NC LS subject |
| Description                                                                                                                         |                                                                                      *None* |
| **Conditions**                                                                                                                      |                                                                                             |
| Content contains                                                                                                                    |                                                                                             |
| - Group name                                                                                                                        |                                                                                     Default |
| - Group operator                                                                                                                    |                                                                                Any of these |
| - Sensitivity labels                                                                                                                |                                      PROTECTED NATIONAL CABINET (group)/Legislative Secrecy |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                                       Message or attachment |
| **Actions**                                                                                                                         |                                                                                             |
| Modify subject                                                                                                                      |                                                                                             |
| - Remove text that matches                                                                                                          |                                                                           `\s*?\[SEC=.*?\]` |
| - Insert this replacement text                                                                                                      | &nbsp;`[SEC=PROTECTED, CAVEAT=SH:NATIONAL-CABINET, ACCESS=Legislative-Secrecy]`<sup>1</sup> |
| - Position                                                                                                                          |                                       Remove matches and append replacement text to subject |
| **User notifications**                                                                                                              |                                                                                             |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                                         Off |
| **Incident reports**                                                                                                                |                                                                                             |
| Use this severity level in admin alerts and reports:                                                                                |                                                                                         Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                                         Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                                         Off |
| **Additional options**                                                                                                              |                                                                                             |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                                 Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                                         Off |
| Priority                                                                                                                            |                                                                                          35 |

##### Mark P C X-header

| Item                                                                                                                                |                                                                                               Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                                                   Mark P C X-header |
| Description                                                                                                                         |                                                                                              *None* |
| **Conditions**                                                                                                                      |                                                                                                     |
| Content contains                                                                                                                    |                                                                                                     |
| - Group name                                                                                                                        |                                                                                             Default |
| - Group operator                                                                                                                    |                                                                                        Any of these |
| - Sensitivity labels                                                                                                                |                                                        PROTECTED CABINET (group)/ PROTECTED CABINET |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                                               Message or attachment |
| Condition group **AND**                                                                                                             |                                                                                                     |
| **NOT**                                                                                                                             |                                                                                                     |
| **Conditions**                                                                                                                      |                                                                                                     |
| Header matches patterns                                                                                                             | X-Protective-Marking<br>`SEC=PROTECTED\u002C CAVEAT=SH:CABINET(?![a-zA-Z\u002C= /]*\u002C ACCESS=)` |
| **Actions**                                                                                                                         |                                                                                                     |
| Set headers                                                                                                                         |                     `X-Protective-Marking: VER=2024.1, NS=gov.au, SEC=PROTECTED, CAVEAT=SH:CABINET` |
| **User notifications**                                                                                                              |                                                                                                     |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                                                 Off |
| **Incident reports**                                                                                                                |                                                                                                     |
| Use this severity level in admin alerts and reports:                                                                                |                                                                                                 Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                                                 Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                                                 Off |
| **Additional options**                                                                                                              |                                                                                                     |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                                         Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                                                 Off |
| Priority                                                                                                                            |                                                                                                  36 |

##### Mark P C subject

| Item                                                                                                                                |                                                  Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | -----------------------------------------------------: |
| Name                                                                                                                                |                                       Mark P C subject |
| Description                                                                                                                         |                                                 *None* |
| **Conditions**                                                                                                                      |                                                        |
| Content contains                                                                                                                    |                                                        |
| - Group name                                                                                                                        |                                                Default |
| - Group operator                                                                                                                    |                                           Any of these |
| - Sensitivity labels                                                                                                                |            PROTECTED CABINET (group)/PROTECTED CABINET |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                  Message or attachment |
| **Actions**                                                                                                                         |                                                        |
| Modify subject                                                                                                                      |                                                        |
| - Remove text that matches                                                                                                          |                                      `\s*?\[SEC=.*?\]` |
| - Insert this replacement text                                                                                                      | &nbsp;`[SEC=PROTECTED, CAVEAT=SH:CABINET]`<sup>1</sup> |
| - Position                                                                                                                          |  Remove matches and append replacement text to subject |
| **User notifications**                                                                                                              |                                                        |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                    Off |
| **Incident reports**                                                                                                                |                                                        |
| Use this severity level in admin alerts and reports:                                                                                |                                                    Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                    Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                    Off |
| **Additional options**                                                                                                              |                                                        |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                            Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                    Off |
| Priority                                                                                                                            |                                                     37 |

##### Mark P C PP X-header

| Item                                                                                                                                |                                                                                                    Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                                                     Mark P C PP X-header |
| Description                                                                                                                         |                                                                                                   *None* |
| **Conditions**                                                                                                                      |                                                                                                          |
| Content contains                                                                                                                    |                                                                                                          |
| - Group name                                                                                                                        |                                                                                                  Default |
| - Group operator                                                                                                                    |                                                                                             Any of these |
| - Sensitivity labels                                                                                                                |                                                                PROTECTED CABINET(group)/Personal Privacy |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                                                    Message or attachment |
| Condition group **AND**                                                                                                             |                                                                                                          |
| **NOT**                                                                                                                             |                                                                                                          |
| **Conditions**                                                                                                                      |                                                                                                          |
| Header matches patterns                                                                                                             |          X-Protective-Marking<br>`SEC=PROTECTED\u002C CAVEAT=SH:CABINET.*\u002C ACCESS=Personal-Privacy` |
| **Actions**                                                                                                                         |                                                                                                          |
| Set headers                                                                                                                         | `X-Protective-Marking: VER=2024.1, NS=gov.au, SEC=PROTECTED, CAVEAT=SH:CABINET, ACCESS=Personal-Privacy` |
| **User notifications**                                                                                                              |                                                                                                          |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                                                      Off |
| **Incident reports**                                                                                                                |                                                                                                          |
| Use this severity level in admin alerts and reports:                                                                                |                                                                                                      Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                                                      Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                                                      Off |
| **Additional options**                                                                                                              |                                                                                                          |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                                              Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                                                      Off |
| Priority                                                                                                                            |                                                                                                       38 |

##### Mark P C PP subject

| Item                                                                                                                                |                                                                           Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                             Mark P C PP subject |
| Description                                                                                                                         |                                                                          *None* |
| **Conditions**                                                                                                                      |                                                                                 |
| Content contains                                                                                                                    |                                                                                 |
| - Group name                                                                                                                        |                                                                         Default |
| - Group operator                                                                                                                    |                                                                    Any of these |
| - Sensitivity labels                                                                                                                |                                      PROTECTED CABINET (group)/Personal Privacy |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                           Message or attachment |
| **Actions**                                                                                                                         |                                                                                 |
| Modify subject                                                                                                                      |                                                                                 |
| - Remove text that matches                                                                                                          |                                                               `\s*?\[SEC=.*?\]` |
| - Insert this replacement text                                                                                                      | &nbsp;`[SEC=PROTECTED, CAVEAT=SH:CABINET, ACCESS=Personal-Privacy]`<sup>1</sup> |
| - Position                                                                                                                          |                           Remove matches and append replacement text to subject |
| **User notifications**                                                                                                              |                                                                                 |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                             Off |
| **Incident reports**                                                                                                                |                                                                                 |
| Use this severity level in admin alerts and reports:                                                                                |                                                                             Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                             Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                             Off |
| **Additional options**                                                                                                              |                                                                                 |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                     Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                             Off |
| Priority                                                                                                                            |                                                                              39 |

##### Mark P C LP X-header

| Item                                                                                                                                |                                                                                                   Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                                                    Mark P C LP X-header |
| Description                                                                                                                         |                                                                                                  *None* |
| **Conditions**                                                                                                                      |                                                                                                         |
| Content contains                                                                                                                    |                                                                                                         |
| - Group name                                                                                                                        |                                                                                                 Default |
| - Group operator                                                                                                                    |                                                                                            Any of these |
| - Sensitivity labels                                                                                                                |                                                               PROTECTED CABINET (group)/Legal Privilege |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                                                   Message or attachment |
| Condition group **AND**                                                                                                             |                                                                                                         |
| **NOT**                                                                                                                             |                                                                                                         |
| **Conditions**                                                                                                                      |                                                                                                         |
| Header matches patterns                                                                                                             |          X-Protective-Marking<br>`SEC=PROTECTED\u002C CAVEAT=SH:CABINET.*\u002C ACCESS=Legal-Privilege` |
| **Actions**                                                                                                                         |                                                                                                         |
| Set headers                                                                                                                         | `X-Protective-Marking: VER=2024.1, NS=gov.au, SEC=PROTECTED, CAVEAT=SH:CABINET, ACCESS=Legal-Privilege` |
| **User notifications**                                                                                                              |                                                                                                         |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                                                     Off |
| **Incident reports**                                                                                                                |                                                                                                         |
| Use this severity level in admin alerts and reports:                                                                                |                                                                                                     Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                                                     Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                                                     Off |
| **Additional options**                                                                                                              |                                                                                                         |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                                             Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                                                     Off |
| Priority                                                                                                                            |                                                                                                      40 |

##### Mark P C LP subject

| Item                                                                                                                                |                                                                          Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | -----------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                            Mark P C LP subject |
| Description                                                                                                                         |                                                                         *None* |
| **Conditions**                                                                                                                      |                                                                                |
| Content contains                                                                                                                    |                                                                                |
| - Group name                                                                                                                        |                                                                        Default |
| - Group operator                                                                                                                    |                                                                   Any of these |
| - Sensitivity labels                                                                                                                |                                      PROTECTED CABINET (group)/Legal Privilege |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                          Message or attachment |
| **Actions**                                                                                                                         |                                                                                |
| Modify subject                                                                                                                      |                                                                                |
| - Remove text that matches                                                                                                          |                                                              `\s*?\[SEC=.*?\]` |
| - Insert this replacement text                                                                                                      | &nbsp;`[SEC=PROTECTED, CAVEAT=SH:CABINET, ACCESS=Legal-Privilege]`<sup>1</sup> |
| - Position                                                                                                                          |                          Remove matches and append replacement text to subject |
| **User notifications**                                                                                                              |                                                                                |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                            Off |
| **Incident reports**                                                                                                                |                                                                                |
| Use this severity level in admin alerts and reports:                                                                                |                                                                            Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                            Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                            Off |
| **Additional options**                                                                                                              |                                                                                |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                    Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                            Off |
| Priority                                                                                                                            |                                                                             41 |

##### Mark P C LS X-header

| Item                                                                                                                                |                                                                                                       Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                                                        Mark P C LS X-header |
| Description                                                                                                                         |                                                                                                      *None* |
| **Conditions**                                                                                                                      |                                                                                                             |
| Content contains                                                                                                                    |                                                                                                             |
| - Group name                                                                                                                        |                                                                                                     Default |
| - Group operator                                                                                                                    |                                                                                                Any of these |
| - Sensitivity labels                                                                                                                |                                                               PROTECTED CABINET (group)/Legislative Secrecy |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                                                       Message or attachment |
| Condition group **AND**                                                                                                             |                                                                                                             |
| **NOT**                                                                                                                             |                                                                                                             |
| **Conditions**                                                                                                                      |                                                                                                             |
| Header matches patterns                                                                                                             |          X-Protective-Marking<br>`SEC=PROTECTED\u002C CAVEAT=SH:CABINET.*\u002C ACCESS=Legislative-Secrecy` |
| **Actions**                                                                                                                         |                                                                                                             |
| Set headers                                                                                                                         | `X-Protective-Marking: VER=2024.1, NS=gov.au, SEC=PROTECTED, CAVEAT=SH:CABINET, ACCESS=Legislative-Secrecy` |
| **User notifications**                                                                                                              |                                                                                                             |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                                                         Off |
| **Incident reports**                                                                                                                |                                                                                                             |
| Use this severity level in admin alerts and reports:                                                                                |                                                                                                         Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                                                         Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                                                         Off |
| **Additional options**                                                                                                              |                                                                                                             |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                                                 Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                                                         Off |
| Priority                                                                                                                            |                                                                                                          42 |

##### Mark P C LS subject

| Item                                                                                                                                |                                                                              Value |
| ----------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------: |
| Name                                                                                                                                |                                                                Mark P C LS subject |
| Description                                                                                                                         |                                                                             *None* |
| **Conditions**                                                                                                                      |                                                                                    |
| Content contains                                                                                                                    |                                                                                    |
| - Group name                                                                                                                        |                                                                            Default |
| - Group operator                                                                                                                    |                                                                       Any of these |
| - Sensitivity labels                                                                                                                |                                      PROTECTED CABINET (group)/Legislative Secrecy |
| - Evaluate predicate for (available for Exchange workload only)                                                                     |                                                              Message or attachment |
| **Actions**                                                                                                                         |                                                                                    |
| Modify subject                                                                                                                      |                                                                                    |
| - Remove text that matches                                                                                                          |                                                                  `\s*?\[SEC=.*?\]` |
| - Insert this replacement text                                                                                                      | &nbsp;`[SEC=PROTECTED, CAVEAT=SH:CABINET, ACCESS=Legislative-Secrecy]`<sup>1</sup> |
| - Position                                                                                                                          |                              Remove matches and append replacement text to subject |
| **User notifications**                                                                                                              |                                                                                    |
| Use notifications to inform your users and help educate them on the proper use of sensitive info.                                   |                                                                                Off |
| **Incident reports**                                                                                                                |                                                                                    |
| Use this severity level in admin alerts and reports:                                                                                |                                                                                Low |
| Send an alert to admins when a rule match occurs.                                                                                   |                                                                                Off |
| Use email incident reports to notify you when a policy match occurs.                                                                |                                                                                Off |
| **Additional options**                                                                                                              |                                                                                    |
| If there's a match for this rule, stop processing additional DLP policies and rules.                                                |                                                                        Not checked |
| Evaluate rule per component (Email body and each individual attachment will be considered an individual entity for rule evaluation) |                                                                                Off |
| Priority                                                                                                                            |                                                                                 43 |

{{% alert title="Subject replacement text" color="warning" %}}

1: The *modify subject* replacement text values must have a leading whitespace character before the `[SEC=`.

{{% /alert %}}

### Policy mode

| Item        |                          Value |
| ----------- | -----------------------------: |
| Policy mode | Turn the policy on immediately |

### Related information

#### Security & Governance

* None identified
  
#### Design

* [Data Loss Prevention]({{<ref "design/shared-services/purview/data-loss-prevention">}})
  
#### Configuration

* None identified

#### References

* [Data loss prevention Exchange reference](https://learn.microsoft.com/en-au/purview/dlp-exchange-conditions-and-actions)
* [Data loss prevention policy reference](https://learn.microsoft.com/en-au/purview/dlp-policy-reference)
* [Learn about using regular expressions (regex) in data loss prevention policies](https://learn.microsoft.com/en-au/purview/dlp-policy-learn-about-regex-use)
* [Regular expression quick reference](https://learn.microsoft.com/en-au/dotnet/standard/base-types/regular-expression-language-quick-reference)
