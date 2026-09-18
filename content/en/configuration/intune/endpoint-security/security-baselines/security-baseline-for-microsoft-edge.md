---
title: Security baseline for Microsoft Edge
weight: 010
description: "This section describes the configuration of security baselines within Microsoft Intune associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the _as built_ configuration for ASD's _Blueprint for Secure Cloud_ (the Blueprint) for the Microsoft Intune portal at the following URL:

<https://intune.microsoft.com/#view/Microsoft_Intune_Workflows/SecurityManagementMenu/~/securityBaselines>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

{{% alert title="Version" color="info" %}}

This security baseline was created for the [Edge v139 (April 2026)](https://learn.microsoft.com/en-au/intune/intune-service/protect/security-baseline-v2-edge-settings?pivots=edge-v139) release.

{{% /alert %}}

### Basics

| Item        |                                Value |
| ----------- | -----------------------------------: |
| Name        | Security baseline for Microsoft Edge |
| Description |                               _None_ |
| Platform    |                              Windows |

### Assignments

#### Included groups

| Item   |       Value |
| ------ | ----------: |
| Groups | All devices |

#### Excluded groups

| Item   |              Value |
| ------ | -----------------: |
| Groups | No groups selected |

### Scope Tags

| Item       |   Value |
| ---------- | ------: |
| Scope tags | Default |

### Configuration settings

#### Microsoft Edge

| Item                                                                                    |                                                  Value |
| --------------------------------------------------------------------------------------- | -----------------------------------------------------: |
| Allow unconfigured sites to be reloaded in Internet Explorer mode                       |                                               Disabled |
| Allow users to proceed from the HTTPS warning page                                      |                                               Disabled |
| Automatically open downloaded MHT or MHTML files from the web in Internet Explorer mode |                                               Disabled |
| Dynamic Code Settings                                                                   |                                                Enabled |
| - Dynamic Code Settings (Device)                                                        | Prevent the browser process from creating dynamic code |
| Enable Application Bound Encryption                                                     |                                                Enabled |
| Enable browser legacy extension point blocking                                          |                                                Enabled |
| Enable site isolation for every site                                                    |                                                Enabled |
| Show the Reload in Internet Explorer mode button in the toolbar                         |                                               Disabled |
| Specifies whether SharedArrayBuffers can be used in a non cross-origin-isolated context |                                               Disabled |
| Allow software WebGL fallback using SwiftShader                                         |                                               Disabled |

##### Extensions

| Item                                                                                |   Value |
| ----------------------------------------------------------------------------------- | ------: |
| Control which extensions cannot be installed                                        | Enabled |
| Extension IDs the user should be prevented from installing (or \* for all) (Device) |      \* |

##### HTTP authentication

| Item                                      |          Value |
| ----------------------------------------- | -------------: |
| Allow Basic authentication for HTTP       |       Disabled |
| Supported authentication schemes          |        Enabled |
| Supported authentication schemes (Device) | ntlm,negotiate |

##### Native Messaging

| Item                                                                          |    Value |
| ----------------------------------------------------------------------------- | -------: |
| Allow user-level native messaging hosts (installed without admin permissions) | Disabled |

##### SmartScreen settings

| Item                                                                         |   Value |
| ---------------------------------------------------------------------------- | ------: |
| Configure Microsoft Defender SmartScreen                                     | Enabled |
| Configure Microsoft Defender SmartScreen to block potentially unwanted apps  | Enabled |
| Prevent bypassing Microsoft Defender SmartScreen prompts for sites           | Enabled |
| Prevent bypassing of Microsoft Defender SmartScreen warnings about downloads | Enabled |

##### Typosquatting Checker settings

| Item                                   |   Value |
| -------------------------------------- | ------: |
| Configure Edge Website Typo Protection | Enabled |

### Related information

#### Security and governance

- [Authentication hardening](/security-and-governance/system-security-plan/system-hardening-authentication)
- [Enterprise mobility](/security-and-governance/system-security-plan/enterprise-mobility)

#### Design

- [Microsoft Edge for Business](/design/endpoints/applications/microsoft-edge-for-business)

#### Configuration

- [ASD Edge hardening](/configuration/intune/devices/configuration-policies/asd-edge-hardening)

#### References

- [Microsoft Edge security baseline settings reference for Microsoft Intune](https://learn.microsoft.com/en-au/intune/intune-service/protect/security-baseline-v2-edge-settings?pivots=edge-v139)
