---
Title: "Add PSPF X-Header and Subject Marking"
weight: 005
description: "This section describes the configuration of data loss prevention  policies within Microsoft Purview associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* for the Microsoft Purview portal blade at the following URL: 

https://compliance.microsoft.com/datalossprevention/policies

The settings described on these pages should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

### Name

| Item        |                                                                                              Value |
| ----------- | -------------------------------------------------------------------------------------------------: |
| Name        |                                                              Add PSPF X-Header and Subject Marking |
| Description | This DLP policy is intended to apply X-Protective-Marking X-headers and subject markings to emails |

### Admin units

| Item        |          Value |
| ----------- | -------------: |
| Admin units | Full directory |

### Locations

| Item                            |                Value |
| ------------------------------- | -------------------: |
| Exchange email                  | All users and groups |
| SharePoint sites                |                      |
| OneDrive accounts               |                      |
| Teams chat and channel messages |                      |
| Devices                         |                      |
| Instances                       |                      |
| On-premises repositories        |                      |
| Power BI workspaces             |                      |

### Advanced DLP rules

{{% alert title="Note" color="info" %}}

This section lists commonly used sensitive info types within the context of the Australian Government. Organisations should add, edit, or remove rules as necessary to address specific requirements.

{{% /alert %}}

- UNOFFICIAL append subject
- UNOFFICIAL add x-header
- OFFICIAL append subject
- OFFICIAL add x-header
- OFFICIAL Sensitive append subject
- OFFICIAL Sensitive add x-header
- OFFICIAL Sensitive Legal-Privilege append subject
- OFFICIAL Sensitive Legal-Privilege add x-header
- OFFICIAL Sensitive Legislative-Secrecy append subject
- OFFICIAL Sensitive Legislative-Secrecy add x-header
- OFFICIAL Sensitive Personal-Privacy append subject
- OFFICIAL Sensitive Personal-Privacy add x-header
- OFFICIAL Sensitive NATIONAL-CABINET append subject
- OFFICIAL Sensitive NATIONAL-CABINET add x-header
- OFFICIAL Sensitive NATIONAL-CABINET Legal-Privilege append subject
- OFFICIAL Sensitive NATIONAL-CABINET Legal-Privilege add x-header
- OFFICIAL Sensitive NATIONAL-CABINET Legislative-Secrecy append subject
- OFFICIAL Sensitive NATIONAL-CABINET Legislative-Secrecy add x-header
- OFFICIAL Sensitive NATIONAL-CABINET Personal-Privacy append subject
- OFFICIAL Sensitive NATIONAL-CABINET Personal-Privacy add x-header
- PROTECTED
- PROTECTED Legal-Privilege append subject
- PROTECTED Legal-Privilege add x-header
- PROTECTED Legislative-Secrecy append subject
- PROTECTED Legislative-Secrecy add x-header
- PROTECTED Personal-Privacy append subject
- PROTECTED Personal-Privacy add x-header
- PROTECTED NATIONAL-CABINET append subject
- PROTECTED NATIONAL-CABINET add x-header
- PROTECTED NATIONAL-CABINET Legal-Privilege append subject
- PROTECTED NATIONAL-CABINET Legal-Privilege add x-header
- PROTECTED NATIONAL-CABINET Legislative-Secrecy append subject
- PROTECTED NATIONAL-CABINET Legislative-Secrecy add x-header
- PROTECTED NATIONAL-CABINET Personal-Privacy append subject
- PROTECTED NATIONAL-CABINET Personal-Privacy add x-header
- PROTECTED CABINET append subject
- PROTECTED CABINET add x-header
- PROTECTED CABINET - Legal-Privilege append subject
- PROTECTED CABINET - Legal-Privilege add x-header
- PROTECTED CABINET - Legislative-Secrecy append subject
- PROTECTED CABINET - Legislative-Secrecy add x-header
- PROTECTED CABINET - Personal-Privacy append subject
- PROTECTED CABINET - Personal-Privacy add x-header

#### UNOFFICIAL append subject

| Item                                                                                             |                     Value |
| ------------------------------------------------------------------------------------------------ | ------------------------: |
| Name                                                                                             | UNOFFICIAL append subject |
| **Conditions**                                                                                   |                           |
| Content contains                                                                                 |                           |
| - Group name                                                                                     |                   Default |
| - Group operator                                                                                 |              Any of these |
| - Sensitivity labels                                                                             |                UNOFFICIAL |
| **Actions**                                                                                      |                           |
| Modify subject                                                                                   |                           |
| - Remove text that matches                                                                       |       "`\s*?\[SEC=.*?\]`" |
| - Insert this replacement text                                                                   |     "` [SEC=UNOFFICIAL]`" |
| - Position                                                                                       | Remove matches and append |
| **User notifications**                                                                           |                           |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                       Off |
| **Incident reports**                                                                             |                           |
| Use this severity level in admin alerts and reports                                              |                       Low |
| Send an alert to admins when a rule match occurs                                                 |                       Off |
| Use email incident reports to notify you when a policy match occurs                              |                       Off |
| **Additional options**                                                                           |                           |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                 Unchecked |
| Priority                                                                                         |                         1 |


#### UNOFFICIAL add x-header

| Item                                                                                             |                                                          Value |
| ------------------------------------------------------------------------------------------------ | -------------------------------------------------------------: |
| Name                                                                                             |                                        UNOFFICIAL add x-header |
| **Conditions**                                                                                   |                                                                |
| Content contains                                                                                 |                                                                |
| - Group name                                                                                     |                                                        Default |
| - Group operator                                                                                 |                                                   Any of these |
| - Sensitivity labels                                                                             |                                                     UNOFFICIAL |
| **Actions**                                                                                      |                                                                |
| Set headers                                                                                      | "X-Protective-Marking":"VER=2018.6, NS=gov.au, SEC=UNOFFICIAL" |
| **User notifications**                                                                           |                                                                |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                            Off |
| **Incident reports**                                                                             |                                                                |
| Use this severity level in admin alerts and reports                                              |                                                            Low |
| Send an alert to admins when a rule match occurs                                                 |                                                            Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                            Off |
| **Additional options**                                                                           |                                                                |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                      Unchecked |
| Priority                                                                                         |                                                              2 |


#### OFFICIAL append subject

| Item                                                                                             |                     Value |
| ------------------------------------------------------------------------------------------------ | ------------------------: |
| Name                                                                                             |   OFFICIAL append subject |
| **Conditions**                                                                                   |                           |
| Content contains                                                                                 |                           |
| - Group name                                                                                     |                   Default |
| - Group operator                                                                                 |              Any of these |
| - Sensitivity labels                                                                             |                  OFFICIAL |
| **Actions**                                                                                      |                           |
| Modify subject                                                                                   |                           |
| - Remove text that matches                                                                       |       "`\s*?\[SEC=.*?\]`" |
| - Insert this replacement text                                                                   |       "` [SEC=OFFICIAL]`" |
| - Position                                                                                       | Remove matches and append |
| **User notifications**                                                                           |                           |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                       Off |
| **Incident reports**                                                                             |                           |
| Use this severity level in admin alerts and reports                                              |                       Low |
| Send an alert to admins when a rule match occurs                                                 |                       Off |
| Use email incident reports to notify you when a policy match occurs                              |                       Off |
| **Additional options**                                                                           |                           |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                 Unchecked |
| Priority                                                                                         |                         3 |


#### OFFICIAL add x-header

