---
title: "Mail flow"
linkTitle: "Mail flow"
weight: 20
description: "This section describes the configuration of mail flow within Exchange Online associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Exchange admin portal at the following URL:

<https://admin.exchange.microsoft.com/#/settings>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### General

| Item                                           |       Value |
| ---------------------------------------------- | ----------: |
| Turn off plus addressing for your organisation | Not checked |
| Turn on sending from aliases                   | Not checked |

### Security

| Item                                              |       Value |
| ------------------------------------------------- | ----------: |
| Turn off SMTP AUTH protocol for your organisation |     Checked |
| Turn on use of legacy TLS clients                 | Not checked |

### Reply-all Storm Protection

| Item                              |   Value |
| --------------------------------- | ------: |
| Enable reply-all storm protection | Checked |
| Minimum number of recipients      |    2500 |
| Minimum number of reply-alls      |      10 |
| Block duration                    |       6 |

### Message Recall

| Item                                                    |                                                      Value |
| ------------------------------------------------------- | ---------------------------------------------------------: |
| Enable cloud-based message recall                       |                                                    Checked |
| Allow users to recall messages read by the recipient    |                                                    Checked |
| Enable recall alerts for recipients                     |                                                    Checked |
|                                                         | Only for recalled messages that were read by the recipient |
| Do not allow senders to recall messages older than this |                                                      1 Day |

### Related information

#### Security & Governance

* [System Monitoring]({{<ref "system-monitoring.md">}})
  
#### Design

* [Policy Filtering]({{<ref "design/shared-services/defender/policy-filtering.md">}})
* [Microsoft 365 Connectivity]({{<ref "design/shared-services/microsoft-365/microsoft365-connectivity.md">}})
  
#### Configuration

* [Microsoft Intune - profile configurations]({{<ref "configuration/intune/devices/configuration-policies">}})

#### References

* None identified
