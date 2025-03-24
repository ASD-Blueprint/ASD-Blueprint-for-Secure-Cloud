---
title: Device Updates
weight: 30
description: "This section describes the design decisions associated with Device Updates using Endpoint Manager for system(s) built using ASD's Blueprint for Secure Cloud."
---

Windows Update for Business uses Intune to manage the installation of updates and features from Microsoft Windows Update servers. There is no requirement or ability to selectively enable or disable a particular update.

{{% alert title="Note" color="info" %}}

Intune only stores the update policy assignment. It does not store the actual update files, so there is no requirement for on-premises servers or storage of update files.

{{% /alert %}}

Within Intune there are four main update types for devices installed with Windows 10 and later:

* **Feature Updates** - Released annually. Feature updates add new features and functionality to Windows.
* **Quality updates** - Include security updates, critical updates, servicing stack updates, and driver updates. They are typically released on the second Tuesday of each month, though they can be released at any time. The second-Tuesday releases are the ones that focus on security updates. Quality updates are cumulative, so installing the latest quality update is sufficient to get all the available fixes for a specific feature update, including any out-of-band security fixes and any servicing stack updates that might have been released previously.
* **Driver updates** - These update the drivers applicable to an organisation's device(s). Driver updates are turned off by default in Windows Server Update Services (WSUS), but for cloud-based update methods, organisations can control whether they are installed or not.
* **Microsoft product updates** - These update other Microsoft products, such as Office. Organisations can enable or disable Microsoft updates by using policies controlled by various servicing tools.

Organisations can choose to apply updates for all of their devices or groups of devices from the three available servicing channels: 

