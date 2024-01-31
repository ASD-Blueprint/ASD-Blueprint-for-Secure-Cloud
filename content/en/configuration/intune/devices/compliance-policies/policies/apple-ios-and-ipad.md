---
Title: "Apple iOS and iPad"
weight: 30
description: "This section describes the configuration of device compliance policies within Microsoft Intune associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Intune portal blade at the following URL:

https://intune.microsoft.com/#view/Microsoft_Intune_DeviceSettings/DevicesComplianceMenu/~/policies
 
The settings described in these tables should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

### Basics

| Item         |                 Value |
| ------------ | --------------------: |
| Name         |    Apple ios and iPad |
| Description  |                    -- |
| Platform     |            iOS/iPadOS |
| Profile type | iOS compliance policy |

### Compliance settings

#### Email

| Item                                 |          Value |
| ------------------------------------ | -------------: |
| Unable to set up email on the device | Not configured |

#### Device Health

| Item                                                         |  Value |
| ------------------------------------------------------------ | -----: |
| Jailbroken devices                                           |  Block |
| Require the device to be at or under the Device Threat Level | Medium |

#### Device Properties

| Item                                  |          Value |
| ------------------------------------- | -------------: |
| Minimum OS version                    |         14.8.1 |
| Maximum OS version                    | Not configured |
| Minimum OS version for mobile devices |         18H107 |
| Maximum OS version for mobile devices | Not configured |

#### Microsoft Defender for Endpoint

| Item                                                        |  Value |
| ----------------------------------------------------------- | -----: |
| Require the device to be at or under the machine risk score | Medium |

#### System Security

| Item                                                  |           Value |
| ----------------------------------------------------- | --------------: |
| **Password**                                          |                 |
| Require a password to unlock mobile devices           |         Require |
| **Device enrollment and automated device enrollment** |                 |
| Simple passwords                                      |           Block |
| Minimum password length                               |              14 |
| Required password type                                |    Alphanumeric |
| Number of non-alphanumeric characters in password     |               1 |
| Maximum minutes of inactivity until screen locks      |     Immediately |
| Password expiration (days)                            |  Not configured |
| Number of previos passwords to prevent reuse          |             365 |
| **Device Security**                                   | 5 |
| Restricted apps                                       | None configured |

### Actions for noncompliance

| Item                     |       Value |
| ------------------------ | ----------: |
| **Action**               |             |
| Mark device noncompliant | Immediately |


### Scope tags

| Item       |   Value |
| ---------- | ------: |
| Scope tags | Default |

### Assignments

#### Included groups

| Item   |                                       Value |
| ------ | ------------------------------------------: |
| Groups | rol-<org>-administrators<br>rol-<org>-users |

#### Excluded groups

No results.

### Related information

#### Security & Governance

* None identified
  
#### Design

* None identified
  
#### Configuration

* None identified

#### References

* None identified



