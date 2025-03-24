---
title: "Mail Exchange Records"
weight: 30
description: "This section describes the design decisions associated with Microsoft 365 Mail Exchange Records for system(s) built using ASD's Blueprint for Secure Cloud."
---

Mail Exchange (MX) records specify the mail server responsible for accepting mail on behalf of the domain. The record is a resource in the Domain Name System (DNS), and it is possible for a single domain to have multiple MX records. Multiple records are largely configured for availability, redundancy, and load balancing reasons.

{{% alert title="Note" color="info" %}}

MX records should be maintained within the Australian Protective Domain Name (AUPDNS) service - as per ASD's [*Gateway Security Guidance Package: Gateway Technology Guide*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/gateway-hardening/gateway-security-guidance-package-gateway-technology-guides).

{{% /alert %}}

### Cloud native deployments

{{% alert title="Design decisions" color="warning" %}}

| Decision point              | Design decision  | Justification                                                                                                       |
|-----------------------------|------------------|---------------------------------------------------------------------------------------------------------------------|
| Authoritative DNS MX Record |                  | This is the ingress point for the mail for the organisation, the mx records will point to the organisation gateway. |
| Mail Exchanger/s            | `<Mail Gateway>` | This is the ingress point for the mail for the organisation, the mx records will point to the organisation gateway. |

{{% /alert %}}

### Hybrid deployments

{{% alert title="Design decisions" color="warning" %}}

| Decision point              | Design decision | Justification                                                                                                                    |
|-----------------------------|-----------------|----------------------------------------------------------------------------------------------------------------------------------|
| Authoritative DNS MX Record | Configured      | If the organisation hosts mail for more than one domain a MX record for each is required. These records are listed.              |
| Mail Exchanger/s            | Configured      | If the organisation requires its on-premises mail gateways to continue to be used, the Virtual IP (VIP) of the gateways is used. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* [Mail Flow and Gateway]({{<ref "microsoft365-connectivity#mail-flow-and-gateway">}})
* [Mail Connectors]({{<ref "microsoft365-connectivity#mail-connectors">}})

#### Configuration

* None identified

#### References

* [DNS Record Requirements for Exchange Online](https://learn.microsoft.com/microsoft-365/enterprise/external-domain-name-system-records?view=o365-worldwide#external-dns-records-required-for-email-in-office-365-exchange-online)
