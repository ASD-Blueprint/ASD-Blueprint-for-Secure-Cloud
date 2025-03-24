---
title: "Windows Update and Patching"
weight: 105
description: "This section describes the design decisions associated with updates and patching on Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

Many updates released for operating systems and application contain bug fixes and security updates. Vulnerabilities can be exploited by malicious code or hackers and need to be patched as soon as possible.

A risk assessment of a vulnerability is essential in determining the time-frame for applying patches. There are many different sources and indicators that will help with this assessment, for example if the vendor releases a patch outside of their normal patching cycle and its marked as a critical update then it is worth immediate investigation and deployment to see how it could affect organisation.

It is vital to have a robust and reliable patch management solution based on industry best practices.

For Microsoft Windows environments the primary patching technologies are:

* **Windows Server Update Service** – WSUS enables administrators to deploy the most recent Microsoft updates. A WSUS server connects directly to Microsoft Update or an "upstream" WSUS server. This enables administrators to control what updates are applied and when, rather than having every computer on the network going to the Internet and installing every available update immediately.
* **Microsoft Endpoint Configuration Manager (MECM)** – MECM integrates with a WSUS server to deliver patch management. WSUS obtains updates from the internet and MECM is used to approve and deploy the updates. Using MECM to deploy software updates enables more control over many aspects of the process such as targeting, maintenance windows, scheduling, and reporting.
* **Microsoft Intune** – Windows Update for Business provides management policies for several types of updates to Windows devices.
  * Feature updates: feature updates contain security and quality revisions, significant feature additions and changes; they are released semi-annually in March and September.
  * Quality updates: these are traditional operating system updates, typically released the second Tuesday of each month (though they can be released at any time). These include security, critical, and driver updates. Windows Update for Business also treats non-Windows updates (such as those for Microsoft Office or Visual Studio) as quality updates. These non-Windows Updates are known as "Microsoft updates" and can configure devices to receive or not receive such updates along with their Windows updates.
  * Driver updates: these are non-Microsoft drivers that are applicable to the devices. Driver updates can be turned off by using Windows Update for Business policies.
  * Microsoft product updates: these are updates for other Microsoft products, such as Office. These updates can be enabled or disabled by using Windows Update for Business policy.

Update rings are policies that are assigned to groups of devices. Intune can define update rings that specify how and when service updates are deployed to Windows devices. By using update rings, it is possible to create an update strategy that mirrors business needs.

To deploy patches to endpoints as quickly as possible, client-side settings should not restrict or delay the installation of patches where it does not interfere with critical operation or cause loss of data due to unexpected reboots.

{{% alert title="Design decisions" color="warning" %}}

| Decision point            | Design decision                                                          | Justification                                                                                                                                                                                                                                                                                           |
|---------------------------|--------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Patching technology       | Organisation preference of Intune, MECM or WSUS                          | For cloud native deployments, Intune is the only option available.<br><br>For hybrid deployments, all three options are available for implementation. Intune provides a simpler approach to patching whilst MECM and WSUS provide more granular control of patch deployment.                            |
| Patching Testing Method   | Pilot and Production                                                     | Enables early deployment and test of Windows updates to selected users prior to the full release of updates to the remaining users.<br><br>The Pilot group will be a select number of users who will actively provide feedback on updates before rollout to all users.                                   |
| Feature Updates           | Enabled                                                                  | To align with ASD's [*Hardening Microsoft Windows 10 version 21H1 Workstations*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/hardening-microsoft-windows-10-version-21h1-workstations) guidance.                                                                                                                                                                                                                                                      |
| Quality Updates           | Enabled                                                                  | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                                                                                                                                                                                                      |
| Driver Updates            | Enabled                                                                  | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                                                                                                                                                                                                       |
| Microsoft Product Updates | Enabled                                                                  | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                                                                                                                                                                                                       |
| Patching Frequency        | Existing organisation patch scheduling based on Essential Eight guidance | The organisations existing patch schedule should reflect:<br><br>Patches, updates or vendor mitigations for security vulnerabilities in operating systems are applied two weeks of release, or within 48 hours if an exploit exists. <br>Meets ASD's [*Essential Eight*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/essential-eight) guidance for patching operating systems. |

{{% /alert %}}

### Related information

#### Security & Governance

* [Essential Eight - Patch Operating Systems]({{<ref "security-and-governance/essential-eight/patch-os.md">}})
* [Essential Eight: Patch Applications]({{< ref "patch-applications.md">}})

#### Design

* [Windows Update and Patching]({{<ref "design/endpoints/windows/configuration/windows-update-and-patching.md">}})

#### Configuration

* [ASD Windows Hardening Guidelines]({{<ref "configuration/intune/devices/configuration-policies/asd-windows-hardening-guidelines.md">}})

#### References

* None identified