---
Title: DNS Settings
weight: 090
description: "This section describes the DNS configuration associated with hybrid systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The settings described on these pages should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

### MX records

MX records are not set within Azure or Exchange and are configured with the hosting provider.

Note, cloud-native MX configuration assumes Office 365 is not configured with a 3rd party gateway for mail flow.

Organisations that are required to route traffic through a 3rd party mail gateway will point MX record to the 3rd party gateway.

The following table describes the MX records to be configured per implementation type.

| Implementation | Domain                  | MX Preferences |                                    Mail Exchanger |
| -------------- | ----------------------- | -------------- | ------------------------------------------------: |
| Cloud-native   | `<organisation.gov.au>` | `10`           | `Organisation-com-au.mail.protection.outlook.com` |
| Hybrid         | `<organisation.gov.au>` | `10`           |                      `<Organisation mx provider>` |

### SPF and DMARC records

Note, SPF and DMARC DNS records are configured through the organisation's DNS provider. DMARC and SPF configuration is unique to the organisation. The following configuration are included as examples.

The following table describes the SPF records to be configured per implementation type.

| Implementation | Domain                  | SPF Record                                         |                                                                                                  DMARC Policy |
| -------------- | ----------------------- | -------------------------------------------------- | ------------------------------------------------------------------------------------------------------------: |
| Cloud-native   | `<organisation.gov.au>` | `"v=spf1 include:spf.protection.outlook.com -all"` | `"v=DMARC1; p=reject; pct=100; rua=mailto:<rua reporting address>; ruf=mailto:<ruf reporting address>; fo=1"` |
| Hybrid         | `<organisation.gov.au>` | (Specific to gateway provider)                     | `"v=DMARC1; p=reject; pct=100; rua=mailto:<rua reporting address>; ruf=mailto:<ruf reporting address>; fo=1"` |


### DKIM records

Note, DKIM DNS selector records are configured through the organisation's DNS provider. Cloud-native configuration assumes DKIM signing is handled by Exchange Online Protection and not a third-party selector.

The following table describes the DKIM records configuration settings per implementation type.

| Implementation | Type  | Domain                  | Host name                     | TTL      |                                                              Points to address or value |
| -------------- | ----- | ----------------------- | ----------------------------- | -------- | --------------------------------------------------------------------------------------: |
| Cloud-native   | CNAME | `<organisation.gov.au>` | `selector1._domainkey `       | `5 Min.` | `selector1-Organisation-gov-au._domainkey.<Organisationinitialdomain>.onmicrosoft.com.` |
| Cloud-native   | CNAME | `<organisation.gov.au>` | `selector2._domainkey `       | `5 Min.` |              `selector2-Organisation-gov-au._domainkey.<Organisation>.onmicrosoft.com.` |
| Hybrid         | CNAME | `<organisation.gov.au>` | `<gateway provided selector>` | `5 Min.` |                                                           `<gateway provided selector>` |

### DNS records

Note, the Autodiscover service external DNS entry is specific to the Hybrid implementation of the organisation. Once all mailboxes have been migrated to Office 365 within a Hybrid configuration this can be pointed as an alias to the Office 365 Autodiscover service using [autodiscover.outlook.com](autodiscover.outlook.com).

Hybrid implementation types will require additional external DNS records depending on the hybrid implementation (classic or modern). The additional certificate requirements for hybrid can be located at - [certificate requirements for hybrid deployments](https://docs.microsoft.com/exchange/certificate-requirements).

The following table describes the DNS record settings to be configured for Organisation.gov.au (default) per implementation type.

| Implementation | Type  | Priority | Host name                           | Points to address or value                               |    TTL |
| -------------- | ----- | -------- | ----------------------------------- | -------------------------------------------------------- | -----: |
| Cloud-native   | MX    | `10`     | Organisation Domain                 | `Organisation-gov-au.mail.protection.outlook.com`        | 1 hour |
| Hybrid         | MX    | `10`     | Organisation Domain                 | Organisation mx provider address.                        | 1 hour |
| Hybrid         | CNAME | -        | Organisation Edge Transport address | Organisation edge transport gateway address.             | 1 hour |
| Hybrid         | CNAME | -        | Organisation CAS/EWS NAT address    | Organisation CAS/EWS NAT when using hybrid classic full. | 1 hour |
| All            | TXT   | -        | Organisation Domain                 | Text string provided by Office 365 domain setup wizard.  | 1 hour |
| Cloud-native   | CNAME | -        | Autodiscover.Organisation.gov.au    | `autodiscover.outlook.com`                               | 1 hour |
| Hybrid         | CNAME | -        | Autodiscover.Organisation.gov.au    | Organisation autodiscover NAT address.                   | 1 hour |
