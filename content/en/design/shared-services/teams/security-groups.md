---
title: "Teams Dynamic Security group"
weight: 45
description: "This section describes the design decisions associated with Teams Teams Dynamic Security group for system(s) built using ASD's Blueprint for Secure Cloud."
---

Dynamic Security Groups are Microsoft Entra ID security groups that are populated based on device and/or user attributes. Dynamic Security Groups can be leveraged to control access to locations, services and features.

The membership of a Dynamic Security Group is updated whenever an attribute of a device or user is modified. If the user/device no longer matches the Group rule, then that user/device is removed. Conversely if a user/device now matches the Group rule, then they are added. When a user is added the Group can be configured so that the added user receives an email notifying them of the addition.

Naming of Dynamic Security groups can be streamlined using a Naming Policy. The Naming Policy ensures that the groups within the environment conform to a standard and their purpose can be easily identified.

{{% alert title="Design decisions" color="warning" %}}

| Decision point | Design decision                                         | Justification                                                                                          |
|----------------|---------------------------------------------------------|--------------------------------------------------------------------------------------------------------|
| Naming Policy  | Configured. Suggestion `grp-<Organisation>-<GroupName>` | Assists in MOGs and standardisation of organisation configuration.                                     |
| Welcome Email  | Disabled                                                | The welcome email will be disabled to reduce the amount of generic correspondence being sent to users. |

{{% /alert %}}

{{% alert title="Note" color="info" %}}

The Welcome Email setting is not able to be disabled across the organisation. The setting needs to be applied on individual Office 365 groups. This can be done programmatically: `_Set-UnifiedGroup <groupname> -UnifiedGroupWelcomeMessageEnabled:$false_`

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