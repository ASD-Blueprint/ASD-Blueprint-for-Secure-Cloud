---
title: "Platform security"
linkTitle: "Platform security"
weight: 30
description: "This section describes the design decisions associated with platform security for system(s) built using ASD's Blueprint for Secure Cloud."
--- 

While many services and configurations contribute to the overall security posture of the Microsoft 365 platform, the primary technical capability comes from the [Microsoft Defender XDR](https://learn.microsoft.com/en-au/defender-xdr/microsoft-365-defender) suite of products. Defender XDR includes:

* **Microsoft Defender for Endpoint** for endpoint security
* **Microsoft Defender for Office 365** for email and collaboration security
* **Microsoft Defender for Identity** for identity security
* **Microsoft Defender for Cloud Apps** for SaaS application security
* **Microsoft Defender Vulnerability Management** for operating system and software vulnerability management
* **Microsoft Defender for Cloud** for hybrid and multi-cloud workload security
* **Microsoft Entra ID Protection** for identity risk detection and remediation
* **Microsoft Purview Data Loss Prevention** for preventing data loss across endpoint, apps and services
* **App Governance** for SaaS application risk detection and remediation

### Microsoft Defender XDR

Defender XDR combines and orchestrates the capabilities of each service into a single solution accessed via the Defender portal at <https://security.microsoft.com>, and provides integrated detection, investigation and response capabilities across the Microsoft 365 platform as well as for on-premises and other cloud environments.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                         | Design decision            | Justification                                                                |
| -------------------------------------- | -------------------------- | ---------------------------------------------------------------------------- |
| Platform security technical capability | Use Microsoft Defender XDR | Defender XDR provide comprehensive and well integrated security capabilities |

{{% /alert %}}

#### Deployment considerations

The following should be considered before provisioning Defender XDR:

##### Deployed services

Defender XDR requires explicit provisioning and configuration of some products and services in order for them to be integrated. Without all products and services integrated, Defender XDR's visibility and functionality will be limited.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                 | Design decision               | Justification                                 |
| ------------------------------ | ----------------------------- | --------------------------------------------- |
| Defender XDR deployed services | Use all Defender XDR services | Increase cross-correlation of security events |

{{% /alert %}}

##### Unified role-based access control (RBAC)

Many Microsoft services have their own access control model in addition to what is provided by Entra ID. It is often preferable to use these models to apply the principle of least privilege, however in smaller organisations the use of Entra built-in roles with broader permissions can be more practical.

The [Defender XDR Unified unified RBAC model](https://learn.microsoft.com/en-au/defender-xdr/manage-rbac) integrates the access control models of each of its services into a single unified model, providing both broad and specific options for accessing Defender XDR services.

{{% alert title="Unified RBAC and PIM" color="info" %}}

Defender XDR Unified RBAC roles are not available for activation within Entra Privileged Identity Management (PIM). In order to use these roles with PIM, the role may be assigned to a group and group membership activated via PIM.

{{% /alert %}}

{{% alert title="Design decisions" color="warning" %}}

| Decision point    | Design decision                       | Justification                          |
| ----------------- | ------------------------------------- | -------------------------------------- |
| Defender XDR RBAC | Use Defender XDR RBAC where practical | Apply the principal of least privilege |

{{% /alert %}}

##### Data location and retention

When provisioning Defender XDR and its services, the storage location equivalent to the Azure region hosting the service may be an option for selection. Australian regions should be selected, however if an incorrect region had been previously selected, it may be possible to have the service migrated or re-provisioned to the correct region by raising a support case. This process may also require reconfiguration or redeployment of remote software components if a new tenant ID or access key is generated.

The data retention period for Defender XDR services is typically 180 days but can be less depending on the service, datatype, and end-user license used. Extending retention beyond 180 days is possible with Microsoft Sentinel, or other SIEM-SOAR or logging service integration.

Further information on Defender XDR's data location and retention can be found in Microsoft's [Data security and retention in Microsoft Defender XDR](https://learn.microsoft.com/en-au/defender-xdr/data-privacy) page.

{{% alert title="Design decisions" color="warning" %}}

| Decision point              | Design decision           | Justification                                                                                                                                                                |
| --------------------------- | ------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Defender XDR data location  | Australia, where possible | Help ensure data is under and jurisdiction of the Australian Government, help ensure confidentiality, and help minimise potential impacts from international service outages |
| Defender XDR data retention | 12 months                 | Align with *Information Security Manual* requirements to retain events in a searchable format                                                                                |

{{% /alert %}}

##### Network configurations for endpoint, agent and sensor communication

Many Defender XDR services rely on communication between their cloud-based service endpoints and remote software components. Network planning should consider how to incorporate such flows into existing networks.

##### Multitenant management

For improved visibility and management capabilities across multiple tenants, some Defender XDR services used in separate environments can be integrated into the [Defender multitenant management](https://learn.microsoft.com/en-au/unified-secops-platform/mto-overview) portal, accessed via <https://mto.security.microsoft.com>.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                      | Design decision                           | Justification                                                |
| ----------------------------------- | ----------------------------------------- | ------------------------------------------------------------ |
| Defender XDR multitenant management | Use multitenant management where possible | Improve operational visibility across organisation resources |

{{% /alert %}}

##### Microsoft Sentinel

Integrating security information and event management (SIEM) and security orchestration, automation, and response (SOAR) services such as Microsoft Sentinel into the [Defender portal](https://learn.microsoft.com/en-au/azure/sentinel/microsoft-sentinel-defender-portal) or into [Defender XDR](https://learn.microsoft.com/en-au/azure/sentinel/microsoft-365-defender-sentinel-integration?tabs=azure-portal) can provide additional benefits for operational teams, such as additional context and improved cross-correlation of security events, additional attack disruption capabilities, and more unified incident and alert management.

Several options are available to integrate Sentinel into the Defender portal or Defender XDR depending on how operational teams manage incidents and alerts, and the extent to which Sentinel may be used with other systems and third party apps.

{{% alert title="Design decisions" color="warning" %}}

| Decision point       | Design decision                      | Justification                                                    |
| -------------------- | ------------------------------------ | ---------------------------------------------------------------- |
| Sentinel integration | Integrate Sentinel with Defender XDR | Enable more efficient threat detection and response capabilities |

{{% /alert %}}

#### Operational considerations

The following should be considered before using Defender XDR:

##### Microsoft Secure Score

[Microsoft Secure Score](https://learn.microsoft.com/en-au/defender-xdr/microsoft-secure-score) is a measurement of an organisation's security posture, detailing security issues affecting an organisation alongside mitigation recommendations. Secure Score's metrics are updated in realtime and tracked over time, providing a useful tool for operational teams to target effort and measure effectiveness. Scoring assessments are also integrated into individual products to provide contextual information.

##### Microsoft Security Copilot

[Security Copilot](https://learn.microsoft.com/en-au/copilot/security/microsoft-security-copilot) is a generative AI security solution that is accessed as a standalone application and which can also be accessed via a number of [embedded experiences](https://learn.microsoft.com/en-au/copilot/security/experiences-security-copilot) in Defender XDR services. Using Security Copilot can provide a number of benefits for operational teams, particularly when it comes to aggregating information of dealing with complex tasks, like reverse engineering scripts, in a timely manner.

Organisations intending to use Security Copilot should be aware of the data, privacy and security implications of using generative AI systems and ensure any risks are understood and accepted before use.

##### Use of APIs

[Defender XDR operates on APIs](https://learn.microsoft.com/en-au/defender-xdr/api-overview), many of which can be accessed via the Microsoft Security Graph, and which can be used to integrate Defender XDR and its services with third party or bespoke apps. Common systems for API integration include SIEM-SOAR tools, data repositories, and service management or ticketing workflows.

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* None identified

#### References

* [Data security and retention in Microsoft Defender XDR](https://learn.microsoft.com/en-au/defender-xdr/data-privacy)
* [Microsoft Defender multitenant management](https://learn.microsoft.com/en-au/unified-secops-platform/mto-overview)
* [Microsoft Defender XDR integration with Microsoft Sentinel](https://learn.microsoft.com/en-au/azure/sentinel/microsoft-365-defender-sentinel-integration)
* [Microsoft Defender XDR Unified role-based access control (RBAC)](https://learn.microsoft.com/en-au/defender-xdr/manage-rbac)
* [Microsoft Secure Score](https://learn.microsoft.com/en-au/defender-xdr/microsoft-secure-score)
* [Microsoft Security Copilot experiences](https://learn.microsoft.com/en-au/copilot/security/experiences-security-copilot)
* [Microsoft Sentinel in the Microsoft Defender portal](https://learn.microsoft.com/en-au/azure/sentinel/microsoft-sentinel-defender-portal)
* [Overview of Microsoft Defender XDR APIs](https://learn.microsoft.com/en-au/defender-xdr/api-overview)
* [Privacy and data security in Microsoft Security Copilot](https://learn.microsoft.com/en-au/copilot/security/privacy-data-security)
* [What is Microsoft Defender XDR?](https://learn.microsoft.com/en-au/defender-xdr/microsoft-365-defender)
* [What is Microsoft Security Copilot?](https://learn.microsoft.com/en-au/copilot/security/microsoft-security-copilot)
