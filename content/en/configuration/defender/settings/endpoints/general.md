---
title: "General"
linkTitle: "General"
weight: 10
description: "This section describes the configuration of advanced endpoint features within Microsoft Defender associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Defender portal at the following URL:

<https://security.microsoft.com/securitysettings/endpoints/integration>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Advanced Features

| Item                                                                                        |         Value |
| ------------------------------------------------------------------------------------------- | ------------: |
| Restrict correlation to within scoped device groups                                         |           Off |
| Enable EDR in block mode                                                                    |            On |
| Automatically resolve alerts                                                                |            On |
| Allow or block file                                                                         |            On |
| Hide potential duplicate device records                                                     |            On |
| Custom network indicators                                                                   |            On |
| Tamper protection                                                                           |            On |
| Show user details                                                                           |            On |
| Skype for business integration                                                              |            On |
| Microsoft Defender for Cloud Apps                                                           |            On |
| Web content filtering                                                                       |            On |
| Device discovery                                                                            |            On |
| Download quarantined files                                                                  |            On |
| Default to streamlined connectivity when onboarding devices in Defender portal​​              |            On |
| Apply streamlined connectivity settings to devices managed by Intune and Defender for Cloud |            On |
| Aggregated Reporting                                                                        |            On |
| Live response                                                                               |            On |
| Live response for Servers                                                                   |            On |
| Live response unsigned script execution                                                     |           Off |
| Deception                                                                                   |            On |
| Share endpoint alerts with Microsoft Compliance Center                                      |            On |
| Microsoft Intune connection                                                                 |            On |
| Authenticated telemetry                                                                     |            On |
| Preview features                                                                            |           Off |
| Endpoint Attack Notifications                                                               | *Not applied* |

### Related information

#### Security & Governance

* [User Application Hardening]({{<ref "system-hardening-user-apps.md">}})
* [Essential Eight: User Application Hardening]({{<ref "user-application-hardening.md">}})
  
#### Design

* [Endpoint Security - Devices]({{<ref "design/platform/security/endpoint-security">}})

#### Configuration

* [Microsoft Entra ID - Protection]({{<ref "configuration/entra-id/protection">}})

#### References

* [Defender for Endpoint](https://learn.microsoft.com/microsoft-365/security/defender-endpoint)
