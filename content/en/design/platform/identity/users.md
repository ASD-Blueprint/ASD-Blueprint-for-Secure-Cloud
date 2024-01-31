---
title: Enterprise Users
weight: 15
description: "This section describes the design decisions associated with user identities, emergency access, and service accounts for system(s) built using ASD's Blueprint for Secure Cloud."
---

The Blueprint leverages Microsoft Entra ID as the Identity and Access Management system. However in reality, identity management requires a number of systems which would include multiple other systems such as human resources and finance and have a central user directory such as Microsoft Entra ID at the centre for authentication and authorisation of users.

Microsoft Entra ID assigns each user a globally unique identifier (GUID) and a unique user principal name (UPN). The GUID is a 128 bit text string for the user identity. The UPN is a username in the form of an email address and can be derived from a synchronised on-premises Active Directory or assigned directly within Microsoft Entra ID.

### Workload identities

Microsoft 365 workload identities are specific to individual services or workloads within the Microsoft 365 ecosystem, such as Exchange Online or SharePoint Online. Whilst the identities are tied to the user UPN the workload identities are created for specific purposes, such as sending emails in Exchange Online. Each workload requiring this additional layer is known as the workload-specific directory store. It is named after the related workload, for example: Exchange Online Directory Services (EXODS), and SharePoint Online Directory Services (SPODS).

### Display name

When creating a new user, Microsoft Entra ID will assign the display name based on the user first name and last name. Microsoft 365 uses the display name within the global address list (GAL) for emails, Teams chats, and access control in various services. Microsoft 365 also displays user photos in a number of services. Where a user photo is not provided, it instead uses the initials taken from the display name to serve as a fallback. For example, the user photo for `Joe User` will display `JU` when there is no image. Within a hybrid configuration the display name is created and managed within the on-premises Active Directory.

### Inactive users

ISM Security Control 1404 lists that inactive user accounts need to be in a disabled state after more than 45 days of inactivity.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                      | Design Decision                                                                  | Justification                                                                                                               |
| ----------------------------------- | -------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| ISM Security Controls 1404 and 1648 | Disable un-privileged and privileged user accounts after > 45 days of inactivity | Unprivileged and Privileged access to systems and applications should be automatically disabled after 45 days of inactivity |

{{% /alert %}}

This can be achieved via a custom script set to run on a scheduled basis. Below is the recommended logic that the script should use to determine if an account is inactive or not:

* If user account is not disabled
* If user has logged on
* If user is not Break Glass Account
* If last login is greater than 45 days
* If all above are _True_ disable account

#### Cloud-native implementation

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point  | Design Decision                     | Justification                                                                                                                                                                                                                                                                                    |
|-----------------|-------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Identity Source | Microsoft Entra ID                  | As this is a cloud only implementation, Microsoft Entra ID will be the source of identity.                                                                                                                                                                                                       |
| Password Reset  | Configured                          | For self-service password reset, users will need to provide an alternate email address, mobile app and phone number during registration. To reset their password, they will need to provide two methods of verification.                                                                         |
| Identity Format | firstname.lastname{sequence number} | Provides consistency throughout Microsoft 365 applications and services, and aligns the UPN to a users email address for easier administration                                                                                                                                                   |
| Display Name    | Firstname Lastname                  | Organisations should avoid using the `Lastname, Firstname` format within the directory as this can cause display issues within Microsoft 365 services and applications. The ability for users to change their own display name through the Microsoft 365 user interface should also be disabled. |

{{% /alert %}}

{{% alert title="Note" color="info" %}}

Administrator accounts and Break Glass Accounts should be excluded from these rules.

{{% /alert %}}

#### Hybrid implementation

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point  | Design Decision    | Justification                                                                                                                                                                                                                                                                                    |
|-----------------|--------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Identity Source | Active Directory   | As this is a hybrid implementation, Active Directory will be the source of identity.                                                                                                                                                                                                             |
| Password Reset  | Configured         | For self-service password reset, users will need to provide an alternate email address, mobile app and phone number during registration. To reset their password, they will need to provide two methods of verification.                                                                         |
| Identity Format | Inherited          | Usernames will be synchronised from the on-premises Active Directory and will inherit naming convention.                                                                                                                                                                                         |
| Display Name    | Firstname Lastname | Organisations should avoid using the `Lastname, Firstname` format within the directory as this can cause display issues within Microsoft 365 services and applications. The ability for users to change their own display name through the Microsoft 365 user interface should also be disabled. |

{{% /alert %}}

{{% alert title="Note" color="info" %}}

Administrator accounts and Break Glass Accounts should be excluded from these rules.

{{% /alert %}}

### Service accounts

