---
title: "Tablet mode"
weight: 65
description: "This section describes the design decisions associated with tablet mode on Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

Tablet Mode is an adaptive user experience feature in Windows that optimises the look and behaviour of applications and the Windows shell for the physical form factor and end-users usage preferences.

Tablet Mode is a feature that switches a device experience from tablet mode to desktop mode and back. The primary way for an end-user to enter and exit "tablet mode" is manually through the Action Centre. In addition, Original Equipment Manufacturers (OEMs) can report hardware transitions (for example, transformation of 2-in-1 device from clamshell to tablet and vice versa), enabling automatic switching between the two modes.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point | Design Decision                                | Justification                                                                                             |
|----------------|------------------------------------------------|-----------------------------------------------------------------------------------------------------------|
| Tablet Mode    | Enabled by default on devices that support it. | To provide the option to manipulate Tablet Mode behaviour through the Action Centre on supported devices. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* None identified