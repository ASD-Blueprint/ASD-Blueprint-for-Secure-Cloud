---
title: "Compliance Manager"
linkTitle: "Compliance Manager"
weight: 50
description: "This section describes the design decisions associated with Compliance Manager with Microsoft Purview for system(s) built using ASD's Blueprint for Secure Cloud."
---

Compliance Manager helps automatically assess and manage compliance across Microsoft 365 services, apps and endpoints by assessing their configurations against common industry standards and regulations. These standards and regulations are implemented as *assessments* that are comprised of a set of requirements, known as *controls*, that relate to specific configurations. Controls are described alongside improvement actions to address configuration compliance, with compliance status being reported and alerts able to be generated for configuration changes.

Assessments exist for many different Australian and international standards and regulations, including for ASD's Essential Eight Maturity Model and *Information Security Manual* (ISM), and while both assessments are based on older frameworks they still provide significant and relevant compliance advice and so are recommended for implementation.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                       | Design Decision                                   | Justification                                                     |
| ------------------------------------ | ------------------------------------------------- | ----------------------------------------------------------------- |
| Using Compliance Manager assessments | Add assessments for ASD's Essential Eight and ISM | Facilitate security compliance reporting and configuration advice |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* [Compliance Manager]({{<ref "configuration/purview/compliance-manager">}})

#### References

* [Essential Eight Maturity Model](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/essential-eight/essential-eight-maturity-model)
* [Information Security Manual (ISM)](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism)
* [Microsoft Purview Compliance Manager](https://learn.microsoft.com/en-us/purview/compliance-manager)
