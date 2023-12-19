---
title: "Web Parts"
weight: 50
description: "This section describes the design decisions associated with SharePoint Web Parts for system(s) built using ASD's Blueprint for Secure Cloud."
---

SharePoint Online provides spaces for users to customise their SharePoint page to include web parts into the page. Web Parts are additional functional parts that can be added into SharePoint pages to enhance productivity and usability for the site. Web Parts are client-side applications that can be added into SharePoint Online. The Australian Signals Directorate (ASD) Blueprint for Secure Cloud (The Blueprint) considers these two 'out of the box' sets of web parts which need to be considered as a part of the design decisions:

* Microsoft published web part
* Third party published web part

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                | Design Decision | Justification                                                                                                                                                                                                                                                                                    |
|-------------------------------|-----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Microsoft published web part   | Enabled         | Microsoft published web parts cannot be disabled in SharePoint.                                                                                                                                                                                                                                   |
| Third Party published web part | Disabled        | Built-in third party web parts which are able to be disabled should be disabled due to potential unsecure data flow outside of Office 365.<br><br>If a third party published web part is identified for use in future, the organisation should undertake a risk assessment before implementation. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* None identified