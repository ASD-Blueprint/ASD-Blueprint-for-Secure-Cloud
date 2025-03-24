---
title: "Self Service Purchasing"
weight: 30
description: "This section describes the design decisions associated with Self Service Purchasing for system(s) built using ASD's Blueprint for Secure Cloud."
---
Self-Service purchase add-ins for Microsoft 365 enables users of Microsoft 365 to purchase third party add-ins for the relevant Microsoft 365 tenancy.

By default self-service purchase of applications from Microsoft Power Platform products is enabled for all users within the tenant. To purchase these applications users must pay with a credit card.

The processing of data for these add-ins does not sit within Microsoft 365 tenancy, which may result in data transmission or storage out of Australia.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                              | Design decision | Justification                                              |
|---------------------------------------------|-----------------|------------------------------------------------------------|
| Global self-service purchase                | Disabled        | Only administrators are permitted to purchase applications |
| Power BI self Service purchase              | Disabled        | Only administrators are permitted to purchase applications |
| Power Apps self-service purchase            | Disabled        | Only administrators are permitted to purchase applications |
| Power Automate (Flow) self-service purchase | Disabled        | Only administrators are permitted to purchase applications |

{{% /alert %}}

### Related information


#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* None identified
#### References

* None identified

#### Related design decisions

* None identified
