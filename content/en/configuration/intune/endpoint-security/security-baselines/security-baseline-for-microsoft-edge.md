---
Title: Security Baseline for Microsoft Edge
weight: 30
description: "This section describes the configuration of security baselines within Microsoft Intune associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Intune portal blade at the following URL:

https://intune.microsoft.com/#view/Microsoft_Intune_Workflows/SecurityManagementMenu/~/securityBaselines
 
The settings described in these tables should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

### Basics

| Item        |                                Value |
| ----------- | -----------------------------------: |
| Name        | Security Baseline for Microsoft Edge |
| Description |                                      |
| Platform    |                 Windows 10 and later |

### Assignments

| Item            | Value |
| --------------- | ----: |
| Included groups |       |
| Excluded groups |       |

### Configuration settings

#### Microsoft Edge

| Item                                                                                    |    Value |
| --------------------------------------------------------------------------------------- | -------: |
| Allow unconfigured sites to be reloaded in Internet Explorer mode                       | Disabled |
| Allow users to proceed from the HTTPS warning page                                      | Disabled |
| Enable browser legacy extension point blocking                                          |  Enabled |
| Enable site isolation for every site                                                    |  Enabled |
| Enhance images enabled                                                                  | Disabled |
| Force WebSQL to be enabled                                                              | Disabled |
| Minimum TLS version enabled                                                             |  Enabled |
| - Minimum SSL version enabled (Device)                                                  |  TLS 1.2 |
| Show the Reload in Internet Explorer mode button in the toolbar                         | Disabled |
| Specifies whether SharedArrayBuffers can be used in a non cross-origin-isolated context | Disabled |

##### Extensions

| Item                                                                               |   Value |
| ---------------------------------------------------------------------------------- | ------: |
| Control which extensions cannot be installed                                       | Enabled |
| Extension IDs the user should be prevented from installing (or * for all) (Device) |       * |

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

##### Password manager and protection

| Item                                            |    Value |
| ----------------------------------------------- | -------: |
| Enable saving passwords to the password manager | Disabled |

##### Private Network Request Settings

| Item                                                                                            |    Value |
| ----------------------------------------------------------------------------------------------- | -------: |
| Specifies whether to allow insecure websites to make requests to more-private network endpoints | Disabled |

##### SmartScreen settings

| Item                                                                         |   Value |
| ---------------------------------------------------------------------------- | ------: |
| Configure Microsoft Defender SmartScreen                                     | Enabled |
| Configure Microsoft Defender SmartScreen to block potentially unwanted apps  | Enabled |
| Prevent bypassing Microsoft Defender SmartScreen prompts for sites           | Enabled |
| Prevent bypassing of Microsoft Defender SmartScreen warnings about downloads | Enabled |