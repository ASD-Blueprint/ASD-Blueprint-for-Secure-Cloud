---
title: "Delivery Optimisation"
weight: 115
description: "This section describes the design decisions associated with delivery optimisation of Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

Delivery optimisation makes use of configurable peer-to-peer or caching technologies to decrease the internet bandwidth consumed by patches and updates.

Within organisations application deployments and patch updates can occur daily to keep them secure and provide the end users the capabilities to perform their work. These application deployments and patch updates can consume high levels of bandwidth, increasing the cost to organisations. To enable organisations to decrease bandwidth use and cost organisations can implement Delivery Optimisation solutions within their main and remote offices. Delivery Optimisation is essentially a peer-to-peer client service that enables end clients to source installation packages and updates from other clients/servers within the network as opposed to always obtaining them from the source servers or the internet. There are two types of configuration options for Delivery Optimisation:

The following options apply to cloud native and Hybrid (configured in Intune):

* **HTTP only, no peering** - Delivery Optimisation cloud service used to provide metadata only. Content to be retrieved from the downloads original source with peer-to-peer disabled. 
* **HTTP blended with peering behind same NAT** - Peer-to-peer sharing within the same network. Delivery Optimisation cloud service locates peers that connect to the internet using the same public IP and attempts to connect peers using their private subnet IP. 
* **HTTP blended with peering across private group** - Peers are automatically grouped by using the Active Directory Domain Services site or domain they reside in. Custom groups can also be used with peers being either manually or dynamically added to the group. Peers within the same group are connected.
* **HTTP blended with internet peering** - Enabled Internet peer sources for Delivery Optimisation.
* **Simple download mode with no peering** - Delivery Optimisation cloud services are disabled. This mode is automatically used with the Delivery Optimisation cloud service is not accessible or when the content file size is less than 10 MB.
* **Bypass mode** - Microsoft BITS will be used instead and should only be used if WSUS is in use and the preference is for BranchCache. 

The following options apply to Hybrid (configured in MECM):

* **BranchCache** - Enables systems within the same subnet and separated from a content source to share downloaded content locally instead of traversing a latent network link back to the MECM content source. 

BranchCache provides two modes of operation being:

* **Distributed Cache Mode** - Content cache at a remote office is distributed among client systems.
* **Hosted Cache Mode** - Content cache at a remote office is hosted on one or more hosted cache servers.
* **Peer Cache** - Is a built-in Configuration Manager solution that enables the clients to share content with other clients directly from their local cache providing Delivery Optimisation. 
* **Microsoft Connected Cache** - With MECM version 1910 a MECM distribution point can be configured as a Microsoft Connected Cache server enabling it to act as an on-demand cache for content downloaded by Delivery Optimisation. 

### Cloud native deployments

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                                                                            | Design Decision                                | Justification                                                                                                        |
|-------------------------------------------------------------------------------------------|------------------------------------------------|----------------------------------------------------------------------------------------------------------------------|
| Delivery Optimisation Method / Feature - single subnet per physical office                | HTTP blended with peering behind same NAT      | Good for single subnet per office as content will be peered per office only. This will not saturate WAN connections. |
| Delivery Optimisation Method / Feature - single subnet spanning multiple physical offices | HTTP blended with peering across private group | Provides the ability to group workstations so only the groupings can peer content.                                   |

{{% /alert %}}

### Hybrid deployments

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                         | Design Decision        | Justification                                                                         |
|----------------------------------------|------------------------|---------------------------------------------------------------------------------------|
| Delivery Optimisation Method / Feature | BranchCache            | Existing MECM solution exists with BranchCache Delivery Optimisation feature enabled. |
| Mode of operation                      | Distributed Cache Mode | Existing MECM solution exists with BranchCache configured in Distribute Cache Mode.   |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* None identified