---
title: "Windows Management"
weight: 10
description: "This section describes the design decisions associated with management of Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

Windows 10 and 11 can be managed via Intune or Microsoft Endpoint Configuration Manager (MECM), or a combination of both. The configuration of Windows management will depend upon which technologies are available to organisations and whether a hybrid deployment is required.

Windows management options will be based on either a deployment which is cloud native or hybrid. This section provides detailed information on the different configuration options for Windows management.

Cloud native deployments provides the organisation the immediate benefits of working with Intune and Windows Autopilot while also integrating directly with other cloud services including Microsoft 365 and Azure Active Directory (AAD). Using Intune will simplify the overall deployment and management of Windows to a single console which is also shared with the mobile device management of iOS devices.

Hybrid deployments give the option of co-management which enables the organisation to manage Windows by using both MECM and Intune. Enabling co-management within MECM allows the organisation to utilise their investment in MECM and take advantage of additional cloud capabilities. This gives the organisation additional flexibility to use the technology solution that works best for them and facilitates a more gradual move to cloud native as the organisation can pilot test various workloads in Intune first.

Hybrid deployments can choose to enable MECM or Intune for client management depending on the cloud maturity level of the organisation or operational requirements. It is not a requirement of organisations undertaking hybrid implementations to use MECM. The Blueprint provides guidance on integration between MECM and Intune for hybrid deployments however organisations with existing infrastructure may alternatively elect to migrate device management from MECM to Intune, which will not affect cybersecurity postures.

Management methods that can be used to manage Windows in a Microsoft 365 environment.

| Microsoft 365 Implementation  | MECM Implementation                                                                             | Management Method for Windows | Benefits                                                                                                                                                                                                                                                                                 |
|-------------------------------|-------------------------------------------------------------------------------------------------|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Cloud native                  | MECM is possible with cloud native depedent on CMG (Cloud Management Gateway) and leveraging Co-Management.                                                          | Intune                        | No on-premises infrastructure required for management, unless you want to leverage Co-Management with MECM. Well suited for Microsoft Entra ID joined workstations for a full cloud solution.                                                                                                                                                 |
| Hybrid with Intune management | Suitable for:<br> * No MECM or<br>* MECM with co-management enabled and Workloads set to Intune | Intune                        | Existing on-premises MECM infrastructure with Hybrid Microsoft Entra ID joined workstation. Well suited for an organisation that does not have MECM or does not want to use MECM to manage workstations.                                                                                 |
| Hybrid with MECM management   | MECM with co-management enabled and Workloads set to MECM                                       | MECM                          | Existing on-premises MECM infrastructure with Hybrid Microsoft Entra ID joined workstations. Well suited for an organisation that has a significant investment in MECM and requires a more gradual migration to Intune. Individual Workloads can be targeted and pilot-tested in Intune. |


With co-management enabled, the organisation can choose which workloads remain on-premises and which workloads are offloaded to Intune. The workloads are:

* **Compliance Policies** – Compliance policies define the rules and settings that a device must comply with to be considered compliant by conditional access policies. Compliance policies will also monitor and remediate compliance issues with devices. 
* **Device Configuration** – The device configuration workload includes settings that are managed for devices in the organisation. Switching this workload also moves the Endpoint Protection and Resource Access workloads.
* **Endpoint Protection** – The Endpoint Protection workload includes the Windows Defender suite of antimalware protection features including Defender Advanced Threat Protection.
* **Resource Access Policies** – Resource access policies configure VPN, Wi-Fi, email, and certificate settings on devices.
* **Client Apps** – Use Intune to manage client apps and PowerShell scripts on co-managed Windows devices. After transitioning this workload, any available apps deployed from Intune will be available in the Company Portal. Apps that are deployed from Configuration Manager are available in Software Centre.
* **Office Click-to-Run Apps** – This workload manages Office 365 apps on co-managed devices.
* **Windows Update Policies** – Windows Update for Business policies allow deferral policies for Windows feature updates or quality updates for Windows devices managed directly by Windows Update for Business.

With co-management disabled and no cloud integration, the organisation will rely on on-premises management of the Windows workstations. These could include utilising MECM task sequencing, MECM Compliance and Endpoint Protection policies, various scripting methods and Group Policy Preferences. 

There are many benefits to going cloud native or hybrid co-management utilising workloads weighted to Intune. The workstations can be managed from any internet-connected location whether that be in the office or a remote location (home, client site etc).

### Cloud native deployments

{{% alert title="Design decisions" color="warning" %}}

| Decision point    | Design decision                | Justification                                                                                                            |
|-------------------|--------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Management method | Cloud native Intune management | Cloud native implementation offers a simple and efficient implementation. Single console to manage both Windows and iOS. |

{{% /alert %}}

### Hybrid deployments

{{% alert title="Design decisions" color="warning" %}}

| Decision point    | Design decision                                                                 | Justification                                                                                                                                                                                                                                                                                              |
|-------------------|---------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Management method | Hybrid with MECM co-management enabled.                                         | Intune integration is required to enable features such as Conditional Access. <br>MECM co-management offers flexibility for the organisation to take advantage of cloud services immediately or pilot and move individual workloads across when ready while leveraging existing configuration on-premises. |
| Management tool   | Organisation preference for Intune or MECM managing endpoints in co-management. | Each organisation has a different level of investment and different maturity in MECM and cloud products. Co-management has several options to meet the unique requirements of each organisation.                                                                                                           |

{{% /alert %}}

### Related information

#### Security & Governance

* [Essential Eight - User Application Hardening]({{<ref "security-and-governance/essential-eight/user-application-hardening.md">}})
* [Essential Eight: Patch Operating Systems]({{< ref "patch-os.md">}})
* [System Management]({{<ref "system-management.md">}})

#### Design

* [Enterprise applications]({{<ref "enterprise-applications.md">}})

#### Configuration

* None identified

#### References

* None identified
