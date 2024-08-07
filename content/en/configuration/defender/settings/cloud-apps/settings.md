---
title: "Cloud app Settings"
linkTitle: "Cloud app Settings"
weight: 10
description: "This section describes the configuration of cloud apps settings within Microsoft Defender associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Defender portal at the following URL:

<https://security.microsoft.com/cloudapps/settings>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as ‘organisation.gov.au’, ‘blueprint.gov.au’ and ‘tenant-name’ should be replaced with the relevant details as required.

{{% /alert %}}

### Organization details

| Item                      | Value                                                 |
| ------------------------- | -----------------------------------------------------:|
| Organization display name | *Organisation name*                                   |
| Environment name          | *Organisation environment name*                       |
| Managed domains           | `organisation.onmicrosoft.com`, `organisation.gov.au` |

### General Settings

| Item                                                             | Value        |
| ---------------------------------------------------------------- | ------------:|
| Default behavior during system downtime                          | Allow access |

### User monitoring

| Item                                                             | Value               |
| ---------------------------------------------------------------- | -------------------:|
| Notify users that their activity is being monitored              | Use default message |

### Related information

#### Security & Governance

* [Application Control]({{<ref "security-and-governance/essential-eight/application-control.md">}})
* [System Management]({{<ref "system-management.md">}})
  
#### Design

* [Authentication]({{<ref "design/platform/identity/authentication.md" >}})
* [Entra ID Protection]({{< ref "design/platform/identity/protection.md" >}})
  
#### Configuration

* [Entra ID Protection]({{<ref "configuration/entra-id/protection">}})
* [Intune Endpoint Security]({{<ref "configuration/intune/endpoint-security">}})

#### References

* [Defender for Cloud apps](https://learn.microsoft.com/azure/defender-for-cloud/)