| Item                                                                                             |                                                        Value |
| ------------------------------------------------------------------------------------------------ | -----------------------------------------------------------: |
| Name                                                                                             |                                        OFFICIAL add x-header |
| **Conditions**                                                                                   |                                                              |
| Content contains                                                                                 |                                                              |
| - Group name                                                                                     |                                                      Default |
| - Group operator                                                                                 |                                                 Any of these |
| - Sensitivity labels                                                                             |                                                     OFFICIAL |
| **Actions**                                                                                      |                                                              |
| Set headers                                                                                      | "X-Protective-Marking":"VER=2018.6, NS=gov.au, SEC=OFFICIAL" |
| **User notifications**                                                                           |                                                              |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                          Off |
| **Incident reports**                                                                             |                                                              |
| Use this severity level in admin alerts and reports                                              |                                                          Low |
| Send an alert to admins when a rule match occurs                                                 |                                                          Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                          Off |
| **Additional options**                                                                           |                                                              |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                    Unchecked |
| Priority                                                                                         |                                                            4 |


#### OFFICIAL: Sensitive append subject

| Item                                                                                             |                                 Value |
| ------------------------------------------------------------------------------------------------ | ------------------------------------: |
| Name                                                                                             |    OFFICIAL: Sensitive append subject |
| **Conditions**                                                                                   |                                       |
| Content contains                                                                                 |                                       |
| - Group name                                                                                     |                               Default |
| - Group operator                                                                                 |                          Any of these |
| - Sensitivity labels                                                                             | OFFICIAL Sensitive/OFFICIAL Sensitive |
| **Actions**                                                                                      |                                       |
| Modify subject                                                                                   |                                       |
| - Remove text that matches                                                                       |                   "`\s*?\[SEC=.*?\]`" |
| - Insert this replacement text                                                                   |         "` [SEC=OFFICIAL:Sensitive]`" |
| - Position                                                                                       |             Remove matches and append |
| **User notifications**                                                                           |                                       |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                   Off |
| **Incident reports**                                                                             |                                       |
| Use this severity level in admin alerts and reports                                              |                                   Low |
| Send an alert to admins when a rule match occurs                                                 |                                   Off |
| Use email incident reports to notify you when a policy match occurs                              |                                   Off |
| **Additional options**                                                                           |                                       |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                             Unchecked |
| Priority                                                                                         |                                     5 |


#### OFFICIAL: Sensitive add x-header

| Item                                                                                             |                                                                  Value |
| ------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------: |
| Name                                                                                             |                                       OFFICIAL: Sensitive add x-header |
| **Conditions**                                                                                   |                                                                        |
| Content contains                                                                                 |                                                                        |
| - Group name                                                                                     |                                                                Default |
| - Group operator                                                                                 |                                                           Any of these |
| - Sensitivity labels                                                                             |                                  OFFICIAL Sensitive/OFFICIAL Sensitive |
| **Actions**                                                                                      |                                                                        |
| Set headers                                                                                      | "X-Protective-Marking":"VER=2018.6, NS=gov.au, SEC=OFFICIAL-Sensitive" |
| **User notifications**                                                                           |                                                                        |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                    Off |
| **Incident reports**                                                                             |                                                                        |
| Use this severity level in admin alerts and reports                                              |                                                                    Low |
| Send an alert to admins when a rule match occurs                                                 |                                                                    Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                                    Off |
| **Additional options**                                                                           |                                                                        |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                              Unchecked |
| Priority                                                                                         |                                                                      6 |


#### OFFICIAL: Sensitive Legal-Privilege append subject

| Item                                                                                             |                                                 Value |
| ------------------------------------------------------------------------------------------------ | ----------------------------------------------------: |
| Name                                                                                             |    OFFICIAL: Sensitive Legal-Privilege append subject |
| **Conditions**                                                                                   |                                                       |
| Content contains                                                                                 |                                                       |
| - Group name                                                                                     |                                               Default |
| - Group operator                                                                                 |                                          Any of these |
| - Sensitivity labels                                                                             |                    OFFICIAL Sensitive/Legal-Privilege |
| **Actions**                                                                                      |                                                       |
| Modify subject                                                                                   |                                                       |
| - Remove text that matches                                                                       |                                   "`\s*?\[SEC=.*?\]`" |
| - Insert this replacement text                                                                   | "` [SEC=OFFICIAL:Sensitive, ACCESS=Legal-Privilege]`" |
| - Position                                                                                       |                             Remove matches and append |
| **User notifications**                                                                           |                                                       |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                   Off |
| **Incident reports**                                                                             |                                                       |
| Use this severity level in admin alerts and reports                                              |                                                   Low |
| Send an alert to admins when a rule match occurs                                                 |                                                   Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                   Off |
| **Additional options**                                                                           |                                                       |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                             Unchecked |
| Priority                                                                                         |                                                     7 |


#### OFFICIAL: Sensitive Legal-Privilege add x-header

| Item                                                                                             |                                                                                         Value |
| ------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------: |
| Name                                                                                             |                                              OFFICIAL: Sensitive Legal-Privilege add x-header |
| **Conditions**                                                                                   |                                                                                               |
| Content contains                                                                                 |                                                                                               |
| - Group name                                                                                     |                                                                                       Default |
| - Group operator                                                                                 |                                                                                  Any of these |
| - Sensitivity labels                                                                             |                                                            OFFICIAL Sensitive/Legal-Privilege |
| **Actions**                                                                                      |                                                                                               |
| Set headers                                                                                      | "X-Protective-Marking":"VER=2018.6, NS=gov.au, SEC=OFFICIAL-Sensitive ACCESS=Legal-Privilege" |
| **User notifications**                                                                           |                                                                                               |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                                           Off |
| **Incident reports**                                                                             |                                                                                               |
| Use this severity level in admin alerts and reports                                              |                                                                                           Low |
| Send an alert to admins when a rule match occurs                                                 |                                                                                           Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                                                           Off |
| **Additional options**                                                                           |                                                                                               |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                                                     Unchecked |
| Priority                                                                                         |                                                                                             8 |


#### OFFICIAL: Sensitive Legislative-Secrecy append subject

| Item                                                                                             |                                                     Value |
| ------------------------------------------------------------------------------------------------ | --------------------------------------------------------: |
| Name                                                                                             |    OFFICIAL: Sensitive Legislative-Secrecy append subject |
| **Conditions**                                                                                   |                                                           |
| Content contains                                                                                 |                                                           |
| - Group name                                                                                     |                                                   Default |
| - Group operator                                                                                 |                                              Any of these |
| - Sensitivity labels                                                                             |                    OFFICIAL Sensitive/Legislative-Secrecy |
| **Actions**                                                                                      |                                                           |
| Modify subject                                                                                   |                                                           |
| - Remove text that matches                                                                       |                                       "`\s*?\[SEC=.*?\]`" |
| - Insert this replacement text                                                                   | "` [SEC=OFFICIAL:Sensitive, ACCESS=Legislative-Secrecy]`" |
| - Position                                                                                       |                                 Remove matches and append |
| **User notifications**                                                                           |                                                           |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                       Off |
| **Incident reports**                                                                             |                                                           |
| Use this severity level in admin alerts and reports                                              |                                                       Low |
| Send an alert to admins when a rule match occurs                                                 |                                                       Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                       Off |
| **Additional options**                                                                           |                                                           |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                 Unchecked |
| Priority                                                                                         |                                                         9 |


#### OFFICIAL: Sensitive Legislative-Secrecy add x-header

