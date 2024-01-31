---
Title: Remote domains
weight: 40
description: "This section describes the configuration of remote connectors within Exchange Online associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* for the Microsoft Exchange Online portal blade at the following URL: 
 
https://admin.exchange.microsoft.com/#/remotedomains
 
The settings described on these pages should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

### Name

| Item          |   Value |
| ------------- | ------: |
| Name          | Default |
| Remote Domain |       * |

### Email reply types

| Item                                |                                     Value |
| ----------------------------------- | ----------------------------------------: |
| Out of Office automatic reply types | Allow only external out of office replies |
| Allow automatic replies             |                               Not checked |
| Allow automatic forwarding          |                               Not checked |

### Message reporting

| Item                                |       Value |
| ----------------------------------- | ----------: |
| Allow delivery reports              | Not checked |
| Allow non-delivery reports          | Not checked |
| Allow meeting forward notifications | Not checked |

### Text and character set

| Item                   |                Value |
| ---------------------- | -------------------: |
| Use rich-text format   | Follow user settings |
| MIME character set     |                 None |
| Non-MIME character set |                 None |

### Related information

#### Security & Governance

* None identified
  
#### Design

* None identified
  
#### Configuration

* None identified

#### References

* None identified