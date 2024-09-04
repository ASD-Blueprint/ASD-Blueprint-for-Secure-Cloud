---
title: "Conditional Access"
linkTitle: "Conditional Access"
weight: 70
description: "This section describes the design decisions associated with Conditional Access for system(s) built using ASD's Blueprint for Secure Cloud."
---

Conditional Access makes policy-based decisions to decide how user and workload identities access the resources associated with an Entra ID tenant. When an access request is a performed, a set of conditions, comprising the set of all Conditional Access policies, are evaluated to decide if access is granted.

### Conditional Access deployment considerations

Conditional access should be used for controlling access wherever possible.

#### Policy names

Policy names should give a clear indication of the scope, type, and purpose of the control.

{{% alert title="Design decisions" color="warning" %}}

| Decision Point | Design Decision                                                    | Justification                   |
| -------------- | ------------------------------------------------------------------ | ------------------------------- |
| Policy name    | [ADM\|APP\|DEV\|GST\|LOC\|OTH\|USR\|WKL] - [B\|G\|S] - [*purpose*] | Enhanced operational visibility |

{{% /alert %}}

- ADM - a policy that relates to administrative users
- APP - a policy that relates to applications<sup>1</sup>
- DEV - a policy that relates to devices
- GST - a policy that relates to guest users
- LOC - a policy that relates to locations
- OTH - a policy that doesn't easily fit the other categories<sup>1</sup>
- USR - a policy that relates to users
- OTH - a policy that doesn't easily fit the other categories<sup>1</sup>
- WKL - a policy that relates to workload identities<sup>1</sup>

---

- B - a policy that blocks access
- G - a policy that grants access
- S - a policy that alters session behaviour

1: These policy names are not implemented in the Blueprint.

See the [Conditional Access policies]({{<ref "conditional-access/policies">}}) configuration page for examples.

Organisations may wish to implement numbering or other keyword standards within the policy name for versioning, to group policy types, or to substitute commonly used wording (abbreviating policy names). Consideration should be given to:

- the resulting order of policy names in the Entra portal when selecting a prefix for policy names
- the extensibility of names, including for deviations from existing policies and atypical scenarios
- the use of special characters in policy names if using any automation or programmatic methods of management
- marking changes to existing policies or the *pre-production* status of newly developed policies

#### Groups

Groups can be used to ensure that policies are scoped to the correct subset of identities.

The use of *exclude* groups is a common practice that allows groups of identities to be excluded from policy control, because of this the management and membership of exclude groups should be tightly controlled.

{{% alert title="Design decisions" color="warning" %}}

| Decision Point                                                | Design Decision                                                               | Justification                                                                                                                       |
| ------------------------------------------------------------- | ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| Conditional Access exclude groups                             | Use separate exclude groups for each Conditional Access policy                | Provide flexibility in bypassing Conditional Access policy control                                                                  |
| Conditional Access exclude group membership                   | Use Privileged Identity Management (PIM) for exclude group membership changes | Conditional Access exclude group membership should be tightly controlled                                                            |
| Conditional Access exclude group lifecycle                    | Use access reviews for exclude group membership                               | Effectively maintain exclude group membership                                                                                       |
| Administrative users in Conditional Access policy assignments | Use groups as well as roles to identity administrative users                  | Using groups helps mitigate gaps that could occur in Conditional Access policy control when just using role assignments<sup>1</sup> |

{{% /alert %}}

1: Using roles in Conditional Access policy assignments may need regular maintenance as roles are regularly updated by Microsoft. New role assignments to users may also require Conditional Access policies to be checked to ensure the role has also been selected within the policy assignment to be included or excluded.

The use of exclude groups is discussed in more detail in the [groups design page]({{<ref "identity/groups">}}).

The use of access reviews is discussed in more detail in the [groups design page]({{<ref "identity/governance">}}).

The use of PIM for exclude group changes is discussed in more detail in the [role-based access control design page]({{<ref "identity/roles">}}).

#### Emergency access

Methods like *break glass* accounts and related exclude groups can be used to mitigate a tenant lockout.

{{% alert title="Design decisions" color="warning" %}}

| Decision Point   | Design Decision                                                     | Justification           |
| ---------------- | ------------------------------------------------------------------- | ----------------------- |
| Emergency access | Exclude Break glass accounts from Conditional Access policy control | Mitigate tenant lockout |

{{% /alert %}}

The use of break glass accounts is discussed in more detail in the [enterprise users design page]({{<ref "identity/users">}}).

#### Other deployment considerations

To enhance operational visibility, policy complexity should be minimised by keeping the policy's purpose focussed on a single objective.

### Named locations

Named locations are used primarily for location-based policy control, and while they can be useful, they should not be used when similarly capable, location-agnostic controls are available.

{{% alert title="Design decisions" color="warning" %}}

| Decision Point            | Design Decision                                             | Justification                                                                                                               |
| ------------------------- | ----------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| Named locations countries | Allow access only from specific countries                   | Limit the sign-in noise associated with access attempts originating from outside the organisation's countries of operations |
| Named locations IPs       | Set public IP addresses associated with known egress points | Enhance Identity Protection risk profiling                                                                                  |

