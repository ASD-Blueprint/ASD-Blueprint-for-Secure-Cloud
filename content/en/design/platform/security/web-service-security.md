---
title: "Web Services"
weight: 20
description: "This section describes the design decisions associated with securing Web Services or cloud Software as a Services (SaaS) applications including Microsoft and other third party services for system(s) built using ASD's Blueprint for Secure Cloud."
---

[Microsoft Defender for Cloud Apps](https://docs.microsoft.com/defender-cloud-apps/what-is-defender-for-cloud-apps) is a part of the [Microsoft 365 Defender](https://docs.microsoft.com/microsoft-365/security/defender/microsoft-365-defender) suite of capabilities. Capabilities include a cloud access security broker (CASB) to help control access to and secure organisations cloud assets.

[Office 365 Cloud App Security](https://docs.microsoft.com/defender-cloud-apps/editions-cloud-app-security-o365) is a subset of Microsoft Defender for Cloud Apps that provides enhanced visibility and control for Office 365. Office 365 Cloud App Security has access to all of the features of Microsoft Defender for Cloud Apps, however only supports the Office 365 app connector. Office 365 Cloud App Security is accessed through the same portal as Microsoft Defender for Cloud Apps.

To manage the risks presented using cloud services, Microsoft has defined a [cloud app security framework](https://docs.microsoft.com/cloud-app-security/what-is-cloud-app-security#the-cloud-app-security-framework) which Microsoft Defender for Cloud Apps implements:

* **Discover and control the use of Shadow IT** – Shadow IT includes cloud services that are in use by users but not assessed and approved by security, including Software-as-a-Service (SaaS), Platform-as-a-Service (PaaS), and Infrastructure-as-a-Service (IaaS) offerings. To protect users and their data these services must be identified so that their risk can be determined and management controls can be implemented. Microsoft Defender for Cloud Apps enables administrators to assess an extensive library of apps against a wide range of risks.
* **Protect sensitive information anywhere in the cloud** – Once data is uploaded to a cloud service it is harder to control and manage compared to traditional on-premises storage. Microsoft Defender for Cloud Apps enables controls to be applied to data regardless of where it is stored, leveraging automated processes and inbuilt policies to both classify and protect information.
* **Protect against cyber threats and anomalies** – Due to the public nature of cloud apps they are exposed to potential malicious activity from external actors. Microsoft Defender for Cloud Apps monitors both user behaviour and app activity to identify anomalies and perform automatic remediation to ensure the confidentiality of data stored in the cloud. This includes identifying indications that a user's account credentials have been compromised.
* **Assess the compliance of cloud apps** – Performing security assessments of cloud apps and services is both complex and expensive. Microsoft Defender for Cloud Apps provides an overview of the industry and regulatory standards that each identified cloud app has been assessed against to simplify the approval process.

### Product architecture

The architecture of Microsoft Defender for Cloud Apps includes several integrated components to address each of the cloud app security framework requirements. The components include log collection and analysis capabilities to detect cloud apps, Application Programming Interface (API) connectors to interface with and control cloud app activity, and reserve proxy capability to enforce conditional access app control policies for authentication to cloud apps.

Access to these functions is via the [Defender for Cloud Apps Portal](https://learn.microsoft.com/defender-cloud-apps/get-started).

#### Data location

At the time of writing Defender for Cloud Apps is hosted from Azure data centres in the [United States (US), United Kingdom (UK) and Europe](https://learn.microsoft.com/defender-cloud-apps/cas-compliance-trust#data-location). An Defender for Cloud Apps tenant account is automatically created in the closest 'Geo'. For Azure tenants located within Australia, Defender for Cloud Apps will use the US Geo.

#### Data retention

The data retention period for information stored within Microsoft Defender for Cloud Apps varies depending on the specific type of data.  The [four data types](https://docs.microsoft.com/cloud-app-security/cas-compliance-trust#data-retention) and their respective periods are listed below:

* Activity log – 180 days
* Discovery data – 90 days
* Alerts – 180 days
* Governance log – 120 days

Note, all user activity and security alert information can be exported from Microsoft Defender for Cloud Apps in Comma-Separated Values (CSV) format if longer data retention is required.

#### Administration

Microsoft Defender for Cloud Apps leverages Entra ID to provide Role-Based Access Control (RBAC) for administration via the web portal. By default, only the Global Administrator and Security Administrator roles have full access to Microsoft Defender for Cloud Apps. Other standard Entra ID roles that have at least read-only access to the portal include Compliance Administrator, Compliance Data Administrator, Security Operator, Security Reader, and Global Reader.

In addition to the standard Entra ID roles, Microsoft Defender for Cloud Apps also has its own [service-specific roles that provide finer grained RBAC](https://docs.microsoft.com/cloud-app-security/manage-admins). If required, Global and Security Administrators can also grant access to specific users within the Microsoft Defender for Cloud Apps portal.

#### Cloud discovery

The Microsoft Defender for Cloud Apps Cloud Discovery design decisions can be found below. Microsoft Defender for Cloud Apps Cloud Discovery components are made up of Log Collectors, Microsoft Defender for Endpoint Integration, Microsoft Defender Advanced Threat Protection Integration, Cloud Discovery Enrichment, User Data Anonymisation, Custom Apps, and App Filters and Queries.

The cloud discovery component of Microsoft Defender for Cloud Apps enables the detection of cloud apps by analysing logs that are uploaded to it.

There are two types of cloud discovery reports that are generated by Microsoft Defender for Cloud Apps, depending on the specific log source:

1. **Snapshot reports** – generated by manually uploading a log export from a proxy or firewall device, provides on demand analysis at the time the log is uploaded.
2. **Continuous reports** – leverage native first and third-party integrations to provide ongoing data ingest and analysis without the need for user interaction.

Continuous reports can be generated a few ways such as configuring one or more of the following [automated log upload capabilities](https://docs.microsoft.com/cloud-app-security/set-up-cloud-discovery):

* **Log collector** – centralisation of logs from one or more proxy or firewall devices to a Docker-powered collector using Syslog and/or File Transfer Protocol (FTP).
* **Microsoft Defender Advanced Threat Protection (ATP) integration** – native integration with Defender ATP logs directly from onboarded endpoint devices running, regardless of whether they connect to cloud services via a managed gateway or directly via the internet.

Microsoft Defender for Cloud Apps supports a wide range of [popular proxy and firewall vendors and products](https://docs.microsoft.com/cloud-app-security/set-up-cloud-discovery#supported-firewalls-and-proxies-) for both snapshot and continuous reports (via log collectors). A custom parser can also be configured for unsupported devices enabling manual attribute mapping.

Once a cloud app has been discovered and its usage reviewed, it can be either sanctioned (approved) or unsanctioned (prohibited) via the Discovered Apps tab. Tagging a cloud app as unsanctioned does not block access directly but enables the generation of a block script that can be downloaded from Microsoft Defender for Cloud Apps and imported into a proxy or firewall appliance. When integrated with Microsoft Defender for Endpoint, app access enforcement can be enabled to block access to apps marked as unsanctioned.

{{% alert title="Note" color="info" %}}

If Microsoft Defender for Cloud Apps is integrated with Defender ATP, or other options then unsanctioned apps will be blocked automatically without the need to generate block scripts.

{{% /alert %}}

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                                 | Design Decision                                                                                                                     | Justification                                                                                                             |
|------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------|
| Cloud Discovery report type                    | Continuous reports                                                                                                                  | To provide continuous visibility while minimising management overhead                                                     |
| Log collector                                  | Will be deployed to collect logs from the organisation's existing proxy or firewalls and upload them to Microsoft Defender for Cloud Apps | To provide automatic upload of logs                                                                                       |
| Microsoft Defender ATP integration             | Enabled                                                                                                                             | To provide additional visibility from the organisation's endpoints that have been onboarded into the Defender ATP.                    |
| List of sanctioned and unsanctioned cloud apps | To be developed during build with the organisation's Cyber Intelligence team                                                              | Provides visibility within the organisation as to what cloud applications are in use and by which department within the organisation. |

{{% /alert %}}

#### Log collector

A log collector receives logs from supported firewall and proxy devices, providing processing and compression before uploading to Microsoft Defender for Cloud Apps. The compression typically results in outbound traffic from the log collectors being 10% the size of received traffic. Configuration information regarding automatic log uploads for continuous reports [can be found here.](https://docs.microsoft.com/cloud-app-security/discovery-docker)

A log collector can receive logs via File Transfer Protocol (FTP) - including FTP over Transport Layer Security (TLS) - and Syslog.

There are two supported deployment modes for log collectors:

1. **Docker container** – a Microsoft-provided Docker image for both Windows and Linux operating systems.
2. **Virtual appliance** – a Microsoft-provided Virtual Machine (VM) image for Hyper-V and VMware hypervisors. Note, the virtual appliance deployment mode is now deprecated.

The Docker container is supported on Windows 10 and 11, Windows Server version 1709 and later, Ubuntu versions 14.04, 16.04 and 18.04, Red Hat Enterprise Linux (RHEL), and CentOS 7.2 or later. The image can be deployed on VMs either hosted on-premises or within Azure, provided suitable network connectivity from the proxy/firewall devices is available.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                 | Design Decision                                                                                             | Justification                                                                                                                |
|--------------------------------|-------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------|
| Number of log collectors       | One                                                                                                         | An increase in the number of log collectors may be necessary if there is excessive traffic.                                  |
| Log collector deployment mode  | Docker container                                                                                            | Maximise support life as virtual appliance has been deprecated.                                                              |
| Log collector location         | Within the organisations Gateway zone                                                                       | Minimise number of firewall ports to be opened between the existing proxies and the log collector.                           |
| Log collector operating system | Organisations discretion of supported operating system for Microsoft Defender for Cloud Apps Log Collector. | Microsoft Defender for Cloud Apps supports Windows and Linux (Ubuntu, RHEL, CentOS) operating systems for the Log Collector. |

{{% /alert %}}

#### Microsoft Defender for Endpoint integration

Microsoft Defender for Endpoint integration enables cloud app and service traffic to be sent from supported Windows 10 (1709 or later) and Windows 11 devices to Microsoft Defender for Cloud Apps to provide additional data for continuous reporting.

This capability is enabled from within the Endpoints > Advanced Features settings within Microsoft 365 Defender portal.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                                       | Design Decision                           | Justification                                                                                 |
|------------------------------------------------------|-------------------------------------------|-----------------------------------------------------------------------------------------------|
| Microsoft Defender for Endpoint portal configuration | Microsoft Defender for Cloud Apps enabled | To enable Microsoft Defender for Endpoint integration with Microsoft Defender for Cloud Apps. |

{{% /alert %}}

#### Cloud discovery enrichment

To further enrich cloud discovery data Microsoft Defender for Cloud Apps can integrate with Entra ID to replace users identified with usernames.

This simplifies identification and investigation of user activity, as well as enabling correlation with API collected activities.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point  | Design Decision | Justification                                     |
|-----------------|-----------------|---------------------------------------------------|
| User enrichment | Enabled         | To identify users by Microsoft Entra ID username. |

{{% /alert %}}

#### User data anonymisation

To protect the privacy of users Microsoft Defender for Cloud Apps supports anonymisation of usernames when logs are uploaded. This is done by encrypting the usernames included in logs using Advanced Encryption Standard (AES) with a 128-bit key which is unique to each tenant.

Security analysts can resolve encrypted usernames on demand to assist in investigations, and each username conversion is recorded in the Governance log. In addition to usernames, Microsoft Defender for Cloud Apps can also anonymise Windows machine names.

{{% alert title="Design Decisions" color="warning" %}}
| Decision Point             | Design Decision | Justification                                                                                                                                                         |
|----------------------------|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Username anonymisation     | Not enabled     | Reduced investigation effort by not requiring security analysts to decrypt usernames on demand. If the organisation identifies a requirement this can be enabled.     |
| Machine name anonymisation | Not enabled     | Reduced investigation effort by not requiring security analysts to decrypt machine names on demand. If the organisation identifies a requirement this can be enabled. |

{{% /alert %}}

#### Custom apps

In addition to the extensive library of cloud apps that are natively available within Cloud Discovery, custom cloud apps, such as internally developed Line-of-Business (LOB) applications, can be added to provide visibility in their use.

This enables Cloud Discovery to identify these custom cloud apps from uploaded firewall and proxy logs and enables security analysts to filter on them specifically.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point | Design Decision      | Justification                                                                            |
|----------------|----------------------|------------------------------------------------------------------------------------------|
| Custom Apps    | Configured on demand | Custom apps will be added to Cloud Discovery as they are identified by the organisation. |

{{% /alert %}}

#### App filters and queries 

Microsoft Defender for Cloud Apps supports the creation and assignment of custom app tags from within the portal. Security analysts can create and apply custom tags to allow them to filter and query results specific to an area of interest. For example, a custom tag may be created for a business unit and that tag applied to only the applications that are approved for their use (i.e. Procurement). An analyst can then quickly filter based on this tag to review the use of these applications.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point | Design Decision      | Justification                                                                            |
|----------------|----------------------|------------------------------------------------------------------------------------------|
| Custom tags    | Configured on demand | Custom tags will be added to Cloud Discovery as they are identified by the organisation. |

{{% /alert %}}

#### App connectors

App connectors enable Microsoft Defender for Cloud Apps to see and reach inside connected cloud apps, providing both visibility into, and control of, the information stored by them. App connectors use application programming interfaces (APIs) provided by the cloud app vendors, with capabilities varying between third-party cloud app vendors.

To support multiple instances of a single cloud app, for example different teams owning and managing their own subscriptions, Microsoft Defender for Cloud Apps supports connecting multiple instances of the same cloud app. However, multi-instance support is only provided for API connected apps and is not available for cloud discovered and proxy connected apps. Additionally, multi-instance support is not available for Azure and Office 365.

The Microsoft Defender for Cloud Apps App Connector components are made up of Microsoft Defender for Cloud Apps - Azure and Microsoft Defender for Cloud Apps - Office 365.

Microsoft and third-parties are continually adding and updating the available app connectors. For up an up to date list of API app connectors refer to the [Microsoft guidance](https://learn.microsoft.com/defender-cloud-apps/enable-instant-visibility-protection-and-governance-actions-for-your-apps).

To connect to each cloud app via API Microsoft Defender for Cloud Apps will require an account within that app which has administrative privileges with full access to all objects stored within the app. The name of this specific privilege level is specific to each cloud app, e.g. Global Administrator for Office 365 and Super Administrator for Google Workspace. It is recommended that a dedicated account is used for integration with Microsoft Defender for Cloud Apps for each connected app.

Microsoft also provide a connector for [Microsoft 365 apps](https://learn.microsoft.com/defender-cloud-apps/connect-office-365), which supports a number of their services including:

* Office 365
* Dynamics 365
* Exchange Online
* OneDrive for Business
* SharePoint Online
* Power BI
* Teams

{{% alert title="Note" color="info" %}}

To leverage integration with Exchange Online and Power BI, the organisation must enable auditing within the Office Security and Compliance Centre.

{{% /alert %}}

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                               | Design Decision                                                                                                                                                                                                  | Justification                                                                                             |
|----------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------|
| Use of app connectors                        | Preferred for all supported cloud apps                                                                                                                                                                           | Provides the greatest available level of visibility and connectivity of the connected apps.                |
| API administrator accounts                   | Dedicated account for Microsoft Defender for Cloud Apps for each connected app that requires one                                                                                                                 | Microsoft best practice to manage connected apps.                                                          |
| List of connected apps                       | Azure<br>Office 365                                                                                                                                                                                              | All approved cloud apps that are supported will be connected to Microsoft Defender for Cloud Apps via API. |
| Microsoft Office 365 Connector Configuration | Selected Components:<br>Microsoft Entra ID Users and Groups<br>Microsoft Entra ID Management events<br>Microsoft Entra ID Sign-in events<br>Microsoft Entra ID Apps<br>Office 365 activities<br>Office 365 files | All components of Office 365 on which Cloud App Security can obtain information.                          |

{{% /alert %}}

#### Policies

Microsoft Defender for Cloud Apps supports a range of policy types to address the various risks associated with leveraging cloud apps, ranging from the detection of new and therefore unsanctioned cloud apps to identifying anomalous user activities that are outside the pattern of normal behaviour.

Up to seven policy types are available in Microsoft Defender for Cloud Apps depending on the data sources that have been enabled. These include:

* **Access policies** – providing real-time monitoring and control of user logins to identified cloud apps.
* **Activity policies** – leveraging integration with each cloud app's API, provides monitoring and control of activities within those applications (specific activities dependent on each vendor's API capabilities).
* **Anomaly detection policy** – detecting anomalous activities within connected cloud apps based on specific risk factors compared with a pre-determined baseline.
* **App discovery policy** – detecting new (unsanctioned) cloud apps and provides associated alerts.
* **Cloud Discovery anomaly detection policy** – reviewing the logs provided to Cloud Discovery specifically (as previously described) to detect anomalous behaviour.
* **File policy** – enabling scanning of connected cloud apps to detect and apply restrictions to specific sensitive files and content.
* **Session policy** – providing real-time monitoring and control of user activities within authenticated sessions to identified cloud apps.

{{% alert title="Note" color="info" %}}

Access and Sessions policies are covered in additional detail in the [Conditional Access App Control section]({{<ref "#conditional-access-app-control-protection">}}). 

{{% /alert %}}

In addition to the policy types listed above, Microsoft Defender for Cloud Apps provides pre-configured policy templates that can be used to streamline policy development and enforcement. Custom policies can also be created by specifying a trigger.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point  | Design Decision                                                                                           | Justification                                                                      |
|-----------------|-----------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| Use of policies | Use of policies is organisation-specific and would need further development with internal Cyber Security Teams. | Provides visibility within the organisation of suspicious behaviour and application use. |

{{% /alert %}}

#### Threat protection

The Microsoft Defender for Cloud Apps Threat Protection design decisions can be found below. Threat Protection components include Microsoft Defender for Identity (formerly Azure Advanced Threat Protection).

##### Microsoft Defender for Identity integration

Microsoft Defender for Identity provides User Entity Behavioural Analytics (UEBA) by monitoring authentication requests to on-premises Active Directory (AD) Domain Controllers (DCs).

Integrating Microsoft Defender for Identity with Microsoft Defender for Cloud Apps extends this capability to hybrid environments and presents all Microsoft Defender for Identity Suspicious Activity (SA) alerts to the Microsoft Defender for Cloud Apps dashboard, reducing the need for security analysts to monitor multiple consoles. To connect Microsoft Defender for Identity to Microsoft Defender for Cloud Apps the user enabling the setting must be an Entra ID Global Administrator. Integration is enabled in the Microsoft Defender for Cloud Apps console and does not require configuration from the Microsoft Defender for Identity console.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                                   | Design Decision | Justification                                                                                      |
|--------------------------------------------------|-----------------|----------------------------------------------------------------------------------------------------|
| Microsoft Defender for Identity data integration | Enabled         | Enables integration with security tools deployed within the organisations on-premises environment. |

{{% /alert %}}

##### App Governance

App Governance is an add-on capability for Microsoft Defender for Cloud Apps that provides a security and policy management capability for OAuth-enabled apps that access Microsoft 365 data via Microsoft's Graph APIs.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point | Design Decision | Justification                                                                                   |
|----------------|-----------------|-------------------------------------------------------------------------------------------------|
| App Governance | Not configured  | The Blueprint does not include a third-party OAuth-enabled apps that access Microsoft 365 data. |

{{% /alert %}}

{{% alert title="Note" color="info" %}}

If integrating with third-party OAuth-enabled apps, use of App Governance is recommended. Further information on App Governance see [App governance in Microsoft Defender for Cloud Apps](https://learn.microsoft.com/defender-cloud-apps/app-governance-manage-app-governance).

{{% /alert %}}

#### Information Protection

The Microsoft Defender for Cloud Apps Information Protection design decisions can be found below. Information Protection components include Admin Quarantine, Azure Information Protection, Azure Security and Files.

##### Admin quarantine

The admin quarantine is used to store files for administrative review that have been matched against an Microsoft Defender for Cloud Apps file policy. Examples include identifying and removing files from cloud apps that include sensitive content, such as financial and Personally Identifiable Information (PII) that should only be stored on-premises and not shared with external collaborators. 

{{% alert title="Note" color="info" %}}

Files stored in SharePoint Online or OneDrive for Business which are detected as malware are not quarantined by Microsoft Defender for Cloud Apps.

{{% /alert %}}

Before a file policy can be configured to use the admin quarantine, a folder location for it must first be identified. Only a single admin quarantine folder location is configured for each Microsoft Defender for Cloud Apps instance and is used by all file policies that leverage this capability. A user notification can also be configured to provide an explanation to users when they attempt to access a quarantined file.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                   | Design Decision                                                                                                                                                                | Justification                                                                                                                                 |
|----------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| Admin quarantine folder location | Configured                                                                                                                                                                     | Folder location is organisation specific and will be determined via organisational internal decision processes.                               |
| User notification                | Default text – `This file was quarantined because it might conflict with organisational security and compliance policies. Contact your IT administrator for more information.` | Notify user that file has been quarantined using default text. Organisation to determine whether default text meets IT security requirements. |

{{% /alert %}}

##### Microsoft Information Protection

Microsoft Information Protection (MIP) provides document and email classification labelling, and protections based on those labels, across hybrid environments. Microsoft Defender for Cloud Apps can be configured to scan for MIP classification labels and content inspection warnings when new files are detected in connected apps. Additionally, Microsoft Defender for Cloud Apps can be configured to only scan labels and warnings originating from its tenant, therefore ignoring labels from external tenants.

To enable Microsoft Defender for Cloud Apps to inspect the content of files that have been protected by MIP it must be granted that permission in Entra ID. This is done via a guided activity initiated from the Microsoft Defender for Cloud Apps portal.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                                                                                 | Design Decision | Justification                                                                                                                                                           |
|------------------------------------------------------------------------------------------------|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Automatically scan new files for MIP classification labels and content inspection warnings     | Enabled         | Microsoft Defender for Cloud Apps is enabled to scan new files for MIP classifications as the Blueprint will leverage Information Protection classification.            |
| Only scan files for MIP classification labels and content inspection warnings from this tenant | Enabled         | Microsoft Defender for Cloud Apps is enabled to scan files for MIP classification from the tenant as the Blueprint will leverage Information Protection classification. |
| Inspect protected files                                                                        | Enabled         | Microsoft Defender for Cloud Apps is enabled to inspect protected files as the Blueprint will leverage Information Protection classification.                           |

{{% /alert %}}

##### Files

File policies can be used to manage documents stored within cloud apps. To enable this capability Microsoft Defender for Cloud Apps must be allowed to monitor files stored in these apps.

There are no design considerations.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point  | Design Decision | Justification                                                                            |
|-----------------|-----------------|------------------------------------------------------------------------------------------|
| File monitoring | Enabled         | Enable Microsoft Defender for Cloud Apps to monitor files stored in connected cloud apps. |

{{% /alert %}}

##### Conditional Access App Control Protection

Conditional Access App Control components include Default Behaviour, User Monitoring, Device Identification and App Onboarding/Maintenance.

The Conditional Access App Control capability of Microsoft Defender for Cloud Apps leverages Entra ID Conditional Access to enforce actions (such as blocking access) based on specific conditions (such as device compliance) by using a reverse proxy architecture. Users' cloud app sessions, including authentication, are proxied by Microsoft Defender for Cloud Apps instead of going directly to the app. Microsoft Defender for Cloud Apps does this by replacing the app's Uniform Resource Locators (URLs) and cookies, therefore not requiring an agent to be installed on the endpoints.

Examples of the Conditional Access App Control policies that can be configured to monitor and control user app access and sessions in real time are listed below:

* **Prevent data exfiltration** – block copy and cut clipboard actions, printing and downloading of sensitive information and documents.
* **Protect on download** – allows sensitive documents to be downloaded by leveraging AIP applies a classification label and protection to it.
* **Prevent upload of unlabelled files** – blocks documents from being uploaded until a user applies an AIP label to them based on the sensitivity of the information they contain.
* **Monitor user sessions for compliance** – identify risky users based on their behaviour during a session.
* **Block access** – based on specific risk factors can prevent users and/or devices from accessing specific resources across one or all connected apps.
* **Block custom activities** – application-specific events can be blocked if they increase the risk of data leakage or exfiltration.

Note, to use Conditional Access App Control an Entra ID Premium P1 license is required in addition to the Microsoft Defender for Cloud Apps license.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point           | Design Decision                                                                                                | Justification                                                          |
|--------------------------|----------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------|
| Access control policies  | Use of policies is organisation-specific and would need further development with internal cyber security team. | Provides a greater security posture for the organisation applications. |
| Session control policies | Use of policies is organisation-specific and would need further development with internal cyber security team. | Provides a greater security posture for users within the organisation. |

{{% /alert %}}

##### Default Behaviour

In the event of a system outage or downtime Microsoft Defender for Cloud Apps can be configured with a Default Behaviour.

This is a deployment wide setting which can be configured to either prevent users from accessing an app if normal policy cannot be enforced, or to provide unrestricted access if this occurs.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                  | Design Decision | Justification                                                                        |
|---------------------------------|-----------------|--------------------------------------------------------------------------------------|
| Default behaviour configuration | Allow access    | To prevent interruption to business functions in the event of an outage or downtime. |

{{% /alert %}}

##### User monitoring

When using Conditional Access App Control to manage access and sessions, Microsoft Defender for Cloud Apps provides the option to notify users that their activities are being monitored.

If user notifications are enabled administrators can either use a Microsoft-provided default message or provide their own, which will include their organisational logo (if it has been uploaded to Microsoft Defender for Cloud Apps).

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                | Design Decision | Justification                                                                                                                                                                                         |
|-------------------------------|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| User monitoring notifications | Not enabled     | There is no default requirement to notify users. Organisations can enable User Monitoring as appropriate to meet operational requirements without impacting the cyber security posture of the environment. |

{{% /alert %}}

##### Device identification

Microsoft Defender for Cloud Apps and Conditional Access App Control can be utilised to identify managed devices within the organisation.

Microsoft Defender for Cloud Apps and Conditional Access App Control supports three methods to identified managed devices:

1. Microsoft Intra (specifically devices that are identified as compliant).
2. Hybrid Entra ID joined devices.
3. The presence of client certificates that are part of a trusted chain.

A combination of multiple of these methods can be configured to identify devices within a diverse environment. Devices that are present within Microsoft Intune, as well as those that are registered to Microsoft Entra ID (hybrid joined), are automatically synchronised to Microsoft Defender for Cloud Apps. To use client certificates to identify devices either a trusted root or intermediate certificate must be uploaded to Microsoft Defender for Cloud Apps in Privacy-Enhanced Mail (PEM) format.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                                       | Design Decision | Justification                                                                                                                                                        |
|------------------------------------------------------|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Use of client certificates for device identification | Not configured  | There is no requirement to use client certificates has been identified as the organisation will leverage Intune for compliant and Hybrid Microsoft Entra ID devices. |


{{% /alert %}}

##### App onboarding / maintenance

Identified specific users can enable currently unsupported cloud apps to be onboarded to Conditional Access App Control for development and testing purposes.

These users can be identified by either email or User Principal Name (UPN) and must be configured within the Microsoft Defender for Cloud Apps portal. Once an app is onboarded by a specified user a feedback bar will be presented as part of the application to enable developers and testers to provide feedback directly back to Microsoft's Cloud App Security team.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point | Design Decision                                                             | Justification                                                                                             |
|----------------|-----------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------|
| Included users | To be developed during build with the organisation Cyber Intelligence team. | Organisation to determine if a requirement for users and non-supported apps exist within the environment. |

{{% /alert %}}

#### Security extensions

To integrate with other security solutions, for example Security Information and Event Management (SIEM) products, Microsoft Defender for Cloud Apps supports a range of security extensions. These include:

* **API tokens** – to provide access to Microsoft Defender for Cloud Apps Representational State Transfer (REST) API endpoints for read and update operations.
* **SIEM agents** – to centralise alerts and activities from Microsoft Defender for Cloud Apps to a SIEM.
* **External Data Loss Prevention (DLP)** – to connect Microsoft Defender for Cloud Apps to external DLP solutions.
* **Playbooks** – to leverage Microsoft Flow playbooks for automation.

Each of these security extension capabilities is described below.

##### API tokens

By creating API tokens within the Microsoft Defender for Cloud Apps portal external applications can connect to the REST API endpoints and perform a range of read and update operations.

A common use-case for this is to generate block scripts from a third-party network appliance, or to resolve alerts that have been investigated through a connected SIEM product.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point | Design Decision | Justification                                                                                                                                                                                                     |
|----------------|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| API tokens     | Not configured  | Organisations can determine and identify whether use cases exist for the creation of API tokens in their specific environments however for a base implementation of the Blueprint, API tokens are not required. |

{{% /alert %}}

##### SIEM agents

To enable Microsoft Defender for Cloud Apps alerts and activities to be integrated into existing security analyst workflows that have been developed in SIEM products Microsoft Defender for Cloud Apps provides SIEM agents.

The Microsoft Defender for Cloud Apps SIEM agent runs on a server – either on-premises or as IaaS – and acts as a forwarder between Microsoft Defender for Cloud Apps and the SIEM. The SIEM agent makes an outgoing request to Microsoft Defender for Cloud Apps over an encrypted Hypertext Transfer Protocol Secure (HTTPS) channel using port 443, leveraging the Microsoft Defender for Cloud Apps RESTful APIs. Once the data has been downloaded it then forwards it to the SIEM as syslog messages on a configurable Transmission Control Protocol (TCP) or User Datagram Protocol (UDP) port.  


{{% alert title="Note" color="info" %}}

If both Microsoft Defender for Identity and Microsoft Defender for Cloud Apps are configured to send alerts to the same SIEM duplicate alerts will be received with different alert IDs. It is recommended to only send these alerts from one source.

{{% /alert %}}

The SIEM agent currently supports [Micro Focus ArcSight and generic Common Event Format (CEF)](https://docs.microsoft.com/cloud-app-security/siem) only. Supported time formats include Request for Comment (RFC) 5424, 3164 and 3164 with year. The agent can be installed on either Windows or Linux operating systems and requires Java 8.

In addition to the SIEM agent, Microsoft Defender for Cloud Apps supports native integration with Azure Sentinel and the Microsoft Security Graph API. Azure Sentinel is Microsoft's cloud native SIEM offering, while the Security Graph API provides additional partner integration solutions, e.g. the Microsoft Graph Security API Add-On for Splunk.

###### Cloud native deployments

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                 | Design Decision | Justification                                                                                    |
|--------------------------------|-----------------|--------------------------------------------------------------------------------------------------|
| Microsoft Sentinel integration | Configured      | To support integration between Defender for Cloud Apps and Microsoft cloud native SIEM solution. |
| Microsoft Sentinel license     | Yes             | To enable Microsoft Sentinel integration a Microsoft Sentinel license is required.               |

{{% /alert %}}

###### Hybrid deployments

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                           | Design Decision                                                                                  | Justification                                                                                         |
|------------------------------------------|--------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------|
| Use of SIEM agent                        | Yes                                                                                              | To support integration between Defender for Cloud Apps and the organisation's existing SIEM solution. |
| SIEM agent install location              | Organisation's discretion of supported operating system for Defender for Cloud Apps SIEM agents. | Defender for Cloud Apps supports Windows and Linux operating systems for the SIEM agents.             |
| Microsoft Security Graph API integration | Not configured                                                                                   | Organisation to determine whether requirement exists based on existing SIEM solution.                 |

{{% /alert %}}

##### External Data Loss Prevention (DLP)

In addition to integration with third-party SIEMs, Microsoft Defender for Cloud Apps also supports integration with third-party DLP providers, enabling existing investments in on-premises solutions to be extended into the cloud.

Integration between external DLP solution and Microsoft Defender for Cloud Apps is performed via the Internet Content Adaptation Protocol (ICAP) protocol which is tunnelled over TLS. This enables Microsoft Defender for Cloud Apps to use the external DLP engine to scan content identified in connected cloud apps for policy violations.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point | Design Decision | Justification                                                                                                                                                                                   |
|----------------|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| External DLP   | Not configured  | Not configured by default, however, organisations can determine whether a DLP solution will be leveraged and if there is a requirement to be integrated with Microsoft Defender for Cloud Apps. |

{{% /alert %}}

##### Playbooks

MMicrosoft Defender for Cloud Apps supports playbook-based automation by integrating with Microsoft Flow (also known as Power Automate).

Specific Microsoft Defender for Cloud Apps alerts can be configured as playbook triggers, automating pre-approved responses and minimising security analyst intervention. Playbooks are created in Microsoft Flow and made available to Microsoft Defender for Cloud Apps via the Cloud App Security connector. The use of playbooks requires a Microsoft Flow plan.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point | Design Decision | Justification                                                                                                                                                                                                                              |
|----------------|-----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Playbooks      | Not configured  | Not configured by default, however, organisations can determine whether Playbooks will be leveraged to assist in automating pre-approved and consistent responses reducing analyst intervention. Use of Playbooks is subject to licensing. |

{{% /alert %}}

#### Microsoft Defender for Cloud Apps - Firewall

Microsoft Defender for Cloud Apps Security is a cloud-based service that helps keep the organisation secure from threats by collecting data from a cloud-based tenant and hybrid on-premises infrastructure and analysing this data. To achieve this firewall rules and proxy allow lists needs to be in place to allow communication between all the components.

Firewall rules and proxy allow lists will be implemented as part of the Microsoft Defender for Cloud Apps security solution. 

Further details on firewall configuration and proxy allow lists for the solution can be found in the Network Configuration.

### Related information

#### Security & Governance

* None identified

#### Design

* [Conditional Access App Control section]({{<ref "#conditional-access-app-control-protection">}})

#### Configuration

* [Device Management]({{<ref "configuration/defender/settings/endpoints/device-management.md">}})

#### References

* [Microsoft Defender for Cloud Apps Overview](https://docs.microsoft.com/defender-cloud-apps/what-is-defender-for-cloud-apps)