---
title: "iOS devices"
weight: 5
description: "This section describes the design decisions associated with iOS endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

iOS follows a yearly major release cycle. With every major release of iOS, older iPhone devices are deprecated from support, hence security updates will not be available to these devices. 

Update policies control the update frequency of managed devices. Intune can define update policies that specify how and when service updates are deployed to iOS devices. By using update rings, it is possible to create an update strategy that mirrors business needs.

ASD’s *Blueprint for Secure Cloud* (the Blueprint) recommends organisations secure iOS for devices based on a variety of hardening guidance including the United States' (US) National Information Assurance Partnership [*Protection Profile for Mobile Device Fundamentals version 3.3*](https://www.niap-ccevs.org/Profile/Info.cfm?PPID=468&id=468), the US Department of Defence's [*Cyber Exchange Security Technical Implementation Guides (STIGs)*](https://public.cyber.mil/stigs/downloads/), the Centre for Internet Security's(CIS) [*Apple iOS Benchmarks*](https://www.cisecurity.org/benchmark/apple_ios), and ASD's [*Security Configuration Guidance for Apple iOS Devices*](https://www.cyber.gov.au/acsc/view-all-content/publications/security-configuration-guide-apple-ios-14-devices) to provide secure access to corporate information.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point            | Design Decision     | Justification                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
|---------------------------|---------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| iOS version               | iOS 16 or above     | To align with ASD's Security Configuration guide – iOS version enforcement of n or n-1 will allow for testing of patches and internal applications before deploying operating system updates.<br><br>Apple applies the n-1 rule to incremental updates, all other versions are no longer signed. Once a version is not signed a device cannot be restored to it. <br><br>iOS 17 is the latest version at time of writing, but a security configuration guide for that version has not yet been released by ASD's. organisations should review [security update notifications](https://support.apple.com/HT201222) from Apple for resolved vulnerabilities and determine an appropriate minimum supported version. |
| iOS Devices               | iPhone XS and above | iPhone X and older are all vulnerable to the exploit Checkm8 and should be avoided.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| Update Policies           | Configured          | To align with ASD's Security Configuration guide.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| Jailbroken/rooted devices | Blocked             | Prevents jail broken devices from accessing organisation information.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* [Protection Profile for Mobile Device Fundamentals version 3.3](https://www.niap-ccevs.org/Profile/Info.cfm?PPID=468&id=468)
* US Department of Defence [Cyber Exchange STIGs](https://public.cyber.mil/stigs/downloads/)
* CIS [Apple iOS Benchmarks](https://www.cisecurity.org/benchmark/apple_ios)
* ASD [Security Configuration Guidance for Apple iOS Devices](https://www.cyber.gov.au/acsc/view-all-content/publications/security-configuration-guide-apple-ios-14-devices)