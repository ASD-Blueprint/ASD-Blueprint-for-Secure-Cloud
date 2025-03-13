---
title: "Permissions"
linkTitle: "Permissions"
weight: 20
description: "This section describes the configuration of endpoint permissions within Microsoft Defender associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Defender portal at the following URL:

<https://security.microsoft.com/securitysettings/endpoints/user_roles>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Roles

#### Microsoft Defender for Endpoint Administrator (default)

| Item                     |                                  Value |
| ------------------------ | -------------------------------------: |
| **General**              |                                        |
| All Settings             |                     *Leave as default* |
| **Assigned user groups** |                                        |
| Group Name               | Azure ATP *tenant name* Administrators |

#### Microsoft Defender for Endpoint Remediation

| Item                                                                              |                                       Value |
| --------------------------------------------------------------------------------- | ------------------------------------------: |
| **General**                                                                       |                                             |
| Role name                                                                         | Microsoft Defender for Endpoint Remediation |
| View Data                                                                         |                                     Enabled |
| - Security operations                                                             |                                     Enabled |
| - Defender Vulnerability Management                                               |                                     Enabled |
| Active remediation actions                                                        |                                     Enabled |
| - Security Operations                                                             |                                     Enabled |
| - Defender Vulnerability Management - Exception handling                          |                                     Enabled |
| - Defender Vulnerability Management - Remediation handling                        |                                     Enabled |
| - Defender Vulnerability Management - Application handling                        |                                     Enabled |
| Defender Vulnerability Management - Manage security baselines assessment profiles |                                     Enabled |
| Alerts investigation                                                              |                                     Enabled |
| Manage security settings in Security Center                                       |                                    Disabled |
| Live response capabilities                                                        |                                     Enabled |
| - Advanced                                                                        |                                    Selected |
| **Assigned User groups**                                                          |                                             |
| Group Name                                                                        |               Azure ATP *tenant name* Users |

#### Microsoft Defender for Endpoint Viewer

| Item                                |                                  Value |
| ----------------------------------- | -------------------------------------: |
| **General**                         |                                        |
| Role name                           | Microsoft Defender for Endpoint Viewer |
| View Data                           |                                Enabled |
| - Security operations               |                                Enabled |
| - Defender Vulnerability Management |                                Enabled |
| **Assigned User groups**            |                                        |
| Group Name                          |        Azure ATP *tenant name* Viewers |

### Device groups

#### Windows 10/11

| Item              |                                                                                                  Value |
| ----------------- | -----------------------------------------------------------------------------------------------------: |
| Rank              |                                                                                                      1 |
| **General**       |                                                                                                        |
| Device group name |                                                                                          Windows 10/11 |
| Remediation level |                                                                 Full - remediate threats automatically |
| **Devices**       |                                                                                                        |
| Name              |                                                                                       `Not configured` |
| AND Domain        |                                                                                       `Not configured` |
| AND Tag           |                                                                                       `Not configured` |
| AND OS            |                                                                            In - Windows 10, Windows 11 |
| **User access**   |                                                                                                        |
| Group Name        | Azure ATP *tenant name* Administrators, Azure ATP *tenant name* Users, Azure ATP *tenant name* Viewers |

#### Ungrouped devices

| Item              |                                                                                                  Value |
| ----------------- | -----------------------------------------------------------------------------------------------------: |
| Rank              |                                                *Not applicable for the default ungrouped device group* |
| **General**       |                                                                                                        |
| Device group name |                                                                            Ungrouped devices (default) |
| Remediation level |                                                                 Full - remediate threats automatically |
| **Devices**       |                                                *Not applicable for the default ungrouped device group* |
| **User access**   |                                                                                                        |
| Group Name        | Azure ATP *tenant name* Administrators, Azure ATP *tenant name* Users, Azure ATP *tenant name* Viewers |

### Related information

#### Security & Governance

* [System Management]({{<ref "system-management.md">}})
* [Essential Eight: User Application Hardening]({{<ref "user-application-hardening.md">}})
  
#### Design

* [Endpoint Security - Devices]({{<ref "design/platform/security/endpoint-security">}})
  
#### Configuration

* [Microsoft Intune - Applications]({{<ref "configuration/intune/apps">}})
* [Microsoft Entra ID - Applications]({{<ref "configuration/entra-id/applications">}})
* [Microsoft Intune - Profile Configurations]({{<ref "configuration/intune/devices/configuration-policies">}})

#### References

* [Defender for Endpoint](https://learn.microsoft.com/microsoft-365/security/defender-endpoint)
