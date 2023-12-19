---
title: "Remote wipe iOS devices"
weight: 15
description: "This section describes the design decisions associated with remote wiping iOS endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

iOS devices can be used to access information while away from the office. The device is used to access the organisations intranet, documents and for collaboration purpose. 

Intune provides the ability to reset the device (factory reset) or remove managed application data from the device. The Factory reset option remotely wipes and resets the iOS device. The Intune manage application wipe does not clear the device of non-managed application data that allow for potential security issues.

The organisation has indicated that the device must be able to be remotely wipe in case it is lost. This is to ensure information cannot be recovered in any circumstances.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point     | Design Decision                                                | Justification                                                                                                                                                                                                                            |
|--------------------|----------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Device Lost Mode   | Enabled                                                        | Lost mode sends notification to the device's lock screen.                                                                                                                                                                                |
| Device remote wipe | Device will be remote wiped of corporate data (Factory Reset) | To minimise the security if the device is lost or not return to the organisation.<br>Intune remotely wipe and reset the iOS device when a user is off-boarded. This allows the device to be reassign to other users in the organisation. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* None identified