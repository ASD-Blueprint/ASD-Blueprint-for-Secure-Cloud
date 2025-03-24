---
title: "Legacy Features"
weight: 50
description: "This section describes the design decisions associated with SharePoint Legacy Features for system(s) built using ASD's Blueprint for Secure Cloud."
---

Legacy features allow for backwards compatibility for legacy capabilities from SharePoint on-premises to SharePoint Online. Legacy features are enabled only when there is a reason to do so, as they may restrict the features available within SharePoint Online. SharePoint Online provides legacy features by default to ensure backwards compatibility with legacy SharePoint on-premises solutions.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                 | Design decision                                                                                     | Justification                                                                                                                                                                                                                                                                                                                                                                                                       |
|--------------------------------|-----------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| InfoPath                       | Not configured                                                                                      | InfoPath is going to be deprecated and it is recommended that InfoPath forms to be redeveloped into PowerApps in Office 365.                                                                                                                                                                                                                                                                                        |
| Records Management             | Not configured                                                                                      | Records Management administrative screen provides configuration settings to route files from a SharePoint Document Library to a centralised SharePoint Records Management site. This is to support the traditional Centralised records management system in SharePoint.<br>**Note**, this is a separate feature from [records management in Microsoft 365](https://learn.microsoft.com/purview/records-management). |
| Secure Store Settings          | Not Configured                                                                                      | Secure Store in SharePoint Online provides a key vault to store all sensitive information in SharePoint. This is primarily used by InfoPath to store sensitive keys and passwords. It is recommended to use Azure Key Vault to store sensitive information.                                                                                                                                                         |
| Business Connectivity Settings | Not configured                                                                                      | Business Connectivity Settings provides SharePoint on-premises ability to consume information from a third party OData Information store.<br>It is recommended to use Power BI to consume third party data and publish it to SharePoint Online.                                                                                                                                                                     |
| Search                         | Not configured                                                                                      | Search provides legacy support on crawled properties, managed properties and custom configuration required.                                                                                                                                                                                                                                                                                                         |
| Term Store                     | To be configured based on the existing or future organisational taxonomy and meta data requirements | Term store is configured for the solution if required by the organisation. Term store provides a consistent taxonomy and ontology for the organisation. This enables ease of search for information within SharePoint.                                                                                                                                                                                              |
| User Profile                   | Not configured                                                                                      | User Profiles provide legacy support of custom properties for users and complied audience.                                                                                                                                                                                                                                                                                                                          |
| Hybrid Picker                  | Not configured                                                                                      | This is to ensure hybrid term stores are synchronised between SharePoint Online and on-premises.                                                                                                                                                                                                                                                                                                                    |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* None identified

#### References

* None identified