---
title: "Microsoft Whiteboard"
weight: 45
description: "This section describes the design decisions associated with implementation of Microsoft Whiteboard for system(s) built using ASD's Blueprint for Secure Cloud."
---

Microsoft Whiteboard is a hosted whiteboarding tool used for collaboration. It integrates with Microsoft 365 services such as Teams and functions on devices such as the Microsoft Surface hub, Windows and iOS. Access to use the tool can be controlled globally.

Microsoft leverages diagnostic data to both address issues and continually improve the Microsoft Whiteboard tool. The level of data provided to Microsoft from clients utilising the Whiteboard application can be controlled. The diagnostic data configuration options are:
* **Required** – The minimum amount of data necessary to keep Whiteboard secure, up-to-date, and performing as expected on devices.
* **Optional** – Additional data to help make product improvements and provides enhanced information to help detect, diagnose, and fix issues. All data under the required setting is also included.
* **Neither** - No diagnostic data about the Whiteboard client software running on the devices is sent to Microsoft. 

The Whiteboard tool also offers optional connected experiences. These experiences are offered directly to users by Microsoft and include items such as Bing image search, Word or PowerPoint document insertion, and Ink beautification. When the connected services are leveraged, the required service data is provided to Microsoft. This data is separate from any diagnostic data provided.

The Whiteboard tool can be used with the Microsoft Surface hub appliance. When using the tool easy sharing can be configured. Easy sharing enables sharing of Whiteboard sessions without logging into the Surface Hub appliance. 

{{% alert title="Design decisions" color="warning" %}}

| Decision point                              | Design decision       | Justification                                                                                                            |
|---------------------------------------------|-----------------------|--------------------------------------------------------------------------------------------------------------------------|
| Whiteboard for everyone in the organisation | Enabled               | Enabling use of Whiteboard within the organisation.                                                                  |
| Level of diagnostic data                    | Neither               | Restricts the amount of data provided to Microsoft for diagnostic and product improvements.                              |
| Connected experience in Whiteboard          | Disabled              | Restricts the availability of unapproved optional experience to be presented to users.                                   |
| Easy sharing of Whiteboard from Surface hub | Organisation Decision | Depending on the location and configuration of the Surface Hub/s within the organisation this setting may be configured. |
 
{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* [Services]({{<ref "configuration/microsoft-365/settings/services">}})

#### References

* None identified