---
title: "Microsoft Store"
weight: 40
description: "This section describes the design decisions associated with the Microsoft Store on Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

The Microsoft Store is an online store for applications available for Windows 8 and newer operating systems. The Microsoft Store has been designed to be used in both public and enterprise scenarios depending on whether the Microsoft Public Store or Microsoft Store for Business is configured.

The Microsoft Public Store is the central location for browsing the library of available Windows UWP Applications that can be installed on Windows 10. The Microsoft Public Store includes both free and paid applications. Applications published by Microsoft and other developers are available.

The Microsoft Store for Business (private store) enables organisations to purchase applications in larger volumes and customise which applications are available to users. Applications which are made available can either be distributed directly from the store or through a managed distribution approach. Applications which have been developed within the organisation can also be added and distributed as required.

Licencing can also be managed through the Microsoft Store for Business and administrators can reclaim and reuse application licences.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point               | Design Decision | Justification                                                                                  |
|------------------------------|-----------------|------------------------------------------------------------------------------------------------|
| Microsoft Public Store       | Disabled        | To align with ASD's [*Hardening Microsoft Windows 10 version 21H1 Workstations*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/hardening-microsoft-windows-10-version-21h1-workstations) guidance.                                             |
| Microsoft Store for Business | Enabled         | To enable the delivery of enterprise volume purchased apps including the Intune Company Portal. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* None identified