---
title: "Authentication Policies"
weight: 35
description: "This section describes the design decisions associated with Authentication Policies for system(s) built using ASD's Blueprint for Secure Cloud."
---

Authentication policies control the authentication methods which can be used to access Exchange Mailboxes. Authentication polices can be leveraged to protect the organisation from brute force and spray attacks. To protect against this, Basic Authentication can be blocked. Basic authentication is where a username and a password are leveraged for client access requests.

Blocking Basic Authentication forces clients to use Modern Authentication. Blocking Basic Authentication can cause issues when clients within the environment do not support Modern Authentication. If this occurs, it is recommended to investigate whether the client can be upgraded to support Modern Authentication. If it can, then it is recommended that the client be upgraded. If it cannot then a separate authentication policy can be leveraged enabling Basic Authentication for that client only.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                      | Design Decision | Justification                                                                                                                                                |
|-------------------------------------|-----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Basic Authentication                | Disabled        | Basic Authentication has known exploits, Modern Authentication is preferred.                                                                                 |
| Authentication Policy Configuration | Configured      | Authentication Policy will be deployed to meet the security requirements of the organisation and be deployed in conjunction with the organisation's security requirements. |


{{% /alert %}}

### Related information

#### Security & Governance

* [Authentication Hardening]({{<ref "system-hardening-authentication">}})
* [User application hardening]({{<ref "security-and-governance/system-security-plan/system-hardening-user-apps.md">}})

#### Design

* None identified

#### Configuration

* None identified

#### References

* None identified