| Item                                                                                             |                                                                                             Value |
| ------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------: |
| Name                                                                                             |                                              OFFICIAL: Sensitive Legislative-Secrecy add x-header |
| **Conditions**                                                                                   |                                                                                                   |
| Content contains                                                                                 |                                                                                                   |
| - Group name                                                                                     |                                                                                           Default |
| - Group operator                                                                                 |                                                                                      Any of these |
| - Sensitivity labels                                                                             |                                                            OFFICIAL Sensitive/Legislative-Secrecy |
| **Actions**                                                                                      |                                                                                                   |
| Set headers                                                                                      | "X-Protective-Marking":"VER=2018.6, NS=gov.au, SEC=OFFICIAL-Sensitive ACCESS=Legislative-Secrecy" |
| **User notifications**                                                                           |                                                                                                   |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                                               Off |
| **Incident reports**                                                                             |                                                                                                   |
| Use this severity level in admin alerts and reports                                              |                                                                                               Low |
| Send an alert to admins when a rule match occurs                                                 |                                                                                               Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                                                               Off |
| **Additional options**                                                                           |                                                                                                   |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                                                         Unchecked |
| Priority                                                                                         |                                                                                                10 |


#### OFFICIAL: Sensitive Personal-Privacy append subject

| Item                                                                                             |                                                  Value |
| ------------------------------------------------------------------------------------------------ | -----------------------------------------------------: |
| Name                                                                                             |    OFFICIAL: Sensitive Personal-Privacy append subject |
| **Conditions**                                                                                   |                                                        |
| Content contains                                                                                 |                                                        |
| - Group name                                                                                     |                                                Default |
| - Group operator                                                                                 |                                           Any of these |
| - Sensitivity labels                                                                             |                    OFFICIAL Sensitive/Personal-Privacy |
| **Actions**                                                                                      |                                                        |
| Modify subject                                                                                   |                                                        |
| - Remove text that matches                                                                       |                                    "`\s*?\[SEC=.*?\]`" |
| - Insert this replacement text                                                                   | "` [SEC=OFFICIAL:Sensitive, ACCESS=Personal-Privacy]`" |
| - Position                                                                                       |                              Remove matches and append |
| **User notifications**                                                                           |                                                        |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                    Off |
| **Incident reports**                                                                             |                                                        |
| Use this severity level in admin alerts and reports                                              |                                                    Low |
| Send an alert to admins when a rule match occurs                                                 |                                                    Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                    Off |
| **Additional options**                                                                           |                                                        |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                              Unchecked |
| Priority                                                                                         |                                                     11 |


#### OFFICIAL: Sensitive Personal-Privacy add x-header

| Item                                                                                             |                                                                                          Value |
| ------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------: |
| Name                                                                                             |                                              OFFICIAL: Sensitive Personal-Privacy add x-header |
| **Conditions**                                                                                   |                                                                                                |
| Content contains                                                                                 |                                                                                                |
| - Group name                                                                                     |                                                                                        Default |
| - Group operator                                                                                 |                                                                                   Any of these |
| - Sensitivity labels                                                                             |                                                            OFFICIAL Sensitive/Personal-Privacy |
| **Actions**                                                                                      |                                                                                                |
| Set headers                                                                                      | "X-Protective-Marking":"VER=2018.6, NS=gov.au, SEC=OFFICIAL-Sensitive ACCESS=Personal-Privacy" |
| **User notifications**                                                                           |                                                                                                |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                                            Off |
| **Incident reports**                                                                             |                                                                                                |
| Use this severity level in admin alerts and reports                                              |                                                                                            Low |
| Send an alert to admins when a rule match occurs                                                 |                                                                                            Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                                                            Off |
| **Additional options**                                                                           |                                                                                                |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                                                      Unchecked |
| Priority                                                                                         |                                                                                             12 |


#### OFFICIAL: Sensitive NATIONAL CABINET append subject

| Item                                                                                             |                                                     Value |
| ------------------------------------------------------------------------------------------------ | --------------------------------------------------------: |
| Name                                                                                             |       OFFICIAL: Sensitive NATIONAL CABINET append subject |
| **Conditions**                                                                                   |                                                           |
| Content contains                                                                                 |                                                           |
| - Group name                                                                                     |                                                   Default |
| - Group operator                                                                                 |                                              Any of these |
| - Sensitivity labels                                                                             |                       OFFICIAL Sensitive/NATIONAL CABINET |
| **Actions**                                                                                      |                                                           |
| Modify subject                                                                                   |                                                           |
| - Remove text that matches                                                                       |                                       "`\s*?\[SEC=.*?\]`" |
| - Insert this replacement text                                                                   | "` [SEC=OFFICIAL:Sensitive, CAVEAT=SH:NATIONAL CABINET]`" |
| - Position                                                                                       |                                 Remove matches and append |
| **User notifications**                                                                           |                                                           |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                       Off |
| **Incident reports**                                                                             |                                                           |
| Use this severity level in admin alerts and reports                                              |                                                       Low |
| Send an alert to admins when a rule match occurs                                                 |                                                       Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                       Off |
| **Additional options**                                                                           |                                                           |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                 Unchecked |
| Priority                                                                                         |                                                        13 |


#### OFFICIAL: Sensitive NATIONAL CABINET add x-header

| Item                                                                                             |                                                                                             Value |
| ------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------: |
| Name                                                                                             |                                                 OFFICIAL: Sensitive NATIONAL CABINET add x-header |
| **Conditions**                                                                                   |                                                                                                   |
| Content contains                                                                                 |                                                                                                   |
| - Group name                                                                                     |                                                                                           Default |
| - Group operator                                                                                 |                                                                                      Any of these |
| - Sensitivity labels                                                                             |                                                               OFFICIAL Sensitive/NATIONAL CABINET |
| **Actions**                                                                                      |                                                                                                   |
| Set headers                                                                                      | "X-Protective-Marking":"VER=2018.6, NS=gov.au, SEC=OFFICIAL-Sensitive CAVEAT=SH:NATIONAL CABINET" |
| **User notifications**                                                                           |                                                                                                   |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                                               Off |
| **Incident reports**                                                                             |                                                                                                   |
| Use this severity level in admin alerts and reports                                              |                                                                                               Low |
| Send an alert to admins when a rule match occurs                                                 |                                                                                               Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                                                               Off |
| **Additional options**                                                                           |                                                                                                   |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                                                         Unchecked |
| Priority                                                                                         |                                                                                                14 |


#### OFFICIAL: Sensitive NATIONAL CABINET Legal-Privilege append subject

| Item                                                                                             |                                                                             Value |
| ------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------: |
| Name                                                                                             |               OFFICIAL: Sensitive NATIONAL CABINET Legal-Privilege append subject |
| **Conditions**                                                                                   |                                                                                   |
| Content contains                                                                                 |                                                                                   |
| - Group name                                                                                     |                                                                           Default |
| - Group operator                                                                                 |                                                                      Any of these |
| - Sensitivity labels                                                                             |                             OFFICIAL Sensitive/NATIONAL CABINET - Legal-Privilege |
| **Actions**                                                                                      |                                                                                   |
| Modify subject                                                                                   |                                                                                   |
| - Remove text that matches                                                                       |                                                               "`\s*?\[SEC=.*?\]`" |
| - Insert this replacement text                                                                   | "` [SEC=OFFICIAL:Sensitive, CAVEAT=SH:NATIONAL CABINET, ACCESS=Legal-Privilege]`" |
| - Position                                                                                       |                                                         Remove matches and append |
| **User notifications**                                                                           |                                                                                   |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                               Off |
| **Incident reports**                                                                             |                                                                                   |
| Use this severity level in admin alerts and reports                                              |                                                                               Low |
| Send an alert to admins when a rule match occurs                                                 |                                                                               Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                                               Off |
| **Additional options**                                                                           |                                                                                   |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                                         Unchecked |
| Priority                                                                                         |                                                                                15 |


#### OFFICIAL: Sensitive NATIONAL CABINET Legal-Privilege add x-header

