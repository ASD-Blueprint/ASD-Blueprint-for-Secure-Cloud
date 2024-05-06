---
title: "Dataverse and Power Apps Model Driven Apps"
weight: 55
description: "This section describes the design decisions associated with usage of Dataverse and Power Apps Model Driven Apps for system(s) built using ASD's Blueprint for Secure Cloud."
---

Dataverse is a platform-as-a-service (PaaS) database service enabling organisations to securely store and manage data used by business applications such as Power Apps Model Driven Apps and Dynamics 365. Data within Dataverse is stored in a set of tables which consists of a set of rows and columns. Each column within a table is designed to store select data. For example a table to store information about people may have columns for name, date of birth, address, salary, etc. Dataverse includes a base set of standard tables that cover typical scenarios, but users can also create custom tables specific to their requirements. The Dataverse can be populated with data by using Power Query. App makers can use Power Apps to build applications that use this data. 

Note the following:

* A Power Platform environment can have one or zero Dataverse instances.
* Additional licensing to Microsoft 365 E5 may be required to fully utilise Microsoft Dataverse. 
* Microsoft Dataverse for Microsoft Teams provides the capability to provision a Dataverse instance specific to a Team within Microsoft Teams, which also provisions a separate environment.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                          | Design Decision       | Justification                                                                                                                                                                                                                         |
|-----------------------------------------|-----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Dataverse usage                         | Enabled               | Dataverse will be enabled within the default Power Platform environment as this is required to support connectors.<br>Organisations need to evaluate Dataverse requirements in requests for any new Power Platform environments. |
| Microsoft Dataverse for Microsoft Teams | Organisation decision | Power Apps for Teams App (required to create a Microsoft Teams linked Dataverse instance) requires Admin access as per Teams App Setup Policies within Teams Admin Centre.                                                       |
| Power Platform Data Integration         | Disabled              | A setting within Power Platform Admin Centre - relates to integration of data into Dataverse which will not be initially utilised for integration purposes.                                                                      |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* None identified

#### References

* [What is Dataverse?](https://docs.microsoft.com/power-apps/maker/data-platform/data-platform-intro)

