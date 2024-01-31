---
title: Conditional Access
weight: 70
description: "This section describes the design decisions associated with conditional access for system(s) built using ASD's Blueprint for Secure Cloud."
---

Conditional Access provides access controls that can be applied to user login requests. These access controls provide an extra level of security to help protect corporate data and information. When a user attempts to access an application or system from any device, one or more conditions must be met before authentication is successful.

Conditional Access offers the following types of access controls:

* **User and location based** - User and location based Conditional Access limits or blocks user access based on their geolocation or IP address.
* **Device based** - Device based Conditional Access ensures only enrolled and approved devices can access corporate data.
* **Application based** - Application based Conditional Access policies provide the ability to allow or block an application based on policy configuration.
* **Risk-based** - Risk-based Conditional Access protects corporate data from malicious hackers based on a user's sign-in risk. The sign-in risk is an indicator of the likelihood (high, medium, or low) that a sign-in attempt was not performed by the legitimate owner of a user account. Entra ID calculates the sign-in risk level during the sign-in process of a user.
* **Session based** - Session based Conditional Access policies enables the control of user sessions by redirecting the user through a reverse proxy instead of directly to the app. From then on, user requests and responses go through Cloud App Security rather than directly to the app.

Based on the above conditions the user will either: be allowed, prompted for multi-factor authentication or blocked.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point             | Design Decision                                                                                         | Justification                                                                                                                                             |
| -------------------------- | ------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Security Defaults          | Disabled                                                                                                | Security Defaults must be disabled to implement Conditional Access policies.                                                                              |
| User based policies        | Allow user access from Australian IPs only, ensure acceptance of Terms of Use, and Block "Guest" access | Blocks all connections from countries except Australia and forces Terms of Use on all authentications.                                                    |
| Device based policies      | Limit access to enrolled, compliant (Microsoft Endpoint enrolled) Windows devices                       | To meet security and business requirements. This allows only managed organisation issued devices access to the organisation's resources.                              |
| Application based policies | Application connection through VPN only                                                                 | Ensure users are connected to the network before accessing applications.                                                                                  |
| Risk-based policies        | Block Legacy Authentication and high risk logins                                                        | Blocks all connections from insecure legacy protocols like ActiveSync, IMAP, POP3, etc., and all high-risk authentications (requires Entra ID Premium P2). |
| Session Based Policies     | Expire user sessions after 12 hours                                                                     | Removes legacy sessions.                                                                                                                                   |

{{% /alert %}}