| Item                                                                                             |                                                                                                                     Value |
| ------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------: |
| Name                                                                                             |                                                         OFFICIAL: Sensitive NATIONAL CABINET Legal-Privilege add x-header |
| **Conditions**                                                                                   |                                                                                                                           |
| Content contains                                                                                 |                                                                                                                           |
| - Group name                                                                                     |                                                                                                                   Default |
| - Group operator                                                                                 |                                                                                                              Any of these |
| - Sensitivity labels                                                                             |                                                                     OFFICIAL Sensitive/NATIONAL CABINET - Legal-Privilege |
| **Actions**                                                                                      |                                                                                                                           |
| Set headers                                                                                      | "X-Protective-Marking":"VER=2018.6, NS=gov.au, SEC=OFFICIAL-Sensitive CAVEAT=SH:NATIONAL CABINET, ACCESS=Legal-Privilege" |
| **User notifications**                                                                           |                                                                                                                           |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                                                                       Off |
| **Incident reports**                                                                             |                                                                                                                           |
| Use this severity level in admin alerts and reports                                              |                                                                                                                       Low |
| Send an alert to admins when a rule match occurs                                                 |                                                                                                                       Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                                                                                       Off |
| **Additional options**                                                                           |                                                                                                                           |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                                                                                 Unchecked |
| Priority                                                                                         |                                                                                                                        16 |


#### OFFICIAL: Sensitive NATIONAL CABINET Legislative-Secrecy append subject

| Item                                                                                             |                                                                                 Value |
| ------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------: |
| Name                                                                                             |               OFFICIAL: Sensitive NATIONAL CABINET Legislative-Secrecy append subject |
| **Conditions**                                                                                   |                                                                                       |
| Content contains                                                                                 |                                                                                       |
| - Group name                                                                                     |                                                                               Default |
| - Group operator                                                                                 |                                                                          Any of these |
| - Sensitivity labels                                                                             |                             OFFICIAL Sensitive/NATIONAL CABINET - Legislative-Secrecy |
| **Actions**                                                                                      |                                                                                       |
| Modify subject                                                                                   |                                                                                       |
| - Remove text that matches                                                                       |                                                                   "`\s*?\[SEC=.*?\]`" |
| - Insert this replacement text                                                                   | "` [SEC=OFFICIAL:Sensitive, CAVEAT=SH:NATIONAL CABINET, ACCESS=Legislative-Secrecy]`" |
| - Position                                                                                       |                                                             Remove matches and append |
| **User notifications**                                                                           |                                                                                       |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                                   Off |
| **Incident reports**                                                                             |                                                                                       |
| Use this severity level in admin alerts and reports                                              |                                                                                   Low |
| Send an alert to admins when a rule match occurs                                                 |                                                                                   Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                                                   Off |
| **Additional options**                                                                           |                                                                                       |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                                             Unchecked |
| Priority                                                                                         |                                                                                    17 |


#### OFFICIAL: Sensitive NATIONAL CABINET Legislative-Secrecy add x-header

| Item                                                                                             |                                                                                                                         Value |
| ------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------: |
| Name                                                                                             |                                                         OFFICIAL: Sensitive NATIONAL CABINET Legislative-Secrecy add x-header |
| **Conditions**                                                                                   |                                                                                                                               |
| Content contains                                                                                 |                                                                                                                               |
| - Group name                                                                                     |                                                                                                                       Default |
| - Group operator                                                                                 |                                                                                                                  Any of these |
| - Sensitivity labels                                                                             |                                                                     OFFICIAL Sensitive/NATIONAL CABINET - Legislative-Secrecy |
| **Actions**                                                                                      |                                                                                                                               |
| Set headers                                                                                      | "X-Protective-Marking":"VER=2018.6, NS=gov.au, SEC=OFFICIAL-Sensitive CAVEAT=SH:NATIONAL CABINET, ACCESS=Legislative-Secrecy" |
| **User notifications**                                                                           |                                                                                                                               |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                                                                           Off |
| **Incident reports**                                                                             |                                                                                                                               |
| Use this severity level in admin alerts and reports                                              |                                                                                                                           Low |
| Send an alert to admins when a rule match occurs                                                 |                                                                                                                           Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                                                                                           Off |
| **Additional options**                                                                           |                                                                                                                               |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                                                                                     Unchecked |
| Priority                                                                                         |                                                                                                                            18 |


#### OFFICIAL: Sensitive NATIONAL CABINET Personal-Privacy append subject

| Item                                                                                             |                                                                              Value |
| ------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------: |
| Name                                                                                             |               OFFICIAL: Sensitive NATIONAL CABINET Personal-Privacy append subject |
| **Conditions**                                                                                   |                                                                                    |
| Content contains                                                                                 |                                                                                    |
| - Group name                                                                                     |                                                                            Default |
| - Group operator                                                                                 |                                                                       Any of these |
| - Sensitivity labels                                                                             |                             OFFICIAL Sensitive/NATIONAL CABINET - Personal-Privacy |
| **Actions**                                                                                      |                                                                                    |
| Modify subject                                                                                   |                                                                                    |
| - Remove text that matches                                                                       |                                                                "`\s*?\[SEC=.*?\]`" |
| - Insert this replacement text                                                                   | "` [SEC=OFFICIAL:Sensitive, CAVEAT=SH:NATIONAL CABINET, ACCESS=Personal-Privacy]`" |
| - Position                                                                                       |                                                          Remove matches and append |
| **User notifications**                                                                           |                                                                                    |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                                Off |
| **Incident reports**                                                                             |                                                                                    |
| Use this severity level in admin alerts and reports                                              |                                                                                Low |
| Send an alert to admins when a rule match occurs                                                 |                                                                                Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                                                Off |
| **Additional options**                                                                           |                                                                                    |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                                          Unchecked |
| Priority                                                                                         |                                                                                 19 |


#### OFFICIAL: Sensitive NATIONAL CABINET Personal-Privacy add x-header

| Item                                                                                             |                                                                                                                      Value |
| ------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------: |
| Name                                                                                             |                                                         OFFICIAL: Sensitive NATIONAL CABINET Personal-Privacy add x-header |
| **Conditions**                                                                                   |                                                                                                                            |
| Content contains                                                                                 |                                                                                                                            |
| - Group name                                                                                     |                                                                                                                    Default |
| - Group operator                                                                                 |                                                                                                               Any of these |
| - Sensitivity labels                                                                             |                                                                     OFFICIAL Sensitive/NATIONAL CABINET - Personal-Privacy |
| **Actions**                                                                                      |                                                                                                                            |
| Set headers                                                                                      | "X-Protective-Marking":"VER=2018.6, NS=gov.au, SEC=OFFICIAL-Sensitive CAVEAT=SH:NATIONAL CABINET, ACCESS=Personal-Privacy" |
| **User notifications**                                                                           |                                                                                                                            |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                                                                        Off |
| **Incident reports**                                                                             |                                                                                                                            |
| Use this severity level in admin alerts and reports                                              |                                                                                                                        Low |
| Send an alert to admins when a rule match occurs                                                 |                                                                                                                        Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                                                                                        Off |
| **Additional options**                                                                           |                                                                                                                            |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                                                                                  Unchecked |
| Priority                                                                                         |                                                                                                                         20 |


#### PROTECTED append subject

| Item                                                                                             |                     Value |
| ------------------------------------------------------------------------------------------------ | ------------------------: |
| Name                                                                                             |  PROTECTED append subject |
| **Conditions**                                                                                   |                           |
| Content contains                                                                                 |                           |
| - Group name                                                                                     |                   Default |
| - Group operator                                                                                 |              Any of these |
| - Sensitivity labels                                                                             |       PROTECTED/PROTECTED |
| **Actions**                                                                                      |                           |
| Modify subject                                                                                   |                           |
| - Remove text that matches                                                                       |       "`\s*?\[SEC=.*?\]`" |
| - Insert this replacement text                                                                   |      "` [SEC=PROTECTED]`" |
| - Position                                                                                       | Remove matches and append |
| **User notifications**                                                                           |                           |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                       Off |
| **Incident reports**                                                                             |                           |
| Use this severity level in admin alerts and reports                                              |                       Low |
| Send an alert to admins when a rule match occurs                                                 |                       Off |
| Use email incident reports to notify you when a policy match occurs                              |                       Off |
| **Additional options**                                                                           |                           |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                 Unchecked |
| Priority                                                                                         |                        21 |


