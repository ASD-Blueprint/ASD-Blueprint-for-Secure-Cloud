---
title: "System Monitoring"
linkTitle: "System Monitoring"
weight: 80
type: docs
description: This page provides a template and guidance to assist organisations in documenting their approach to system monitoring, including event logging and monitoring, associated with their system(s) built on ASD's Blueprint for Secure Cloud.
---

{{% alert title="Instruction" color="dark" %}}

The system monitoring section of a System Security Plan (SSP) should document an organisation's approach to event logging and monitoring. As with other sections of the SSP, information in the system monitoring section should be documented according to the relevant controls outlined in ASD's ISM and the SSP Annex. 

All template text refers to a typical implementation of a system built using the Blueprint, and includes reference to organisational policies, processes and technical configurations to be implemented in addition to the technical controls that may be configured using guidance from the Blueprint. Any implementation implied by the below text should not be considered as prescriptive of how organisations must scope, build, document, or assess its system.

When completing the below template, organisations should insert and update information where relevant to ensure it accurately represents their approach to system administration, patching and backups and restoration. When complete, remove any instructional boxes throughout. 

{{% /alert %}}

### Event logging and monitoring

#### Applicability

ISM controls relating to the system monitoring of `<SYSTEM-NAME>`'s are applicable to and covered by this section of the SSP. 

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

The collection of event logs for monitoring of `<SYSTEM-NAME>` is performed in accordance with `<ORGANISATION-NAME>`'s [Event Logging Policy]({{< ref "security-and-governance/policies">}}).

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

Technical controls for system monitoring of `<SYSTEM-NAME>` are configured with reference to ASD's [*Blueprint for Secure Cloud*](https://blueprint.asd.gov.au) including the following technical configuration:

* Defender for Endpoint and Defender for Microsoft 365 centralise logs relating to the security of devices and Microsoft services
* Windows devices and Microsoft 365 services leverage Microsoft's Window Time service
* Microsoft Entra ID logs authentication events to Log Analytics
* the following events are logged to the local event log on each Windows endpoint:
* access to important data and processes
* application crashes and any error messages
* attempts to use special privileges
* changes to accounts
* changes to security policy
* changes to system configurations
* DNS and Hypertext Transfer Protocol (HTTP) requests
* failed attempts to access data and system resources
* service failures and restarts
* system startup and shutdown
* transfer of data to external media
* user or group management
* use of special privileges
* logs include the date and time of the event, the relevant user or process, the event description, and the ICT equipment involved are recorded
* logs stored in Log Analytics are protected from unauthorised access, modification and deletion by the Microsoft Entra ID RBAC model. 
* Standard Windows users do not have access to modify the local event logs.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Related information

#### Security & Governance

*   [Event Logging Policy]({{< ref "security-and-governance/policies">}})
*   [Essential Eight: Application Control]({{< ref "application-control.md" >}})
*   [Essential Eight: Multi-factor-Authentication]({{< ref "multi-factor-authentication.md" >}})
*   [Essential Eight: Restrict Administrative Privileges]({{< ref "restrict-administrative-privileges.md">}})
*   [Essential Eight: User Application Hardening]({{< ref "user-application-hardening.md">}})
*   [Application Control]({{<ref "security-and-governance/essential-eight/application-control.md">}})

#### Design

* [Endpoint Monitoring]({{<ref "design/platform/client/endpoint-monitoring.md">}})
* [Platform Monitoring and Auditing]({{<ref "design/platform/security/platform-monitoring-auditing.md">}})
* [Audit and Logging]({{<ref "design/shared-services/defender/audit-and-logging.md">}})
* [Microsoft 365 Monitoring]({{<ref "design/shared-services/microsoft-365/microsoft365-monitoring.md">}})
* [Reporting and Monitoring]({{<ref "design/platform/identity/reporting-and-monitoring.md">}})

#### Configuration

* [Microsoft Entra ID - Applications]({{<ref "configuration/entra-id/applications">}})
* [Microsoft Intune - Profile Configurations]({{<ref "configuration/intune/devices/configuration-profiles">}})
* [Endpoint security policies]({{<ref "configuration/defender/endpoints/configuration-management/endpoint-security-policies.md">}})


#### External documentation

* ASD's [*Guidelines for System Monitoring*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-system-monitoring)
* [Overview of Log Analytics in Azure Monitor](https://learn.microsoft.com/azure/azure-monitor/logs/log-analytics-overview)
* [Log Analytics tutorial](https://learn.microsoft.com/azure/azure-monitor/logs/log-analytics-tutorial)