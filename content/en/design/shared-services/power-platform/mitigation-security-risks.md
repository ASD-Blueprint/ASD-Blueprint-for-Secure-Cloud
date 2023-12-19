---
title: "Mitigation of Power Platform security risks"
weight: 55
description: "This section describes how core security risks within the Power Platform will be mitigated for system(s) built using ASD's Blueprint for Secure Cloud."
---
Below lists the core security risks for the Power Platform and how they are mitigated via the documented design decisions.

| Risk                                | Mitigation                                                                                                                                                                                                                                                                                                         |
|-------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Information leakage                 | Configure **Power Platform Data loss prevention (DLP) policies** to act as guardrails to help prevent users from unintentionally exposing organisational data and to protect information security in the tenant.<br>Enable **Tenancy Isolation** to block inbound and outbound connections with external tenancies |
| Connection to external data sources | Configure **Power Platform Data loss prevention (DLP) policies** to restrict usage to Microsoft 365 only connectors.<br>- **Data Gateways** which connect to external data sources not enabled.                                                                                                                    |
| Operational Information security    | Enable **Power Platform Customer lockbox** to ensure that organisation can review and approve (or reject) data access requests when data access to customer data is needed by Microsoft engineers.                                                                                                                 |

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* [Microsoft Power Platform security documentation](https://docs.microsoft.com/power-platform/admin/security)

