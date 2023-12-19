---
title: Printing
weight: 45
description: "This section describes the design decisions associated with the management of Applications deployed to endpoints for system(s) built using ASD's Blueprint for Secure Cloud."
---

Printing is a legitimate method of data transfer out of an environment. Printing allows users to physically export data from a network and hence also it can be leveraged by malicious actors for data exfiltration. To minimize the risks associated with printing, the allowed locations for printing should be controlled.

Microsoft Intune can be leveraged to control printers available for a device and whether a user is able to add additional local printers.

For a user to leverage an available printer, connectivity and a device driver is often required. The drivers can be delivered and updated using Microsoft Intune and/or Microsoft Endpoint Configuration Manager. Connectivity will depend on the connected network(s) of the device. Options include:

* **Corporate Network printing** - In the workplace, the domain joined computers can connect to the print servers and send jobs to the queue.
* **External Network printing via Hybrid Cloud Print** - Without network connectivity via Citrix, a VPN, or Microsoft Hybrid Cloud Print, direct print server connectivity is not available. Microsoft Hybrid Cloud Print utilises a reverse proxy to communicate with the print servers located within the work network.
* **External Network printing via VPN** - When direct printer connectivity is not available from external networks, a VPN such as Windows 10 Always-On VPN can allow clients to function as if they were part of the corporate network.

When deploying a hybrid solution, the allocation of printers to users should be considered. Other management solutions such as Group Policy and Microsoft Endpoint Configuration Manager may be servicing the allocation of printers to devices.

### Cloud native deployments

{{% alert title="Design Decisions" color="warning"%}}

| Decision Point                | Design Decision | Justification                                                                                                                                          |
| ----------------------------- | --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Printer addition restrictions | Configured      | Configured using scripts deployed via Microsoft Intune. Printers must be supported out of the box in Windows 10 / 11.                                  |
| Unsecure location Printing    | Configured      | Out of office printing is to be restricted as adequate controls for the creation, storage and destruction of classified content cannot be implemented. |

{{% /alert %}}

### Hybrid deployments

{{% alert title="Design Decisions" color="warning"%}}

| Decision Point                | Design Decision | Justification                                                                                                                                                |
| ----------------------------- | --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Printer addition restrictions | Configured      | Management tools such as Group Policy can be used to configure printer configurations. Printers will need to be supported out of the box in Windows 10 / 11. |
| Unsecure location Printing    | Configured      | Out of office printing is restricted as adequate controls cannot be implemented to prevent the creation of classified content on untrusted print device.     |

{{% /alert %}}

### Universal Print

Universal Print enables organisations to manage print infrastructure through cloud services for compatible printers and apart from the printer does not require any additional on-premises infrastructure. The service integrates with Microsoft Entra ID and where required also supports single sign-on. By using the additional [Universal Print connector software](https://learn.microsoft.com/universal-print/fundamentals/universal-print-connector-overview), organisations can also deploy the service for non-compatible printers. 

{{<figure src="https://learn.microsoft.com/universal-print/fundamentals/media/architecture-diagram.png" title="Universal Print Architecture">}}

Universal Print provides a limited pool of print jobs per month for organisations with applicable Microsoft 365 subscriptions. Organisations can also add additional print volume when required. Microsoft's [licencing Universal Print page](https://learn.microsoft.com/universal-print/fundamentals/universal-print-license) provides additional information.

Organisations should undertake an assessment of the Universal Print service to determine its fit with the organisational risk appetite.

For those organisations electing to implement Universal Print, Microsoft provide the following guidance: [Set up Universal Print](https://learn.microsoft.com/universal-print/fundamentals/universal-print-getting-started).

### Related information

#### Security & Governance

* None identified

#### Design

* [Windows Desktop Applications]({{<ref "enterprise-applications">}})
* [Windows Universal Applications]({{<ref "universal-platform-applications">}})

#### References

* [Microsoft Intune App Management](https://docs.microsoft.com/mem/intune/apps/app-management)
* [Proactive Remediations](https://docs.microsoft.com/mem/analytics/proactive-remediations)
* [Universal Print](https://learn.microsoft.com/universal-print/fundamentals/)
