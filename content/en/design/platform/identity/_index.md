---
title: Identity and Access Management
weight: 10
description: "This section describes the design decisions associated with Microsoft Entra ID which is the cloud based Authentication and Authorisation service for system(s) built using ASD's Blueprint for Secure Cloud."
---

Identity and access management (IAM) is arguably the cornerstone of security within ASD's *Blueprint for Secure Cloud* (the Blueprint). It is the framework upon which user, device, and resource identities are managed. At its core, there are two IAM elements:

1. **Authentication**: the process of a system verifying the identity of a user or workload
2. **Authorisation**: the process of a system determining whether an identity should have access to an object or service.

Microsoft 365 authentication needs an identity, for users this is represented as the User Principal Name (UPN) and something by which their identity can be confirmed such as a password, biometric gesture, FIDO2 token, certificate, or a combination of these methods.

Organisations should consider appropriate identity management solutions which cater for their users joining, moving, and leaving the organisation. They should look to leverage a system or systems which can provide appropriate sources of truth such as a human resources system for a user's position information and therefore group and role membership, a learning management system (LMS) for additional credentials and so on. The selected solution should centralise storage of identity information for a single point of truth of authentication and authorisation activities, thereby minimising potential conflicts and creating a seamless user experience.

### Microsoft Entra ID

Microsoft Entra ID, previously named Azure Active Directory (AAD), is the multi-cloud identity and access management solution used by all Microsoft 365 services and associated workloads. It allows for integration with third-party applications to provide the third-party application with the rich identity features within Microsoft Entra ID such as multi-factor authentication, automatic provisioning, Conditional Access, and single sign-on. There are two options for creating Entra ID user accounts: cloud-only or standalone identities, and hybrid identities.

#### Cloud-only identities

As the name implies, cloud-only identities exist only within the Entra ID cloud environment. A user may also have an account within an on-premises Active Directory in addition to an account within the organisation's Entra ID tenant effectively isolating the identities into two standalone instances. The two instances of the accounts may have the same username and password, and possess the same attributes. They would involve different underlying unique identifiers and be managed independently, which doubles administration effort and introduces risks associated with conflicting attributes or maintenance errors. Organisations can use standalone identities for users who do not require an account within an on-premises Active Directory instance such as third-party vendors or emergency access, or Break Glass Accounts. 

In situations where organisations do not have an on-premises Active Directory environment and are implementing Microsoft 365 in isolation, all identities would be cloud-only.

#### Hybrid identities

In a hybrid identity model, an on-premises Active Directory environment is connected to Microsoft Entra ID using Entra Connect Sync or Entra Cloud Sync. The user accounts are created and managed in an on-premises Active Directory environment and subsequently synchronised using Entra Connect Sync or Entra Cloud Sync to Entra ID. Within the hybrid identity model, the on-premises Active Directory forest is the central single source of authority for most of the synchronised directory objects. When synchronising objects from on-premises Active Directory to Entra ID, an administrator can only change limited aspects of synchronised identities within Entra ID.

Within the hybrid identity model, there are three ways for users to authenticate:

1. **Password hash synchronisation**: a cryptographic hash of the users password, not the password itself, is synchronised to Entra ID. When a user authenticates to a service or resource, the hash of the provided password is compared to the stored hash. Enabling password-write back, also allows for the password to be changed within Microsoft Entra ID and synchronised back to the on-premises Active Directory which may provide additional advantages in self-service password reset scenarios
2. **Pass-through authentication**: authentication requests from a service are sent to queue where they are retrieved by an Entra Connect agent and validated against the on-premises directory. The on-premises domain controller returns the authentication status to Entra ID
3. **Federated authentication**: in this approach, authentication requests are passed to a federation server or service and can include third-party federation services or Active Directory Federation Server (ADFS). The federation server or service passes the authentication request to the on-premises directory and then returns an authentication token for the identity to enable access to the cloud service.

The approaches can be combined to provide a manual fallback mechanism should the on-premises directory or federation infrastructure become unavailable.

#### External Identities

Microsoft Entra ID has the capability to integrate with Business-to-Business (B2B) and Business-to-Consumer (B2C) external identities to provide partner collaboration. The Blueprint does not currently provide guidance on federated identities.
