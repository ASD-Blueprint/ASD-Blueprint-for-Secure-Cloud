---
title: "Transport Security"
weight: 40
description: "This section describes the design decisions associated with Exchange Online for system(s) built using ASD's Blueprint for Secure Cloud."
---

Message Transfer Agent - Strict Transport Security (MTA-STS) enables the configuration of domain policies that define whether the receiving domain supports TLS. If the domain doesn't support TLS then the policy can be configured to prevent transmission. Outbound mail flow in Exchange Online supports MTA-STS. Configuration of MTA-STS requires a DNS TXT record and the hosting a of the policy file.

Opportunistic TLS enables email traffic to be encrypted when both the sender and receiver domains support TLS without the need for an additional port for encrypted traffic. By default, Exchange Online always attempts to encrypt mail traffic using opportunistic TLS. Microsoft always uses TLS 1.2 when transferring mail between [Exchange Online customers](https://learn.microsoft.com/purview/exchange-online-uses-tls-to-secure-email-connections?view=o365-worldwide#how-exchange-online-uses-tls-between-exchange-online-customers).

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point           | Design Decision   | Justification                                                                             |
|--------------------------|-------------------|-------------------------------------------------------------------------------------------|
| Configuration of MTA-STS | Recommended       | Organisations should configure the required DNS record and policy to require TLS support. |
| Opportunistic TLS        | Enabled (default) | To encrypt email traffic where supported by the external email domain.                    |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* None identified