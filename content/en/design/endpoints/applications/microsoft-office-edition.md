---
title: "Microsoft Office edition"
weight: 5
description: "This section describes the design decisions associated with the editions of Microsoft Office."
---

Microsoft Office is available in two release cycles and within those release cycles there are multiple editions. Microsoft Office has two release cycles:

* **Microsoft 365 Apps for enterprise** – Microsoft 365 Apps for enterprise combines the Microsoft Office desktop suite with cloud-based versions of Microsoft's communications and collaboration services—including Microsoft Exchange Online, Microsoft SharePoint Online, Office Online, and Microsoft Teams. Microsoft 365 Apps for enterprise is upgraded with new features on a regular basis via feature update channels.
* **Traditional Microsoft Office** – Traditional Microsoft Office is sold as a one-time purchase and provides Office applications for a single computer. There are no upgrade channel options which means to upgrade to the next major release, another copy of MS Office will have to be procured. Traditional Microsoft Office is not upgraded with new features for the life of the release. Microsoft Office 2019 is the latest traditional version available.

Within these release cycles, either 32-bit or 64-bit architectures can be selected. Microsoft Office provides 32-bit or 64-bit version to be installed on Windows devices. Microsoft 64-bit version of Office will be automatically chosen to be installed, unless 32-bit version is installed. The 64-bit version of Office provides ability working with larger datasets and files. However, 64-bit version of Office does not support legacy macros, and COM Add-In.

Microsoft 365 Apps for enterprise provides three feature update channels for customers to choose:

* **Current Channel** - new Office features are available as soon as they are released, not on a set schedule.
* **Monthly Enterprise Channel** - new office features are released in a predictable monthly schedule.
* **Semi-annual Enterprise Channel** - new Office features are released twice a year. 

Microsoft Project and Visio (365 and 2019) are available as click-to-run editions that can be either licenced through Microsoft 365 or through hybrid licensing. Regardless of the licence type, they can be installed through Intune or MECM (for hybrid deployments). The installation media is configured using the [Office Deployment Tool (ODT)](https://www.microsoft.com/download/details.aspx?id=49117) which generates the installer and configuration options for the deployment. Microsoft Office 365 E3/E5 licensing does not include the rights to use these applications. There are some caveats to what combination of Office versions are supported alongside Project and Visio, please see the [supported scenarios](https://learn.microsoft.com/deployoffice/install-different-office-visio-and-project-versions-on-the-same-computer).

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                    | Design Decision                          | Justification                                                                                 |
|-----------------------------------|------------------------------------------|-----------------------------------------------------------------------------------------------|
| Microsoft Office Version          | Microsoft 365 Apps for Enterprise 64-bit | Aligns with modernisation vision and provides access to the latest and most updated features. |
| Microsoft 365 Apps Update channel | Monthly Enterprise                       | Provides the latest features for Office apps, such as Excel and Word, on a regular basis.     |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* [ASD Office Hardening Guidelines]({{<ref "configuration/intune/devices/configuration-policies/asd-office-hardening-guidelines.md">}})
* [Endpoint security policies]({{<ref "configuration/defender/endpoints/configuration-management/endpoint-security-policies.md">}})


#### References

* [Microsoft Office Deployment Tool](https://www.microsoft.com/download/details.aspx?id=49117)
* [Supported scenarios for installing different versions of Office, Project, and Visio on the same computer](https://learn.microsoft.com/deployoffice/install-different-office-visio-and-project-versions-on-the-same-computer)
* [Add Microsoft 365 apps to Windows 10/11 devices with Microsoft Intune](https://learn.microsoft.com/mem/intune/apps/apps-add-office365)
* [Restricting Administrative Privileges](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-administration/restricting-administrative-privileges)