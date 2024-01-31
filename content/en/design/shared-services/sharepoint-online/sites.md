---
title: "Sites"
weight: 50
description: "This section describes the design decisions associated with SharePoint Sites for system(s) built using ASD's Blueprint for Secure Cloud."
---

SharePoint Online provides the ability to create Intranet sites and Team Sites for groups to collaborate and manage their documents. A SharePoint site enables members of a team or from other teams to contribute content on a single platform. The information is limited to the members of the team or project.

The creation and storage sizing of SharePoint Online sites can be controlled. Out of the box, users can create SharePoint sites and these sites have no storage limits applied. Without restriction there is potentially a large management overhead so it is suggested to set the limit default to 200GB.

Administrators can put controls in place which restricts who can create a SharePoint site and set the size requirements.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                                             | Design Decision                                                                                                                                       | Justification                                                                                                                                                       |
|------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| SharePoint site naming convention                          | Avoid spaces and special characters in site collection naming                                                                                         | Spaces and special characters can cause problems with indexing and extend the length of the path. Short names are easier to remember                                |
| Configure Site Storage limits                              | Configured                                                                                                                                            | Currently set to manually set site storage limits. Larger storage can increase management therefore default limit will be set to 200GB.                             |
| Block access from unmanaged devices                        | Configured with `Allow limited web only access`                                                                                                       | Default settings                                                                                                                                                    |
| Enable Idle Session sign outs                              | Sign out users after 1 hr<br>Give users this much notice before signing out: 5 minutes                                                                | Default settings                                                                                                                                                    |
| Only allow access from specific IP address locations       | Not configured                                                                                                                                        | Location based access is controlled via Conditional Access policies                                                                                                 |
| Only allow access from apps that use modern authentication | Enabled                                                                                                                                               | The security risk associated with allowing apps that don’t use modern authentication. Note that additional conditional access policy is in place to block legacy authentication access. |
| Use of Root site https://organisationsites.sharepoint.com/ | Root site to be used for future core Intranet site and joined with related sites via hub site functionality. Root site to be defined as the Home Site | Best practice to use root site for Intranet and set as Home Site as this makes it more intuitive for organisational users                                           |
| Sub site creation                                          | Disable creation of subsites                                                                                                                          | Recommended Modern SharePoint Online Information Architecture is to create site collections and join together as Hub sites                                          |
| Hub site creation                                          | SharePoint Administrators only                                                                                                                        | To ensure governance of the management of hub sites                                                                                                                 |
| Who can create a new site                                  | Restricted to SharePoint Administrator and Global Administrator roles                                                                                 | Users will need to request a new SharePoint site to ensure that it is created with the correct controls, for example template type, storage and classification.     |
| Multi-Geo SharePoint                                       | Not enabled                                                                                                                                           | SharePoint Online Data residency only within Australia                                                                                                              |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* None identified