---
title: "Voice Calling"
weight: 45
description: "This section describes the design decisions associated with Teams Voice Calling for system(s) built using ASD's Blueprint for Secure Cloud."
---

Enables organisations to make calls to landlines or mobiles within Microsoft Teams. Voice calling can be configured in a number of ways depending on the requirements of the organisation, and whether a telephony system is already in place:

* **VoIP calling:** Available within Teams by default without any configuration required. Users can make voice or video calls to each other and collaborate over the internet outside of the PSTN (Public Switched Telephone Network) system. PSTN users outside of Teams can dial in using the provided PSTN dial in conference number to VoIP meetings where this is enabled.
* **Operator Connect:** Operator Connect enables a simple PSTN connection method which enables organisations to connect to a PSTN provider of their choice if they participate in the Operator Connect program. The PSTN integration is managed as a service by the chosen operator.
* **Calling Plan via Telstra Calling for Office 365:** Telstra Calling avoids the complexity of separate collaboration systems and can be enabled within Teams. Similar to Operator Connect, this method provides a fully managed service by Telstra for Teams calling to PSTN systems.
* **Direct Routing:** Direct Routing enables hybrid organisations to connect their on-premises telephony infrastructure to Microsoft Teams through a series of supported on-premises Session Border Controllers (SBC). This method provides the organisation a self-managed service for Teams calling to PSTN systems.

{{% alert title="Design decisions" color="warning" %}}

| Decision point         | Design decision             | Justification                                                                                                                                         |
|------------------------|-----------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| Voice Calling solution | Organisation decision       | The organisation should assess their requirements for calling in order to select the right calling solution for Teams.                                |
| Security Assessment    | Organisation to risk assess | As the calling options are hosted outside of the Microsoft 365 system boundary by third party providers they should be risk assessed to determine suitability. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* None identified

#### References

* None identified
