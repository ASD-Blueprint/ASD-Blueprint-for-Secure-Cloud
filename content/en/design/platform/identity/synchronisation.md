---
title: Identity Synchronisation
weight: 60
description: "This section describes the design decisions associated with on-premises identity synchronisation for system(s) built using ASD's Blueprint for Secure Cloud."
---

Entra Connect, previously known as Azure Active Directory Connect, is a product designed to synchronise directory objects and changes between Active Directory and Entra ID. Entra Connect enables the on-premises directory service to be the source of truth for identities within the environment and ensures that changes are replicated to Entra ID.

Entra Connect can be deployed in several patterns. These patterns follow the guiding principles of:

* Only one Entra Connect instance can be actively synchronising to an Entra tenant
* On-premises AD can only be synchronised to one Entra tenant unless directory synchronisation and Microsoft Identity Manager (MIM) are leveraged

As only one Entra Connect instance can be actively synchronising at a time, high availability is not possible. A warm standby can be configured using a second Entra Connect server in `Staging Mode`.

Within the Entra Connect client the synchronisation process can be customised in several ways including:

* **Group Filtering** - Group filtering limits the scope of the synchronisation to the members of a group within the on-premises directory
* **Organisational Unit (OU) Filtering** - OU filtering limits the scope of the synchronisation to the objects in one or more OUs within the directory
* **Attribute Filtering** - Attribute filtering controls which attributes from an object are synchronised to the cloud
* **Entra ID App Filtering** - Entra ID app filtering assists in limiting the number of attributes synchronised to the cloud based on which Microsoft 365 services are in use

Each of the above customisations provide control over what directory information is synchronised to the cloud from the on-premises directory service. The Entra Connect client can also be leveraged to configure Single Sign-On (SSO) and Exchange Hybrid. Entra Connect must run on a domain joined server running Windows Server 2016 or later. It will likely synchronise many Active Directory objects to Entra ID and hence there is a range of hardware requirements to consider based on the number of objects in Active Directory that will be synchronised, see [Entra ID Connect Prerequisites](https://learn.microsoft.com/entra/identity/hybrid/connect/how-to-connect-install-prerequisites) for further information.

When Entra Connect is leveraged, a created within the on-premises directory service (Active Directory) is synchronised via the Entra Connect client into Entra ID (the cloud-based directory service).

The organisation must implement specific firewall rules need in order for Entra Connect to connect to Active Directory and Entra ID. Further details on firewall configuration can be found within the Network Configuration section.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                                | Design Decision       | Justification                                                                                                                                                                                                                                                                                                               |
| --------------------------------------------- | --------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Entra Connect                                 | Configured            | Identity synchronisation is a critical requirement and must be implemented based on ACSC guidance. The source of truth for account information will be on-premises Active Directory.                                                                                                                                        |
| Attribute used for login                      | User ID               | This attribute is commonly used for logins as it will ensure that the same credentials are maintained for on-premises and in-cloud authentication.                                                                                                                                                                          |
| Organisational unit filtering                 | Configured            | To target only the required identities for synchronisation. Whole directory synchronisations are not recommended.                                                                                                                                                                                                           |
| Single Sign On                                | Configured            | Single Sign-on.                                                                                                                                                                                                                                                                                                             |
| Staging Server                                | Configured            | Best practice dictates a secondary staging server be in place to be used in disaster recovery scenarios.                                                                                                                                                                                                                    |
| Password writeback                            | Organisation decision | Password writeback enables additional capabilities such as [Leaked Password Detection](https://docs.microsoft.com/azure/active-directory/identity-protection/concept-identity-protection-risks#password-hash-synchronization), however, it requires hashed passwords to be synchronised from on-premises AD DS to Entra ID. |
| Self Service Password Reset                   | Organisation decision | The Self-Service Password Reset feature requires activation of password writeback in the Entra Connect configuration.                                                                                                                                                                                                       |
| Entra ID App and attribute filtering          | Configured            | All Entra ID App and attribute filtering will be synchronised as recommended by Microsoft .                                                                                                                                                                                                                                 |
| Exchange Hybrid                               | Configured            | Exchange will be used in a hybrid configuration with Exchange Online, therefore this setting is required to be set as Configured.                                                                                                                                                                                           |
| Exchange Mail Public Folders                  | Not Configured        | The organisation does not leverage Public folders currently, therefore this setting is not required.                                                                                                                                                                                                                        |
| Directory extension attribute synchronisation | Not Configured        | Not required for this solution.                                                                                                                                                                                                                                                                                             |

{{% /alert %}}

##### Configuration

The below is the Entra Connect configuration applicable to organisations leveraging a hybrid implementation.

| Configuration                                                               | Value                                                                                                                 | Description                                                                                                                                                                                                                                     |
| --------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Installation Mode                                                           | Custom                                                                                                                | The type of installation -- Default or Custom. The Default install does not allow customisation of the filtering.                                                                                                                               |
| SQL Mode                                                                    | Local DB                                                                                                              | The location of the Entra Connect database. Local DB is the default configuration and the simplest to manage.                                                                                                                                     |
| Directory to Connect to                                                     | {organisation}.gov.au                                                                                                 | Entra ID Tenant of the organisation.                                                                                                                                                                                                                  |
| On-premises attribute to use for Entra ID (used for logging in to Entra ID) | User ID                                                                                                               | This attribute is commonly used for logins as it will ensure that the same credentials are maintained for on-premises and in-cloud authentication.                                                                                              |
| Alternate ID                                                                | Not required                                                                                                          | This is required in scenarios where primary ID may be duplicated between users in the organisation.                                                                                                                                             |
| OU Filtering                                                                | Enabled <br>{organisation to determine}                                                                               | OU filtering will be used to ensure that specific OUs containing entities such as service accounts are not synchronised with Entra ID. OU filtering will be finalised during deployment and documented in As-Built-As-Configured documentation. |
| Uniquely Identifying Users                                                  | Users are represented only once across all directories.<br>Let Azure manage the source anchor (ms-DS-ConsistencyGuid) | Default configuration. As users are not duplicated within the environment, this setting meets the solution requirements. The ms-DS-ConsistencyGuid is used when Azure manages the source anchor.                                                |
| Entra ID Attributes                                                         | Default -- All attributes                                                                                             | Default configuration. All attributes to be synchronised.                                                                                                                                                                                       |
| Synchronisation Interval                                                    | 30 minutes                                                                                                            | Default synchronisation interval.<br>Note: Password resets and new accounts are synchronised immediately.                                                                                                                                       |

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* [Entra ID Connect Prerequisites](https://learn.microsoft.com/entra/identity/hybrid/connect/how-to-connect-install-prerequisites)
* [Leaked Password Detection](https://docs.microsoft.com/azure/active-directory/identity-protection/concept-identity-protection-risks#password-hash-synchronization)