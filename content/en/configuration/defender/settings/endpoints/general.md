---
Title: General
weight: 10
description: "This section describes the configuration of endpoints within Microsoft Defender associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* for Defender portal blade at the following URL: 

https://security.microsoft.com/securitysettings/endpoints/integration
 
The settings described on these pages should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}


### Advanced Features

| Item                                                   | Value |
| ------------------------------------------------------ | -----:|
| Restrict correlation to within scoped device groups    | Off   |
| Enable EDR in block mode                               | On    |
| Automatically resolve alerts                           | On    |
| Allow of block file                                    | On    |
| Hide potential duplicate device records                | On    |
| Custom network indicators                              | On    |
| Tamper protection                                      | On    |
| Show user details                                      | On    |
| Skype for business integration                         | On    |
| Microsoft Defender for Cloud Apps                      | On    |
| Web content filtering                                  | On    |
| Device discovery                                       | On    |
| Download quarantined files                             | On    |
| Live response                                          | On    |
| Live response for Servers                              | On    |
| Live response unsigned script execution                | Off   |
| Share endpoint alerts with Microsoft Compliance Center | On    |
| Microsoft Intune connection                            | On    |
| Authenticated telemetry                                | On    |
| Preview features                                       | Off   |

### Related information

#### Security & Governance

* None identified
  
#### Design

* [Devices]({{<ref "design/platform/security/endpoint-security">}})
* [Devices]({{<ref "design/endpoints">}})
  
#### Configuration

* None identified

#### References

* [Defender for Endpoint](https://learn.microsoft.com/microsoft-365/security/defender-endpoint)