#### PROTECTED add x-header

| Item                                                                                             |                                                         Value |
| ------------------------------------------------------------------------------------------------ | ------------------------------------------------------------: |
| Name                                                                                             |                                        PROTECTED add x-header |
| **Conditions**                                                                                   |                                                               |
| Content contains                                                                                 |                                                               |
| - Group name                                                                                     |                                                       Default |
| - Group operator                                                                                 |                                                  Any of these |
| - Sensitivity labels                                                                             |                                     PROTECTED/Legal-Privilege |
| **Actions**                                                                                      |                                                               |
| Set headers                                                                                      | "X-Protective-Marking":"VER=2018.6, NS=gov.au, SEC=PROTECTED" |
| **User notifications**                                                                           |                                                               |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                           Off |
| **Incident reports**                                                                             |                                                               |
| Use this severity level in admin alerts and reports                                              |                                                           Low |
| Send an alert to admins when a rule match occurs                                                 |                                                           Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                           Off |
| **Additional options**                                                                           |                                                               |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                     Unchecked |
| Priority                                                                                         |                                                            22 |


#### PROTECTED Legal-Privilege append subject

| Item                                                                                             |                                        Value |
| ------------------------------------------------------------------------------------------------ | -------------------------------------------: |
| Name                                                                                             |     PROTECTED Legal-Privilege append subject |
| **Conditions**                                                                                   |                                              |
| Content contains                                                                                 |                                              |
| - Group name                                                                                     |                                      Default |
| - Group operator                                                                                 |                                 Any of these |
| - Sensitivity labels                                                                             |                    PROTECTED/Legal-Privilege |
| **Actions**                                                                                      |                                              |
| Modify subject                                                                                   |                                              |
| - Remove text that matches                                                                       |                          "`\s*?\[SEC=.*?\]`" |
| - Insert this replacement text                                                                   | "` [SEC=PROTECTED, ACCESS=Legal-Privilege]`" |
| - Position                                                                                       |                    Remove matches and append |
| **User notifications**                                                                           |                                              |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                          Off |
| **Incident reports**                                                                             |                                              |
| Use this severity level in admin alerts and reports                                              |                                          Low |
| Send an alert to admins when a rule match occurs                                                 |                                          Off |
| Use email incident reports to notify you when a policy match occurs                              |                                          Off |
| **Additional options**                                                                           |                                              |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                    Unchecked |
| Priority                                                                                         |                                           23 |


#### PROTECTED Legal-Privilege add x-header

| Item                                                                                             |                                                                                 Value |
| ------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------: |
| Name                                                                                             |                                                PROTECTED Legal-Privilege add x-header |
| **Conditions**                                                                                   |                                                                                       |
| Content contains                                                                                 |                                                                                       |
| - Group name                                                                                     |                                                                               Default |
| - Group operator                                                                                 |                                                                          Any of these |
| - Sensitivity labels                                                                             |                                                             PROTECTED/Legal-Privilege |
| **Actions**                                                                                      |                                                                                       |
| Set headers                                                                                      | "X-Protective-Marking":"VER=2018.6, NS=gov.au, SEC=PROTECTED, ACCESS=Legal-Privilege" |
| **User notifications**                                                                           |                                                                                       |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                                   Off |
| **Incident reports**                                                                             |                                                                                       |
| Use this severity level in admin alerts and reports                                              |                                                                                   Low |
| Send an alert to admins when a rule match occurs                                                 |                                                                                   Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                                                   Off |
| **Additional options**                                                                           |                                                                                       |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                                             Unchecked |
| Priority                                                                                         |                                                                                    24 |


#### PROTECTED Legislative-Secrecy append subject

| Item                                                                                             |                                            Value |
| ------------------------------------------------------------------------------------------------ | -----------------------------------------------: |
| Name                                                                                             |     PROTECTED Legislative-Secrecy append subject |
| **Conditions**                                                                                   |                                                  |
| Content contains                                                                                 |                                                  |
| - Group name                                                                                     |                                          Default |
| - Group operator                                                                                 |                                     Any of these |
| - Sensitivity labels                                                                             |                    PROTECTED/Legislative-Secrecy |
| **Actions**                                                                                      |                                                  |
| Modify subject                                                                                   |                                                  |
| - Remove text that matches                                                                       |                              "`\s*?\[SEC=.*?\]`" |
| - Insert this replacement text                                                                   | "` [SEC=PROTECTED, ACCESS=Legislative-Secrecy]`" |
| - Position                                                                                       |                        Remove matches and append |
| **User notifications**                                                                           |                                                  |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                              Off |
| **Incident reports**                                                                             |                                                  |
| Use this severity level in admin alerts and reports                                              |                                              Low |
| Send an alert to admins when a rule match occurs                                                 |                                              Off |
| Use email incident reports to notify you when a policy match occurs                              |                                              Off |
| **Additional options**                                                                           |                                                  |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                        Unchecked |
| Priority                                                                                         |                                               25 |


#### PROTECTED Legislative-Secrecy add x-header

| Item                                                                                             |                                                                                     Value |
| ------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------: |
| Name                                                                                             |                                                PROTECTED Legislative-Secrecy add x-header |
| **Conditions**                                                                                   |                                                                                           |
| Content contains                                                                                 |                                                                                           |
| - Group name                                                                                     |                                                                                   Default |
| - Group operator                                                                                 |                                                                              Any of these |
| - Sensitivity labels                                                                             |                                                                 PROTECTED/Legal-Privilege |
| **Actions**                                                                                      |                                                                                           |
| Set headers                                                                                      | "X-Protective-Marking":"VER=2018.6, NS=gov.au, SEC=PROTECTED, ACCESS=Legislative-Secrecy" |
| **User notifications**                                                                           |                                                                                           |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                                       Off |
| **Incident reports**                                                                             |                                                                                           |
| Use this severity level in admin alerts and reports                                              |                                                                                       Low |
| Send an alert to admins when a rule match occurs                                                 |                                                                                       Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                                                       Off |
| **Additional options**                                                                           |                                                                                           |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                                                 Unchecked |
| Priority                                                                                         |                                                                                        26 |


#### PROTECTED Personal-Privacy append subject

| Item                                                                                             |                                         Value |
| ------------------------------------------------------------------------------------------------ | --------------------------------------------: |
| Name                                                                                             |     PROTECTED Personal-Privacy append subject |
| **Conditions**                                                                                   |                                               |
| Content contains                                                                                 |                                               |
| - Group name                                                                                     |                                       Default |
| - Group operator                                                                                 |                                  Any of these |
| - Sensitivity labels                                                                             |                    PROTECTED/Personal-Privacy |
| **Actions**                                                                                      |                                               |
| Modify subject                                                                                   |                                               |
| - Remove text that matches                                                                       |                           "`\s*?\[SEC=.*?\]`" |
| - Insert this replacement text                                                                   | "` [SEC=PROTECTED, ACCESS=Personal-Privacy]`" |
| - Position                                                                                       |                     Remove matches and append |
| **User notifications**                                                                           |                                               |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                           Off |
| **Incident reports**                                                                             |                                               |
| Use this severity level in admin alerts and reports                                              |                                           Low |
| Send an alert to admins when a rule match occurs                                                 |                                           Off |
| Use email incident reports to notify you when a policy match occurs                              |                                           Off |
| **Additional options**                                                                           |                                               |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                     Unchecked |
| Priority                                                                                         |                                            27 |


