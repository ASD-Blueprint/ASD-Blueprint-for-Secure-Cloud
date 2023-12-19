---
title: "Internet browser"
weight: 60
description: "This section describes the design decisions associated with internet browsers on Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

The internet browser is a software application used for accessing web pages. This browser may be built into the operating system or installed later. Microsoft Edge Chromium is a web browser for Windows 10. It has been developed to modern standards and provides greater performance, security and reliability. It also provides additional features such as Web Note and Reading View.

Alternate browsers may also be deployed to support specific business needs or requirements.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point  | Design Decision                          | Justification                                                  |
|-----------------|------------------------------------------|----------------------------------------------------------------|
| Default Browser | Microsoft Edge Chromium – Stable edition | To ensure compatibility and performance with modern web pages. |
| Legacy support  | Microsoft Edge with IE mode              | To support legacy web pages not compatible with Edge.          |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* None identified