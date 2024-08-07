---
title: Records Management
weight: 00
description: "This section describes the configuration of records management within Microsoft Purview associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Purview portal at the following URL: 
 
https://compliance.microsoft.com/recordsmanagement
 
The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

### Records management settings

#### Retention Labels

##### Deleting content labeled for retention

| Item                                            | Value |
| ----------------------------------------------- | -----:|
| Allow users to delete items on OneDrive         | On    |
| Allow users to delete items on SharePoint sites | On    |

##### Configure record versioning

| Item                     | Value |
| ------------------------ | -----:|
| Enable record versioning | On    |

##### Allow editing of record properties

| Item                                  | Value |
| ------------------------------------- | -----:|
| Allow users to edit record properties | On    |