---
title: "Components"
weight: 25
description: "This section provides an overview of the key components associated with system(s) built on ASD's Blueprint for Secure Cloud."
---

### Core Platform Services

#### Identity

ASD's *Blueprint for Secure Cloud* (the Blueprint) leverages Microsoft Entra ID as the primary Authentication an Authorisation service. Previously known as Azure Active Directory, Entra ID is Microsoft's multi-cloud identity and access management solution. All Microsoft 365 workloads use Entra ID making it a central element across Microsoft's online services. It additionally enables third-party system, service and application integration providing them with benefits such as single sign-on, multi-factor authentication, automatic provisioning and Conditional Access. Underpinning Entra ID is an entire product family which includes the following:

* **Microsoft Entra Permissions Management:** This is Microsoft's Cloud Infrastructure Entitlement Management (CIEM) solution which provides discovery, remediation and permissions monitoring across Microsoft Azure, Amazon AWS, Google Cloud Platform and others.
* **Microsoft Entra Verified ID:** Microsoft's decentralised identity solution to enable secure interactions between identities, applications and resources.
* **Microsoft Entra Workload Identities:** Workload identities are applications, service principals and managed identities and consists of a group of features to secure, manage and monitor identities as opposed to a single service.
* **Microsoft Entra Identity Governance:**: Enables organisations to manage the identity lifecycle across cloud services and on-premises solutions and systems.

#### Network Connectivity

The Blueprint addresses four scenarios relating to connectivity discussed within [Microsoft 365 Connectivity]({{<ref "microsoft365-connectivity">}})

#### Monitoring Auditing and Security

The Blueprint currently provides guidance on implementation of a Microsoft 365 tenant and services. Compliance, security, monitoring and auditing will therefore be provided by the variety of solutions available within a Microsoft 365 E5 licence. This includes:

* **Microsoft Defender:**
  *   Microsoft Defender for Cloud Apps
  *   Microsoft Defender for Endpoints
  *   Microsoft Defender for Identity
  *   Microsoft Defender for Office 365
  *   Microsoft Defender Vulnerability Management (MDVM)
* **Microsoft Information Protection**
* **Microsoft Purview**
* **Log Analytics**

#### Device Management & Secure Endpoints

The Blueprint provides guidance on configuration of Microsoft Intune to manage:
* endpoint provisioning
* device and security configuration
* application deployment and control
* processes to update the above components. 

### Application Services

The Blueprint provides guidance on configuration for a range of Microsoft 365 services which cover core productivity, collaboration, development and information storage requirements. Services include:
* Exchange Online
* SharePoint Online
* OneDrive for Business
* Teams
* Power Platform
* Office 365
