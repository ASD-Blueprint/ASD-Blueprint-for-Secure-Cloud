---
title: Entra ID Tenant Settings
weight: 5
description: "This section describes the design decisions associated with a tenant's Entra ID base settings for system(s) built using ASD's Blueprint for Secure Cloud."
---

In terms of Microsoft 365, a tenant is a container for the set of services assigned to an organisation. Within the core of a tenant sits a dedicated instance of Microsoft Entra. The following sections provide details on the design decisions for base tenant settings.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point            | Design Decision                     | Justification                                                                                                                                                                                                                     |
| ------------------------- | ----------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Region and Location       | Australia / Australian Data Centres | All data should reside in Australian data centres to meet security requirements                                                                                                                                                   |
| Contacts                  | Configured                          | Out of band contact details in case of service lockout                                                                                                                                                                            |
| Access to Azure           | No                                  | A custom group should be set as the Tenant Root Owner. Individual accounts should not access the tenant root except in exceptional cases (tenant lockout). This setting should be closely monitored and audited - see notes below |
| Security Defaults         | Disabled                            | Settings (MFA, Conditional Access, etc.) are managed at a more granular level than Security Defaults provides.                                                                                                                    |

{{% /alert %}}

### User default permissions (user settings)

To reduce the risk of shadow IT and rogue applications, the Blueprint recommends restricting the ability to create Microsoft Entra ID entities such as applications and security groups. This capability is limited to administrators.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                                               | Design Decision     | Justification                                                                                                                                                                                         |
| ------------------------------------------------------------ | ------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Application Registrations                                    | via Administrator   | It is recommended organisations develops a service request process and/or limited developers group to enable creation of new applications. This will enable limiting of access to Microsoft Entra ID |
| Restrict access to the Microsoft Entra administrative portal | Enabled             | Application Administrators require access to the portal. This is provided at an app level through the Application Administrator role.                                                                 |
| Allow LinkedIn connections                                   | Disabled            | Organisations should disable integration and ability to share information with third-parties                                                                                                          |
| Security Groups                                              | Users cannot create | Enables for centrally controlled group creation                                                                                                                                                       |
| Microsoft 365 Groups                                         | Users can create    | Promotes collaboration opportunities within organisations                                                                                                                                           |

{{% /alert %}}

### Corporate branding

Microsoft 365 authentication screens provide the ability to identify the organisation to which the user is authenticating. Corporate branding enables a consistent sign-in experience for users where the branding is applied.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point   | Design Decision | Justification                                                                                                                                                                                                                             |
| ---------------- | --------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Corporate Branding | Configured      | Organisation specific logos will be required to provide a corporate look and feel. The Organisation specific logon banner text is provided under the "Sign-in page text" area of company branding to remind users of their security responsibilities. |

{{% /alert %}}

### Licences

The Blueprint is built using Microsoft 365 E5 licences, which includes Microsoft Entra ID P2. The E5 license provides enhanced features such as self-service, enhanced monitoring, security reporting, and just in time access, which are required to meet maturity level 3 under ASD's [Essential Eight Maturity Model](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/essential-eight/essential-eight-maturity-model). Additional feature comparisons and mapping of Essential Eight to Microsoft 365 features is available at [https://m365maps.com](https://m365maps.com/).

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point | Design Decision                          | Justification                                                                                                                                                                                                   |
| -------------- | ---------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Licences       | Microsoft Entra ID P2 / Microsoft 365 E5 | P2 is required for advanced security features such as Privileged Identity Management and Access Reviews.<br>E5 is required for advanced security features such as Threat Protection and Information Management. |
| Licence Groups | Configured                               | Configured to assign Microsoft 365 licences to user groups. Ensures consistent configuration.                                                                                                                   |

{{% /alert %}}

### Mobile device and application management

By design the configuration and security policies of user endpoints, as well as the applications deployed to these endpoints, is centrally controlled.

#### Cloud-native deployment

For cloud-native deployments, all devices are enrolled and joined to Microsoft Entra ID. Microsoft Intune is used for mobile device management (MDM) / mobile application management (MAM). Devices are deployed using [Windows Autopilot user-driven mode for Entra ID join](https://learn.microsoft.com/autopilot/user-driven#user-driven-mode-for-azure-ad-join) which involves the following process:

1. Joins device to organisation
2. Enrol in Intune
3. Configure device as defined by the Blueprint/organisation

As part of step two, a [Automatic enrolment](https://docs.microsoft.com/mem/intune/enrollment/windows-enroll#enable-windows-10-automatic-enrollment) feature registers the device and joins Microsoft Entra ID. Once registered, the device is managed with Intune.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point          | Design Decision                                | Justification                                                 |
| ----------------------- | ---------------------------------------------- | ------------------------------------------------------------- |
| Automatic MDM Enrolment | Intune - Configured to all Users (requires P2) | Simplifies Microsoft Entra ID Join / Device Enrolment process |

{{% /alert %}}

#### Hybrid deployments

For hybrid deployments, organisations will need to determine the most appropriate solution for their devices. In order to leverage other features within the Blueprint, it is recommended that organisations, at a minimum, enable co-management for all devices. See [Microsoft's Co-management documentation](https://learn.microsoft.com/mem/configmgr/comanage/). Devices are deployed using [Windows Autopilot user-driven mode for hybrid Entra ID join](https://learn.microsoft.com/autopilot/user-driven#user-driven-mode-for-hybrid-azure-ad-join).

### Custom domain

When a new Microsoft Entra ID tenant is created it is automatically assigned a default Microsoft domain name (`onmicrosoft.com`). This domain is internet routable and aligns to `<TENANTNAME>.onmicrosoft.com`. A second internet routable domain name is also provisioned if Exchange Online is activated within the tenant. The second internet routable domain aligns to `<TENANTNAME>.mail.onmicrosoft.com`. Additional custom domains can also be registered to the tenant to be used by Exchange Online and other Azure services. These domains can be used for receiving email and/or be utilised as the User Principal Name (UPN).

The Blueprint recommends organisations register a new or existing domain (e.g. `<ORGANISATION.GOV.AU>`) and use it as the default for User Principal Names and email addresses.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                    | Design Decision                      | Justification                                                                                                      |
| --------------------------------- | ------------------------------------ | ------------------------------------------------------------------------------------------------------------------ |
| Registration of other Domains     | Configured - `<ORGANISATION.GOV.AU>` | Registered to tenant and used for User Principal Names and email.                                                  |
| Microsoft Entra ID Primary domain | `<TENANTNAME>.onmicrosoft.com`       | Required to ensure that Azure created resources and emergency accounts contain the organisations's primary domain. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* [Microsoft Entra ID Overview](https://learn.microsoft.com/entra/fundamentals/whatis)
* [Elevate Access for a Global Administrator](https://docs.microsoft.com/azure/role-based-access-control/elevate-access-global-admin)
* [Users Default Permissions to Azure Active Directory](https://learn.microsoft.com/entra/fundamentals/users-default-permissions)
* [How Applications are Added](https://learn.microsoft.com/entra/identity-platform/how-applications-are-added)
* [Customise Branding](https://learn.microsoft.com/entra/fundamentals/how-to-customize-branding)
* [Licence Assignment](https://learn.microsoft.com/entra/fundamentals/license-users-groups)
