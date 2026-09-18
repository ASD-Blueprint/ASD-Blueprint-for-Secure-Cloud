---
title: "Microsoft Teams clients"
weight: 30
description: "This section describes the design decisions associated with the Microsoft Teams client according to guidance in ASD's Blueprint for Secure Cloud."
---

The [Microsoft Teams client](https://learn.microsoft.com/en-au/microsoftteams/teams-client-desktop-admin) operates across multiple platforms and devices, necessitating distinct security and management approaches. Configuration spans both local client settings and integrations with Entra ID, Intune, Defender for Office 365, and Purview.

These approaches are shaped by the two primary contexts in which Teams clients are used:

- **[User clients](https://learn.microsoft.com/en-au/microsoftteams/teams-client-desktop-admin):** This includes desktop clients (Windows, macOS, VDI), mobile clients (iOS, Android), and web clients. These are used by individual users signing in interactively. This context supports security controls such as Multi-Factor Authentication (MFA), as well as Intune compliance and data protection policies.

- **[Device clients](https://learn.microsoft.com/en-au/microsoftteams/devices/certified-devices-overview):** This includes Microsoft Teams Rooms (MTRs) and panels, and Teams Phones. These are typically communal, appliance-like devices that sign in automatically using non-interactive resource accounts. As such, they do not support MFA. Instead, they rely on Intune device compliance policies and other foundational [security measures](https://learn.microsoft.com/en-au/microsoftteams/rooms/security) to reduce the attack surface.

### User client configuration

Teams client configurations are managed through a combination of Entra ID, Intune, and the [Teams admin center](https://learn.microsoft.com/en-au/microsoftteams/manage-teams-in-modern-portal). Together, these platforms control access, enforce compliance, and govern in-app functionality:

- Entra ID evaluates [Conditional Access policies](/configuration/entra-id/protection/conditional-access/policies) to enforce user authentication and session prerequisites.
- Intune secures endpoints by applying device compliance rules and application data protection policies.
- The Teams admin center manages in-app functionality through service-side, user-centric policies for meetings, messaging, and calling.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                   | Design decision                                                                                   | Justification                                                                        |
| :------------------------------- | :------------------------------------------------------------------------------------------------ | :----------------------------------------------------------------------------------- |
| Access control                   | Incorporate Teams in baseline Conditional Access policies for all M365 apps                       | Ensures a consistent authentication experience for users                             |
| Device security posture          | Use Intune device compliance policies as a grant control in Conditional Access                    | Blocks access from unhealthy or non-compliant corporate devices                      |
| Unmanaged device data protection | Use Intune App Protection Policies as a grant control in Conditional Access for unmanaged devices | Protects corporate data on unmanaged devices without requiring full device enrolment |
| In-app functionality             | Manage all user and feature settings in the Teams admin centre                                    | Centralises feature management in the dedicated service admin portal                 |

{{% /alert %}}

### User client deployment

User clients are managed differently depending on their platform. The Teams desktop client is typically [deployed](https://learn.microsoft.com/en-au/microsoftteams/deploy-overview) as part of the Microsoft 365 Apps for Enterprise suite but follows its own [update lifecycle](https://learn.microsoft.com/en-au/microsoftteams/teams-client-update). Mobile clients are distributed via public app stores or managed through Intune.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                  | Design decision                                                          | Justification                                                                                |
| :------------------------------ | :----------------------------------------------------------------------- | :------------------------------------------------------------------------------------------- |
| Desktop deployment method       | Include the Teams client in the base Microsoft 365 Apps deployment       | Simplifies the initial rollout and ensures all users receive Teams by default                |
| Desktop client update mechanism | Use the Teams client's native auto-update engine                         | Reduces administrative overhead and ensures the client remains current with security updates |
| Mobile client deployment        | Use Intune to manage the deployment of Teams on corporate mobile devices | Ensures clients are properly installed and managed, and enables compliance checks            |

{{% /alert %}}

### Device security and management

Shared Teams devices should be managed separately from user clients because they use non-interactive resource accounts, which do not support user-based security controls like multi-factor authentication (MFA).

A layered security model is required to manage sign-in, compliance, platform hardening, and updates. Intune enforces device-level configuration and compliance, while the Teams admin centre manages application settings and certified firmware updates.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                   | Design decision                                                                                                                                                                                                                   | Justification                                                                                      |
| :------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------- |
| Access control                   | Use a [Conditional Access policy](https://learn.microsoft.com/en-au/microsoftteams/rooms/conditional-access-and-compliance-for-devices) for resource accounts that requires both device compliance and a trusted network location | Provides a strong, multi-layered compensating control for non-interactive sign-in by excluding MFA |
| Device compliance                | Apply platform-specific Intune compliance policies to all shared devices                                                                                                                                                          | Ensures only healthy, policy-compliant devices can access services via Conditional Access          |
| Platform hardening               | Use Intune device restriction profiles to disable unnecessary features (e.g. unused USB ports, app sideloading)                                                                                                                   | Reduces the attack surface by limiting access to potentially exploitable device capabilities       |
| Application and firmware updates | Manage software and firmware updates for Teams hardware via the Teams admin centre                                                                                                                                                | Ensures specialised devices receive certified updates from their native management platform        |
| Network isolation                | Place devices on a dedicated VLAN or trusted network segment with restricted access                                                                                                                                               | Limits exposure to lateral movement and reduces the device’s value as an attack vector             |
| Physical security                | Where possible, use lockable enclosures, port blockers, and tamper-evident seals                                                                                                                                                  | Prevents theft, physical tampering, and unauthorised peripheral access                             |
| Operational controls             | Monitor sign-in logs and regularly inspect devices for physical tampering                                                                                                                                                         | Supports anomaly detection                                                                         |

{{% /alert %}}

### Virtual desktop infrastructure (VDI)

Running [Teams in VDI](https://learn.microsoft.com/en-au/microsoftteams/teams-client-vdi-requirements-deploy) introduces unique requirements not present on physical clients:

- The VDI platform should support media optimisation to offload AV processing from the session host to the user's local endpoint, which is required to prevent high latency and server load.
- The client should be installed per-machine on the golden image. For the [VDI 2.0 architecture](https://learn.microsoft.com/en-au/microsoftteams/vdi-2), this is a _slim client_ that requires periodic image updates, even though its PWA components auto-update.
- A solution like [FSLogix](https://learn.microsoft.com/en-au/fslogix/overview) is required for non-persistent sessions to roam user-specific data and prevent Teams from re-installing or re-syncing at every sign-in.
- The user's local device (thin client or PC) should be certified for optimisation and have a direct network path to Microsoft 365 media relays, bypassing the VDI connection.

### End-to-end encryption (E2EE)

Teams supports E2EE for [one-to-one calls](https://learn.microsoft.com/en-au/microsoftteams/teams-end-to-end-encryption) and, with Teams Premium, for [scheduled meetings](https://learn.microsoft.com/en-au/microsoftteams/end-to-end-encrypted-meetings) of up to 200 participants. E2EE ensures only the communicating endpoints can decrypt content, providing maximum confidentiality.

E2EE disables features such as recording, transcription, live captions, call transfer, and compliance auditing. It can be used in scenarios where confidentiality requirements take precedence over collaboration features and oversight capabilities.

### Network optimisation

A high-quality Teams experience requires an [optimised network](https://learn.microsoft.com/en-au/microsoftteams/prepare-network) that provides a direct path to the Microsoft 365 service endpoints and prioritises real-time media traffic. Bandwidth needs can be estimated using the [Network Planner tool](https://learn.microsoft.com/en-au/microsoftteams/network-planner), and ongoing network health is monitored using the Teams [Call Quality Dashboard (CQD)](https://learn.microsoft.com/en-au/microsoftteams/monitor-call-quality-qos).

This network prioritisation can be implemented using [Quality of Service (QoS)](https://learn.microsoft.com/en-au/microsoftteams/qos-in-teams) by applying Differentiated Services Code Point (DSCP) markings to packets and [configuring clients](https://learn.microsoft.com/en-au/microsoftteams/qos-in-teams-clients) and network infrastructure to respect those markings.

{{% alert title="Design decisions" color="warning" %}}

| Decision point               | Design decision                                                                           | Justification                                                                                                      |
| :--------------------------- | :---------------------------------------------------------------------------------------- | :----------------------------------------------------------------------------------------------------------------- |
| Network path optimisation    | Consider local internet egress and bypass proxies for trusted Microsoft 365 traffic       | Can reduce latency by avoiding corporate network backhauling and deep packet inspection of known, trusted services |
| Media traffic prioritisation | Consider implementing internal network QoS and split tunnelling for VPN users             | Helps protect real-time audio and video from packet loss and jitter on both corporate and remote networks          |
| QoS policy scope             | Apply any QoS policies to all clients and network infrastructure supporting Teams traffic | Ensures end-to-end traffic prioritisation for optimal user experience                                              |
| Bandwidth planning           | Size network connections based on concurrent user projections and usage patterns          | Prevents network congestion during peak usage periods                                                              |

{{% /alert %}}

### Microsoft Defender for Office 365 (MDO) integration

Teams is integrated with [Defender for Office 365](https://learn.microsoft.com/en-au/defender-office-365/mdo-support-teams-about) which provides both Teams-specific features and broader security services that enable specific features within the Teams client.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                       | Design decision                                                                            | Justification                                                                                                    |
| :----------------------------------- | :----------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------- |
| Safe Links for Teams                 | Enable Safe Links scanning for all Teams messages and apply organisation-wide              | Provides real-time URL protection to detect and block malicious links before users click them                    |
| Safe Attachments for Teams           | Enable Safe Attachments scanning for Teams files                                           | Detects malware in files shared through Teams using dynamic detonation analysis                                  |
| Zero-Hour Auto Purge (ZAP) for Teams | Enable ZAP for Teams chats, group chats, and channels with automatic user notification     | Automatically removes malicious messages from user inboxes after delivery, mitigating damage from missed threats |
| User message reporting               | Enable user reporting to security operations mailboxes (only)                              | Allows end users to contribute to threat detection whilst providing forensic data for incident response          |
| Attack Simulation Training for Teams | Include Teams-based phishing simulations in organisation-wide security awareness campaigns | Tests user awareness and reinforces security training                                                            |

{{% /alert %}}

### Purview integration

The Teams client enforces data governance policies configured in Purview. This integration is essential for protecting information in real time. Organisations should consider implementing [Data Loss Prevention (DLP) policies](https://learn.microsoft.com/en-au/purview/dlp-microsoft-teams) using Sensitive Information Types (SITs) to automatically detect and block sensitive and security-classified information from being shared in chats and channels.

Additionally, [Purview sensitivity labels](https://learn.microsoft.com/en-au/purview/sensitivity-labels-teams-groups-sites) can be applied to Teams meetings to enforce security controls and, with Teams Premium, these controls can include advanced protections such as applying watermarks to shared content or video feeds and blocking meeting recording.

Using Purview for Teams containers, chats, and channels is discussed in more detail in the [labelling and classification](/design/shared-services/purview/labelling-and-classification) design page.

### Related information

#### Security and governance

- None identified

#### Design

- [Information labelling and classification](/design/shared-services/purview/labelling-and-classification)

#### Configuration

- [Conditional Access policies](/configuration/entra-id/protection/conditional-access/policies)
- [Messaging](/configuration/teams/setting-and-policies/global-settings/messaging/messaging)
- [Microsoft Teams protection](/configuration/defender/system/settings/email-and-collaboration/microsoft-teams-protection)
- [Safe attachments](/configuration/defender/email-and-collaboration/policies-and-rules/threat-policies/safe-attachments)
- [Safe links](/policies-and-rules/threat-policies/safe-links)
- [User reported settings](/configuration/defender/system/settings/email-and-collaboration/user-reported-settings)

#### References

- [Conditional Access and Intune compliance for Microsoft Teams Rooms and panels](https://learn.microsoft.com/en-au/microsoftteams/rooms/conditional-access-and-compliance-for-devices)
- [Data loss prevention and Microsoft Teams](https://learn.microsoft.com/en-au/purview/dlp-microsoft-teams)
- [Implement Quality of Service (QoS) in Microsoft Teams](https://learn.microsoft.com/en-au/microsoftteams/qos-in-teams)
- [Implement Quality of Service (QoS) in Microsoft Teams desktop clients on Windows](https://learn.microsoft.com/en-au/microsoftteams/qos-in-teams-clients)
- [Improve call quality in Microsoft Teams](https://learn.microsoft.com/en-au/microsoftteams/monitor-call-quality-qos)
- [Install Teams for Virtualized Desktop Infrastructure (VDI)](https://learn.microsoft.com/en-au/microsoftteams/teams-client-vdi-requirements-deploy)
- [IT Admins - Microsoft Teams deployment overview](https://learn.microsoft.com/en-au/microsoftteams/deploy-overview)
- [Manage teams in the Microsoft Teams admin center](https://learn.microsoft.com/en-au/microsoftteams/manage-teams-in-modern-portal)
- [Microsoft Defender for Office 365 support for Microsoft Teams](https://learn.microsoft.com/en-au/defender-office-365/mdo-support-teams-about)
- [Microsoft Teams client](https://learn.microsoft.com/en-au/microsoftteams/teams-client-desktop-admin)
- [Microsoft Teams Rooms on Windows and Teams Android device security](https://learn.microsoft.com/en-au/microsoftteams/rooms/security)
- [New VDI solution for Teams](https://learn.microsoft.com/en-au/microsoftteams/vdi-2)
- [Overview of Teams certified devices](https://learn.microsoft.com/en-au/microsoftteams/devices/certified-devices-overview)
- [Prepare your organization's network for Microsoft Teams](https://learn.microsoft.com/en-au/microsoftteams/prepare-network)
- [Require end-to-end encryption for sensitive Teams meetings](https://learn.microsoft.com/en-au/microsoftteams/end-to-end-encrypted-meetings)
- [Microsoft Teams client](https://learn.microsoft.com/en-au/microsoftteams/teams-client-desktop-admin)
- [Use end-to-end encryption for one-to-one Microsoft Teams calls](https://learn.microsoft.com/en-au/microsoftteams/teams-end-to-end-encryption)
- [Use sensitivity labels to protect content in Microsoft Teams, Microsoft 365 groups, and SharePoint sites](https://learn.microsoft.com/en-au/purview/sensitivity-labels-teams-groups-sites)
- [Use the Network planner for Microsoft Teams](https://learn.microsoft.com/en-au/microsoftteams/network-planner)
- [What is FSLogix?](https://learn.microsoft.com/en-au/fslogix/overview)
- [Why it's important to keep Teams updated.](https://learn.microsoft.com/en-au/microsoftteams/teams-client-update)
