---
title: "Enterprise Applications"
weight: 45
description: "This section describes the design decisions associated with enterprise applications on Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

Enterprise applications provide organisations and end users the functionality they require to perform day to day activities. Applications can be delivered to the users desktop by one of the following methods:

* **Intune** – Ideally suited for Windows 10 and 11 only deployments. This is the only option for delivering application to iOS clients.
* **Microsoft Endpoint Configuration Manager (MECM)** – Ideally suited where organisations have a large existing investment of packaged applications. This is the only option for delivering application to servers. Ths is the only option for delivering virtual applications. 

Self-Service applications are requested by users directly. They can be delivered via Software Centre which is installed as part of the MECM client or Company Portal which is available as part of Intune and the Microsoft 365 tenant. As of MECM version 1802 "user-available" apps now appear in Software Centre under the applications tab where they were previously available in the Application Catalogue

Packaging methodology should be inherited from existing organisation procedures as each application has unique requirements. It is possible to repacked existing applications into an msix format which is compatible with both Intune and MECM delivery.

### Cloud native deployments

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                    | Design Decision         | Justification                                                                                                  |
|-----------------------------------|-------------------------|----------------------------------------------------------------------------------------------------------------|
| Application Delivery Technologies | Deployed via Intune     | Applications deployed via Intune and will be installed during the build deployment.                            |
| Self Service                      | Company Portal          | Enable users to install the apps needed while ensuring the SOE remains as light weight as possible.             |
| Packaging Methodology             | Organisation preference | Applications will be packaged according to organisation internal packaging standards and delivered via Intune. |

{{% /alert %}}

### Hybrid deployments

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                    | Design Decision                        | Justification                                                                                                                                                                                                             |
|-----------------------------------|----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Application Delivery Technologies | Deployed via Intune or MECM            | Applications deployed via Intune and will be installed during the build deployment.<br>MECM can continue to be used for existing applications, however consideration should be made to migrate these to Intune in future. |
| Self Service                      | Company Portal or MECM Software Center | Enable users to request install of specific apps while ensuring the SOE remains as light weight as possible.                                                                                                               |
| Packaging Methodology             | Organisation preference                | Applications will be packaged according to organisation internal packaging standards and delivered via MECM or Intune.                                                                                                    |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* None identified