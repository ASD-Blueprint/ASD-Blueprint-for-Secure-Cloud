---
title: Entra ID Protection
weight: 40
description: "This section describes the design decisions associated with Entra ID Protection for system(s) built using ASD's Blueprint for Secure Cloud."
---

Entra ID Protection is the function of provisioning access rights to a resource. Entra ID Protection can take the form of an access policy. An access policy defines the business rules on whether an authenticated user is granted or denied access to a resource. Entra ID utilises Conditional Access to define the access policies for Microsoft 365 data. Entra ID using Entra ID Protection utilises analytics to further minimise risk that access is provisioned to a compromised authenticated user.

Entra ID Protection enables configuration of automated responses to suspicious activities and actions related to user identities. With Entra ID Protection, risk-based policies can be configured that automatically respond to detected issues when a specified risk level has been reached. These policies, in addition to other conditional access controls provided by Entra ID, can either automatically block, Smart Lockout, or initiate adaptive remediation actions including password resets and MFA enforcement.

Entra ID Protection uses the following mechanisms to detect anomalous activity within the environment:

* **Vulnerabilities** - Entra ID Protection analyses identity configuration and detects vulnerabilities that can have an impact on user identities. Vulnerabilities can include items such as unmanaged cloud applications.
* **Risk Events** - Entra ID uses adaptive machine learning algorithms and heuristics to detect suspicious actions that are related to the user's identities. The system creates a record for each detected suspicious action. These records are also known as risk events and include activities such as sign-ins from anonymous IP addresses, sign-ins from IP addresses previously detected as exhibiting suspicious activity, or unfamiliar locations.

Entra ID Protection provides mechanisms for logging and reporting functionality that simplify investigation activities.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point      | Design Decision                                                       | Justification                                                                                                                                                                                                                    |
| ------------------- | --------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Entra ID Protection | Enable the sign-in risk policy and user risk policy within the tenant | Provide reporting of detected suspicious sign-in activity based on defined MFA, sign-in risk and user risk policies for increased security.                                                                                      |
| User risk policy    | Enabled                                                               | The user risk policy detects the probability that a user account has been compromised by detecting risk events that are atypical of a user's behaviour, alerting when high risk behaviour is detected.                          |
| Sign-in risk policy | Enabled                                                               | Entra ID analyses each sign-in of a user. The objective of the analysis is to detect suspicious actions that come along with the sign-in. Automated actions will be configured to be taken when high risk behaviour is detected. |

{{% /alert %}}

{{% alert title="Note" color="info" %}}

These policies are replicated in the Conditional Access policies MS007, MS008 and MS002. [Microsoft recommends](https://learn.microsoft.com/entra/identity/conditional-access/howto-conditional-access-policy-risk-user) Conditional Access over Identity Protection. The Blueprint recommends configuration of both Conditional Access and Identity Protection in alignment with each other.

{{% /alert %}}

#### Smart Lockout

Entra ID Smart Lockout protects Entra ID accounts from brute force attacks such as password guessing by recognising legitimate sign-in attempts from authentications from unknown sources. Smart Lockout is always-on for Entra ID but allows customisation of the number of incorrect attempts and the lockout duration.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point              | Design Decision | Justification                                                      |
| --------------------------- | --------------- | ------------------------------------------------------------------ |
| Lockout threshold           | 5               | To reduce the effectiveness of attempted password guessing attacks |
| Lockout duration in seconds | 30              | To minimise impact to users if accidentally locked out.            |

{{% /alert %}}

{{% alert title="Note" color="info" %}}

Smart lockout duration automatically increases with subsequent lockouts.

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* [Conditional Access]({{<ref "conditional-access">}})

#### References

* [Identity Protection Overview](https://learn.microsoft.com/entra/id-protection/overview-identity-protection)
* [API Reference](https://docs.microsoft.com/graph/api/resources/identityprotection-root?view=graph-rest-beta)
* [Microsoft Entra smart lockout](https://learn.microsoft.com/entra/identity/authentication/howto-password-smart-lockout)