#### PROTECTED Personal-Privacy add x-header

| Item                                                                                             |                                                                                  Value |
| ------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------: |
| Name                                                                                             |                                                PROTECTED Personal-Privacy add x-header |
| **Conditions**                                                                                   |                                                                                        |
| Content contains                                                                                 |                                                                                        |
| - Group name                                                                                     |                                                                                Default |
| - Group operator                                                                                 |                                                                           Any of these |
| - Sensitivity labels                                                                             |                                                             PROTECTED/Personal-Privacy |
| **Actions**                                                                                      |                                                                                        |
| Set headers                                                                                      | "X-Protective-Marking":"VER=2018.6, NS=gov.au, SEC=PROTECTED, ACCESS=Personal-Privacy" |
| **User notifications**                                                                           |                                                                                        |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                                    Off |
| **Incident reports**                                                                             |                                                                                        |
| Use this severity level in admin alerts and reports                                              |                                                                                    Low |
| Send an alert to admins when a rule match occurs                                                 |                                                                                    Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                                                    Off |
| **Additional options**                                                                           |                                                                                        |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                                              Unchecked |
| Priority                                                                                         |                                                                                     28 |


#### PROTECTED NATIONAL CABINET append subject

| Item                                                                                             |                                            Value |
| ------------------------------------------------------------------------------------------------ | -----------------------------------------------: |
| Name                                                                                             |        PROTECTED NATIONAL CABINET append subject |
| **Conditions**                                                                                   |                                                  |
| Content contains                                                                                 |                                                  |
| - Group name                                                                                     |                                          Default |
| - Group operator                                                                                 |                                     Any of these |
| - Sensitivity labels                                                                             |                       PROTECTED/NATIONAL CABINET |
| **Actions**                                                                                      |                                                  |
| Modify subject                                                                                   |                                                  |
| - Remove text that matches                                                                       |                              "`\s*?\[SEC=.*?\]`" |
| - Insert this replacement text                                                                   | "` [SEC=PROTECTED, CAVEAT=SH:NATIONAL-CABINET]`" |
| - Position                                                                                       |                        Remove matches and append |
| **User notifications**                                                                           |                                                  |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                              Off |
| **Incident reports**                                                                             |                                                  |
| Use this severity level in admin alerts and reports                                              |                                              Low |
| Send an alert to admins when a rule match occurs                                                 |                                              Off |
| Use email incident reports to notify you when a policy match occurs                              |                                              Off |
| **Additional options**                                                                           |                                                  |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                        Unchecked |
| Priority                                                                                         |                                               29 |


#### PROTECTED NATIONAL CABINET add x-header

| Item                                                                                             |                                                                                     Value |
| ------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------: |
| Name                                                                                             |                                                   PROTECTED NATIONAL CABINET add x-header |
| **Conditions**                                                                                   |                                                                                           |
| Content contains                                                                                 |                                                                                           |
| - Group name                                                                                     |                                                                                   Default |
| - Group operator                                                                                 |                                                                              Any of these |
| - Sensitivity labels                                                                             |                                                                PROTECTED/NATIONAL CABINET |
| **Actions**                                                                                      |                                                                                           |
| Set headers                                                                                      | "X-Protective-Marking":"VER=2018.6, NS=gov.au, SEC=PROTECTED, CAVEAT=SH:NATIONAL-CABINET" |
| **User notifications**                                                                           |                                                                                           |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                                       Off |
| **Incident reports**                                                                             |                                                                                           |
| Use this severity level in admin alerts and reports                                              |                                                                                       Low |
| Send an alert to admins when a rule match occurs                                                 |                                                                                       Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                                                       Off |
| **Additional options**                                                                           |                                                                                           |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                                                 Unchecked |
| Priority                                                                                         |                                                                                        30 |


#### PROTECTED NATIONAL CABINET Legal-Privilege append subject

| Item                                                                                             |                                                                    Value |
| ------------------------------------------------------------------------------------------------ | -----------------------------------------------------------------------: |
| Name                                                                                             |                PROTECTED NATIONAL CABINET Legal-Privilege append subject |
| **Conditions**                                                                                   |                                                                          |
| Content contains                                                                                 |                                                                          |
| - Group name                                                                                     |                                                                  Default |
| - Group operator                                                                                 |                                                             Any of these |
| - Sensitivity labels                                                                             |                             PROTECTED/NATIONAL CABINET - Legal-Privilege |
| **Actions**                                                                                      |                                                                          |
| Modify subject                                                                                   |                                                                          |
| - Remove text that matches                                                                       |                                                      "`\s*?\[SEC=.*?\]`" |
| - Insert this replacement text                                                                   | "` [SEC=PROTECTED, CAVEAT=SH:NATIONAL-CABINET, ACCESS=Legal-Privilege]`" |
| - Position                                                                                       |                                                Remove matches and append |
| **User notifications**                                                                           |                                                                          |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                      Off |
| **Incident reports**                                                                             |                                                                          |
| Use this severity level in admin alerts and reports                                              |                                                                      Low |
| Send an alert to admins when a rule match occurs                                                 |                                                                      Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                                      Off |
| **Additional options**                                                                           |                                                                          |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                                Unchecked |
| Priority                                                                                         |                                                                       31 |


#### PROTECTED NATIONAL CABINET Legal-Privilege add x-header

| Item                                                                                             |                                                                                                             Value |
| ------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------: |
| Name                                                                                             |                                                           PROTECTED NATIONAL CABINET Legal-Privilege add x-header |
| **Conditions**                                                                                   |                                                                                                                   |
| Content contains                                                                                 |                                                                                                                   |
| - Group name                                                                                     |                                                                                                           Default |
| - Group operator                                                                                 |                                                                                                      Any of these |
| - Sensitivity labels                                                                             |                                                                      PROTECTED/NATIONAL CABINET - Legal-Privilege |
| **Actions**                                                                                      |                                                                                                                   |
| Set headers                                                                                      | "X-Protective-Marking":"VER=2018.6, NS=gov.au, SEC=PROTECTED, CAVEAT=SH:NATIONAL-CABINET, ACCESS=Legal-Privilege" |
| **User notifications**                                                                           |                                                                                                                   |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                                                               Off |
| **Incident reports**                                                                             |                                                                                                                   |
| Use this severity level in admin alerts and reports                                              |                                                                                                               Low |
| Send an alert to admins when a rule match occurs                                                 |                                                                                                               Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                                                                               Off |
| **Additional options**                                                                           |                                                                                                                   |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                                                                         Unchecked |
| Priority                                                                                         |                                                                                                                32 |


#### PROTECTED NATIONAL CABINET Legislative-Secrecy append subject

| Item                                                                                             |                                                                        Value |
| ------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------: |
| Name                                                                                             |                PROTECTED NATIONAL CABINET Legislative-Secrecy append subject |
| **Conditions**                                                                                   |                                                                              |
| Content contains                                                                                 |                                                                              |
| - Group name                                                                                     |                                                                      Default |
| - Group operator                                                                                 |                                                                 Any of these |
| - Sensitivity labels                                                                             |                             PROTECTED/NATIONAL CABINET - Legislative-Secrecy |
| **Actions**                                                                                      |                                                                              |
| Modify subject                                                                                   |                                                                              |
| - Remove text that matches                                                                       |                                                          "`\s*?\[SEC=.*?\]`" |
| - Insert this replacement text                                                                   | "` [SEC=PROTECTED, CAVEAT=SH:NATIONAL-CABINET, ACCESS=Legislative-Secrecy]`" |
| - Position                                                                                       |                                                    Remove matches and append |
| **User notifications**                                                                           |                                                                              |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                          Off |
| **Incident reports**                                                                             |                                                                              |
| Use this severity level in admin alerts and reports                                              |                                                                          Low |
| Send an alert to admins when a rule match occurs                                                 |                                                                          Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                                          Off |
| **Additional options**                                                                           |                                                                              |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                                    Unchecked |
| Priority                                                                                         |                                                                           33 |


