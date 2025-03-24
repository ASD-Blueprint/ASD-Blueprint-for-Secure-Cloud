---
title: Application and HR Provisioning
weight: 85
description: "This section describes the design decisions associated with automated provisioning of user identities for system(s) built using ASD's Blueprint for Secure Cloud."
---

Entra ID to SaaS application provisioning refers to automatically creating user identities and roles in the cloud (SaaS) applications that users need access to. In addition to creating user identities, automatic provisioning includes the maintenance and removal of user identities as status or roles change. The System for Cross-Domain Identity Management (SCIM) specification provides a common user schema to help users move into, out of, and around apps.

Provisioning can be done in two modes:

* **Manual** - There is no automatic Entra ID provisioning connector for the app yet. User accounts must be created manually, for example by adding users directly into the app's administrative portal.

* **Automatic** - an Entra ID provisioning connector has been developed for this application. For pre-integrated applications listed in the gallery, step-by-step guidance is available for setting up automatic provisioning.

The provisioning mode supported by an application is also visible on the Provisioning tab once the application added to the Enterprise apps. If there is no out of the box connector, and the SaaS application is SCIM 2.0 enabled then a custom SCIM Endpoint can be developed.

{{% alert title="Design decisions" color="warning" %}}

| Decision point | Design decision                       | Justification                                                                                                             |
| -------------- | ------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| Provisioning   | Configured per service as appropriate | Use automated where out of the box connectors exists. Custom SCIM endpoints allowed with separate security accreditation. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* None identified

#### References

* [Application Provisioning Overview](https://learn.microsoft.com/entra/identity/app-provisioning/user-provisioning)
* [How Provisioning Works](https://learn.microsoft.com/entra/identity/app-provisioning/how-provisioning-works)
