---
title: "System Properties"
weight: 80
description: "This section describes the design decisions associated with system properties on Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

The System Properties window can be customised in several ways. Within the System Properties window, the Manufacturer and Model values can be displayed. Support information can also be populated which includes:

* Support phone
* Support hours
* Support website

A custom Original Equipment Manufacturers (OEMs) logo can also be displayed below the Windows logo.

The system Computer Description can also be used to display the build date, time and Standard Operating Environment (SOE) version.

The Manufacturer value is used in the title string displayed in the support section, being "Manufacturer support". If the actual computer manufacturer were to be populated, then the support section heading would be "HP support", for example, which would be misleading for users. Setting the Manufacturer value to "Organisation" would set the support section heading to "Organisation support".

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point       | Design Decision                                    | Justification                                                               |
|----------------------|----------------------------------------------------|-----------------------------------------------------------------------------|
| Company Name         | Not Configured                                     | Not required to support deployments.                                        |
| OEM Logo             | Configured – Australian Government crest           | To identify that the equipment is under Australian Government jurisdiction. |
| Manufacturer Value   | Configured – the Organisation Name                 | To identify the organisation as the device owner.                           |
| Model Value          | Configured – Asset Number                          | To identify the device via asset label.                                     |
| Support Hours Value  | Configured – Support hours of internal ICT support | To simplify organisation desktop support.                                   |
| Support Phone Value  | Configured                                         | To simplify organisation desktop support.                                   |
| Support URL Value    | Configured                                         | To simplify organisation desktop support.                                   |
| Computer Description | Configured – Asset type and model                  | To simplify organisation desktop support.                                   |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* None identified