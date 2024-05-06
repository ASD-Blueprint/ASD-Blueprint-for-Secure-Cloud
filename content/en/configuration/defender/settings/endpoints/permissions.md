---
Title: Permissions
weight: 20
description: "This section describes the configuration of permissions within Microsoft Defender associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* for Defender portal blade at the following URL: 

https://security.microsoft.com/securitysettings/endpoints/user_roles
 
The settings described on these pages should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}


### Roles

#### Microsoft Defender for Endpoint Administrator (default)

| Item                     | Value                               |
| ------------------------ | -----------------------------------:|
| **General**              |                                     |
| All Settings             | *Leave as default*                  |
| **Assigned user groups** |                                     |
| Group Name               | Azure ATP (workspace name) Administrator |

#### Microsoft Defender for Endpoint Remediation

| Item                                                                                 | Value                                       |
| ------------------------------------------------------------------------------------ | -------------------------------------------:|
| **General**                                                                          |                                             |
| Role name                                                                            | Microsoft Defender for Endpoint Remediation |
| Description                                                                          | Permissions to view Defender ATP details    |
| View Data - Security operations                                                      | Enabled                                     |
| View Data - Defender Vulnerability Management                                        | Enabled                                     |
| Active remediation action - Security Operations                                      | Enabled                                     |
| Active remediation action - Defender Vulnerability Management - Exception handling   | Enabled                                     |
| Active remediation action - Defender Vulnerability Management - Remediation handling | Enabled                                     |
| Alerts investigation                                                                 | Enabled                                     |
| Live response capabilities                                                           | Enabled                                     |
| - Advanced                                                                           | Selected                                    |
| **Assigned User groups**                                                             |                                             |
| Group Name                                                                           | Azure ATP (workspace name) User             |

#### Microsoft Defender for Endpoint Viewer

| Item                                          | Value                                                              |
| --------------------------------------------- | ------------------------------------------------------------------:|
| **General**                                   |                                                                    |
| Role name                                     | Microsoft Defender for Endpoint Viewer                             |
| Description                                   | Users with access to Investigate and Remediate Defender ATP Alerts |
| View Data - Security operations               | Enabled                                                            |
| View Data - Defender Vulnerability Management | Enabled                                                            |
| **Assigned User groups**                      |                                                                    |
| Group Name                                    | Azure ATP (workspace name) Viewer                                  |

### Device groups

#### Windows 10/11

| Item              | Value                                                                                                          |
| ----------------- | --------------------------------------------------------------------------------------------------------------:|
| Rank              | 1                                                                                                              |
| **General**       |                                                                                                                |
| Device group name | Windows 10/11                                                                                                  |
| Remediation level | Full - remediate threats automatically                                                                         |
| Description       | Defender ATP Device Group for all Windows 10 & 11 devices                                                      |
| **Devices**       |                                                                                                                |
| Name              | `Not configured`                                                                                               |
| AND Domain        | `Not configured`                                                                                               |
| AND Tag           | `Not configured`                                                                                               |
| AND OS            | In - Windows 10, Windows 11                                                                                    |
| **User access**   |                                                                                                                |
| Group Name        | Azure ATP (workspace name) Administrator, Azure ATP (workspace name) Users, Azure ATP (workspace name) Viewers |

#### Ungrouped devices

| Item              | Value                                                                                                          |
| ----------------- | --------------------------------------------------------------------------------------------------------------:|
| Rank              | last                                                                                                           |
| **General**       |                                                                                                                |
| Device group name | Ungrouped devices                                                                                              |
| Remediation level | Full - remediate threats automatically                                                                         |
| Description       | Defender ATP Device Group for all ungrouped devices                                                            |
| **Devices**       |                                                                                                                |
| Name              | `Not configured`                                                                                               |
| AND Domain        | `Not configured`                                                                                               |
| AND Tag           | `Not configured`                                                                                               |
| AND OS            | In - None                                                                                                      |
| **User access**   |                                                                                                                |
| Group Name        | Azure ATP (workspace name) Administrator, Azure ATP (workspace name) Users, Azure ATP (workspace name) Viewers |

### Related information

#### Security & Governance

* [System Management]({{<ref "system-management.md">}})
* [Essential Eight: User Application Hardening]({{<ref "user-application-hardening.md">}})
  
#### Design

* [Endpoint Security - Devices]({{<ref "design/platform/security/endpoint-security">}})
  
#### Configuration

* [Microsoft Intune - Applications]({{<ref "configuration/intune/apps">}})
* [Microsoft Entra ID - Applications]({{<ref "configuration/entra-id/applications">}})
* [Microsoft Intune - Profile Configurations]({{<ref "configuration/intune/devices/configuration-profiles">}})

#### References

* [Defender for Endpoint](https://learn.microsoft.com/microsoft-365/security/defender-endpoint)