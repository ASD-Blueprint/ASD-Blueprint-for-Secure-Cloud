---
title: "Fast User Switching"
weight: 70
description: "This section describes the design decisions associated with fast user switching on Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

Fast User Switching enables more than one concurrent connection to a Windows device. However, only one session can be active at a time. Fast User Switching creates potential security risks around session-jacking and credential breaches. If one user reboots or shuts down the computer while another user is logged on, the other user may lose work as applications may not automatically save documents.

{{% alert title="Design decisions" color="warning" %}}

| Decision point      | Design decision | Justification                                    |
|---------------------|-----------------|--------------------------------------------------|
| Fast User Switching | Disabled        | To minimise potential attack surface of the SOE. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* None identified

#### References

* None identified