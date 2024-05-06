---
title: Application Data Protection
weight: 5
description: "This section describes the design decisions associated with Application Data Protection for system(s) built using ASD's Blueprint for Secure Cloud."
---

Within Microsoft Intune, application protection policies are rules that ensure organisations' data remains safe or contained in a managed application. An application protection policy can be a rule that is enforced when the user attempts to access or move 'corporate' data, or a set of actions that are prohibited or monitored when the user is inside the app.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                                                                 | Design Decision                                               | Justification                                                                                                      |
|--------------------------------------------------------------------------------|---------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------|
| Mobile Application Management (MAM) or Mobile Device Management (MDM) policies | MDM will be used to apply application protection policies.    | MAM based policy is not able to manage non-enlightened line of business applications. (Non-Microsoft Office apps). |
| Desktop Protected Apps                                                         | All Microsoft Office desktop applications will be protected.  | Advice on additional desktop applications is included in the Blueprint.                                                 |
| Mobile Apps                                                                    | Default set will be protected on mobile devices.              | Default set of mobile apps covers all of the apps referred to in the Blueprint.                                               |
| Network Boundary – Cloud Resources                                             | Default SharePoint URLs will be protected.                    | If additional URLs are identified these can also be added to the Cloud Resources scope.                            |
| Network Boundary – Network Domain                                              | Production domain will be protected.                          | If additional network subnets are identified these can also be added to the Network Domain scope.                  |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* [Enterprise Mobility]({{<ref "security-and-governance/system-security-plan/enterprise-mobility.md">}})

#### Configuration

* [iOS and iPadOS]({{<ref "configuration/intune/apps/by-platform/ios-ipados.md">}})
* [Windows]({{< ref "configuration/intune/apps/by-platform/windows.md">}})
* [Microsoft Intune - profile configurations]({{<ref "configuration/intune/devices/configuration-profiles">}})

#### References

* [Intune Device and Data Protection Overview](https://docs.microsoft.com/mem/intune/protect/device-protect)
* [Mobile Application Management Overview](https://docs.microsoft.com/mem/intune/apps/app-management)
* [Windows Information Protection](https://docs.microsoft.com/mem/intune/protect/windows-information-protection-configure)
* [Intune Protected Apps](https://docs.microsoft.com/mem/intune/apps/apps-supported-intune-apps)
