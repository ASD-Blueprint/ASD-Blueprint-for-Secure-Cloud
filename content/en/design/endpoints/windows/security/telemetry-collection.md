---
title: "Telemetry Collection"
weight: 35
description: "This section describes the design decisions associated with telemetry collection on Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

Windows 10/11 and Windows Server include the Connected User Experiences and Telemetry component, which uses Event Tracing for Windows (ETW) trace logging technology that gathers and stores diagnostic data events and data. The operating system and some Microsoft management solutions, such as MECM use the same logging technology.

Windows uses telemetry information to analyse and fix software problems. It also helps Microsoft improve its software and provide updates that enhance the security and reliability of devices within organisations.

Telemetry level options are:

* Off – Disable telemetry data collection.
* Security – Information that is required to help keep Windows secure, including info about telemetry client settings, the Malicious Software Removal Tool, and Windows Defender. This level is available only on Windows 10/11 Enterprise and Windows 10/11 Education, and Windows 10/11 IoT Core.
* Basic – Basic device info, including quality-related info, application compatibility, and info from the Security level.
* Enhanced – Additional insights, including how Windows and Windows apps are used, how they perform, advanced reliability info, and info from both the Basic and the Security levels.
* Full – All info necessary to identify and help to fix problems, plus info from the Security, Basic, and Enhanced levels.


{{% alert title="Design Decisions" color="warning" %}}

| Decision Point  | Design Decision | Justification                                                                                                             |
|-----------------|-----------------|---------------------------------------------------------------------------------------------------------------------------|
| Allow Telemetry | Enabled         | In line with the ASD's hardening guideline policy recommendations and meets requirements for future Desktop Analytics use. |
| Telemetry Level | 2 – Enhanced    | Microsoft recommend Enhanced Limited for Desktop Analytics.                                                               |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* None identified