There are three types of service accounts native to Microsoft Entra ID: [Managed identities, service principals](/design/platform/identity/application/#application-objects-app-registration-and-service-principals-enterprise-applications), and user-based service accounts. Service accounts are a special type of account that is intended to represent a non-human entity such as an application, application programming interface (API), or other service.

For services hosted within Azure, [Microsoft recommends](https://learn.microsoft.com/entra/architecture/secure-service-accounts) using a managed identity if possible, and a service principal if not. Managed identities cannot be used for services hosted outside of Azure. In that case, Microsoft recommends a service principal.

User based service accounts are standard user accounts where the password and MFA methods are shared between multiple individuals. For this reason Microsoft does not recommend user accounts as service accounts because they are less secure. This includes on-premises service accounts synchronised to Microsoft Entra ID, because they aren't converted to service principals.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point   | Design Decision                                         | Justification                                      |
| ---------------- | --------------------------------------------------------| -------------------------------------------------- |
| Service Accounts | Managed Identities / Service Principals only (see note) | Alignment to Microsoft and security best practice. |

{{% /alert %}}

{{% alert title="Design Decisions" color="info" %}}

There are two exceptions to the use of user based service accounts due to the nature and purpose of these accounts, being the Break Glass and Enterprise Enrolment Accounts. These should be closely monitored and audited with the passwords and MFA strictly controlled.

{{% /alert %}}

#### Emergency access admin accounts

Emergency access or 'break glass' accounts are accounts used to restore access to an environment or tenant. Break Glass Accounts should be an option of last resort and should only be used when normal administrative accounts cannot be used to restore access. Example of this is where conditional access has malfunctioned and both users and administrative staff are unable to authenticate into the environment, or all privileged administrator accounts are comprised in another capacity.

[Microsoft best practice](https://learn.microsoft.com/entra/identity/role-based-access-control/security-emergency-access) recommends configuration of two Break Glass Accounts. Organisations should store these accounts according to Emergency Account/break glass procedures. Best practice is for these accounts to meet the following minimum requirements:

* They are not to be associated with any individual user.
* They will use a different authorisation mechanism than standard administrative accounts.
* They are cloud only accounts that use the `*.onmicrosoft.com` domain.
* The passwords to these accounts are set to never expire or be cleaned up or removed due to inactivity.
* The accounts are to be given the Global Administrator role assigned permanently.
* At least one of the accounts is to be excluded from Multi-factor Authentication (MFA).
* At least one of the accounts is to be completely excluded from all Conditional Access policies.
* The accounts should be stored on paper, in two or three separate parts, in secure, fireproof safes that are in disparate locations.
* Use of these accounts is monitored and only used in genuine emergencies.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point            | Design Decision | Justification                                                                                  |
| ------------------------- | --------------- | ---------------------------------------------------------------------------------------------- |
| Emergency access accounts | Configured      | Two emergency access accounts configured in alignment to Microsoft and security best practice. |

{{% /alert %}}

**Emergency access account configuration**

| Configuration                      | Value                                                                                           | Description                                                                                                                                                   |
| ---------------------------------- | ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Username                           | Any value that is not associated to a specific user.                                            | Accounts are not to be associated with any individual user.                                                                                                   |
| Account type                       | Accounts are cloud only accounts that use the `*.onmicrosoft.com` domain.                       | Only `*.onmicrosoft.com` accounts should be used as per Microsoft best practice.                                                                              |
| Password Expiry                    | Passwords are set to never expire.                                                              | Ensures the passwords for these accounts are valid in an emergency.                                                                                           |
| Roles                              | Emergency access accounts will be assigned the Global Administrator role.                       | The accounts are to be given the Global Administrator role assigned permanently.                                                                              |
| Multi Factor Authentication (MFA)  | Both Emergency access accounts will be excluded from MFA.                                       | MFA device may not be available when the emergency access account is required.                                                                                |
| Conditional Access                 | At least one of the accounts is to be completely excluded from all Conditional Access policies. | The emergency access account may need access to fix an issue and it would not be beneficial if a policy were to block access.                                 |
| Physical access to account details | Account details will be stored on paper in an appropriate location.                             | It is strongly recommended that the accounts are stored on paper, in two or three separate parts, in secure, fireproof safes that are in disparate locations. |
| Monitoring of accounts             | Account usage will be monitored via Defender for Cloud Apps.                                    | Use of these accounts is monitored and only used in genuine emergencies.                                                                                      |

### Related information

#### Security & Governance

* None identified

#### Design

* [Essential Eight]({{<ref "essential-eight">}})
* [Entra ID Custom Domains]({{<ref "tenant/#custom-domain">}})
* [Microsoft 365 - Accepted Domains]({{<ref "accepted-domains">}})
* [Exchange - User Mailbox Configuration]({{<ref "user-mailbox-configuration">}})

#### References

* [Service Account Overview](https://learn.microsoft.com/entra/architecture/secure-service-accounts)
* [Service Account Governance](https://learn.microsoft.com/entra/architecture/govern-service-accounts)
* [Azure Roles Types](https://learn.microsoft.com/en-us/azure/role-based-access-control/rbac-and-directory-admin-roles)