---
title: "Web Filtering"
weight: 5
description: "This section describes the design decisions associated with managing endpoint security for system(s) built using ASD's Blueprint for Secure Cloud."
---

Microsoft 365 and other enterprise software-as-a-service (SaaS) applications that use Microsoft Entra ID as their identity provider all share URLs with common domain names such as `outlook.office.com` and `login.microsoftonline.com`. Blocking these internet addresses to prevent users from accessing other third-party Microsoft 365 tenancies and services would also prevent users from accessing the organisation Microsoft 365 tenancy. With Microsoft Entra ID tenant restrictions, organisations with a supported web filtering system (proxy) can specify the list of approved Microsoft Entra ID tenants that their users are permitted to access (e.g. GovTeams). Microsoft Entra ID then only grants access to these permitted tenants.

Microsoft Entra ID tenant restrictions prerequisites are as follows:

* The organisation web filtering service must support transport layer security (TLS) interception, hypertext transfer protocol (HTTP) header insertion, uniform resource locator (URL), and fully qualified domain name (FQDN) filtering.
* Endpoints must trust the web filtering services public key infrastructure (PKI) certificate chain for TLS communications.  

For more detail on Microsoft Entra ID tenant restrictions, see [use tenant restrictions to manage access to SaaS apps](https://learn.microsoft.com/entra/identity/enterprise-apps/tenant-restrictions).

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point      | Design Decision | Justification                                                                                                                                                                                                                              |
|---------------------|-----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Tenant restrictions | Configured      | Organisations that have implemented an enterprise web filtering solution that is capable of this feature (using TLS inspection and HTTP header insertion) should implement tenant restrictions for PROTECTED to prevent data exfiltration. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* [Tenant Restrictions](https://learn.microsoft.com/entra/identity/enterprise-apps/tenant-restrictions)