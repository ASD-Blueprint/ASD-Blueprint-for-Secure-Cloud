---
title: "Accepted Domains"
weight: 30
description: "This section describes the design decisions associated with Accepted Domains for system(s) built using ASD's Blueprint for Secure Cloud."
---

Accepted Domains are SMTP namespaces configured within Exchange Online. Only emails addressed to users within the nominated domains are accepted.

Accepted Domains consist of the following types:

* **Authoritative Domains** - Authoritative Domains are domains where the Exchange Organisation accepts messages addressed to recipients and is responsible for generating non-delivery reports. On creation of an Exchange Online organisation the tenant domain Fully Qualified Domain Name (FQDN) and the `<tenantname>.mail.onmicrosoft.com` FQDN are automatically populated as an Authoritative Domains; and
* **Relay Domains** - Relay Domains are often called Non-Authoritative Domains. The Exchange Organisation will accept the messages addressed to the recipients; however, it is not responsible for generating non-delivery reports. Hybrid Exchange leverages Relay Domains and mail connectors to relay messages between both on-premises infrastructure and Exchange Online.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                                      | Design decision | Justification                                                                                                                                                                      |
|-----------------------------------------------------|-----------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Authoritative Domains                               | Configured      | `<tenantname>.onmicrosoft.com` authoritative domain is created during the enablement of Microsoft 365 and represents the Exchange Online Organisations initial SMTP address space. |
| Configure Additional Accepted Authoritative Domains | Configured      | Required to integrate with additional organisations. Any additional organisations that require access to the system are to be included.                                                      |

{{% /alert %}}

### Hybrid deployments

{{% alert title="Design decisions" color="warning" %}}

| Decision point                                      | Design decision | Justification                                                                                                                                                                                                                                                                                |
|-----------------------------------------------------|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Non-Authoritative / Internal / Relay Domains        | Configured      | `<tenantname>.onmicrosoft.com` authoritative domain is created during enablement of Microsoft 365 and represents the Exchange Online Organisations SMTP address space. The additional authoritative domains are required as each organisation will have a corresponding authoritative domain.|

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* [AD Tenant Settings - Custom Domains]({{<ref "tenant#custom-domain">}})

#### Configuration

* None identified

#### References

* [Manage accepted domains in Exchange Online](https://learn.microsoft.com/exchange/mail-flow-best-practices/manage-accepted-domains/manage-accepted-domains)