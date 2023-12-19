---
title: "Networking"
weight: 110
description: "This section describes the design decisions associated with the networking technologies built into Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

Windows 10 and 11 contains networking technologies built into the operating system. These features allow Windows to communicate with other networked devices including those on the Internet.

IPv6 can be enabled or disabled within Windows 10 and 11 depending on the network to which the device will be connected. IPv6 should be disabled unless it is exclusively used throughout the network. 

Windows provides support for several wireless networking technologies that allow devices to connect to a wireless network. The two most popular technologies supported in Windows currently are Wi-Fi and Mobile Broadband networking.

802.1x ensures that only appropriate users or devices can connect to a PROTECTED network and that data is secure at the radio transmission level. The Single Sign-On (SSO) feature executes Layer 2 network authentication at the appropriate time given the network security configuration, integrating with the user's Windows logon experience.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point         | Design Decision                                                  | Justification                                                                                                                                             |
|------------------------|------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| IPv6                   | Disabled                                                         | To align with ASD's [*Hardening Microsoft Windows 10 version 21H1 Workstations*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/hardening-microsoft-windows-10-version-21h1-workstations) guidance.<br>Exceptions to this rule are if IPv6 is wholly deployed within an organisation network with no IPv4. |
| Wireless               | Enabled                                                          | Where applicable, wireless capable devices will have Wi-Fi enabled to allow use case of mobile working.                                                   |
| Wireless Configuration | Refer to Table below for wireless configuration recommendations. | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                                                        |
| Broadband              | Not Configured                                                   | If organisation devices have Subscriber Identity Module (SIM) capability this can be enabled without affecting an organisations cyber security posture.        |
| Network Bridging       | Disabled                                                         | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                                                      |
| Wake on LAN (WoL)      | Configured via existing MECM solution if in use                  | Wake on LAN configured to allow existing MECM management tasks to operate on computers regardless of power status.                                        |

{{% /alert %}}

### Wireless configuration

{{% alert title="Design Decisions" color="warning" %}}

| Configuration                                             | Value      | Description                                                         |
|-----------------------------------------------------------|------------|---------------------------------------------------------------------|
| Connect to Wireless Hotspots                              | Enabled    | Allows users to connect to wireless hotspots when working remotely. |
| Automatically Connect to Suggested Open Hotspots          | Disabled   | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                   |
| Prohibit installation and configuration of Network Bridge | Enabled    | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                   |
| Single Sign On 802.1x                                     | Enabled    | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                   |
| Wireless Profile Configuration                            | Configured | Will be configured depending on the organisation requirements.      |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* None identified