---
Title: Connectors
weight: 50
description: "This section describes the configuration of connectors within Exchange Online associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* for the Microsoft Exchange Online portal blade at the following URL: 
 
https://admin.exchange.microsoft.com/#/connectors
 
The settings described on these pages should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Cloud-native configuration

Cloud-native connector configuration assumes Office 365 is not configured with a 3rd party gateway for mail flow.

Organisations that are required to route traffic through a 3rd party mail gateway will require connectors to be configured.

#### Inbound mail connector

| Item           | Configuration |
| -------------- | ------------: |
| Not configured |           N/A |

#### Outbound mail connector

| Item           | Configuration |
| -------------- | ------------: |
| Not configured |           N/A |

### Hybrid configuration

#### Inbound mail connector

| Item                                                 |                                                                                                                                                                                                                            Configuration |
| ---------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| From                                                 |                                                                                                                                                                                                         Your Organization's email server |
| To                                                   |                                                                                                                                                                                                                               Office 365 |
| Description                                          |                                                                                                                                                                                                                                     None |
| Status                                               |                                                                                                                                                                                                                                       On |
| Retain internal Exchange email headers (recommended) |                                                                                                                                                                                                                                   Enable |
| How to identify your organization                    |                                                                                                                        Identify the organization by verifying that messages are coming Inbound from xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx |
| Security restrictions                                | Reject messages if they aren’t encrypted using Transport Layer Security (TLS), or the subject name on the certificate that the organization uses to authenticate with Office 365 doesn’t match this domain name: `*.organisation.gov.au` |


#### Outbound mail connector

| Item                                                 |                                                                                                                                                                                                                  Configuration |
| ---------------------------------------------------- | -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| From                                                 |                                                                                                                                                                                                                     Office 365 |
| To                                                   |                                                                                                                                                                                               Your Organization’s email server |
| Description                                          |                                                                                                                                                                                                                           None |
| Status                                               |                                                                                                                                                                                                                             On |
| Retain internal Exchange email headers (recommended) |                                                                                                                                                                                                                         Enable |
| How to identify your organization                    |                                                                                                              Identify the organization by verifying that messages are going outbound from xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx |
| When to use the connector                            |                                                                                                                                                                          Only when email messages are sent to these domains: * |
| Routing method                                       |                                                                                                                                                            Route email messages through these smart hosts: organisation.gov.au |
| Security restrictions                                | Always use Transport Layer Security (TLS) and connect only if the recipient’s email server certificate is issued by a trusted certificate authority (CA), and the subject name matches this domain: `mail.organisation.gov.au` |

### Related information

#### Security & Governance

* None identified
  
#### Design

* None identified
  
#### Configuration

* None identified

#### References

* None identified
