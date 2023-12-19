---
title: "Teams"
weight: 35
description: "This section describes the design decisions associated with Teams for system(s) built using ASD's Blueprint for Secure Cloud."
---

A Team in the context of Microsoft Teams is a grouping of users who are working together to achieve an outcome. It allows users to communicate together through chat and meeting functions as well as collaborate on documents and files uploaded. Within the Team, Channels can be used to breakdown the work into smaller more specific items. These channels can be extended using Bots, Tabs and connectors.

Microsoft Teams leverages most of the functionality of the Office 365 components. When a Team is created the following items are also created :

* **SharePoint Site** - A new SharePoint site with the URL format of `/sites/<SiteTitle>`. Spaces within a `SiteTitle` are stripped out.
* **Office 365 Group** - A new Office 365 Group, which is added into the Microsoft Entra ID tenant. This is created with the site title as the Group Name.
* **Teams email** – A new email address per channel can be created. The email inbox is managed centrally by the Microsoft Team services. At the time of writing this document, the email address will have a domain of `<custom email inbox>@apac.teams.ms`. *Note: This email is not part of Microsoft Exchange Online.*