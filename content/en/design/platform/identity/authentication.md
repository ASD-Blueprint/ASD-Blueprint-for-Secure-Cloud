---
title: Authentication
weight: 10
description: "This section describes the design decisions associated with authentication methods, MFA, Password Protection, Self-Service Password Reset and Password Management for system(s) built using ASD's Blueprint for Secure Cloud."
---

Authentication is the process of verifying one's identity. It is a primary security control to protect information assets. Within Microsoft 365 it ranges from logging into a device, to sending an email, and collaborating on a document. When deploying Microsoft 365, the identity for individuals is stored either in the cloud or in both the cloud and on-premises.

To secure access to user credentials and therefore stored information assets, multiple authentication factors are used which presents a significant challenge for attackers attempting to gain access to systems. Traditional authentication methods rely purely on something the user knows, such as a password. Because a users email address is often publicly available and is the username, it is not considered a security factor. The user enters their username to claim an identity, they must then provide an authentication factor to validate this claim (identification vs authentication). ASD recommends use of [multi-factor authentication](https://www.cyber.gov.au/protect-yourself/securing-your-accounts/multi-factor-authentication) for all users in order to prove their identity for the purpose of granting access.

### Cloud-Native deployment

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point        | Design Decision      | Justification                                      |
| --------------------- | -------------------- | ---------------------------------------------------|
| Authentication method | Cloud authentication | Only Microsoft Entra ID is used for authentication |

{{% /alert %}}

### Hybrid deployments

Active Directory allows for authentication of directory objects within the corporate network using a number of protocols such as LDAP and Kerberos. In a hybrid scenario, credential authentication support is required outside of the corporate network. This can be achieved using either:

* **Cloud authentication**: Cloud authentication utilises credentials stored within the cloud to authenticate users. The credentials can belong to cloud only accounts.
* **Password hash synchronisation (PHS)**: PHS synchronises a hash of the hash of a user's on-premises password which has undergone a salting process before it is sent to Microsoft Entra ID. If the user's hashed password matches the stored hash, the user is then authenticated. This means the authentication will be handled in the cloud.
* **Pass-through authentication (PTA)**: This feature enables users to login to Azure services including Office 365 using the on-premises Active Directory credentials. When authenticating, the user enters their credentials into an Microsoft 365 authentication service. The service encrypts the credentials and places the request in a queue. The on-premises PTA agents read the queue and perform the decryption and validation against Active Directory. The outcome of the validation is sent via the PTA agent to the Microsoft 365 authentication service to complete the user's authentication request. Through the process no credentials are stored within Microsoft Entra ID
* **Federation integration (AD FS)**: Active Directory Federation Services (AD FS) enables users to login to Microsoft 365 services using the organisations existing federation infrastructure. A federation trust is established between the corporate network and Entra ID with the authentication handled on-premises.

PHS is the easiest, most flexible, and secure authentication method for hybrid deployments. There are instances where this method may not be appropriate, such as requiring integration with multiple on-premises forests, where not all objects in all forests are synchronised.

It is a common misconception that PHS is insecure. To illustrate the security surrounding PHS, the following details the process that happens when passwords are synchronised:

1. The password synchronisation agent, installed on the Microsoft Entra Connect server, requests the password hashes from the on-premises Active Directory using the standard [Microsoft Directory Replication Service Remote Protocol](https://learn.microsoft.com/openspecs/windows_protocols/ms-drsr/f977faaa-673e-4f66-b9bf-48c640241d47). The Microsoft Directory Replication Service Remote (MS-DRSR) protocol is the same protocol used to synchronise Domain Controllers.
2. Before the Domain Controller sends the hashes to Microsoft Entra Connect, it encrypts the MD4 password hashes with a key created with the MD5 hash of the Remote Procedure Call (RPC) session key and a salt. The salt is sent along with the encrypted password hashes to enable Microsoft Entra Connect to decrypt the contents.
3. Microsoft Entra Connect generates a key to decrypt the received data back to the MD4 format.

{{% alert title="Note" color="info" %}}

Clear text passwords are not accessible by Microsoft Entra Connect.

{{% /alert %}}

4. The hash is then converted to a 32-byte hexadecimal string and then converted back into binary using UTF-16 encoding where it is expanded to 64 bytes.
5. Microsoft Entra Connect adds a 10 byte salt to each 64 byte hash
6. The MD4 hash and newly salted hash are combined and input to the PBKDF2 function to derive keys, see [PKCS #5: Password-Based Cryptography Specification](https://www.ietf.org/rfc/rfc2898.txt).
   1. The PBKDF2 function is iterated 1000 times using the Hash-based Message Authentication Code (HMAC) Secure Hashing Algorithm (SHA) 256 keyed hashing algorithm.

   {{% alert title="Note" color="info" %}}

   As per ASD's [*Guidelines for Cryptography*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-cryptography), HMAC-SHA256 is a suitable cryptographic algorithm.

   {{% /alert %}}

   2. The result of the iterated PBKDF2 function is concatenated with the salted hash and number of SHA256 iterations.
7.  The outcome of step 6 is then synchronised to Microsoft Entra ID over a secure Transport Layer Security (TLS) connection.

{{% alert title="Note" color="info" %}}

Whilst Microsoft Entra ID knows how the hash was generated, it cannot decrypt the hash as it is a one-way hash.

{{% /alert %}}

When a user authenticates to Microsoft Entra ID, the password entered by the user undergoes the same process as outlined above. Only when the result is the same as the stored hash is the password considered correct.

Microsoft allows combining authentication methods to address multiple risks. The below diagram outlines the decision process organisations can undertake when determining the preferred authentication method. The default configuration recommended by the Blueprint is to use PHS with PTA.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point        | Design Decision                                     | Justification                                                                                                                                       |
| --------------------- | --------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| Authentication option | Password Hash Synchronisation with Pass-through Authentication | Enables organisations to provide users with a leaked credential report, and additionally provides a failover if the primary sign-in method fails. |

{{% /alert %}}

### Multi-factor authentication

Multi-Factor Authentication (MFA) is any combination of two or more authentication sources from the following categories.

* Something a user knows (such as a password or PIN).
* Something a user has (such as a specific hardened device).
* Something a user is (such as biometric trait, for example a fingerprint).

{{% alert title="Note" color="info" %}}

Biometrics are yet to be formally accepted as part of the industry standard definition of an authentication factor due to the varied nature of its application. Organisations should undertake their own assessment to determine use of biometric authentication.

{{% /alert %}}

Microsoft Entra Multifactor Authentication provides additional security by requiring a second form of authentication via a range of methods such as:

* Call to phone - Call to phone places an automated voice call to a phone number defined by the user.
* Verification code from mobile app - The Microsoft Authenticator app generates a new verification code every 30 seconds. The user enters the verification code into the sign-in interface.
* Notification through mobile app - Sends a push notification to a user's phone or registered device using the Microsoft Authenticator app. The user views the notification and selects "Approve" to complete the verification process.
* Text message to phone - Sends a text message that contains a verification code that is used as the authentication token. The user is prompted to enter the verification code into the sign-in interface. This process is called one-way SMS.
* OAuth hardware token verification code - OATH is an open standard that specifies how one-time password (OTP) codes are generated. Various vendor tokens are supported.

The MFA registration workflow uses [Combined Information Registration](https://docs.microsoft.com/azure/active-directory/authentication/concept-registration-mfa-sspr-combined). Registration is triggered via interrupt mode when the [Conditional Access policy]({{<ref "conditional-access" >}}) is triggered, which occurs when signing into any resource. [Identity Protection]({{<ref "protection" >}}), which can also trigger MFA registration, allows the user to defer registration for 14 days.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point   | Design Decision | Justification                                                                                                                                                                                                                              |
| -----------------| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| MFA grace period | Disabled        | Implementation of Conditional Access policies for MFA will force users to immediately register for MFA. Disabling the grace period provides a fall back option for those organisations not implementing select Conditional Access policies |

{{% /alert %}}

Previously the [MFA Service Settings](https://learn.microsoft.com/entra/identity/authentication/howto-mfa-mfasettings#mfa-service-settings) do not separate hard time-based one-time password (TOTP) and soft TOTP verification methods - enabling one enables the other. With the introduction of [Authentication Strength](https://learn.microsoft.com/entra/identity/authentication/concept-authentication-strengths) (see below) Hard TOTP and Soft TOTP verification methods can be separated.

Combined security information registration is required to use FIDO2 as an authentication method which means FIDO2 Keys are registered by the user in their account profile in the [security information](https://mysignins.microsoft.com/security-info). There is no centralised administrator provisioning / de-provisioning of keys. In order to add a security key an initial authentication method must have already been set up or a [Temporary Access Pass (TAP)](https://learn.microsoft.com/azure/active-directory/authentication/howto-authentication-temporary-access-pass) (see below) must be used. If a Hard Token is not registered or a TAP has not been enabled there will be a prompt to set up the Microsoft Authenticator app. The app can be registered to the account, but Authentication Strength policies will stop this being used as a second factor.

The authentication methods used by users can be monitored using the [Authentication Methods Activity Reports](https://docs.microsoft.com/azure/active-directory/authentication/howto-authentication-methods-activity).

#### Microsoft Authenticator

The [Microsoft Authenticator App](https://learn.microsoft.com/entra/identity/authentication/concept-authentication-authenticator-app) provides three methods for authentication:

* Software Token - The Authenticator App can be used to generate an OATH TOTP verification code after successful authentication with the username and password.
* Push - Users Verify or Deny a notification sent to the Authenticator App after authentication with a username and password
* Passwordless - After entering a username, the Authenticator App displays a prompt on the registered phone to enter the number which is displayed on the initial login screen

The device on which the Microsoft Authenticator app is installed must be "Microsoft Entra Registered" (as opposed to Microsoft Entra Joined) within the Entra ID tenant to an individual user in order to use passwordless thereby allowing use of personal devices for the purpose of multi-factor authentication.

When implementing MFA via Microsoft Authenticator, organisations should consider other settings to align with their risk appetite.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point      | Design Decision | Justification                                                                   |
|---------------------|-----------------|---------------------------------------------------------------------------------|
| Authentication mode | Push            | Enables enhanced MFA capabilities without enabling passwordless authentication. |
| Number matching     | Enabled         | Reduces the risk of push notification MFA fatigue attacks.                      |
| Additional context  | Enabled         | Assist users in identifying legitimate MFA requests.                            |

{{% /alert %}}

{{% alert title="Note" color="info" %}}

Microsoft Authenticator is not phishing resistant. In addition to the above configuration, organisations electing to implement Microsoft Authenticator should also configure Conditional Access policies to require managed devices to get protection from external phishing threats and restrict access to the boundaries of specific countries by using the GPS signal from the device.

{{% /alert %}}

#### Windows Hello for Business

Windows Hello for Business authentication is tied to organisation devices. A user needs both the device and a sign-in component such as a PIN or biometric factor to access corporate resources. This provides single sign-on to the device and applications.

This authentication method is embedded in devices with a built-in Trusted Platform Module (TPM) which enables PIN and biometric recognition methods. Windows Hello for Business is enabled through Microsoft Intune as part of device enrolment. Users are prompted for a PIN as part of device setup.

The Blueprint recommends disabling biometric authentication. However, organisations should undertake their own assessment to determine use of biometric authentication.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point             | Design Decision                          | Justification                        |
| -------------------------- | ---------------------------------------- | ------------------------------------ |
| Windows Hello for Business | Configured via Endpoint Enrolment Policy | Consistent deployment across devices |

{{% /alert %}}

#### FIDO2 Keys

The FIDO (Fast IDentity Online) Alliance helps to promote open authentication standards and reduce the use of passwords as a form of authentication. FIDO2 is the latest standard that incorporates the web authentication (WebAuthn) standard. FIDO2 security keys can be used to sign in to Entra ID joined Windows 10/11 devices and get single-sign on to cloud and on-premises resources. Users can also use FIDO2 security keys to sign in to supported web browsers.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point  | Design Decision         | Justification                                                                                                                                                   |
| --------------- | ----------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Authorised Keys | Organisational decision | Align with a [compatible FIDO2 security key](https://learn.microsoft.com/entra/identity/authentication/concept-authentication-passwordless#fido2-security-keys) |

{{% /alert %}}

#### Hardware tokens

Entra ID supports the use of OATH-TOTP SHA-1 tokens that refresh codes every 30 or 60 seconds. OATH TOTP hardware tokens come with a secret key, or seed, pre-programmed in the token. These keys must be input into Entra ID. Secret keys are limited to 128 characters, which may not be compatible with all tokens. The secret key can only contain the characters `a-z` or `A-Z` and digits `2-7`, and must be encoded in Base32. Programmable OATH TOTP hardware tokens that can be reseeded can also be set up with Entra ID in the software token setup flow.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point  | Design Decision | Justification                                                                  |
| --------------- | --------------- | ------------------------------------------------------------------------------ |
| Hardware Tokens | Enabled         | Required for MFA unsupported FIDO2 security key use cases by limited user set. |

{{% /alert %}}

#### Temporary Access Pass

TAP is a time-limited passcode that allows users to register passwordless methods authentication and recover access for their account without a password. This enables uses to recover MFA methods if they lose their authentication devices. An authentication methods policy is used to:

* restrict use of the TAP to select users and groups
* limit use of the TAP for a defined short period
* set the TAP for one-time use

Administrators can create a TAP for users only after enabling the policy. Once a user has a valid TAP, they can use it to sign in and register a FIDO2 key from the [My Security Info page](https://mysignins.microsoft.com/security-info).

When MFA is enforced for adding security information, this scenario will occur if a OATH token is not registered for the user (i.e. no MFA method in place) and a security key needs to be registered by the user for MFA.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point        | Design Decision | Justification                                                                                      |
| --------------------- | --------------- | -------------------------------------------------------------------------------------------------- |
| Temporary Access Pass | Configured      | Required in instances where users do not have an OATH Hard Token and need to register security key |

{{% /alert %}}

### Essential Eight MFA Maturity

For Australian Government organisations implementing MFA, Microsoft has detailed guidance on implementing MFA to achieve the various [Essential Eight maturity levels](https://learn.microsoft.com/compliance/essential-eight/e8-mfa). The Blueprint provides a summary of [Essential Eight MFA guidance]({{<ref "multi-factor-authentication">}}). Organisations should make an informed approach of both the business and security impacts of each option with regards to implementation of MFA.

#### Essential Eight Maturity Level 1

Australian Government organisations should, at minimum, look to implement an MFA solution which will achieve Essential Eight Maturity Level 2. Maturity Level 1 is considered to provide a basic level of authentication security. The following design decisions provide an example for organisations wishing to address Essential Eight MFA Maturity Level 1 requirements:

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point         | Design Decision                        | Justification                                                                                                                                                                                                               |
|------------------------|----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Authentication Methods | Microsoft Authenticator (Passwordless) | Enforce for third-party internet-facing services (Microsoft 365), administrators, and important data repositories.                                                                                                          |
| Hardware Token Support | Allowed (supported OATH tokens only)   | Hardware token support is required to support specific use cases, such as working from locations that may not allow mobile phones, or users who may have a specific physical token, biometrics, or smartcard justification. |

{{% /alert %}}

The following authentication methods are not suitable for Maturity Level 1:

* SMS Sign in
* Email OTP

#### Essential Eight Maturity Level 2 and Level 3

Configuration guidance provided as part of the Blueprint primarily addresses requirements for Maturity Level 2 of the Essential Eight. Within the context of Microsoft 365 and the Blueprint, Essential Eight Maturity Level 2 and Maturity Level 3 are identical. The following design decisions provide an example for organisations wishing to address these requirements:

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point         | Design Decision                                                             | Justification                                                                                                             |
| ---------------------- | --------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| Authentication Methods | FIDO2 Key / Windows Hello for Business (Pin Only) on organisational devices | Required to meet Essential Eight Maturity Level 3 requirements with alternative approach to handle unsupported use cases. |
| Alternative Methods    | Temporary Access Pass                                                       | Enables onboarding and recovery of passwordless MFA methods (i.e. FIDO2 key).                                             |

{{% /alert %}}

The following authentication methods are not permitted for Maturity Level 2:

* SMS Sign in
* Email OTP
* Password plus Phone (SMS)
* Password plus Phone (Voice call)
* Password plus Email (Entra ID B2C)
* Password plus Microsoft Authenticator app (OTP)
* Password plus single-factor OTP
* Password plus Microsoft Entra joined with software TPM
* Password plus Compliant mobile device
* Password plus Microsoft Entra hybrid joined with software TPM
* Password plus Microsoft Authenticator App (Notification)
* Password plus Microsoft Entra joined with hardware TPM
* Password plus Microsoft Entra hybrid joined with hardware TPM

### Conditional authentication strength

[Authentication Strength](https://learn.microsoft.com/entra/identity/authentication/concept-authentication-strengths) is a [Microsoft 365 Conditional Access]({{< ref "conditional-access">}}) control that enables administrators to specify allowed combinations of authentication methods which can be used to access a resource. Authentication Strength can also be used to enforce security key MFA for all users.

Due to the strict requirements of Essential Eight MFA Maturity Level 3 controls, it is recommended to have exceptions to security key MFA for Temporary Access Passes. This exception enables registration of the security key and resetting a security key if lost or if the user has forgotten the PIN. A separate exception group could also be added to enable use of Hard Tokens as a MFA method as fall back for unsupported scenarios. Users should be placed temporarily in relevant groups only as required.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point          | Design Decision | Justification                                                                                                                                                            |
| ----------------------- | ----------------| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| MFA                     | Configured      | Native Azure MFA will be configured to secure authentication to all organisation resources.                                                                              |
| Trusted IP              | Not configured  | Conditional Access policies should be used in place of the legacy 'Trusted IP' feature. Trusted egress IP addresses should be defined by Conditional Access if required. |
| MFA for Administration  | Configured      | Administration through Microsoft 365 administration portals and other Cloud Apps should require MFA.                                                                     |
| MFA for User Apps       | Configured      | MFA is required.                                                                                                                                                         |
| MFA for PIN activation  | Configured      | MFA is required                                                                                                                                                          |

{{% /alert %}}

### Password policies

A password policy should be applied to all user and admin accounts that are created and managed directly in Entra ID. Entra ID enables administrators to ban weak passwords and define parameters to lock out an account after repeated bad password attempts. 

**Other password policy settings can't be modified**. The default (and unchangeable) [Microsoft Entra password policies](https://learn.microsoft.com/entra/identity/authentication/concept-password-ban-bad-combined-policy#azure-ad-password-policies) applied during user provisioning and password change are as follows:

| Property                                               | Requirements                                                                                                                                                                             |
| ------------------------------------------------------ | -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Characters allowed                                     | Uppercase characters (A - Z)<br>Lowercase characters (a - z)<br>Numbers (0 - 9)<br>Symbols: @ # $ % ^ & \* - \_ ! + = [ ] { } \| \\ : ' , . ? / \` ~ " ( ) ; &lt; > or 'blank space'      |
| Characters not allowed                                 | Unicode characters                                                                                                                                                                       |
| Password length                                        | Passwords require </br> - A minimum of 8 characters </br> - A maximum of 256 characters                                                                                                  |
| Password complexity                                    | Passwords require three out of four of the following: </br>- Uppercase characters </br> - Lowercase characters </br> - Numbers </br> - Symbols                                           |
| Password not recently used                             | When a user changes or resets their password, the new password cannot be the same as the current or recently used passwords.                                                             |
| Password is not banned by Entra ID Password Protection | The password can't be on the global list of banned passwords for Entra ID Password Protection, or on the customizable list of banned passwords specific to the organization (see below). |
| Password Expiry (changeable)                           | Never                                                                                                                                                                                    |

These policies are based on [Microsoft Research](https://www.microsoft.com/research/publication/password-guidance/). Organisations should review ASD's [*Creating Strong Passphrases*](https://www.cyber.gov.au/acsc/view-all-content/publications/creating-strong-passphrases) guidance on passphrases and implement appropriate controls and policies to address ASD's [*Guidelines on System Hardening*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-system-hardening)

### Password Protection

Entra ID Password Protection detects and blocks known weak passwords and their variants, and can also block additional weak terms that are specific to the organisation.

With Entra ID Password Protection, default global banned password lists are automatically applied to all users within an Entra ID tenant. Additional entries can be defined in a custom banned password list. When users change or reset their passwords, these banned password lists are checked to enforce the use of strong passwords.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point     | Design Decision | Justification                                        |
| ------------------ | --------------- | ---------------------------------------------------- |
| Password Lockout   | Configured      | Mitigates brute force password attacks               |
| Custom Banned List | Configured      | Adds organisation keywords into banned password list |

{{% /alert %}}

### Password WriteBack

Password WriteBack is a feature enabling the ability to write password changes made within Microsoft Entra ID back into the organisations on-premises Active Directory. Password WriteBack enables a user to reset their password from Entra ID, which enables additional capabilities such as Leaked Credential Detection report. 

{{% alert title="Note" color="info" %}}

The current version of Microsoft Entra Connect does not allow Password WriteBack for privileged accounts. A privileged account is one whose `adminCount` attribute is non-NULL and non-zero. 

If using a version of Entra ID Connect prior to version 1.1.553.0, ensure the service account that connects Microsoft Entra Connect to the on-premises Active Directory, does not have the ability to update the passwords for the administration accounts.

{{% /alert %}}

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point        | Design Decision       | Justification                                                                                                                             |
| --------------------- | --------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| Password write back   | Organisation decision | Enables additional usability and security features. However, if implemented incorrectly may introduce additional risk to the organisation |

{{% /alert %}}

### Self-service password reset

Entra ID self-service password reset (SSPR) gives users the ability to change or reset their password, with no administrator or help desk involvement. If a user's account is locked or they forget their password, they can follow prompts to unblock themselves and get back to work. This ability reduces help desk calls and loss of productivity when a user can't sign in to their device or an application.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point              | Design Decision       | Justification                                                                                                                                                                                         |
| --------------------------- | --------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Self-Service Password Reset | Organisation decision | Enables additional usability and security features, However, there may exist attribution and security risks associated with SSPR authentication methods requiring personally identifiable information |

{{% /alert %}}

Organisations wanting to implement Microsoft Entra Self-Service Password Reset should review [Microsoft's planning guidance](https://learn.microsoft.com/entra/identity/authentication/howto-sspr-deployment)

### Password / TAP / security key / PIN management

There are various scenarios where a user may need a password or security key PIN set or reset, such as

* **Initial security key issuance** - A TAP must be issued in order to register the security key to their account
* **Forgotten security key PIN** - The security key must be removed from the account, reset, and security key added to their account
* **Forgotten user password** - The password must be reset and provided to the user who then is forced to reset
* **Forgotten Windows Hello for Business PIN** - The PIN must removed from their account and a new PIN added by the user

ASD's [*Guidelines for System Hardening*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-system-hardening) provides advice on setting credentials for user accounts. This guidance should be followed when setting or resetting user passwords, passphrases, and PINs.

The following design decisions provide recommended settings or procedures regarding setting and resetting user credentials.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point        | Design Decision        | Justification                                                                                                                                                                                                     |
| --------------------- | -----------------------| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Temporary Passwords   | Randomly Generated     | Aligns with ISM-1227: Credentials set for user accounts are randomly generated.                                                                                                                                   |
| Temporary Passwords   | Change on first use    | Aligns with ISM-1595: Credentials provided to users are changed on first use.                                                                                                                                     |
| Identity Verification | Organisation policy    | Should align with ISM-1593: Users provide sufficient evidence to verify their identity when requesting new credentials.                                                                                           |
| Password Distribution | Two part via 2nd party | Aligns with ISM-1594: Credentials are provided to users via a secure communications channel or, if not possible, split into two parts with one part provided to users and the other part provided to supervisors. |

{{% /alert %}}

The following sections are suggested processes organisations can leverage to address various set or reset scenarios.

#### Platform administrator groups for TAP (security key) issue / reset

Given a TAP enables access to register security keys without other factors, it provides the "Keys to Kingdom" and must be issued securely. Only Platform Administrators should be able to issue TAPs.

Only Entra ID `Global Administrators` and `Privileged Role Administrators` roles should be able to issue TAP's. 

Given organisations should have a limited number of Platform Administrators with these privileges in order to scale issuance and resetting of security keys an additional platform administrator group should be created to delegate required permissions to a help desk function, where practical. This group should have the Entra ID [`Authentication Administrator`](https://learn.microsoft.com/entra/identity/role-based-access-control/permissions-reference#authentication-administrator) role to enable users in this group the ability to reset passwords and add MFA methods (TAP's) for standard user accounts. 

Privileged or other special user accounts assigned to a [Role Assignable Groups](https://learn.microsoft.com/entra/identity/role-based-access-control/groups-concept) should have TAP issuance by Platform Administrators or other privileged roles determined by the organisation.

#### Initial security key issuance

In this scenario, a new user requires a FIDO2 security key to access the Microsoft 365 environment.

1. User provides valid identification such as an organisational security pass or personal information to a relevant Verifying Authority. 
2. The Verifying Authority verifies the identity against recorded account information in order to receive a TAP / User Password from the Administrator. 
3. The pass / password is transmitted using two parts via a secure channel.

#### Security key reset

In this scenario the user is unable to log on using a security key because they have forgotten the security key PIN. This requires the security key to be reset (wiped of existing information) and re-registered to the user account using the initial security key \issuance process described above.

#### Windows Hello for Business reset

In this scenario the user is unable to login in using a Windows Hello for Business PIN. In situations where users also have a security key then they can reset the PIN using the "I forgot my PIN" once [signed into Windows](https://support.microsoft.com/windows/change-your-pin-when-you-re-already-signed-in-to-your-device-0bd2ab85-b0df-c775-7aef-1324f2114b19).

Where users cannot sign in using a security key they can [Reset their PIN from Windows login](https://support.microsoft.com/windows/reset-your-pin-when-you-aren-t-signed-in-to-windows-a386c519-3ab2-b873-1e9b-bb228a98b904). 

Windows Hello for Business PIN's can be force removed by Platform Administrators via the users `Authentication Methods` in Entra ID.

### Related information

#### Security & Governance

* None identified

#### Design

* [Enterprise Users]({{<ref "users">}})

#### References

* [Authentication Methods](https://learn.microsoft.com/entra/identity/authentication/concept-authentication-methods)
* [Combined Registration Concepts](https://learn.microsoft.com/entra/identity/authentication/concept-registration-mfa-sspr-combined)
* [Password-less Authentication](https://learn.microsoft.com/entra/identity/authentication/concept-authentication-passwordless)
* [Temporary Access Pass](https://learn.microsoft.com/entra/identity/authentication/howto-authentication-temporary-access-pass)
* [OATH Hardware Tokens](https://learn.microsoft.com/entra/identity/authentication/concept-authentication-oath-tokens)
* [Security Key Sign In](https://learn.microsoft.com/entra/identity/authentication/howto-authentication-passwordless-security-key)
* [Windows Hello Configuration via Endpoint Manager](https://docs.microsoft.com/mem/intune/protect/identity-protection-windows-settings)
* [Self Service Password Reset](https://learn.microsoft.com/entra/identity/authentication/concept-sspr-howitworks)