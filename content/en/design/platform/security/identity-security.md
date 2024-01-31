---
title: "Identity Security"
weight: 30
description: "This section covers the security features associated with ensuring configuration of identity management is effectively monitored and audited and threats can be identified and responded to correctly for system(s) built using ASD's Blueprint for Secure Cloud."
---

 Features within Identity Security include:

* **Secure Score** - Dynamic indicator of alignment of Entra ID alignment with Microsoft's best practice recommendations for security
* **Monitoring and health** - Identity Activity and Security logging and monitoring
* **Identity Protection** - Automated threat response based on sign-in and user risk
* **Defender for Identity** - Hybrid Active Directory and Entra ID traffic monitoring

### Secure Score

[Identity Secure Score](https://learn.microsoft.com/entra/identity/monitoring-health/concept-identity-secure-score) provides an indicator as to how aligned the organisations Entra ID configuration is to Microsoft's [best practice](https://learn.microsoft.com/azure/security/fundamentals/identity-management-best-practices) recommendations for security. This provides an objective assessment of the identity security posture and recommendations for security improvements.

Identity secure score is found at `Entra portal` > `Entra ID` > `Security` > `Identity Secure Score`.

Azure dynamically (every 48 hours) compares the security configuration against the tenants settings and calculates a score based on the alignment with best practices. Where there is a variation a recommendation is provided. Recommendations can be categorised such that it is accepted as a risk, a mitigation planned or resolved through an alternate. Secure score also present a score comparison against other companies of similar size.

The identity score feeds into Microsoft 365 Defender where trends in the score over time can also be reviewed.

The secure score does not express an absolute measure of how likely an organisation is to get breached. It expresses the extent to which the organisation has adopted features that can offset the risk of being breached. No service can guarantee that organisations will not be breached, and the secure score should not be interpreted as a guarantee in any way.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point | Design Decision | Justification                                |
|----------------|-----------------|----------------------------------------------|
| Secure Score   | > 80%           | Continual monitoring and improvement program. |

{{% /alert %}}

### Entra ID activity reports and monitoring

See the [Identity Monitoring]({{<ref "reporting-and-monitoring">}}) design decisions.

#### Identity Protection

See the [Identity Protection]({{<ref "design/platform/identity/protection">}}) design decisions.

#### Microsoft Defender for Identity

Microsoft Defender for Identity is an Azure-hosted security capability designed to monitor AD traffic and alert on suspicious authentication-related activities. Defender for Identity leverages Machine Learning (ML) to analyse user, device, and resource authentication behaviours to build a baseline, then alert security analysts when an authentication attempt occurs that is not consistent with the baseline. Traffic corresponding to known authentication-based attacks, such as Pass-the-Hash (PtH) and Pass-the-Ticket (PtT), is also recognised by Defender for Identity and specific alerts generated.

The Defender for Identity architecture is composed of a Defender for Identity cloud service with the following components:

* **Defender for Identity cloud service** – Is hosted on Azure infrastructure and at the time of writing, Defender for Identity cloud service is deployed in the US, Europe and Asia data centres.
* **Defender for Identity portal** – Management interface where the Defender for Identity instance can be created, displays data collected by Defender for Identity sensors and is the central console for monitoring, managing and investigating threats.
* **Defender for Identity sensor** – Sensors are installed on all domain controllers which monitor and collect domain controller traffic that is fed back to the Defender for Identity portal for analysis.

A high-level illustration of Defender for Identity architecture is shown in the below diagram. 

{{<figure src="/content/images/platform-defender-for-identity.png" title="Microsoft Defender for Identity Architecture">}}
*Figure reproduced from <https://learn.microsoft.com/defender-for-identity/prerequisites>*

A single Defender for Identity instance can monitor multiple AD DS forests and their respective domains.

Defender for Identity relies on Network Name Resolution (NNR) to correlate between raw activities (containing IP addresses) and the relevant devices involved in the activities to be able to generate security alerts for suspicious activities. To correlate IP addresses to device names, Defender for Identity sensors lookup the IP addresses using these methods:

* NTLM over RPC (TCP Port 135).
* NetBIOS (UDP port 137).
* RDP (TCP port 3389) – only the first packet of Client hello.
* Queries the DNS server using reverse DNS lookup of the IP address (UDP 53).

Microsoft recommends using all the above methods, however if this is not possible the organisation should use the DNS lookup method and at least one of the other methods available at [Network Name Resolution in Microsoft Defender for Identity](https://learn.microsoft.com/defender-for-identity/nnr-policy).

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                                               | Design Decision                                                                     | Justification                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
|--------------------------------------------------------------|-------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Number of Defender for Identity instances                    | One                                                                                 | A single Defender for Identity instance can monitor multiple AD DS forests.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Defender for Identity instance name                          | {organisation-instance-name}.atp.azure.com                                          | The Defender for Identity cloud service will be given an Defender for Identity instance name which will be used to access the Defender for Identity portal.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Forests and domains to be monitored by Defender for Identity | {organisation}.com.au                                                               | Nominated organisation forests and domains.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| Defender for Identity sensor deployment                      | To all DC's within the identified forests and domains.                              | Best practice to ensure all authentication traffic is monitored by Defender for Identity.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| Internet connectivity                                        | Domain controllers must have internet connectivity                                  | Domain controllers which will have Defender for Identity sensors installed, must have internet connectivity to the Defender for Identity Cloud Service. <br>Defender for Identity sensors support the use of a web proxy / WPAD for internet connectivity.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| Directory service accounts                                   | A standard AD user account & password<br><br>A group Managed Service Account (gMSA) | If the organisation environment consists of Windows Server 2008 R2 SP1 domain controllers a standard AD user account and password is required with read access to all objects in the monitored domains.<br><br>If organisation environment consists of Windows Server 2012 or above domain controllers than a group Managed Service Account (gMSA) is required with read access to all objects in the monitored domain.<br><br>If the organisation environment consists of a mixture of domain controller operating system versions, then a combination of group Managed Service Account (gMSA) and Standard user account is required. See [Microsoft Defender for Identity prerequisites](https://learn.microsoft.com/defender-for-identity/prerequisites). |
| Network Name Resolution (NNR)                                | Reverse DNS lookup and one other method (listed above)                              | This is the minimum NNR requirement for Defender for Identity. Microsoft recommends using all of the above-mentioned resolution methods available within organisation environment.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| Deleted Objects container permissions                        | Read-only                                                                           | Microsoft recommends users should have read-only permissions assigned on the [Deleted objects container](https://learn.microsoft.com/defender-for-identity/directory-service-accounts#permissions-required-for-the-dsa) to enable Defender for Identity to detect user deletions from the organisations Active Directory.                                                                                                                                                                                                                                                                                                                                                                                                                                          |

{{% /alert %}}

##### Role groups

Defender for Identity provides security groups to enable the implementation of a RBAC model.

Microsoft Entra ID provides the basis for the Defender for Identity role groups. When Defender for Identity is enabled for the first time it automatically creates the three security groups in Microsoft Entra ID, using the product's previous name - Azure ATP. The three Defender for Identity security groups are:

* **Azure ATP {Instance Name} Administrators** – Provides full administrative access to the specific Defender for Identity instance including all configuration settings.
* **Azure ATP {Instance Name} Users** – Able to modify configurations relating to suspicious activities (i.e. change status and add exclusions), alerts and scheduled reports, but not the configuration of Defender for Identity sensors or data sources.
* **Azure ATP {Instance Name} Viewers** – Access to log into the Defender for Identity console to view suspicious activities and download reports. Not able to modify the status of a suspicious activity or add any exclusions.

Note, in addition to the role groups described above, any tenant Global and Security Admins can login to the Defender for Identity portal.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                                | Design Decision       | Justification                                                                                                                      |
|-----------------------------------------------|-----------------------|------------------------------------------------------------------------------------------------------------------------------------|
| Members of the Azure ATP Administrators group | Organisation decision | Only specific users that require administrative access should be added to this group.                                              |
| Members of the Azure ATP Users group          | Organisation decision | Include membership of the cyber security team that are responsible for the day-to-day use and management of Defender for Identity. |
| Members of the Azure ATP Viewers group        | Organisation decision | Include membership of the cyber security team to enable auditing of Defender for Identity.                                         |

{{% /alert %}}

##### Notifications

In addition to creating alerts in the Defender for Identity console whenever a new suspicious activity or health issue is detected, Defender for Identity can also be configured to send email and syslog notifications. This enables security analysts to monitor existing mailboxes and leverage toolsets such as a Security Information and Event Management (SIEM) product rather than constantly having to login and view the Defender for Identity portal.

Defender for Identity does not require a Simple Mail Transfer Protocol (SMTP) server to be configured to send email alerts. However, the syslog configuration of a SIEM is required to send alerts to it. The required settings include:

* Fully Qualified Domain Name (FQDN) / Internet Protocol (IP) address.
* Port that that SIEM is listening on for syslog alerts.
* Transport protocol, either Transport Control Protocol (TCP), User Datagram Protocol (UDP) or Transport Layer Security (TLS) / Secured Syslog.
* Request For Comments (RFC) 3164 or 5424 format.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point       | Design Decision                                          | Justification                                                                                                     |
|----------------------|----------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------|
| Mail notifications   | Enabled for both suspicious activities and health alerts | Notify relevant security teams when unwarranted and unauthorised activities occur.                                |
| Syslog notifications | Enabled for both suspicious activities and health alerts | If the organisation has an existing SIEM solution enable the SIEM to gather all possible security-related events. |

{{% /alert %}}

##### Integration with Defender for Endpoint

Defender for Identity supports native integration with Defender for Endpoint.

The purpose of this is to combine Defender for Identity's monitoring of AD and DCs specifically, with Defender for Endpoint's monitoring of general endpoints, to provide a single interface that combines events and alerts from both.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                         | Design Decision | Justification                                          |
|----------------------------------------|-----------------|--------------------------------------------------------|
| Integration with Defender for Endpoint | Enabled         | To integrate data feeds and alerts from both products. |

{{% /alert %}}

##### Firewall

As Defender for Identity is reliant upon the Defender for Identity portal and the Defender for Identity sensors, firewall ports are required to be opened to enable communication between infrastructure (Domain Controllers and standalone servers) and Defender for Identity. These port configurations are updated frequently and are available online from Microsoft ([Configure endpoint proxy and Internet connectivity settings for the Microsoft Defender for Identity Sensor](https://learn.microsoft.com/defender-for-identity/configure-proxy), [Microsoft Defender for Identity prerequisites](https://learn.microsoft.com/defender-for-identity/prerequisites)).

It is important to note the traffic between the client and the Defender for Identity portal offering is TLS1.2 encrypted. Configuration will occur on the proxy, external gateway and local infrastructure servers of the organisation as required.

Firewall rules and proxy allow lists will be implemented as part of the Defender for Identity solution.

* **Defender for Identity service location** – As mentioned previously, Defender for Identity data centres are deployed in the United States, Europe, and Asia. The organisation's Defender for Identity instance will be created in the data centre that is geographically closest to the organisation's Microsoft Entra ID service. This will assist in determining which service location to utilise for generating allow lists. For Microsoft Entra ID tenants located in Australia, Defender for Identity will be created in Asia.
* **Maximal security and data privacy** – Defender for Identity cloud services use certificate based mutual authentication for communication between Defender for Identity cloud backend and all Defender for Identity sensors. To make the authentication process seamless as possible if the organisation's environment utilises SSL inspection then the inspection should be configured for mutual authentication.

Further details on the firewall configuration for the solution can be found in the [Hybrid - Network Configuration ABAC]({{<ref "configuration">}}).

#### Integration with Defender for Cloud Apps

Defender for Cloud Apps is a Cloud Access Security Broker that provide visibility, control over data travel and powerful analytics to identify and deal with cyberthreats. Integrating Defender for Identity with Defender for Cloud Apps extends this capability to hybrid environments and presents all Defender for Identity Suspicious Activity (SA) alerts to the Defender for Cloud Apps dashboard, reducing the need for security analysts to monitor multiple consoles.

To connect Defender for Identity to Defender for Cloud Apps the administrator enabling the setting must be a Microsoft Entra ID Global Admin. Integration is enabled in the Defender for Cloud Apps console and does not require configuration from the Defender for Identity console. Defender for Cloud Apps enables organisations to access the Defender for Identity data within a single monitoring and management portal reducing the number of monitoring consoles required, however the following needs to be considered:

* **Alerts** – Defender for Cloud Apps can display Defender for Identity alerts within the Alerts queue. Defender for Cloud Apps also provides additional alert filtering not available within Defender for Identity.
* **Alerts management** – Management of alerts can be performed in both Defender for Cloud Apps and Defender for Identity portals. Closing alerts in one portal will not necessarily close the same alert in the other portal. It is recommended to choose which portal will be used to manage and remediate alerts to avoid duplicate effort.
* **SIEM notification** – both Defender for Identity and Defender for Cloud Apps can be configured to send alert notification to a SIEM. In the event this is configured duplicate SIEM notifications for the same alerts will be visible within SIEM under different alert ID's. To avoid this situation, it is recommended to choose which portal will be used to perform alert management and then only this portal is to be configured to send alert notification to a SIEM.
* **Activities** – Defender for Cloud Apps displays Defender for Identity alerts also in the activity log. Defender for Cloud Apps provides additional activity filtering not available within Defender for Identity.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                           | Design Decision | Justification                                          |
|------------------------------------------|-----------------|--------------------------------------------------------|
| Integration with Defender for Cloud Apps | Enabled         | To integrate data feeds and alerts from both products. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* [Identity Protection]({{<ref "design/platform/identity/protection">}})
* [Identity Monitoring]({{<ref "reporting-and-monitoring">}})

#### References

* [Microsoft Identity Security Overview](https://learn.microsoft.com/azure/security/fundamentals/identity-management-overview)
* [Azure security baseline for Azure Active Directory](https://learn.microsoft.com/security/benchmark/azure/baselines/aad-security-baseline)
* [Microsoft Defender for Identity](https://learn.microsoft.com/defender-for-identity/what-is)
* [Identity secure score in Azure Active Directory](https://learn.microsoft.com/entra/identity/monitoring-health/concept-identity-secure-score)
* [Azure Active Directory security operations guide](https://learn.microsoft.com/entra/architecture/security-operations-introduction)
* [Azure Active Directory identity management and access management for AWS](https://learn.microsoft.com/azure/architecture/reference-architectures/aws/aws-azure-ad-security)
