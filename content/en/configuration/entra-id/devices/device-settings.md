---
title: "Device settings"
linkTitle: "Device settings"
weight: 10
type: docs
description: "This page describes the configuration of device settings within Microsoft Entra ID associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Entra ID portal blade at the following URL: 

https://entra.microsoft.com/#view/Microsoft_AAD_Devices/DevicesMenuBlade/~/DeviceSettings
 
The settings described in these tables should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

### Microsoft Entra join and registration settings

| Item                                                                                |     Value |
| ----------------------------------------------------------------------------------- | --------: |
| Users may join devices to Microsoft Entra                                           |       All |
| Users may register their devices with Microsoft Entra                               |       All |
| Require Multifactor Authentication to register or join devices with Microsoft Entra |       Yes |
| Maximum number of devices per user                                                  | Unlimited |

### Local administrator settings

| Item                                                                | Value |
| ------------------------------------------------------------------- | ----: |
| Enable Microsoft Entra Local Administrator Password Solution (LAPS) |   Yes |

### Other settings

| Item                                                                        | Value |
| --------------------------------------------------------------------------- | ----: |
| Restrict users from recovering the BitLocker key(s) for their owned devices |    No |

### Related information

#### Security & Governance

* None identified
  
#### Design

* [Devices]({{<ref "design/platform/identity/devices">}})
  
#### Configuration

* None identified

#### References

* [Microsoft Entra device identity documentation](https://learn.microsoft.com/entra/identity/devices/)