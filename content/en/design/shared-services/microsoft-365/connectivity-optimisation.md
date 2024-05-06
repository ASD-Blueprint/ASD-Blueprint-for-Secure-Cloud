---
title: "Optimisation"
weight: 30
description: "This section describes the design decisions associated with Autodiscover for system(s) built using ASD's Blueprint for Secure Cloud."
---

Microsoft 365 is a globally distributed service. The user experience with Microsoft 365 involves connectivity through highly distributed service connection points that are distributed over worldwide Microsoft Azure locations. This section outlines design decisions that aim to:

1. Achieve the highest level of maturity and adherence to existing Australian Government Whole-of-Government policies 
2. Optimise performance and maximise user experience 

[Microsoft's current best practice](https://learn.microsoft.com/microsoft-365/enterprise/network-planning-and-performance?view=o365-worldwide) targets primarily the second objective; however this guidance is inconsistent with guidance regarding Secure Internet Gateways in ASD's [*Information Security Manual* (ISM)](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism) and the Department of Home Affairs' [*Protective Security Policy Framework* (PSPF)](https://www.protectivesecurity.gov.au/). Implementation of the Microsoft recommendations should therefore be undertaken with consideration to the organisations risk appetite and the implications of implementing all Microsoft recommendations. 

According to Microsoft, the following achieves optimal Microsoft 365 connectivity and performance:

* **Local DNS resolution and Internet egress** - Provision local DNS servers in each location and ensure that Microsoft 365 connections egress to the internet as close as possible to the user's location. This configuration minimises latency and improves connectivity to the closest Microsoft 365 entry point.
* **Add regional egress points** - If the organisation network has multiple locations but only one egress point, add regional egress points to enable users to connect to the closest Microsoft 365 entry point. This configuration minimises latency and improves connectivity to the closest Microsoft 365 entry point.
* **Bypass proxies and inspection devices** - Configure browsers to send Microsoft 365 traffic directly to egress points and bypass proxies. Configure edge routers and firewalls to permit Microsoft 365 traffic without inspection. This configuration minimises latency and reduces the load on network devices.
* **Enable split tunnelling connection for VPN users** - If a VPN solution is required Always on VPN should be integrated into the organisation infrastructure. For VPN users, enable Microsoft 365 connections to connect directly from the user's network rather than over the VPN tunnel by implementing split tunnelling. This configuration minimises latency and improves connectivity to the closest Microsoft 365 entry point.

### Connectivity optimisation for increased security

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                                   | Design Decision                   | Justification                                                                                                                       |
|--------------------------------------------------|-----------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| Workstation Connectivity                         | VPN with central internet gateway | Provides the highest level of auditing and monitoring.                                                                              |
| Local DNS resolution and Internet egress         | Not Configured                    | All traffic will egress centrally through an internet gateway.                                                                      |
| Add regional egress points                       | Not Configured                    | All traffic will egress centrally through an internet gateway.                                                                      |
| Bypass proxies and inspection devices            | Configured                        | Proxies and internet gateway will be configured following Microsoft best practice guidance to allow services to function correctly. |
| Enable split tunnelling connection for VPN users | Not Configured                    | All traffic will always traverse the VPN and egress through the internet gateway.                                                   |

{{% /alert %}}

### Connectivity optimisation for enhanced user experience

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                                   | Design Decision                   | Justification                                                                                                                                                                                                            |
|--------------------------------------------------|-----------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Workstation Connectivity                         | Direct connection to the internet | Provides the best performance for users.                                                                                                                                                                                 |
| Local DNS resolution and Internet egress         | Configured if required            | DNS will be resolved to the gateway of their internet device.                                                                                                                                                            |
| Add regional egress points                       | Configured if required            | Regional Egress Points are not configured in this solution due to the workstations being directly connected to the internet.                                                                                             |
| Bypass proxies and inspection devices            | Configured                        | Proxies are not configured in this solution due to the workstations being directly connected to the internet.                                                                                                            |
| Enable split tunnelling connection for VPN users | Configured                        | Split tunnelling is configured in this solution to enable workstations to directly connect to Microsoft services. If a VPN solution is required Always on VPN should be integrated into the organisation infrastructure. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* [Delivery Optimisation]({{<ref "delivery-optimisation.md">}})

#### Configuration

* None identified

#### References

* [Network planning and performance tuning for Microsoft 365](https://learn.microsoft.com/microsoft-365/enterprise/network-planning-and-performance?view=o365-worldwide)