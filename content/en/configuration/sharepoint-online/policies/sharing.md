---
Title: "Sharing"
weight: 020
description: "This section describes the configuration of SharePoint associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* for the <SERVICE> portal blade at the following URL: 
 
https://`<TENANT-NAME>`-admin.sharepoint.com/

`Home` > `Policies` > `Sharepoint`
 
These settings should be used to provide reference of a baseline implementation for a system configured using the blueprint. Any implementation implied by the below should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.
 
Implementation of the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.
 
Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

### External sharing

| Item                           |                                              Value |
| ------------------------------ | -------------------------------------------------: |
| **Content can be shared with** |                                                    |
| SharePoint                     | Least permissive; Only people in your organization |
| OneDrive                       | Least permissive; Only people in your organization |

### File and folder links

| Item                                                                                                             |                            Value |
| ---------------------------------------------------------------------------------------------------------------- | -------------------------------: |
| Choose the type of link that's selected by default when users share files and folders in SharePoint and OneDrive | Only people in your organization |
| Choose the permission that's selected by default for sharing links                                               |                             Edit |

### Other settings

| Item                                                                                          | Value |
| --------------------------------------------------------------------------------------------- | ----: |
| Show owners the names of people who viewed their files in OneDrive                            |  True |
| Let site owners choose to display the names of people who viewed files or pages in SharePoint |  True |
| Use short links for sharing files and folders                                                 |  True |