Microsoft provides [Conditional Access policy templates](https://learn.microsoft.com/entra/identity/conditional-access/concept-conditional-access-policy-common) which cover a range of scenarios and are considered Microsoft's best practice for Conditional Access.

### Conditional Access policies

Using the Microsoft templates as a base, the below is the list of Conditional Access policies recommended by the Blueprint:

| Policy                                                                    | Description                                                                                                                                                                                                                                         |
| ------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Allow access from compliant iOS devices                                   | Grants access to managed iOS devices that are enrolled and compliant in Intune. An approved Microsoft app is required on iOS.                                                                                                                       |
| Allow access from compliant Windows devices                               | Grants access to managed Windows devices that are Intune enrolled and compliant and/or Hybrid Entra ID joined. This policy also enforces MFA to access resources.                                                                                   |
| Block countries not allowed                                               | Blocks all connections from countries not in the allowed countries list.                                                                                                                                                                            |
| Block guest access                                                        | Deny all guest and external users by default.                                                                                                                                                                                                       |
| Block legacy authentication                                               | Blocks all connections from insecure legacy protocols such as ActiveSync, IMAP, and POP3.                                                                                                                                                           |
| Block non-trusted IPs                                                     | Blocks access from IP addresses not in the allowed IPs list.                                                                                                                                                                                        |
| Block unapproved devices                                                  | Prevents access from device types not included in the Blueprint (Android, Windows Phone and macOS).                                                                                                                                                 |
| Enforce MFA Legacy Methods                                                | Enforces MFA using only Windows Hello, Security Key, Password + Hard Token for all users.                                                                                                                                                           |
| Expire administration sessions                                            | Enforces a sign-in frequency to ensure administrators sessions do not remain active for longer than 4 hours.                                                                                                                                        |
| Expire user sessions                                                      | Enforces a sign-in frequency to ensure non-privileged users are required to complete an MFA prompt every 12 hours.                                                                                                                                  |
| Require acceptance of Terms of Use                                        | Meet requirement for user acceptance of terms and conditions.                                                                                                                                                                                       |
| Require multi-factor authentication for all users                         | MS004: Meets the requirement to enforce MFA for all users. This is a fallback policy given enforcement of MFA Legacy Methods.                                                                                                                       |
| Require multi-factor authentication for administrators                    | MS001: Meets the requirement to enforce MFA for all users. This is a fallback policy given all users require MFA.                                                                                                                                   |
| Require multi-factor authentication for management Azure Management       | MS006: Meets the requirement to enforce MFA for all users. This is a fallback policy given all users require MFA.                                                                                                                                   |
| Require multi-factor authentication for risky sign-ins                    | Additional authentication check when sign in identified as outside normal behaviour. This is a fallback policy given all users require MFA.                                                                                                         |
| Require password change for high-risk users                               | This is the preferred method as opposed to just using Entra ID Protection settings for risky sign-ins as it provides [additional capabilities](https://learn.microsoft.com/entra/identity/conditional-access/howto-conditional-access-policy-risk). |
| Require phishing-resistant multi-factor authentication for administrators | Enforces use of phishing resistant multi-factor authentication for all administrators.                                                                                                                                                              |
| Securing security info registration                                       | Enforces the requirement for token or temporary password issue before registering other MFA methods.                                                                                                                                                |

{{% alert title="Note" color="info" %}}

Persistence across browser sessions is also controlled by the [Company Branding Setting](https://learn.microsoft.com/entra/fundamentals/how-to-customize-branding) `Show option to remain signed in` which is set to `Yes`. This doesn't change the session lifetime, but allows sessions to remain active when users close and re-open their browsers thereby increasing the user experience.

{{% /alert %}}

### Conditional Access Exceptions

#### Device Enrolment Exception

During [device enrolment]({{<ref "device-enrolment">}}) a new machine needs to be registered with Microsoft Intune. To [register the Device ID]({{<ref "device-enrolment#windows-autopilot-overview">}}) a powershell script is run on the device which connects to Microsoft Intune and prompts the administrator enrolling the device to login. When the administrator authenticates, two Conditional Access policies block authentication:

* **Allow access from compliant Windows devices** - At this stage the device has not had policies applied and therefore is not compliant.
* **Block non-trusted IPs** - At this stage the device has no VPN and cannot be connected to the network. Any login is coming from the "cloud".

To enable device enrolment a group is excepted from these policies. This group will be a privileged group containing a limited number of Platform Administrators who carry out device enrollments with an "approval" workflow to stop compromised account self elevation. This is a temporary time bound elevation of 30 minutes duration. Strong MFA is enforced when the user logs in from the non-compliant device outside the network.

### Related information

#### Security & Governance

* None identified

#### Design

* [Multi-factor Authentication]({{<ref "authentication/#multi-factor-authentication">}})

#### References

* [Conditional Access Overview](https://learn.microsoft.com/entra/identity/conditional-access/overview)
* [Common Policies](https://learn.microsoft.com/entra/identity/conditional-access/concept-conditional-access-policy-common?tabs=secure-foundation)
* [Security Defaults in Entra ID](https://learn.microsoft.com/entra/fundamentals/security-defaults)
* [Session Lifetimes](https://learn.microsoft.com/entra/identity/conditional-access/howto-conditional-access-session-lifetime)
