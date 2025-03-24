---
title: "Activation and licencing"
weight: 25
description: "This section describes the design decisions associated with activation and licencing of Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

Licence keys and activation processes are leveraged by Microsoft to ensure that the device or user is eligible to use the feature or run the product (i.e. Windows 10).

Windows 10 and 11 licensing has evolved significantly since the initial release by Microsoft. In addition to the traditional activation methods for on-premises networks (KMS, MAK and AD Based Activation) it is also possible to use Windows Subscription Activation. The evolution of Windows 10 activation is described below:

* Starting from Windows 10 Pro version 1703, Windows 10 Subscription Activation feature enables a step up from Windows 10 Pro edition to Windows 10 Enterprise for those with a qualifying Windows 10 or Microsoft 365 subscription.
* Microsoft Entra ID is available for identity management.

Office 365 products require licensing to enable full functionality and support. The available activation methods are:

* **Office 365 based activation** - Office 365 is Microsoft's productivity solution in the cloud. Office 365 has two sets of suites, one for the small and medium business segment and one for the enterprise segment. These suites are sold across different channels and programs designed to meet each segment's needs. Products are assigned to users and then activated through the online Microsoft Office 365 licensing service.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                                                               | Design decision                                                                      | Justification                                                                                                                                                                                                                                                                                                                                                                                                           |
|------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Licencing for Microsoft Windows 10/11 Enterprise <br>Microsoft Office 365 E5 | Microsoft 365 E5 which includes Windows 10/11 E5, Office 365 E5 and EM+S E5 per user | For organisations to meet their obligations under the ISM, PSPF, and ASD's cloud guidance as they relate to PROTECTED security classification. It is recommended in this design that organisations purchase a Microsoft 365 E5 licence for each user.                                                                                                                                                                              |
| Windows Activation Method                                                    | Windows Subscription                                                                 | All devices will meet the requirements for Subscription Activation (a supported [Windows 10 version](https://learn.microsoft.com/windows/release-health/release-information) or [Windows 11 version](https://learn.microsoft.com/windows/release-health/windows11-release-information) and internet access), as this is the simplest solution to implement and manage as part of the licensing entitlement. |
| Office Activation Method                                                     | Office 365 Subscription                                                              | All devices meet the requirement for Office 365 activation (internet access) as this is the simplest solution to implement and manage as part of the licensing entitlement.                                                                                                                                                                                                                                             |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* [Microsoft 365 Licensing]({{<ref "design/shared-services/microsoft-365/licencing.md">}})

#### Configuration

* None identified

#### References

* None identified