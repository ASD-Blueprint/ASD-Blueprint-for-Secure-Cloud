---
title: "Sharing and Access Controls"
weight: 50
description: "This section describes the design decisions associated with SharePoint Sharing and Access Controls for system(s) built using ASD's Blueprint for Secure Cloud."
---

Sharing and Access controls  provide granular control over external sharing and access to SharePoint Online. Sharing and Access control is essential for securing SharePoint Online document and information sharing. Access to SharePoint Sites can be controlled through a variety of means to ensure that the data of the sites is protected. This includes the configuration of:

* Only allowing access from specific IP address locations
* Only allowing access from apps that use modern authentication
* Blocking access from devices which are not managed by the organisation through Microsoft Intune.
* Sites can be further secured through the implementation of Idle session timeouts. Idle session timeouts essentially act to log a user out of SharePoint after a period of inactivity.

Access Controls provides an administrative tool to restrict access contents in SharePoint.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point   | Design Decision | Justification                                                                                                                                                                                                                                                                                 |
|------------------|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Sharing Controls | Configured      | Sharing to external users will be `disabled`.<br>Documents within SharePoint Online can only be shared with internal users. The default setting will be to share with "View" permissions which can be modified by the user to "Edit". Collaboration and sharing will be achieved using Teams. |
| Access Controls  | Configured      | Access to SharePoint Online will be controlled on a device level to ensure data is being accessed from approved devices.                                                                                                                                                                      |

{{% /alert %}}

### Configuration

| Configuration                                      | Value                          | Description                                                                                                                                           |
|----------------------------------------------------|--------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Unmanaged Devices**                              |                                |                                                                                                                                                       |
| Unmanaged Devices                                  | Allow limited, web only access | Provide restricted access to devices that are not Microsoft Intune compliant.                                                               |
| **Idle session time-out**                          |                                |                                                                                                                                                       |
| Sign out inactive users automatically              | On                             | Controls idle time on users logged onto a device.                                                                                                     |
| Sign out users after:                              | 1 hour                         | Ensure users are logged out after an idle time.                                                                                                       |
| Give users this much notice:                       | 5 minutes                      | Ensure users are notified before they are signed out.                                                                                                 |
| **Network Location**                               |                                |                                                                                                                                                       |
| Allow access only from a specific IP address range | Off                            | Define a trusted network boundary by specifying one or more authorized IP address ranges.                                                             |
| **Apps that do not use modern Authentication**     |                                |                                                                                                                                                       |
| Apps that do not use modern Authentication         | Block access                   | Some third-party apps and previous versions of Office cannot enforce device-based restrictions. Use this setting to block all access from these apps. |

#### Cloud native deployments

The below are the settings specific to a cloud native deployment of SharePoint Online.

| Configuration                                                                                 | Value                                                                               | Description                                                                                                                  |
| --------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| **External Sharing**                                                                          |                                                                                     |                                                                                                                              |
| SharePoint                                                                                    | New and existing guests                                                             | Guest access is available in accordance with [Collaboration]({{<ref "external-identities">}})                                 |
| More external sharing settings                                                                | Limit external sharing by domain: Checked <br>Add domains that are allowed: Checked | Guests must sign in using the same account to which the sharing invitations are sent.                                        |
| OneDrive                                                                                      | Only people in the organisation                                                     | No external sharing allowed.                                                                                                 |
| **File and folder links**                                                                     |                                                                                     |                                                                                                                              |
| Choose the type of link that is created by default when users get links                       | Specific people                                                                     | Internal link which can only be sent to people in the organisation.                                                          |
| **Other settings**                                                                            |                                                                                     |                                                                                                                              |
| Show owners the names of people who viewed their files in OneDrive                            | Checked                                                                             | This is to ensure owners are aware of external users who have access to the document.                                        |
| Let site owners choose to display the names of people who viewed files or pages in SharePoint | Checked                                                                             | Permits display of activity on SharePoint sites to foster collaboration.                                                     |
| Use shorter links when sharing files and folders                                              | Checked                                                                             | Ensure URL are short and concise.                                                                                            |
| Default link permission                                                                       | Edit                                                                                | Users will have edit permissions by default to increase usability. If view permissions are required, this is also available. |

#### Hybrid deployments

The below are the settings specific to a hybrid deployment of SharePoint Online.

| Configuration                                                                                 | Value                           | Description                                                                                                                  |
| --------------------------------------------------------------------------------------------- | ------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| **External Sharing**                                                                          |                                 |                                                                                                                              |
| SharePoint                                                                                    | Only people in the organisation | No external sharing allowed.                                                                                                 |
| OneDrive                                                                                      | Only people in the organisation | No external sharing allowed.                                                                                                 |
| **File and folder links**                                                                     |                                 |                                                                                                                              |
| Choose the type of link that is created by default when users get links                       | Only people in the organisation | Internal link which can only be sent to people in the organisation.                                                          |
| **Other settings**                                                                            |                                 |                                                                                                                              |
| Show owners the names of people who viewed their files in OneDrive                            | Checked                         | This is to ensure owners are aware of external users who have access to the document.                                        |
| Let site owners choose to display the names of people who viewed files or pages in SharePoint | Checked                         | Permits display of activity on SharePoint sites to foster collaboration.                                                     |
| Use shorter links when sharing files and folders                                              | Checked                         | Ensure URL are short and concise.                                                                                            |
| Default link permission                                                                       | Edit                            | Users will have edit permissions by default to increase usability. If view permissions are required, this is also available. |

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* None identified