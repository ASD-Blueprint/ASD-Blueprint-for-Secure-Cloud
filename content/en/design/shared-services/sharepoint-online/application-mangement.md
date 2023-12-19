---
title: "Application Management"
weight: 50
description: "This section describes the design decisions associated with SharePoint Application Management for system(s) built using ASD's Blueprint for Secure Cloud."
---

Application management enables the organisation to control who can purchase third party applications for SharePoint Online. These apps can be purchased from [Microsoft Appsource](https://appsource.microsoft.com/marketplace/apps?product=sharepoint) and used within SharePoint Online itself.

SharePoint default methods of displaying and sharing of sharing data are available. Third party applications may circumvent controls or auditing and provide other methods of displaying or sharing of SharePoint data. Any third-party applications will need to be validated for compliance.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                                                                | Design Decision | Justification                                                                                                                      |
|-------------------------------------------------------------------------------|-----------------|------------------------------------------------------------------------------------------------------------------------------------|
| Users to have the ability to get apps from marketplace                        | Disable         | Only administrators are approved to assign or purchase application.                                                                |
| Allow third party apps from the store be open office documents in the browser | Disable         | This setting increases the security of the solution by ensuring documents in the browser cannot start third party apps for Office. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* None identified