{{% /alert %}}

### Terms of use

Organisations may wish to consider using different terms of use targeted to different user-types or use cases. For example, a notice for beta-testing an application with external users might require different terms to an employee accessing Microsoft 365 applications.

### Authentication contexts

Authentication contexts allow select applications to trigger policy control.

| Decision Point          | Design Decision                                            | Justification                 |
| ----------------------- | ---------------------------------------------------------- | ----------------------------- |
| Authentication contexts | Restrict access to PROTECTED information to employees only | Protect sensitive information |

The use of authentication contexts is discussed in more detail in the [Purview design page]({{<ref "shared-services/purview">}}).

### Authentication strengths

Authentication strengths allow customisation of the specific methods used to authenticate users.

| Decision Point                                   | Design Decision                                                | Justification                                          |
| ------------------------------------------------ | -------------------------------------------------------------- | ------------------------------------------------------ |
| Authentication strengths for user access         | Use phishing-resistant MFA                                     | Comply with Essential Eight requirements               |
| Authentication strengths for bootstrapping flows | Use phishing-resistant MFA plus temporary access passes (TAPs) | Facilitate onboarding and replacement device MFA setup |

### Conditional Access policies

For policy details see the [Conditional Access policies]({{<ref "conditional-access/policies">}}) configuration page.

| Administrative user policies               | Description                                                 |
| ------------------------------------------ | ----------------------------------------------------------- |
| Time-box web-based administrative sessions | Expire web-based administrative user sessions after 4-hours |

| Device policies                                    | Description                                                          |
| -------------------------------------------------- | -------------------------------------------------------------------- |
| Block access from unapproved devices               | Prevent access from devices other than iOS and Windows-based devices |
| Require strong authentication for Intune enrolment | Enforce phishing-resistant MFA when enrolling a device with Intune   |
| Require the use of compliant devices               | Require Intune device compliance for all devices                     |

| Guest policies                              | Description                                                |
| ------------------------------------------- | ---------------------------------------------------------- |
| Block access for unapproved guests          | Prevent access for all guests                              |
| Allow guest access to specific applications | Allow approved guests access to specific applications only |

| Location policies                      | Description                                                     |
| -------------------------------------- | --------------------------------------------------------------- |
| Block access from unapproved countries | Prevent access from countries not in the allowed countries list |

| User policies                                                       | Description                                                                                     |
| ------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| Block access via legacy authentication methods                      | Prevent access via legacy authentication methods that do not support MFA                        |
| Require strong authentication for users                             | Enforce phishing-resistant MFA for non-administrative users                                     |
| Require agreement to terms of use                                   | Require agreement to an acceptable use policy before access                                     |
| Require strong authentication when registering security information | Enforce phishing-resistant MFA and allow the use of a TAP when registering security information |
| Block high-risk sign-ins                                            | Prevent high risk sign-ins that are likely malicious                                            |
| Require strong re-authentication for risky sign-ins                 | Require phishing-resistant MFA for low to medium risk sign-ins                                  |
| Block high-risk users                                               | Prevent access from accounts that are likely compromised                                        |
| Block users with elevated insider risks                             | Prevent access from accounts where a trusted negatively impacts the organisation                |
| Time-box web-based user sessions                                    | Expire web-based non-administrative user sessions after 16-hours                                |

#### Contingency policies

Organisations may wish to implement disabled policies that are activated in the event of a critical situation such as a business continuity event or security breach. The policies below are not implemented in the Blueprint but intended to example ideas for policy development.

| Contingency policies                                 | Description                                                                 |
| ---------------------------------------------------- | --------------------------------------------------------------------------- |
| Enable for BCP activation - MFA disruption           | Enable additional authentication methods / disable MFA for particular users |
| Enable for security break - external malicious actor | Enforce access from trusted location                                        |

### Related information

#### Security & Governance

- [Essential Eight MFA guidance]({{<ref "essential-eight/multi-factor-authentication">}})
- [Authentication hardening]({{<ref "system-security-plan/system-hardening-authentication">}})
- [Enterprise mobility]({{<ref "system-security-plan/enterprise-mobility">}})

#### Design

- [Device enrolment]({{<ref "client/device-enrolment">}})
- [Entra ID Protection]({{<ref "identity/protection">}})
- [Multi-factor authentication]({{<ref "identity/authentication/#multi-factor-authentication">}})
- [Register device IDs]({{<ref "client/device-enrolment/#windows-autopilot-overview">}})

#### Configuration

- [Conditional Access policies]({{<ref "conditional-access/policies">}})

#### References

- [Authentication strengths](https://learn.microsoft.com/en-us/entra/identity/authentication/concept-authentication-strengths)
- [Conditional Access](https://learn.microsoft.com/en-au/entra/identity/conditional-access/)
- [Network assignment](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-assignment-network)
- [Terms of use](https://learn.microsoft.com/en-us/entra/identity/conditional-access/terms-of-use)
