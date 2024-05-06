---
title: Device Compliance
weight: 15
description: "This section describes the design decisions associated with Device Compliance for system(s) built using ASD's Blueprint for Secure Cloud."
---

Device Compliance Policies are rules, such as device PIN length or encryption requirements, that are applied to devices. These policies must be met before a device is considered compliant, the device compliance status can then be used by services such as Conditional Access to grant or disallow access to applications or services.

Microsoft Intune can control access to resources by interrogating endpoints and determining whether they meet a minimum list of features and are judged as "compliant". Compliance can be assigned a grace period where a non-compliant device can still access resources for a period, or the device can be blocked immediately. Each compliance policy can be edited to ensure that devices are tested before being allowed access to corporate resources.

Deployed device compliance profiles ensure a strong security posture for the entire Windows and iOS fleet. Compliance policies allow the organisation to ensure that baselines are met prior to access being granted to any corporate applications or data. The Windows 10 / 11 compliance policy settings include:

* **Device Health** - This includes BitLocker status and whether code integrity is enabled.
* **Device Properties** - Including a minimum and maximum operating system version.
* **Configuration Manager Compliance** - Whether the endpoint is compliant with all Configuration Manager evaluations. This is especially applicable in a co-managed scenario such as this deployment.
* **System Security** - Password compliance, standards, length and complexity. Also includes device level firewall, Trusted Platform Module (TPM), Antivirus, Anti-spyware and Microsoft Defender Antimalware settings.
* **Microsoft Defender for Endpoint** - Configures the maximum allowed machine risk score, if exceeded the device is marked as non-compliant.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point        | Design Decision                                                                  | Justification                |
| --------------------- | -------------------------------------------------------------------------------- | ---------------------------- |
| Compliance Assessment | Configured | Used for conditional access.<br>Requires compliance with Device Health, Device Properties and Microsoft Defender |

{{% /alert %}}

{{% alert title="Note" color="info" %}}

Since mobile devices routinely leave the office environment, and the protection it affords, it is important that organisations develop a mobile device usage policy governing their use.

{{% /alert %}}

### Related information

#### Security & Governance

* [System Monitoring]({{<ref "system-monitoring.md">}})
* [Enterprise Mobility]({{<ref "security-and-governance/system-security-plan/enterprise-mobility.md">}})

#### Design

* [Conditional Access]({{<ref "design/platform/identity/conditional-access">}})

#### Configuration

* [Compliance Policies]({{<ref "configuration/intune/devices/compliance-policies/policies">}})

#### References

* [Device Compliance Overview](https://docs.microsoft.com/mem/intune/protect/device-compliance-get-started)
