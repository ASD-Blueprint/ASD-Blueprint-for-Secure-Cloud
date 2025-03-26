---
title: "Identity security"
linkTitle: "Identity security"
weight: 30
description: "This section describes the design decisions associated with identity security for system(s) built using ASD's Blueprint for Secure Cloud."
---

### Identity security

Identity security underpins all Microsoft cloud-based service offerings, and forms the basis of the company's Zero Trust approach and [Secure Future Initiative](https://www.microsoft.com/en-au/trust-center/security/secure-future-initiative). Identity security is also an essential component of ASD's [*Modern Defensible Architecture* (MDA)](https://www.cyber.gov.au/resources-business-and-government/governance-and-user-education/modern-defensible-architecture/foundations-modern-defensible-architecture), which provides a strategic framework for the consistent application of security principles throughout the design, development and maintenance of systems.

Microsoft Entra ID and Microsoft Defender for Identity provide a broad range of technical capabilities to safeguard the identities used in an organisation: Entra ID manages identities and access controls, and Defender for Identity monitors and detects suspicious activity within Windows Server identity infrastructure, used together they help organisations protect access and identify potential security threats across both cloud and on-premises environments.

### Microsoft Entra ID

[Entra ID](https://learn.microsoft.com/en-au/entra/fundamentals/whatis) provides a number of features to manage identities and control access to organisation resources, and provides an effective means to meet a number of ASD’s [*Information Security Manual* (ISM)](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism) requirements.

#### Identity management

Centralised identity management reduces unnecessary authentication and enables simplified and holistic management of administrative configurations and security operations. Entra ID's identity management features include:

* **[User]({{<ref "design/platform/identity/users">}}) and [group]({{<ref "design/platform/identity/groups">}}) management** allowing organisations to create, store, and manage users, groups, and devices in a centralised location
* **[User provisioning and deprovisioning]({{<ref "design/platform/identity/provisioning">}})** automating the process of creating and removing accounts and access rights
* **Single sign-on (SSO)** enabling users to access multiple applications and resources using a single set of credentials
* **[Password management]({{<ref "design/platform/identity/authentication">}})** providing self-service password reset (SSPR), password policies and weak password checking
* **[Entitlement management]({{<ref "design/platform/identity/governance">}})** allowing organisations to manage and control access to resources based on business requirements and roles
* **[Lifecycle workflows]({{<ref "design/platform/identity/governance">}})** automating tasks related to user lifecycle, such as onboarding and offboarding

#### Access control

Controlling access to resources is crucial for maintaining security, data integrity and compliance. Entra ID's access control and security features include:

* **[Role-based access control (RBAC)]({{<ref "design/platform/identity/roles">}})** enabling administrators to assign roles and permissions to users based on their responsibilities
* **[Conditional Access]({{<ref "design/platform/identity/conditional-access">}})** allowing organisations to enforce security policies based on user, device, network and a number of other conditions
* **[Multi-factor authentication (MFA)]({{<ref "design/platform/identity/authentication">}})** requiring users to provide multiple forms of verification
* **[Privileged Identity Management (PIM)]({{<ref "design/platform/identity/governance">}})** providing fine-grained control and monitoring of access to critical resources
* **[Access reviews]({{<ref "design/platform/identity/governance">}})** allowing organisations to periodically review and validate user access to ensure it remains appropriate
* **Authentication protocols** supporting various authentication protocols like OpenID Connect, OAuth, and SAML
* **[Password-free authentication]({{<ref "design/platform/identity/authentication">}})** offering passwordless authentication options like windows Hello for Business, FIDO2 and Microsoft Authenticator

#### Other features

* **[Identity Protection]({{<ref "design/platform/identity/protection">}})** detecting risky user behaviour and sign-ins and makes access decisions
* **[Directory synchronisation]({{<ref "design/platform/identity/synchronisation">}})** allowing organisations to synchronise their on-premises Active Directory with Entra ID
* **[Reporting and analytics]({{<ref "design/platform/identity/reporting-and-monitoring">}})** providing insights into user activity and access patterns
* **Integration with other Microsoft cloud platforms** seamlessly integrating with other Microsoft services
* **[External identities]({{<ref "design/platform/identity/external-identities">}})** Providing a range of security and enabling services for B2C and B2B collaboration

### Defender for Identity

[Microsoft Defender for Identity (MDI)](https://learn.microsoft.com/en-au/defender-for-identity/what-is) uses signals from Windows Server identity infrastructure to proactively assess identity security posture and respond to identity security incidents. MDI is managed and operated from the Defender portal and is an integration component of Defender XDR, sharing its signals and correlating events with other Defender XDR services.

{{% alert title="Design decisions" color="warning" %}}

| Decision point            | Design decision                                          | Justification                                                          |
| ------------------------- | -------------------------------------------------------- | ---------------------------------------------------------------------- |
| Use Defender for Identity | Deploy Defender for Identity for all hybrid environments | Enable threat detection and response capabilities for identity servers |

{{% /alert %}}

#### MDI components

MDI consists of three main components:

##### 1. The Defender portal

The Defender portal is the primary operational interface for MDI and is used to create the MDI workspace, add or activate MDI sensors, and manage the limited configuration options available to configure sensors, tag devices, and manage alerting and notification rules.

##### 2. MDI sensors

MDI sensors are software agents installed directly on Domain Controllers (DC), Active Directory Federation Services (AD FS), Active Directory Certificate Services (AD CS), and Entra Connect servers. The sensors analyse network traffic and Windows events and send the parsed information to the MDI cloud service.

##### 3. The MDI cloud service

The MDI cloud service ingests sensor information and uses machine learning and threat intelligence from Microsoft's Intelligent Security Graph to detect and alert on suspicious activity via the Defender portal. The MDI cloud service runs on Azure infrastructure in select regions determined by the proximity of an organisation's Entra ID tenant at the time the MDI workspace was created.

{{% alert title="Design decisions" color="warning" %}}

| Decision point | Design decision | Justification                                                                                                                                                                |
| -------------- | --------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| MDI location   | Australia       | Help ensure data is under and jurisdiction of the Australian Government, help ensure confidentiality, and help minimise potential impacts from international service outages |

{{% /alert %}}

If the MDI cloud service had been previously deployed to an incorrect location, it is possible to have the workspace location changed by raising a support case. Changing the location is a destructive process but will not affect other XDR services. Further information can be found in [this](https://techcommunity.microsoft.com/blog/microsoftdefenderatpblog/microsoft-defender-data-can-now-be-hosted-locally-in-australia/3898337) Microsoft blog article.

#### Deployment considerations

Deploying MDI is a manageable process that requires a number of prerequisite configurations to be in place for success. In addition to the linked Microsoft Learn documentation herein, organisations may also find [this](https://setup.cloud.microsoft/defender/identity) Microsoft Setup Expert guide and [this](https://techcommunity.microsoft.com/blog/coreinfrastructureandsecurityblog/deploying-microsoft-defender-for-identity/4363501) Microsoft blog article useful.

The following should be considered before attempting to deploy MDI:

##### Server capacity

MDI sensors deployed on Domain Controllers (only) in busy environments can require additional server resources to operate effectively. A [capacity sizing tool](https://learn.microsoft.com/en-au/defender-for-identity/deploy/capacity-planning) exists to assist deployment planning and should be run on each Domain Controller prior to sensor deployment.

MDI sensors will [self-sacrifice performance](https://learn.microsoft.com/en-au/defender-for-identity/architecture#resource-limitations) and begin limiting analysis if there is ever resource contention on the server. Notifications for these events will appear in the Defender portal.

##### Network planning

Each sensor deployed requires internet connectivity to the MDI cloud service:

* [Forward proxy](https://learn.microsoft.com/en-au/defender-for-identity/deploy/configure-proxy) configurations can be used although SSL inspection and interception are not supported
* Use of ExpressRoute circuits with Microsoft Peering are supported

Internal network controls may also need to be modified to permit protocols used with [Network Name Resolution (NNR)](https://learn.microsoft.com/en-au/defender-for-identity/nnr-policy) ([among others](https://learn.microsoft.com/en-au/defender-for-identity/technical-faq#which-traffic-does-defender-for-identity-generate-in-the-network-from-domain-controllers--and-why)). NNR performs fingerprinting that greatly enriches sensor data by translating IP address information into computer names.

{{% alert title="Design decisions" color="warning" %}}

| Decision point | Design decision                           | Justification                |
| -------------- | ----------------------------------------- | ---------------------------- |
| Enable NNR     | Use all primary and secondary NNR methods | Enrich threat detection data |

{{% /alert %}}

Network issues can be [troubleshooted](#investigating-deployment-issues) by checking the sensor logs.

##### Server configuration

A number of pre and post-deployment tasks must be performed on servers to enable sensor installation and ensure they can operate to their full capabilities. The `Test-MdiReadiness.ps1` [script](https://github.com/microsoft/Microsoft-Defender-for-Identity/tree/main/Test-MdiReadiness) exists to assess compliance with several prerequisite server configurations. Guides also exist to address the following key configurations:

* [Event collection](https://learn.microsoft.com/en-au/defender-for-identity/deploy/event-collection-overview) - ensure the correct events are audited and included in Windows event logs
* [Directory Service accounts (DSA)](https://learn.microsoft.com/en-au/defender-for-identity/deploy/directory-service-accounts) - ensure servers can be queried for entities found in network, event and trace data
* [Security Account Manager Remote (SAM-R) protocol](https://learn.microsoft.com/en-au/defender-for-identity/deploy/remote-calls-sam) - ensure Directory Service accounts can query and identify remote accounts
* [Action account](https://learn.microsoft.com/en-au/defender-for-identity/deploy/manage-action-accounts) - ensure MDI can take remediation actions on potentially compromised accounts

{{% alert title="Design decisions" color="warning" %}}

| Decision point                    | Design decision                                                                             | Justification                                                                                |
| --------------------------------- | ------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
| Additional event collection       | Collect all events important to MDI<sup>1</sup>                                             | Enhance threat detection                                                                     |
| Use of Directory Service accounts | Use Group Managed Service Accounts (gMSA) with read-only permissions                        | Enhance threat detection while securing and simplifying credential management across servers |
| Use of SAM-R protocol             | Enable the Directory Service account to perform SAM-R queries<sup>2</sup>                   | Enable lateral movement detection                                                            |
| Use of action accounts            | Use the default LocalSystem account and do not reuse Directory Service accounts<sup>3</sup> | Enable response actions while applying the principle of least privilege                      |

1: Different server roles have different event collection requirements.

2: Enabling SAM-R can replace permissions used in the domain, enable in audit mode first.

3: Action accounts require write permissions on user accounts to perform actions.

{{% /alert %}}

##### Sensor types and deployment options

Two sensor types are available for installation: the [classic (versions 2.x) sensor](https://learn.microsoft.com/en-au/defender-for-identity/deploy/install-sensor), and the [new (versions 3.x) sensor](https://learn.microsoft.com/en-au/defender-for-identity/deploy/activate-capabilities).

While the new sensor can be installed on Windows Server 2019 and newer, it does not offer the same feature parity and protections as the classic sensor, in addition:

* The new sensor can currently only be installed on Domain Controllers running Windows Server 2019 and newer
* The new sensor is installed and updated via Microsoft Defender for Endpoint (MDE), and so requires the server to be onboarded to MDE and have appropriate [server licensing](https://learn.microsoft.com/en-au/defender-endpoint/minimum-requirements#licensing-requirements)

The classic sensor is not affected by the above constraints and can also be deployed as a *standalone* sensor.

Standalone sensors are classic sensors installed on separate servers with port mirroring from identity servers and [a number of additional configurations](https://learn.microsoft.com/en-au/defender-for-identity/deploy/prerequisites-standalone) (compared to an integrated deployment). Standalone sensor deployments are used in environments where integrated sensors are not able to be installed, and where more isolation is required due to network design, separation of services, or infrastructure capacity. Standalone sensor deployments, by virtue of the sensor's isolation from the identity servers they protect, are also not able to offer the same feature parity as integrated sensor deployments.

{{% alert title="Design decisions" color="warning" %}}

| Decision point            | Design decision                                                  | Justification                                                               |
| ------------------------- | ---------------------------------------------------------------- | --------------------------------------------------------------------------- |
| Sensor types/versions     | Install classic (versions 2.x) sensors                           | Maximise threat detection and response capabilities                         |
| Sensor deployment options | Deploy integrated senors (not standalone sensors) where possible | Maximise threat detection and response capabilities and minimise complexity |

{{% /alert %}}

##### Deployment scope

MDI sensors should be installed on [all Domain Controllers](https://learn.microsoft.com/en-au/defender-for-identity/deploy/install-sensor) in [all forests](https://learn.microsoft.com/en-au/defender-for-identity/deploy/multi-forest), even forests with no trust, and including read-only Domain Controllers; and on [all AD FS, AD CS, and Entra Connect servers](https://learn.microsoft.com/en-au/defender-for-identity/deploy/active-directory-federation-services), even in clustered configurations.

{{% alert title="Design decisions" color="warning" %}}

| Decision point          | Design decision                          | Justification                                       |
| ----------------------- | ---------------------------------------- | --------------------------------------------------- |
| Sensor deployment scope | Deploy sensors to all applicable servers | Maximise threat detection and response capabilities |

{{% /alert %}}

##### Licensing

MDI is enabled at the tenant level requiring all users that benefit from the service to have an [E5 or equivalent license assigned](https://learn.microsoft.com/en-au/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#microsoft-defender-for-identity).

##### Investigating deployment issues

Critical health issues with sensors will be displayed in the Defender portal.

Each sensor's [logs should also be checked](https://learn.microsoft.com/en-au/defender-for-identity/troubleshooting-using-logs) after deployment to ensure the completeness of its capabilities are enabled and not being blocked by misconfigurations or other issues.

The `New-MDIConfigurationReport` [PowerShell command](https://learn.microsoft.com/en-au/powershell/module/defenderforidentity/new-mdiconfigurationreport?view=defenderforidentity-latest) can be a helpful tool to validate System Access Control Lists (SACLs) and the presence of the MDI related Group Policy Objects (GPOs).

[Known issues](https://learn.microsoft.com/en-au/defender-for-identity/troubleshooting-known-issues) may also provide insights into deployment or operation anomalies.

#### Operational considerations

The following should be considered before using MDI:

##### Updating sensors

Sensors update automatically. It is possible to enabled delayed update on classic (versions 2.x) sensors in the Defender portal's Identities settings section. The delayed update setting will stage an update for 72 hours before deployment, which may be useful in mitigating the impacts of failed updates. New (versions 3.x) sensor updates can be similarly staged via MDE deployment rings.

##### Entity tagging

[Entity tagging](https://learn.microsoft.com/en-au/defender-for-identity/entity-tags) can enhance the sensitivity of threat detection and response capabilities for important users, groups and devices. Tags can be viewed and applied in the Defender portal's Identities settings section, with three types of tags supported:

1. The *Sensitive* tag for users, devices and groups - apply to high-value or sensitive assets like administrative or senior executive accounts and workstations
1. The *Honeytoken* tag for users and devices - apply to accounts created specifically to lure malicious actors
1. The *Exchange server* tag for devices - assign to Microsoft Exchange servers<sup>1</sup>

1: MDI will also automatically tag Exchange servers and a number of other sensitive users, groups and devices.

{{% alert title="Design decisions" color="warning" %}}

| Decision point | Design decision                                               | Justification                               |
| -------------- | ------------------------------------------------------------- | ------------------------------------------- |
| Entity tagging | Apply entity tags to all applicable users, groups and devices | Help protect high-value or sensitive assets |

{{% /alert %}}

##### Alerting

Some MDI alerts require learning periods to identity patterns of behaviour which can take up to 30-days to confirm. During the learning period it can be useful for MDI operators to enable the *test mode* in the Defender portal's Identities settings section. Test mode sets applicable alert thresholds to low, triggering alerts sooner and more frequently, enabling MDI users to experience alerts, observe identity behaviour, and gain familiarity with their environment. When test mode is disabled, thresholds return to their default setting of high. While keeping alert threshold set to high is recommended, thresholds can be changed if necessary.

##### Exclusions

MDI detection and response actions can be excluded for specific IP addresses, computers, domains and users, and can be excluded globally or for specific detection rules. Excluding actions can be useful to reduce false positives, focus on critical issues, or to avoid unnecessary investigations into legitimate activities. Situations where exclusions could be considered include, suppressing alerts triggered by a security scanning tool, or preventing a break glass or service account from being disabled.

### Related information

#### Security & Governance

* None identified

#### Design

* [Application and HR provisioning]({{<ref "design/platform/identity/protection">}})
* [Authentication]({{<ref "design/platform/identity/authentication">}})
* [Conditional Access]({{<ref "design/platform/identity/conditional-access">}})
* [Enterprise users]({{<ref "design/platform/identity/protection">}})
* [Entra ID Protection]({{<ref "design/platform/identity/protection">}})
* [External identities]({{<ref "design/platform/identity/external-identities">}})
* [Groups]({{<ref "design/platform/identity/groups">}})
* [Identity governance]({{<ref "design/platform/identity/governance">}})
* [Identity synchronisation]({{<ref "design/platform/identity/synchronisation">}})
* [Reporting and monitoring]({{<ref "design/platform/identity/reporting-and-monitoring">}})
* [Role-Based Access Control]({{<ref "design/platform/identity/protection">}})

#### Configuration

* None identified

#### References

* [Activate Microsoft Defender for Identity capabilities directly on a domain controller](https://learn.microsoft.com/en-au/defender-for-identity/deploy/activate-capabilities)
* [Configure endpoint proxy and internet connectivity settings](https://learn.microsoft.com/en-au/defender-for-identity/deploy/configure-proxy)
* [Configure sensors for AD FS, AD CS, and Microsoft Entra Connect](https://learn.microsoft.com/en-au/defender-for-identity/deploy/active-directory-federation-services)
* [Configure Microsoft Defender for Identity action accounts](https://learn.microsoft.com/en-au/defender-for-identity/deploy/manage-action-accounts)
* [Defender for Identity entity tags in Microsoft Defender XDR](https://learn.microsoft.com/en-au/defender-for-identity/entity-tags)
* [Deploying Microsoft Defender for Identity](https://techcommunity.microsoft.com/blog/coreinfrastructureandsecurityblog/deploying-microsoft-defender-for-identity/4363501)
* [Directory Service Accounts for Microsoft Defender for Identity](https://learn.microsoft.com/en-au/defender-for-identity/deploy/directory-service-accounts)
* [Event collection with Microsoft Defender for Identity](https://learn.microsoft.com/en-au/defender-for-identity/deploy/event-collection-overview)
* [Foundations for modern defensible architecture](https://www.cyber.gov.au/resources-business-and-government/governance-and-user-education/modern-defensible-architecture/foundations-modern-defensible-architecture)
* [Information Security Manual (ISM)](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism)
* [Install a Microsoft Defender for Identity sensor](https://learn.microsoft.com/en-au/defender-for-identity/deploy/install-sensor)
* [Licensing, Microsoft Defender for Identity](https://learn.microsoft.com/en-au/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#microsoft-defender-for-identity)
* [Microsoft Defender data can now be hosted locally in Australia](https://techcommunity.microsoft.com/blog/microsoftdefenderatpblog/microsoft-defender-data-can-now-be-hosted-locally-in-australia/3898337)
* [Microsoft Defender for Identity architecture](https://learn.microsoft.com/en-au/defender-for-identity/architecture)
* [Microsoft Defender for Identity frequently asked questions](https://learn.microsoft.com/en-au/defender-for-identity/technical-faq)
* [Microsoft Defender for Identity multi-forest support](https://learn.microsoft.com/en-au/defender-for-identity/deploy/multi-forest)
* [Microsoft Defender for Identity setup guide](https://setup.cloud.microsoft/defender/identity)
* [Microsoft Defender for Identity standalone sensor prerequisites](https://learn.microsoft.com/en-au/defender-for-identity/deploy/prerequisites-standalone)
* [Minimum requirements for Microsoft Defender for Endpoint](https://learn.microsoft.com/en-au/defender-endpoint/minimum-requirements#licensing-requirements)
* [Network Name Resolution in Microsoft Defender for Identity](https://learn.microsoft.com/en-au/defender-for-identity/nnr-policy)
* [Plan capacity for Microsoft Defender for Identity deployment](https://learn.microsoft.com/en-au/defender-for-identity/deploy/capacity-planning)
* [Secure Future Initiative](https://www.microsoft.com/en-au/trust-center/security/secure-future-initiative)
* [Troubleshooting Microsoft Defender for Identity known issues](https://learn.microsoft.com/en-au/defender-for-identity/troubleshooting-known-issues)
* [Troubleshooting Microsoft Defender for Identity sensor using the Defender for Identity logs](https://learn.microsoft.com/en-au/defender-for-identity/troubleshooting-using-logs)
* [What is Microsoft Defender for Identity?](https://learn.microsoft.com/en-au/defender-for-identity/what-is)
* [What is Microsoft Entra ID?](https://learn.microsoft.com/en-au/entra/fundamentals/whatis)