* **General Availability Channel** - Feature updates are released annually. As long as a device isn't set to defer feature updates, any device in this channel will install a feature update as soon as it's released. If the organisation uses Windows Update for Business, the channel provides three months of additional total deployment time before being required to update to the next release.
* **Windows Insider Program for Business** - Insider preview releases are made available during the development of the features that will be shipped in the next feature update, enabling organisations to validate new features and compatibility with existing apps and infrastructure, providing feedback to Microsoft on any issues encountered.
* **Long-term Servicing Channel** - The Long-Term Servicing Channel is designed to be used only for specialised devices (which typically don't run Office) such as ones that control medical equipment or ATMs. Devices on this channel receive new feature releases every two to three years.

Intune provides the ability to manage when devices are updated through policy types, which can be assigned to groups of devices:

* **Update Rings for Windows 10 and later** - This policy is a collection of settings that configures when devices that run Windows 10 and Windows 11 updates get installed.
* **Feature updates for Windows 10 and later** - This policy updates devices to the Windows version specified by the organisation, and then freezes the feature set version on those devices. This version freeze remains in place until the organisation updates them to a later Windows version. While the feature version remains static, devices can continue to install quality and security updates that are available for their feature version.
* **Quality updates for Windows 10 and Later policy** - expedite the install of the most recent Windows 10/11 security updates as quickly as possible on devices managed via Microsoft Intune. Deployment of expedited updates is done without the need to pause or edit the existing monthly servicing policies. With expedited updates, the installation of quality updates like the most recent patch Tuesday release or an out-of-band security update for a zero-day flaw can be sped up.

{{% alert title="Note" color="info" %}}

Organisations should consider creating multiple device groups to enable testing of new features through the Windows Insider Program which can be applied to early adopters before providing to all users via the General Availability Channel.

{{% /alert %}}

{{% alert title="Note" color="info" %}}

While it is possible to use both the update rings policy with update deferrals and feature updates policy, the use of deferrals should be ended. Combining update ring deferrals with feature updates policy creates complexity which may delay update installations. When both policy types are applied to a device, the conditions of both policy types must be met on the device before it is offered an applicable update. This scenario can lead to updates not installing as expected due to a block by one of the policy types. To de-conflict the policies set the `Feature update deferral period (days) to a value of 0`

{{% /alert %}}

{{% alert title="Note" color="info" %}}

When deploying a hybrid solution, the software and patch updates of Windows devices should be considered. Other management solutions such as Microsoft Endpoint Configuration Manager and WSUS may be servicing the Windows devices for the updates and hence duplicating processes.

{{% /alert %}}

{{% alert title="Design decisions" color="warning" %}}

| Decision point                  | Design decision                                                                                                                                          | Justification                                                                                              |
| ------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| **Update Ring Policy**          |                                                                                                                                                          |                                                                                                            |
| Servicing Channel               | General Availability Channel                                                                                                                             | Aligns with ASD's [*Patching Applications and Operating Systems*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-administration/patching-applications-and-operating-systems) guidance.                                                    |
| Microsoft Product updates       | Allow                                                                                                                                                    | Aligns with ASD's *Patching Applications and Operating Systems* guidance.                                                             |
| Windows Drivers                 | Allow                                                                                                                                                    | Aligns with ASD's *Patching Applications and Operating Systems* guidance.                                                              |
| Quality Deferral period         | 0 days                                                                                                                                                   | De-conflict with Quality Policy Settings.                                                                   |
| Feature Deferral                | 0 days                                                                                                                                                   | De-conflict with Feature Policy Settings.                                                                   |
| Feature Update uninstall period | 10 days                                                                                                                                                  | Enables reversal for a short period of time in the event of breaking change updates.                        |
| **Feature Updates Policy**      |                                                                                                                                                          |                                                                                                            |
| Feature Updates                 | Enabled for feature releases                                                                                                                             | Manually control deployment of Feature Releases / Operating System Versions (Win 11) to specified devices. |
| Expedite Updates Policy         | Enabled for Zero Security Updates                                                                                                                        | Address extreme security risks within 48 hours.                                                              |
| **Compliance Reporting**        |                                                                                                                                                          |                                                                                                            |
| Windows Health Monitoring       | Enabled through [Device Configuration Policy](https://learn.microsoft.com/en-us/mem/intune/protect/windows-update-reports) | Allows Windows Update Compliance Reporting.                                                                 |

{{% /alert %}}

{{% alert title="Note" color="info" %}}

Feature updates for Windows 10 and later policies cannot be applied during the Autopilot out-of-box experience (OOBE). Instead, the policies apply at the first Windows Update scan after a device has finished provisioning, which is typically a day. Compliance Policies are delayed to take this into account.

{{% /alert %}}

To avoid conflicts or configurations which might block installation of expedited updates, update rings policies should have the following settings:

* Enable Pre-release: `Not Configured`
* Automatic Update Behaviour: `Reset to default`
* Change Notification Update Level: `Turn off all notifications including restart warnings`

Intune supports the following reporting options to enable monitoring and troubleshooting of deployment updates:

* **Reports in Intune**:
    * Windows 10 and later update rings - Use a built-in report that's ready by default when update rings are deployed to an organisation's devices.
    * Windows 10 and later feature updates - Use two built-in reports that work together to gain a deep picture of update status and issues. These reports require data collection from devices to be configured before the reports can display data about feature updates.
* **Update Compliance**:
    * Use Update Compliance with Intune to monitor Windows update rollouts. [Update Compliance](https://docs.microsoft.com/windows/deployment/update/update-compliance-monitor) is a free service built on Azure Monitor and Log Analytics.

### Windows Autopatch

Included with Windows 10/11 Enterprise E3 and above licences is the Windows Autopatch feature. Autopatch will automate patching for Windows, Microsoft 365 Apps for Enterprise, Microsoft Edge, Microsoft Teams, and Microsoft drivers and firmware for their Surface devices and peripherals to alleviate some of the manual labour involved with patching. It is configured through update policies within Microsoft Intune which enables administrators to define multiple update rings. 

Organisations should consider use of Windows Autopatch in accordance with their patching policy and processes aligning with their risk appetite. For organisations electing to leverage Windows Autopatch, Microsoft has published the [Autopatch enrolment steps](https://learn.microsoft.com/compliance/essential-eight/e8-patch-os#autopatch-enrollment-steps) guidance.

### Related information

#### Security & Governance

* [System Monitoring]({{<ref "system-monitoring.md">}})
* [Essential Eight - Patch Operating Systems]({{<ref "security-and-governance/essential-eight/patch-os.md">}})
* [Essential Eight - Patch Applications]({{<ref "security-and-governance/essential-eight/patch-applications.md">}})
* [Essential Eight - User Application Hardening]({{<ref "security-and-governance/essential-eight/user-application-hardening.md">}})
* [Enterprise Mobility]({{<ref "security-and-governance/system-security-plan/enterprise-mobility.md">}})

#### Design

* [Windows Update and Patching]({{<ref "windows-update-and-patching">}})

#### Configuration

* None identified

#### References

* [Windows updates in Intune](https://docs.microsoft.com/mem/intune/protect/windows-update-for-business-configure)
* [Windows Update Type and Channels](https://docs.microsoft.com/windows/deployment/update/get-started-updates-channels-tools#types-of-updates)
* [Windows Builds and Release History](https://docs.microsoft.com/windows/release-health/release-information)
* [Allow Telemetry](https://docs.microsoft.com/windows/client-management/mdm/policy-csp-system#system-allowtelemetry)
* [Update Compliance](https://docs.microsoft.com/windows/deployment/update/update-compliance-monitor)
* [Servicing Cadence](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/windows-10-update-servicing-cadence/ba-p/222376)
* [Health Monitoring](https://docs.microsoft.com/mem/intune/configuration/windows-health-monitoring)
* [Windows Autopatch](https://learn.microsoft.com/compliance/essential-eight/e8-patch-os#windows-autopatch)