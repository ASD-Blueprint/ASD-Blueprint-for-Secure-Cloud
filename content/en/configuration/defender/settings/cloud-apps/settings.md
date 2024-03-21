---
Title: Cloud app Settings
weight: 10
description: "This section describes the configuration of cloud apps within Microsoft Defender associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* for Defender portal blade at the following URL: 

https://security.microsoft.com/cloudapps/settings
 
These settings should be used to provide reference of a baseline implementation for a system configured using the blueprint. Any implementation implied by the below should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.
 
Implementation of the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.
 
Placeholders such as ‘organisation.gov.au’, ‘blueprint.gov.au’ and ‘tenant-name’ should be replaced with the relevant details as required.
 
{{% /alert %}}


### Organization Details

| Item                      | Value                                                 |
| ------------------------- | -----------------------------------------------------:|
| Organization display name | *Organisation name*                                   |
| Environment name          | *Organisation environment name*                       |
| Managed domains           | `organisation.onmicrosoft.com`, `organisation.gov.au` |

### Redirection To Microsoft Defender XDR

| Item                                             | Value   |
| ------------------------------------------------ | -------:|
| Automatically redirect to Microsoft Defender XDR | Checked |

### General Settings

| Item                                                             | Value        |
| ---------------------------------------------------------------- | ------------:|
| Default behavior during system downtime                          | Allow access |
| Treat accounts with the same user and different Ids as identical | Not checked  |

### User monitoring

| Item                                                             | Value               |
| ---------------------------------------------------------------- | -------------------:|
| Notify users that their activity is being monitored              | Use default message |

### Related information

#### Security & Governance

* None identified
  
#### Design

* None identified
  
#### Configuration

* None identified

#### References

* [Defender for Cloud apps](https://learn.microsoft.com/azure/defender-for-cloud/)