#### PROTECTED NATIONAL CABINET Legislative-Secrecy add x-header

| Item                                                                                             |                                                                                                                 Value |
| ------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------: |
| Name                                                                                             |                                                           PROTECTED NATIONAL CABINET Legislative-Secrecy add x-header |
| **Conditions**                                                                                   |                                                                                                                       |
| Content contains                                                                                 |                                                                                                                       |
| - Group name                                                                                     |                                                                                                               Default |
| - Group operator                                                                                 |                                                                                                          Any of these |
| - Sensitivity labels                                                                             |                                                                      PROTECTED/NATIONAL CABINET - Legislative-Secrecy |
| **Actions**                                                                                      |                                                                                                                       |
| Set headers                                                                                      | "X-Protective-Marking":"VER=2018.6, NS=gov.au, SEC=PROTECTED, CAVEAT=SH:NATIONAL-CABINET, ACCESS=Legislative-Secrecy" |
| **User notifications**                                                                           |                                                                                                                       |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                                                                   Off |
| **Incident reports**                                                                             |                                                                                                                       |
| Use this severity level in admin alerts and reports                                              |                                                                                                                   Low |
| Send an alert to admins when a rule match occurs                                                 |                                                                                                                   Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                                                                                   Off |
| **Additional options**                                                                           |                                                                                                                       |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                                                                             Unchecked |
| Priority                                                                                         |                                                                                                                    34 |


#### PROTECTED NATIONAL CABINET Personal-Privacy append subject

| Item                                                                                             |                                                                     Value |
| ------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------: |
| Name                                                                                             |                PROTECTED NATIONAL CABINET Personal-Privacy append subject |
| **Conditions**                                                                                   |                                                                           |
| Content contains                                                                                 |                                                                           |
| - Group name                                                                                     |                                                                   Default |
| - Group operator                                                                                 |                                                              Any of these |
| - Sensitivity labels                                                                             |                             PROTECTED/NATIONAL CABINET - Personal-Privacy |
| **Actions**                                                                                      |                                                                           |
| Modify subject                                                                                   |                                                                           |
| - Remove text that matches                                                                       |                                                       "`\s*?\[SEC=.*?\]`" |
| - Insert this replacement text                                                                   | "` [SEC=PROTECTED, CAVEAT=SH:NATIONAL-CABINET, ACCESS=Personal-Privacy]`" |
| - Position                                                                                       |                                                 Remove matches and append |
| **User notifications**                                                                           |                                                                           |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                       Off |
| **Incident reports**                                                                             |                                                                           |
| Use this severity level in admin alerts and reports                                              |                                                                       Low |
| Send an alert to admins when a rule match occurs                                                 |                                                                       Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                                       Off |
| **Additional options**                                                                           |                                                                           |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                                 Unchecked |
| Priority                                                                                         |                                                                        35 |


#### PROTECTED NATIONAL CABINET Personal-Privacy add x-header

| Item                                                                                             |                                                                                                              Value |
| ------------------------------------------------------------------------------------------------ | -----------------------------------------------------------------------------------------------------------------: |
| Name                                                                                             |                                                           PROTECTED NATIONAL CABINET Personal-Privacy add x-header |
| **Conditions**                                                                                   |                                                                                                                    |
| Content contains                                                                                 |                                                                                                                    |
| - Group name                                                                                     |                                                                                                            Default |
| - Group operator                                                                                 |                                                                                                       Any of these |
| - Sensitivity labels                                                                             |                                                                      PROTECTED/NATIONAL CABINET - Personal-Privacy |
| **Actions**                                                                                      |                                                                                                                    |
| Set headers                                                                                      | "X-Protective-Marking":"VER=2018.6, NS=gov.au, SEC=PROTECTED, CAVEAT=SH:NATIONAL-CABINET, ACCESS=Personal-Privacy" |
| **User notifications**                                                                           |                                                                                                                    |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                                                                Off |
| **Incident reports**                                                                             |                                                                                                                    |
| Use this severity level in admin alerts and reports                                              |                                                                                                                Low |
| Send an alert to admins when a rule match occurs                                                 |                                                                                                                Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                                                                                Off |
| **Additional options**                                                                           |                                                                                                                    |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                                                                          Unchecked |
| Priority                                                                                         |                                                                                                                 36 |


#### PROTECTED CABINET append subject

| Item                                                                                             |                                                           Value |
| ------------------------------------------------------------------------------------------------ | --------------------------------------------------------------: |
| Name                                                                                             |                                PROTECTED CABINET append subject |
| **Conditions**                                                                                   |                                                                 |
| Content contains                                                                                 |                                                                 |
| - Group name                                                                                     |                                                         Default |
| - Group operator                                                                                 |                                                    Any of these |
| - Sensitivity labels                                                                             |                             PROTECTED/CABINET - Legal-Privilege |
| **Actions**                                                                                      |                                                                 |
| Modify subject                                                                                   |                                                                 |
| - Remove text that matches                                                                       |                                             "`\s*?\[SEC=.*?\]`" |
| - Insert this replacement text                                                                   | "` [SEC=PROTECTED, CAVEAT=SH:CABINET, ACCESS=Legal-Privilege]`" |
| - Position                                                                                       |                                       Remove matches and append |
| **User notifications**                                                                           |                                                                 |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                             Off |
| **Incident reports**                                                                             |                                                                 |
| Use this severity level in admin alerts and reports                                              |                                                             Low |
| Send an alert to admins when a rule match occurs                                                 |                                                             Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                             Off |
| **Additional options**                                                                           |                                                                 |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                       Unchecked |
| Priority                                                                                         |                                                              37 |


#### PROTECTED CABINET add x-header

| Item                                                                                             |                                                                                                    Value |
| ------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------: |
| Name                                                                                             |                                                                           PROTECTED CABINET add x-header |
| **Conditions**                                                                                   |                                                                                                          |
| Content contains                                                                                 |                                                                                                          |
| - Group name                                                                                     |                                                                                                  Default |
| - Group operator                                                                                 |                                                                                             Any of these |
| - Sensitivity labels                                                                             |                                                                                        PROTECTED/CABINET |
| **Actions**                                                                                      |                                                                                                          |
| Set headers                                                                                      | "X-Protective-Marking":"VER=2018.6, NS=gov.au, SEC=PROTECTED, CAVEAT=SH:CABINET, ACCESS=Legal-Privilege" |
| **User notifications**                                                                           |                                                                                                          |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                                                      Off |
| **Incident reports**                                                                             |                                                                                                          |
| Use this severity level in admin alerts and reports                                              |                                                                                                      Low |
| Send an alert to admins when a rule match occurs                                                 |                                                                                                      Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                                                                      Off |
| **Additional options**                                                                           |                                                                                                          |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                                                                Unchecked |
| Priority                                                                                         |                                                                                                       38 |


#### PROTECTED CABINET - Legal-Privilege append subject

