---
title: "Content Migration"
weight: 40
description: "This section describes the design decisions associated with One Drive Content Migration for system(s) built using ASD's Blueprint for Secure Cloud."
---

The implementation of OneDrive for Business can be coupled with a migration from an existing on-premises SharePoint farm infrastructure. This migration can take the form of one of the following:

* **OneDrive (SharePoint 2010/2013)** – Administrators can move an existing OneDrive site hosted to SharePoint Online. Administrators can also leverage the capability of a Hybrid configuration to automatically redirect users to their OneDrive for Business post migration.
* **Network and local file shares** – Most users will have a personal drive or a designated location on the network to save work which may not have a function assigned. To free up network storage and extend the ability to access files in the cloud, administrators can move files from a specific network path to the user's OneDrive for Business site.

If a migration is not required, the deployment is referred to as a 'Greenfield deployment'.

Access to OneDrive can be controlled to ensure the organisation's data is protected. This includes the configuration of:

* Only allowing access from specific IP address locations.
* Only allowing access from applications that use modern authentication.
* Only syncing to PCs joined to a specific domain.

On deletion of a user's OneDrive account, its content will be deleted. The deletion period can be customised, however it is recommended that the data be archived in an external system or migrated to a SharePoint Site.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point  | Design Decision                                                                                                                                 | Justification                                                                                              |
|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------|
| Deployment Type | Migration of data is out of scope for the Blueprint however Microsoft provides vendor guidance on possible migration paths for the organisation. | Migration method is dependent on the outcome of an assessment of quantity and type of data to be migrated. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* None identified

#### References

* [Content Migration](https://docs.microsoft.com/onedrive/plan-onedrive-enterprise#migrating-data)