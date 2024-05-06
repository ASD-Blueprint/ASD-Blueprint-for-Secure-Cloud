---
title: "Autodiscover"
weight: 30
description: "This section describes the design decisions associated with Autodiscover for system(s) built using ASD's Blueprint for Secure Cloud."
---

Autodiscover is a mechanism for the configuration of a user's email client with minimal user input. The required input from the user is their email address and password.

Autodiscover for a cloud environment varies from the process utilised when on-premises Exchange is leveraged. With a cloud environment, an Autodiscover Endpoint representing the domain is not available. Instead, Domain Name System (DNS) redirection and Hypertext Transfer Protocol Secure (HTTPS) redirection is leveraged to direct the Autodiscover client to a trusted Autodiscover Endpoint. 

The high-level process for Autodiscover is:

1. Autodiscover endpoint looks for a host named `autodiscover.<DomainName>.com`
2. DNS provides the Internet Protocol (IP) address of the host `autodiscover.outlook.com`
3. Autodiscover client attempts communication utilising HTTPS (this fails)
4. Autodiscover client requests redirection over Hypertext Transfer Protocol (HTTP) (This directs the client to `autodiscover-s.outlook.com`)
5. Autodiscover client attempts communication utilising HTTPS. The communication is successful. However, the new Autodiscover endpoint does not have a server certificate for the requested hostname. This communication is then redirected using HTTPS redirection to an additional Autodiscover endpoint which can provide the required Autodiscover information.
6. Autodiscover client completes the Autodiscover process with the new Autodiscover endpoint.

The above process requires appropriate [External DNS records](https://learn.microsoft.com/microsoft-365/enterprise/external-domain-name-system-records?view=o365-worldwide#external-dns-records-required-for-email-in-office-365-exchange-online)

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point      | Design Decision                                                  | Justification                                                 |
|---------------------|------------------------------------------------------------------|---------------------------------------------------------------|
| DNS Records (CNAME) | **Alias**: Autodiscover<br>**Target**:`autodiscover.outlook.com` | A DNS record that points clients to the Autodiscover service. |

{{% /alert %}}

### Cloud native deployments

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point | Design Decision                                                        | Justification                                                                                                  |
|----------------|------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------|
| Autodiscover   | CNAME **Alias**: Autodiscover<br>**Target**:`autodiscover.outlook.com` | Autodiscover will improve the user experience and is required to configure a user's Outlook profile and inbox. |

{{% /alert %}}

### Hybrid deployments

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point          | Design Decision                       | Justification                                                                                                                                      |
|-------------------------|---------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
| Autodiscover internally | Configured - Service Connection Point | Autodiscover will continue to point to the internal Exchange Servers until all mailboxes have been migrated to Microsoft 365 to ensure functionality. |
| Autodiscover externally | Configured – DNS record               | To ensure autodiscover functions externally to the organisation.                                                                                   |

{{% /alert %}}

{{% alert title="Note" color="info" %}}

Public DNS records should be maintained within the Australian Protective Domain Name (AUPDNS) service per ASD's [Gateway Security Guidance Package: Gateway Technology Guide](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/gateway-hardening/gateway-security-guidance-package-gateway-technology-guides).

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* None identified

#### References

* [Microsoft 365 DNS Record Requirements](https://learn.microsoft.com/microsoft-365/enterprise/external-domain-name-system-records?view=o365-worldwide)
* [Gateway Security Guidance Package: Gateway Technology Guide](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/gateway-hardening/gateway-security-guidance-package-gateway-technology-guides)