| Item                                                                                             |                                              Value |
| ------------------------------------------------------------------------------------------------ | -------------------------------------------------: |
| Name                                                                                             | PROTECTED CABINET - Legal-Privilege append subject |
| **Conditions**                                                                                   |                                                    |
| Content contains                                                                                 |                                                    |
| - Group name                                                                                     |                                            Default |
| - Group operator                                                                                 |                                       Any of these |
| - Sensitivity labels                                                                             |                PROTECTED CABINET - Legal-Privilege |
| **Actions**                                                                                      |                                                    |
| Modify subject                                                                                   |                                                    |
| - Remove text that matches                                                                       |                                "`\s*?\[SEC=.*?\]`" |
| - Insert this replacement text                                                                   |     "` [SEC=PROTECTED CABINET - Legal-Privilege]`" |
| - Position                                                                                       |                          Remove matches and append |
| **User notifications**                                                                           |                                                    |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                Off |
| **Incident reports**                                                                             |                                                    |
| Use this severity level in admin alerts and reports                                              |                                                Low |
| Send an alert to admins when a rule match occurs                                                 |                                                Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                Off |
| **Additional options**                                                                           |                                                    |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                          Unchecked |
| Priority                                                                                         |                                                 39 |


#### PROTECTED CABINET - Legal-Privilege add x-header

| Item                                                                                             |                                                                                                    Value |
| ------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------: |
| Name                                                                                             |                                                         PROTECTED CABINET - Legal-Privilege add x-header |
| **Conditions**                                                                                   |                                                                                                          |
| Content contains                                                                                 |                                                                                                          |
| - Group name                                                                                     |                                                                                                  Default |
| - Group operator                                                                                 |                                                                                             Any of these |
| - Sensitivity labels                                                                             |                                                                      PROTECTED/CABINET - Legal-Privilege |
| **Actions**                                                                                      |                                                                                                          |
| Set headers                                                                                      | "X-Protective-Marking":"VER=2018.6, NS=gov.au, SEC=PROTECTED, CAVEAT=SH:CABINET, ACCESS=Legal-Privilege" |
| **User notifications**                                                                           |                                                                                                          |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                                                      Off |
| **Incident reports**                                                                             |                                                                                                          |
| Use this severity level in admin alerts and reports                                              |                                                                                                      Low |
| Send an alert to admins when a rule match occurs                                                 |                                                                                                      Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                                                                      Off |
| **Additional options**                                                                           |                                                                                                          |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                                                                Unchecked |
| Priority                                                                                         |                                                                                                       40 |


#### PROTECTED CABINET - Legislative-Secrecy append subject

| Item                                                                                             |                                                               Value |
| ------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------: |
| Name                                                                                             |              PROTECTED CABINET - Legislative-Secrecy append subject |
| **Conditions**                                                                                   |                                                                     |
| Content contains                                                                                 |                                                                     |
| - Group name                                                                                     |                                                             Default |
| - Group operator                                                                                 |                                                        Any of these |
| - Sensitivity labels                                                                             |                             PROTECTED/CABINET - Legislative-Secrecy |
| **Actions**                                                                                      |                                                                     |
| Modify subject                                                                                   |                                                                     |
| - Remove text that matches                                                                       |                                                 "`\s*?\[SEC=.*?\]`" |
| - Insert this replacement text                                                                   | "` [SEC=PROTECTED, CAVEAT=SH:CABINET, ACCESS=Legislative-Secrecy]`" |
| - Position                                                                                       |                                           Remove matches and append |
| **User notifications**                                                                           |                                                                     |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                 Off |
| **Incident reports**                                                                             |                                                                     |
| Use this severity level in admin alerts and reports                                              |                                                                 Low |
| Send an alert to admins when a rule match occurs                                                 |                                                                 Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                                 Off |
| **Additional options**                                                                           |                                                                     |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                           Unchecked |
| Priority                                                                                         |                                                                  41 |


#### PROTECTED CABINET - Legislative-Secrecy add x-header

| Item                                                                                             |                                                                                                        Value |
| ------------------------------------------------------------------------------------------------ | -----------------------------------------------------------------------------------------------------------: |
| Name                                                                                             |                                                         PROTECTED CABINET - Legislative-Secrecy add x-header |
| **Conditions**                                                                                   |                                                                                                              |
| Content contains                                                                                 |                                                                                                              |
| - Group name                                                                                     |                                                                                                      Default |
| - Group operator                                                                                 |                                                                                                 Any of these |
| - Sensitivity labels                                                                             |                                                                      PROTECTED/CABINET - Legislative-Secrecy |
| **Actions**                                                                                      |                                                                                                              |
| Set headers                                                                                      | "X-Protective-Marking":"VER=2018.6, NS=gov.au, SEC=PROTECTED, CAVEAT=SH:CABINET, ACCESS=Legislative-Secrecy" |
| **User notifications**                                                                           |                                                                                                              |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                                                          Off |
| **Incident reports**                                                                             |                                                                                                              |
| Use this severity level in admin alerts and reports                                              |                                                                                                          Low |
| Send an alert to admins when a rule match occurs                                                 |                                                                                                          Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                                                                          Off |
| **Additional options**                                                                           |                                                                                                              |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                                                                    Unchecked |
| Priority                                                                                         |                                                                                                           42 |


#### PROTECTED CABINET - Personal-Privacy append subject

| Item                                                                                             |                                                            Value |
| ------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------: |
| Name                                                                                             |              PROTECTED CABINET - Personal-Privacy append subject |
| **Conditions**                                                                                   |                                                                  |
| Content contains                                                                                 |                                                                  |
| - Group name                                                                                     |                                                          Default |
| - Group operator                                                                                 |                                                     Any of these |
| - Sensitivity labels                                                                             |                             PROTECTED/CABINET - Personal-Privacy |
| **Actions**                                                                                      |                                                                  |
| Modify subject                                                                                   |                                                                  |
| - Remove text that matches                                                                       |                                              "`\s*?\[SEC=.*?\]`" |
| - Insert this replacement text                                                                   | "` [SEC=PROTECTED, CAVEAT=SH:CABINET, ACCESS=Personal-Privacy]`" |
| - Position                                                                                       |                                        Remove matches and append |
| **User notifications**                                                                           |                                                                  |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                              Off |
| **Incident reports**                                                                             |                                                                  |
| Use this severity level in admin alerts and reports                                              |                                                              Low |
| Send an alert to admins when a rule match occurs                                                 |                                                              Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                              Off |
| **Additional options**                                                                           |                                                                  |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                        Unchecked |
| Priority                                                                                         |                                                               43 |


#### PROTECTED CABINET - Personal-Privacy add x-header

| Item                                                                                             |                                                                                                     Value |
| ------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------: |
| Name                                                                                             |                                                         PROTECTED CABINET - Personal-Privacy add x-header |
| **Conditions**                                                                                   |                                                                                                           |
| Content contains                                                                                 |                                                                                                           |
| - Group name                                                                                     |                                                                                                   Default |
| - Group operator                                                                                 |                                                                                              Any of these |
| - Sensitivity labels                                                                             |                                                                      PROTECTED/CABINET - Personal-Privacy |
| **Actions**                                                                                      |                                                                                                           |
| Set headers                                                                                      | "X-Protective-Marking":"VER=2018.6, NS=gov.au, SEC=PROTECTED, CAVEAT=SH:CABINET, ACCESS=Personal-Privacy" |
| **User notifications**                                                                           |                                                                                                           |
| Use notifications to inform your users and help educate them on the proper use of sensitive info |                                                                                                       Off |
| **Incident reports**                                                                             |                                                                                                           |
| Use this severity level in admin alerts and reports                                              |                                                                                                       Low |
| Send an alert to admins when a rule match occurs                                                 |                                                                                                       Off |
| Use email incident reports to notify you when a policy match occurs                              |                                                                                                       Off |
| **Additional options**                                                                           |                                                                                                           |
| If there's a match for this rule, stop processing additional DLP policies and rules              |                                                                                                 Unchecked |
| Priority                                                                                         |                                                                                                        44 |


### Policy mode

| Item        |                          Value |
| ----------- | -----------------------------: |
| Policy mode | Turn the policy on immediately |

### Related information

#### Security & Governance

* None identified
  
#### Design

* None identified
  
#### Configuration

* None identified

#### References

* None identified