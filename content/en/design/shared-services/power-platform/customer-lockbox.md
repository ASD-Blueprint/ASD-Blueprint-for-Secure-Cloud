---
title: "Power Platform Customer Lockbox"
weight: 55
description: "This section describes the design decisions associated with enabling Customer Lockbox specific to Power Platform for system(s) built using ASD's Blueprint for Secure Cloud."
---

In addition to the tenant wide Customer Lockbox functionality, specific [Power Platform Customer Lockbox](https://learn.microsoft.com/power-platform/admin/about-lockbox) functionality is also available to be configured within the Power Platform Administration Centre. In the rare occasion when Microsoft attempts to access customer data that's stored within Power Platform, a Customer Lockbox request is sent to the organisations Microsoft 365 `Global Administrators` and `Power Platform Administrators` for approval. 

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point   | Design Decision | Justification                                                                                                                                                                                  |
|------------------|-----------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Customer Lockbox | Enabled         | Customer Lockbox for Microsoft Power Platform can be used to control Microsoft operator access to customer content. It may take up to 24 hours for all supported data sources to be protected. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* [Securely access customer data using Customer Lockbox in Power Platform](https://docs.microsoft.com/power-platform/admin/about-lockbox)

