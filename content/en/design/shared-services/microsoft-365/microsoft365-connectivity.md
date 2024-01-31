---
title: Microsoft 365 Connectivity
weight: 12
description: "This section describes the design decisions associated with on-premises endpoint connectivity."
---

Microsoft 365 is a publicly facing SaaS offering and firewall ports are required to be opened to enable communication between infrastructure and desktops and Microsoft 365. These ports configurations are updated frequently and are available online from [Microsoft](https://docs.microsoft.com/office365/enterprise/urls-and-ip-address-ranges).

It is important to note the traffic between the clients and the Microsoft 365 offering is TLS 1.2 encrypted.

Configuration will occur on the proxy and external gateway of the organisation as required.

### Mail flow and gateway

Mail flow is the path taken by an email from the sender to a receiver. A Mail Gateway acts as the central egress and ingress point for mail traffic into organisations.

For organisations implementing a PROTECTED environment, organisations are required to use a separate mail gateway to interface with [GovLINK](https://www.finance.gov.au/government/whole-government-information-communications-technology-services/govlink) for the following functions:

* Encryption
* Message rules
* Header modification

This will achieve the closest alignment to whole-of-government policy for [Secure Internet Gateways](https://www.cyber.gov.au/acsc/view-all-content/programs/irap/asd-certified-gateways) and with the guidance in ASD's [*Information Security Manual*](https://www.cyber.gov.au/acsc/view-all-content/guidance/email-gateways-and-servers) and the [Protective Security Policy Framework](https://www.protectivesecurity.gov.au/sites/default/files/2019-11/policy-8-annex-g-email-protective-marking-standard.pdf).

GovLINK enables secure communication between Commonwealth entities across public infrastructure and is required for PROTECTED mail to be securely transferred between government organisations.

A Transport Layer Security (TLS) solution for GovLINK is available enabling a direct interface between Microsoft 365 Exchange Online and GovLINK. In addition to Exchange Online, organisations wishing to deploy this solution will also require Microsoft Defender, Mail Transfer Agent-Strict Transport Security (MTA-STS), and TLS.

More information on GovLINK is available on [the Department of Finance website](https://www.finance.gov.au/government/whole-government-information-communications-technology-services/govlink). 

Enquires on the GovLINK TLS solution can also be directed to [govlinkenquiries@finance.gov.au](mailto:govlinkenquiries@finance.gov.au) or via the above website.

{{% alert title="Design Decisions" color="warning" %}}

| Implementation Type | Mail Gateway                     | Mail Connectors         | Mail Ingress | Mail Egress  | Sensitivity Labels |
| ------------------- | -------------------------------- | ----------------------- | ------------ | ------------ | ------------------ |
| Cloud               | Exchange Online Protection (EOP) | Not required            | EOP          | EOP          | Required           |
| Hybrid              | Existing mail gateway            | EOL &lt;-> Mail gateway | Mail gateway | Mail gateway | Required           |

{{% /alert %}}

### Optimisation

Microsoft 365 is a globally distributed service. The user experience with Microsoft 365 involves connectivity through highly distributed service connection points that are scaled over many Microsoft locations worldwide. This section outlines two sets of design decisions, representing advice to achieve the highest level of maturity and adherence to existing Whole of Government policies and advice to maximise optimisation outside and user experience. The below information is to inform organisations, including on how best to maximise optimisation and user experience, however consideration should be given for the risk implications of implementing in such a way. While this approach of optimisation represents the current [best practice published by Microsoft](https://docs.microsoft.com/office365/enterprise/network-planning-and-performance) it is inconsistent with the previously referenced guidance in ASD's ISM and the PSPF relating to Secure Internet Gateways. We have provided configuration controls for both scenarios below.

To minimise latency, a customer network can route user requests to the closest Microsoft 365 service entry point, rather than connecting to Microsoft 365 through an egress point in a central location or region.

The following achieves optimal Microsoft 365 connectivity and performance:

*   Local DNS resolution and Internet egress - Provision local DNS servers in each location and ensure that Microsoft 365 connections egress to the internet as close as possible to the user's location. This configuration minimises latency and improves connectivity to the closest Microsoft 365 entry point.
*   Add regional egress points - If the organisation's network has multiple locations but only one egress point, add regional egress points to enable users to connect to the closest Microsoft 365 entry point. This configuration minimises latency and improves connectivity to the closest Microsoft 365 entry point.
*   Bypass proxies and inspection devices - Configure browsers to send Microsoft 365 traffic directly to egress points and bypass proxies. Configure edge routers and firewalls to permit Microsoft 365 traffic without inspection. This configuration minimises latency and reduces the load on network devices.
*   Enable split tunnelling connection for VPN users - If a VPN solution is required Always on VPN should be integrated into the organisation infrastructure. For VPN users, enable Microsoft 365 connections to connect directly from the user's network rather than over the VPN tunnel by implementing split tunnelling. This configuration minimises latency and improves connectivity to the closest Microsoft 365 entry point.

**Microsoft 365 Connectivity Optimisation Design Decisions for an increased security posture.**

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                                   | Design Decision                   | Justification                                                                                                                       |
| ------------------------------------------------ | --------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| Workstation Connectivity                         | VPN with central internet gateway | Provides the highest level of auditing and monitoring.                                                                              |
| Local DNS resolution and Internet egress         | Not Configured                    | All traffic will egress centrally through an internet gateway.                                                                      |
| Add regional egress points                       | Not Configured                    | All traffic will egress centrally through an internet gateway.                                                                      |
| Bypass proxies and inspection devices            | Configured                        | Proxies and internet gateway will be configured following Microsoft best practice guidance to enable services to function correctly. |
| Enable split tunnelling connection for VPN users | Not Configured                    | All traffic will always traverse the VPN and egress through the internet gateway.                                                   |

{{% /alert %}}

**Microsoft 365 Connectivity Optimisation Design Decisions for an enhanced User Experience.**

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                                   | Design Decision                   | Justification                                                                                                                                                                                                      |
| ------------------------------------------------ | --------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Workstation Connectivity                         | Direct connection to the internet | Provides the best performance for users.                                                                                                                                                                           |
| Local DNS resolution and Internet egress         | Configured if required            | DNS will be resolved to the gateway of their internet device.                                                                                                                                                      |
| Add regional egress points                       | Configured if required            | Regional Egress Points are not configured in this solution due to the workstations being directly connected to the internet.                                                                                       |
| Bypass proxies and inspection devices            | Configured                        | Proxies are not configured in this solution due to the workstations being directly connected to the internet.                                                                                                      |
| Enable split tunnelling connection for VPN users | Configured                        | Split tunnelling is configured in this solution to enable workstations to directly connect to Microsoft services. If a VPN solution is required Always on VPN should be integrated into the organisation infrastructure. |

{{% /alert %}}

### Exchange hybrid

This section is only relevant for organisations implementing a hybrid solution that leverages an on-premises Exchange Server(s).

Exchange Online can be used standalone (cloud only) or integrated with an on-premises Exchange Server(s) and Active Directory Domain Services, extending the organisation's messaging farm in a hybrid configuration.

A Hybrid configuration provides administrators with added flexibility to transition users to the Cloud without isolating them from the on-premises resources. A Hybrid configuration can also assist with transport routing for compliance reasons (e.g. GovLINK) when "centralized mail transport" is enabled. The [Edge Transport](https://docs.microsoft.com/exchange/edge-transport-servers) service may be deployed in scenarios where the organisation does not wish to expose Hybrid mail servers directly to Exchange Online Protection.

organisations wishing to synchronise their existing on-premises Active Directory Domain Services for identity (hybrid identity) must maintain an on-premises Exchange server for recipient management purposes, this is because most of the user attributes cannot be managed from Exchange online due to directory synchronisation rules, for more information see [decommissioning on-premises Exchange servers](https://docs.microsoft.com/exchange/decommission-on-premises-exchange).

Establishing hybrid deployments requires an Exchange hybrid server that is supported with existing on-premises Exchange Server. Microsoft recommends the deployment of the newest Exchange Hybrid server for the environment to ensure the best compatibility with Exchange Online.

Exchange 2010 has reached [end of support](https://docs.microsoft.com/microsoft-365/enterprise/exchange-2010-end-of-support?view=o365-worldwide), organisations that wish to use retain a Hybrid configuration after the Hybrid migration method should migrate those Exchange server roles to a supported version of Exchange. Microsoft also recommend that organisations still on Exchange 2010 that have not started or completed their Hybrid migration, upgrade from 2010 to 2016 before commencing the hybrid configuration.

Exchange Hybrid Server Supported Configurations.

| On-premises environment | Exchange 2019 Hybrid Deployment | Exchange 2016 Hybrid Deployment | Exchange 2013 Hybrid Deployment | Exchange 2010 Hybrid Deployment |
| ----------------------- | ------------------------------- | ------------------------------- | ------------------------------- | ------------------------------- |
| Exchange 2019           | Supported                       | Not supported                   | Not supported                   | Not supported                   |
| Exchange 2016           | Supported                       | Supported                       | Not supported                   | Not supported                   |
| Exchange 2013           | Supported                       | Supported                       | Supported                       | Not supported                   |
| Exchange 2010           | Not supported                   | Supported                       | Supported                       | Supported                       |

The following table outlines the Exchange server roles required to be installed based on on-premises Exchange environment version. The roles mentioned for Exchange 2013 and 2010 can be installed separately or on one server, Microsoft strongly recommend installing all roles on one server.

| On-premises environment | Mailbox server        | Client Access server  | Hub Transport         |
| ----------------------- | --------------------- | --------------------- | --------------------- |
| Exchange 2016 and newer | At least one instance | Not required          | Not required          |
| Exchange 2013           | At least one instance | At least one instance | Not required          |
| Exchange 2010           | At least one instance | At least one instance | At least one instance |

Exchange Hybrid design considerations and decisions only apply to organisations leveraging a hybrid implementation.

| Decision Point                                  | Design Decision       | Justification                                                                                                                                                                                             |
| ----------------------------------------------- | --------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Exchange Hybrid Deployment                      | Exchange 2016-based   | The organisation will use its existing Exchange 2016 server to establish the hybrid connection.                                                                                                           |
| Edge Transport Server for hybrid mail transport | Organisation decision | The organisation can choose to leverage an Edge Transport server to prevent the exposure of internal Exchange servers directly to the internet, depending on their risk appetite and gateway environment. |

### Mail Exchange records

Mail Exchange (MX) records specify the mail server responsible for accepting mail on behalf of the domain.

The record is a resource in the Domain Name System (DNS), and it is possible for a single domain to have multiple MX records. Multiple records are largely configured for availability, redundancy, and load balancing reasons.

#### Cloud native deployments

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point              | Design Decision  | Justification                                                                                                       |
| --------------------------- | ---------------- | ------------------------------------------------------------------------------------------------------------------- |
| Authoritative DNS MX Record | `<Mail Gateway>` | This is the ingress point for the mail for the organisation, the mx records will point to the organisation gateway. |
| Mail Exchanger/s            | `<Mail Gateway>` | This is the ingress point for the mail for the organisation, the mx records will point to the organisation gateway. |

{{% /alert %}}

#### Hybrid deployments

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point              | Design Decision | Justification                                                                                                                    |
| --------------------------- | --------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| Authoritative DNS MX Record | Configured      | If the organisation hosts mail for more than one domain a MX record for each is required. These records are listed.              |
| Mail Exchanger/s            | Configured      | If the organisation requires its on-premises mail gateways to continue to be used, the Virtual IP (VIP) of the gateways is used. |

{{% /alert %}}

### Mail connectors

Mail connectors use TLS to secure communication and can customise the way mail flows into and out of the organisation.

Generally mail connectors are required. An exception may be where organisations do not use a mail gateway and relies on Exchange Online Protection.

When the organisation intends to operate at the PROTECTED level, the Blueprint assumes that all organisations are implementing the configuration with a Mail Gateway and as such, provides detailed configurations on implementing mail connectors via the relevant gateway.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point  | Design Decision | Justification                                                                                                                                            |
| --------------- | --------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Mail Connectors | Configured      | Mail connectors are required for all Exchange and Exchange Online implementations. Specific connectors are configured when implementing Exchange hybrid. |

{{% /alert %}}

Mail Connector Configuration for all organisations and implementation types for environments intended to be used at the PROTECTED level

| Configuration                                      | Value                                                                                                                     | Description                                                                                                               |
| -------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| Certificate details                                | Configured                                                                                                                | Certificate to be issued from the gateway hosting the GovLINK connection.                                                 |
| Virtual IP address (VIP)                           | Configured                                                                                                                | Virtual IP Address details will be provided by the gateway provider.                                                      |
| **Exchange Online Receive Connector**              |                                                                                                                           |                                                                                                                           |
| Name                                               | `Inbound-connector-from-<GATEWAY>`                                                                                        | Describes the source and directionality of mail.                                                                          |
| Retain internal mail headers                       | Unchecked                                                                                                                 | Internal Mail headers are stripped off messages.                                                                          |
| On-premises server identification method and value | Identify by Senders Domain. Reject email messages if they are not sent over TLS. Require subject name matching `<DOMAIN>` | Ensures mail is being sent over an encrypted connection to a known domain.                                                |
| **Exchange Online Send Connector**                 |                                                                                                                           |                                                                                                                           |
| Name                                               | `outbound-connector-to-<GATEWAY>`                                                                                         | Describes the source and directionality of mail.                                                                          |
| Retain internal mail headers                       | Checked                                                                                                                   | When reporting spam that slips past the filters, it is essential that we receive the full message headers from a message. |
| When to use the connector                          | \\\* (All Mail)                                                                                                           | All mail should use the connector.                                                                                        |
| Message routing                                    | Route through these smart hosts.                                                                                          | This should be used route mail to the gateway.                                                                            |
| Connector Authentication settings                  | Always use TLS issued by a trusted Certificate Authority with a SAN matching `<DOMAIN>`                                   | Ensures mail is being sent over an encrypted connection to a known domain.                                                |

### Autodiscover

Autodiscover is a mechanism for the configuration of a user's email client with minimal user input. The required input from the user is their email address and password.

Autodiscover for a cloud environment varies from the process utilised when on-premises Exchange is leveraged. With a cloud environment, an Autodiscover Endpoint representing the domain is not available. Instead, DNS redirection and Hypertext Transfer Protocol Secure (HTTPS) redirection is leveraged to direct the Autodiscover client to a trusted Autodiscover Endpoint. The high-level process is:

*   The Autodiscover endpoint looks for a host named autodiscover.{DomainName}.com
*   DNS provides the Internet Protocol (IP) address of the host autodiscover.outlook.com
*   The Autodiscover client attempts communication utilising HTTPS (This fails)
*   The Autodiscover client requests redirection over Hypertext Transfer Protocol (HTTP) (This directs the client to autodiscover-s.outlook.com)
*   The Autodiscover client attempts communication utilising HTTPS. The communication is successful. However, the new Autodiscover endpoint does not have a server certificate for the requested hostname. This communication is then redirected using HTTPS redirection to an additional Autodiscover endpoint which can provide the required Autodiscover information.
*   The Autodiscover client completes the Autodiscover process with the new Autodiscover endpoint.

To ensure this process functions as described above, appropriate DNS records are required.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point      | Design Decision                        | Justification                                                 |
| ------------------- | -------------------------------------- | ------------------------------------------------------------- |
| DNS Records (CNAME) | Autodiscover: autodiscover.outlook.com | A DNS record that points clients to the Autodiscover service. |

{{% /alert %}}

#### Cloud native deployments

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point | Design Decision                             | Justification                                                                                                  |
| -------------- | ------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| Autodiscover   | CNAME autodiscover autodiscover.outlook.com | Autodiscover will improve the user experience and is required to configure a user's Outlook profile and inbox. |

{{% /alert %}}

#### Hybrid deployments

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point          | Design Decision                       | Justification                                                                                                                                         |
| ----------------------- | ------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| Autodiscover internally | Configured - Service Connection Point | Autodiscover will continue to point to the internal Exchange Servers until all mailboxes have been migrated to Microsoft 365 to ensure functionality. |
| Autodiscover externally | Configured -- DNS record              | To ensure autodiscover functions externally to the organisation.                                                                                      |

{{% /alert %}}

### SPF, DMARC and DKIM

Sender Policy Framework (SPF), Domain Key Identified Mail (DKIM), and Domain-based Message Authentication, Reporting and Conformance (DMARC) are tools for email authentication. These tools can coexist to provide enhanced capabilities.

These tools can coexist to provide enhanced capabilities.

*   SPF - SPF is a DNS entry which lists the servers which can send emails from a specific domain. It enables recipients to verify the identity of incoming mail.
*   DKIM - DKIM, unlike SPF is a tool to verify whether the content of the message is trustworthy. This is completed using a public/private key signing process.
*   DMARC - DMARC enables both SPF and DKIM using policy. A DMARC policy sets out how to handle messages which do not align to what the receiver knows about the sender. This can include rejecting the message; suggesting the message is quarantined; or allowing the message.

While DKIM within Microsoft 365 can sign messages, the organisation's gateway may also be configured to do this which may cause issues with DMARC verification.

Note, organisations that enable DKIM signing within Microsoft 365 that also add additional business logic to email at the egress mail gateway, such as adding a default organisation email disclaimer, would fail DKIM authentication as the contents of the email had changed after the email had been sent from Exchange Online. In this scenario consider migrating the business logic from the mail gateway to native Exchange Online transport rules.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point | Design Decision | Justification                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| -------------- | --------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| SPF            | Configured      | Configuration of SPF record(s) are required as a baseline for the deployment and are configured to "hard fail" as per ASD's recommendations. The SPF record(s) are configured for all such authorised senders for that domain, including the Microsoft 365 SPF sender address (spf.protection.outlook.com) if applicable to ensure mail sent from Exchange Online passes SPF. SPF record(s) are to be configured by the DNS provider that that organisation consumes. |
| DKIM           | Configured      | DKIM is a public/private key signing process used to verify the content of an email. DKIM signing should be enabled on emails originating from an organisation's domains as per ASD's recommendations. DKIM is either enabled on the organisation mail gateway solution (hybrid) or within Microsoft 365 (cloud native).                                                                                                                                                     |
| DMARC          | Configured      | One DMARC policy is to be configured per the organisation's domain as per ASD's recommendations. This is to be configured at the gateway that the organisation consumes. DMARC records are configured for all domains such that emails are rejected if they fail SPF or DKIM checks.                                                                                                                                                                                  |

{{% /alert %}}

### Accepted domains

Accepted Domains are SMTP namespaces configured within Exchange Online. Only emails addressed to users within the nominated domains are accepted.

Accepted Domains consist of the following types:

*   Authoritative Domains - Authoritative Domains are domains where the Exchange Organisation accepts messages addressed to recipients and is responsible for generating non-delivery reports. On creation of an Exchange Online organisation the tenant domain Fully Qualified Domain Name (FQDN) and the `<tenantname>.mail.onmicrosoft.com` FQDN are automatically populated as an Authoritative Domains; and
*   Relay Domains - Relay Domains are often called Non-Authoritative Domains. The Exchange Organisation will accept the messages addressed to the recipients; however, it is not responsible for generating non-delivery reports. Hybrid Exchange leverages Relay Domains and mail connectors to relay messages between both on-premises infrastructure and Exchange Online.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                        | Design Decision | Justification                                                                                                                                                                                                                                                                                         |
| ------------------------------------- | --------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Configure Additional Accepted Domains | Configured      | Required to integrate with additional organisations. Any additional organisations that require access to the system are to be included.                                                                                                                                                               |
| Authoritative Domains                 | Configured      | The `<tenantname>.onmicrosoft.com` authoritative domain is created during the enablement of Microsoft 365 and represents the Exchange Online Organisations SMTP address space. The additional authoritative domains are required as each organisation will have a corresponding authoritative domain. |

{{% /alert %}}

#### Hybrid deployments

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point | Design Decision | Justification                                                            |
| -------------- | --------------- | ------------------------------------------------------------------------ |
| Relay Domains  | Configured      | This setting is required to be configured in a Hybrid Exchange scenario. |

{{% /alert %}}

### Remote domains

Remote Domains enable administrators to control the type of replies and format of messages users send to the destination domain.

Administrators can configure Exchange to allow (or block) the following:

*   Out of Office messages.
*   Automatic replies and forwards.
*   Read or delivery receipts.
*   Non-delivery report to a specified domain.

The default remote domain will apply the same settings to all messages; however, administrators can configure specific settings for specific domains.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point           | Design Decision               | Justification                                                       |
| ------------------------ | ----------------------------- | ------------------------------------------------------------------- |
| Configure Remote Domains | Default configuration applied | The default configuration within Exchange Online will be leveraged. |

{{% /alert %}}

#### Configuration

| Policy Setting                      | Configuration                                                                                                              | Description                                                                                      |
| ----------------------------------- | -------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ |
| Name                                | `Default`                                                                                                                  | Name of the remote domain.                                                                       |
| Remote Domain                       | `*`                                                                                                                        | Note `*` means all external organisations.                                                            |
| Out of Office automatic reply types | Allow only external Out of Office replies - Selected                                                                       | Enables limiting of the type of client automatic replies.                                     |
| Automatic replies                   | Allow automatic replies -- Unchecked<br>Allow automatic forwarding - Unchecked                                             | Enables limiting of automatic replies and automatic forwards.                                 |
| Message reporting                   | Allow delivery reports - Ticked<br>Allow non-delivery reports -- Ticked<br>Allow meeting forward notifications - Unchecked | Enables limiting of delivery reports, no-delivery reports, and meeting forward notifications. |
| Use rich text format                | Follow user settings - Selected                                                                                            | Enables control over message format.                                                          |
| Supported Character Set             | None                                                                                                                       | Enables control over the character set.                                                       |

### Certificates for hybrid deployments

There are additional specific certificate requirements when configuring Exchange Hybrid that only apply to organisations implementing a hybrid configuration as Exchange Online encrypts all traffic to the on-premises environment. organisations implementing cloud only environments that do not leverage an on-premises Exchange Server do not need require these configurations.

The following certificates are associated with Exchange hybrid deployments:

*   Azure Active Directory Connect (Entra Connect) with Active Directory Federation Services (AD FS) -- a third party certificate from a Trusted Authority (CA) is required to establish a trust between web clients and federations server proxies used to sign and decrypt security tokens.
*   Exchange Federation -- a self-signed certificate is used to create a secure connection between the on-premises Exchange server and Azure Active Directory authentication
*   Exchange Services -- a third party certificated from a Trusted Authority (CA) is required to secure the TLS communication between Exchange servers and clients. These include Outlook on the web, Exchange ActiveSync, Outlook Anywhere and secure message transport
*   Existing Exchange Servers -- might use self-signed or certificates issued by a Trusted Authority (CA) depending on Exchange server certificates. These certificates may need updating for Exchange Hybrid

Suggested FQDNs for hybrid deployments:

| Service                                                    | Suggested FQDN                                                                                                                                                     | Field                    |
| ---------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------ |
| Primary shared Simple Mail Transfer Protocol (SMTP) domain | organisation.gov.au                                                                                                                                                | Subject name             |
| Autodiscover                                               | To be determined by the organisation. <br>Label that matches the external Autodiscover FQDN on the Exchange Client Access server, such as Autodiscover.contoso.com | Subject alternative name |
| Transport                                                  | To be determined by the organisation. <br>Label that matches the external FQDN of the Edge Transport servers, such as edge.contoso.com                             | Subject alternative name |

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point            | Design Decision                 | Justification                                                                                                                                                    |
| ------------------------- | ------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Hybrid Server Certificate | New certificate to be purchased | As the only new service which is being configured is the Exchange Hybrid Server, that is the only certificate which requires validation and updates as required. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* [GovLink](https://www.finance.gov.au/government/whole-government-information-communications-technology-services/govlink)
* [Secure Internet Gateways](https://www.cyber.gov.au/acsc/view-all-content/programs/irap/asd-certified-gateways)
* ASD's [*Information Security Manual*](https://www.cyber.gov.au/acsc/view-all-content/guidance/email-gateways-and-servers)
* [Protective Security Policy Framework](https://www.protectivesecurity.gov.au/sites/default/files/2019-11/policy-8-annex-g-email-protective-marking-standard.pdf)