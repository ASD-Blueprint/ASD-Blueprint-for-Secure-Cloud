---
title: "Tenancy Isolation"
weight: 55
description: "This section describes the design decisions associated with blocking external tenants from establishing connections into the tenant for system(s) built using ASD's Blueprint for Secure Cloud."
---

With tenant restrictions, the organisation can control access to Software-as-a-Service (SaaS) cloud applications, based on the Entra ID tenant the applications use for single sign-on. With tenant restrictions, the organisation can specify the list of tenants that their users are permitted to access. Entra ID then only grants access to these permitted tenants using Entra ID based tenant restriction. 

Additionally, if the organisation wants to enforce tenant isolation for Microsoft Power Platform connections, then they can use Power Platform’s tenant isolation capability. Note that the Power Platform tenant isolation feature does not impact Entra ID based access outside of Power Apps and Power Automate. Power Platform tenant isolation only works for connectors using Entra ID based authentication such as Office 365 Outlook or SharePoint. 

Organisations wanting to block connectors that use external identity providers such as Microsoft account, Google, etc., can create a data loss prevention policy and classify the connector under the Blocked group. See [Connectors and Data Loss Prevention Policies]({{< ref "connectors-dlp-policies">}}).

Power Platform tenant isolation ability is available with two options: one-way or two-way restriction. 

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point   | Design Decision                                                                                   | Justification                                                                                                                                                                                                                             |
|------------------|---------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Tenant Isolation | Enabled for organisation tenant only<br>Inbound and Outbound Restricted to organisation tenant id | Tenant isolation can be used to block external tenants from establishing connections into the tenant (inbound isolation) as well as block the organisation tenant from establishing connections to external tenants (outbound isolation). |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* None identified

#### References

* [Cross-tenant inbound and outbound restrictions](https://docs.microsoft.com/power-platform/admin/cross-tenant-restrictions)
