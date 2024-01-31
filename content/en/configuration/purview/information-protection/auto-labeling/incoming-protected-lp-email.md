---
Title: Label incoming PROTECTED Legal Privilege email
weight: 060
description: "This section describes the configuration of auto-labeling within Microsoft Purview associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* for the Microsoft Purview portal blade at the following URL: 
 
https://compliance.microsoft.com/informationprotection/autolabeling
 
The settings described on these pages should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

### Name

| Item        |                                                                                                Value |
| ----------- | ---------------------------------------------------------------------------------------------------: |
| Name        |                                                       Label Incoming PROTECTED Legal-Privilege Email |
| Description | Applies the PROTECTED Legal-Privilege label to incoming emails based on either the header or subject |

### Admin units

| Item        |          Value |
| ----------- | -------------: |
| Admin units | Full directory |

### Locations

| Item              |                Value |
| ----------------- | -------------------: |
| Exchange email    | All users and groups |
| SharePoint sites  |                      |
| OneDrive accounts |                      |

### Rules for Exchange email

#### Check for PROTECTED Legal-Privilege x-header

| Item        |                                        Value |
| ----------- | -------------------------------------------: |
| Name        | Check for PROTECTED Legal-Privilege x-header |
| Description |                                              |

##### Conditions

| Item                   |                                                                                                                   Value |
| ---------------------- | ----------------------------------------------------------------------------------------------------------------------: |
| Header matches pattern | Header name: `X-Protective-Marking`<br>Regular expression: `(?im)(SEC=PROTECTED\s*\u002C\s*ACCESS=Legal[\s-]Privilege)` |


#### Check for PROTECTED Legal-Privilege subject

| Item        |                                       Value |
| ----------- | ------------------------------------------: |
| Name        | Check for PROTECTED Legal-Privilege subject |
| Description |                                             |

##### Conditions

| Item                    |                                                                            Value |
| ----------------------- | -------------------------------------------------------------------------------: |
| Subject matches pattern | Regular expression: `(?im)(SEC=PROTECTED\s*\u002C\s*ACCESS=Legal[\s-]Privilege)` |

### Label

| Item                |                     Value |
| ------------------- | ------------------------: |
| Label to auto-apply | PROTECTED/Legal-Privilege |

### Additional settings for email

| Item                                                                       |       Value |
| -------------------------------------------------------------------------- | ----------: |
| Automatically replace existing labels that have the same or lower priority | Not checked |

### Policy mode

| Item                                                                    |                         Value |
| ----------------------------------------------------------------------- | ----------------------------: |
| Decide if you want to test out the policy now or later                  | Run policy in simulation mode |
| Automatically turn on policy if not modified after 7 days in simulation |                   Not checked |

{{% alert title="Note" color="info" %}}

Organisations enabling this auto-label policy should first test the included rules before turning it on.

{{% /alert %}}

### Related information

#### Security & Governance

* None identified
  
#### Design

* None identified
  
#### Configuration

* None identified

#### References

* None identified