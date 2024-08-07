---
title: "Services"
linkTitle: "Services"
weight: 00
description: "This section describes the configuration of services in Microsoft 365 associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft 365 portal at the following URL:

<https://admin.microsoft.com/Adminportal/Home?#/Settings/Services>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Account Linking

| Item                                                             |    Value |
| ---------------------------------------------------------------- | -------: |
| Allow users to connect their Microsoft Entra ID and MSA accounts | Disabled |

### Adoption Score

| Item                                             |                           Value |
| ------------------------------------------------ | ------------------------------: |
| Select users and groups for calculating insights | Include all users (recommended) |
| Turn on group-level insights                     |                        Disabled |

### Azure Speech Services

| Item                                       |   Value |
| ------------------------------------------ | ------: |
| Allow the organization-wide language model | Enabled |

### Bookings

| Item                                    |    Value |
| --------------------------------------- | -------: |
| Allow your organization to use Bookings | Disabled |

### Calendar

| Item                                                                                                     |    Value |
| -------------------------------------------------------------------------------------------------------- | -------: |
| Let users share their calendars with people outside of your organization who have Office 365 or Exchange | Disabled |

### Copilot for Sales

| Item                                                               |    Value |
| ------------------------------------------------------------------ | -------: |
| Allow users to see Copilot for Sales content in Microsoft 365 apps | Disabled |

### Cortana

| Item                                                                                                                                                                     |    Value |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------: |
| Allow Cortana in Windows 10 (version 1909 and earlier), and the Cortana app on iOS and Android, to access Microsoft-hosted data on behalf of people in your organization | Disabled |

### Dynamics 365 Applications

| Item                                                                                                                      |    Value |
| ------------------------------------------------------------------------------------------------------------------------- | -------: |
| Allow your user's data to be viewed by themselves when using Dynamic 365 Applications.                                    | Disabled |
| Allow Aggregated and non-identifiable insights to be accessed by other users of your company's Dynamics 365 Applications. | Disabled |
| Allow individualized insights to be accessed by other users of your company's Dynamics 365 Applications.                  | Disabled |

### Dynamics 365 Customer Voice - Security

| Item                      |    Value |
| ------------------------- | -------: |
| Prevent phishing attempts |  Enabled |
| Collect names             |  Enabled |
| Restrict survey access    | Disabled |

### Microsoft 365 Groups

| Item                                                                                    |    Value |
| --------------------------------------------------------------------------------------- | -------: |
| Let group owners add people outside your organization to Microsoft 365 Groups as guests | Disabled |
| Let guest group members access group content                                            | Disabled |
| When there's no owner, email and ask active group members to become an owner            | Disabled |

### Microsoft 365 installation options

| Item                                                    |    Value |
| ------------------------------------------------------- | -------: |
| **Feature updates**                                     |          |
| As soon as they're ready (Current Channel, recommended) | Selected |
| **Installation - Windows**                              |          |
| Office (includes Skype for Business)                    |  Enabled |
| Skype for Business (Standalone)                         |  Enabled |
| **Installation - Mac**                                  |          |
| Office                                                  |  Enabled |
| Skype for Business (X El Capitan 10.11 or higher)       |  Enabled |

### Microsoft 365 on the web

| Item                                                                                   |   Value |
| -------------------------------------------------------------------------------------- | ------: |
| Let users open files store in third-party storage services in Microsoft 365 on the web | Enabled |

### Microsoft communication to users

| Item                                                                                                |    Value |
| --------------------------------------------------------------------------------------------------- | -------: |
| Let people in my organization receive emails from Microsoft about how to use Microsoft 365 products | Disabled |

### Microsoft Forms

| Item                                                  |    Value |
| ----------------------------------------------------- | -------: |
| Send a link to the form and collect responses         | Disabled |
| Share to collaborate on the form layout and structure | Disabled |
| Share the form as the template that can be duplicated | Disabled |
| Share form result summary                             | Disabled |
| Record named by default                               | Disabled |
| Include Bing search, YouTube videos                   | Disabled |
| Add internal phishing protection                      |  Enabled |
| Allow respondents to edit their responses             | Disabled |

### Microsoft Graph Data Connect

| Item                                                                       |    Value |
| -------------------------------------------------------------------------- | -------: |
| Turn on Microsoft Graph Data Connect on or off for you entire organization | Disabled |

### Microsoft Loop

| Item                                                                    |   Value |
| ----------------------------------------------------------------------- | ------: |
| Microsoft Loop workspaces are available to all users in my organization | Enabled |

### Microsoft Planner

| Item                                                                                                               |    Value |
| ------------------------------------------------------------------------------------------------------------------ | -------: |
| Allow Planner users to publish their plans and assigned tasks to Outlook or their calendars through iCalendar feed | Disabled |

### Microsoft Search in Bing homepage - Homepage

| Item                                                                |    Value |
| ------------------------------------------------------------------- | -------: |
| Display the Microsoft Search in Bing homepage for your organization | Disabled |

### Microsoft Teams

| Item                                  |    Value |
| ------------------------------------- | -------: |
| Turn on Microsoft Teams for all users |  Enabled |
| Allow guest access in Teams           | Disabled |

### Microsoft To Do

| Item                                           |    Value |
| ---------------------------------------------- | -------: |
| Allow your users to receive push notifications | Disabled |

### Microsoft Viva Insights

| Item                                            |    Value |
| ----------------------------------------------- | -------: |
| Viva Insights web experience                    |  Enabled |
| Digest email                                    |  Enabled |
| Insights Outlook add-in and inline suggestions  |  Enabled |
| Schedule send suggestions                       |  Enabled |
| Allow Microsoft to contact me about my feedback | Disabled |

### Modern Authentication

| Item                                                                               |    Value |
| ---------------------------------------------------------------------------------- | -------: |
| Turn on modern authentication for Outlook 2013 for Windows and later (recommended) |  Enabled |
| Authenticated SMTP                                                                 | Disabled |

### News

| Item                                                          |         Value |
| ------------------------------------------------------------- | ------------: |
| **General**                                                   |               |
| Industry                                                      | None selected |
| Topics                                                        | None selected |
| Exclude Content                                               | None selected |
| Allow user to customize their own topics                      |      Disabled |
| Turn on industry news content in Microsoft Feed               |      Disabled |
| **Industry updates**                                          |               |
| Send daily email updates                                      |      Disabled |
| **Bing homepage**                                             |               |
| Include industry news                                         |      Disabled |
| **Microsoft Edge new tab page**                               |               |
| Show Microsoft 365 content on the Microsoft Edge new tab page |      Disabled |
| Show My Feed content on the Microsoft Edge new tab page       |      Disabled |
| Users default to My Feed                                      |    Unselected |
| Users default to Work Feed                                    |    Unselected |

### Office scripts

| Item                                               |    Value |
| -------------------------------------------------- | -------: |
| Let users automate their tasks in Excel on the web | Disabled |

### Reports

| Item                                                                     |    Value |
| ------------------------------------------------------------------------ | -------: |
| Display concealed user, group, and site names in all reports             | Disabled |
| Make report data available to Microsoft 365 usage analytics for Power BI | Disabled |

### SharePoint

| Item                                                           |    Value |
| -------------------------------------------------------------- | -------: |
| Only people in your Organization - no external sharing allowed | Selected |

### Sway

| Item                                                                                   |    Value |
| -------------------------------------------------------------------------------------- | -------: |
| Let people in your organization share their sways with people outside you organization | Disabled |
| Let people in your organization look up people and security groups                     | Disabled |
| Flickr                                                                                 | Disabled |
| Pickit                                                                                 | Disabled |
| Wikipedia                                                                              | Disabled |
| YouTube                                                                                | Disabled |

### User owned apps and services

| Item                                                      |    Value |
| --------------------------------------------------------- | -------: |
| Let users access the Office Store                         | Disabled |
| Let users start trials on behalf of your organization     | Disabled |
| Let users auto-claim licences the first time they sign in | Disabled |

### Viva Learning

| Item                                                                                                                                                                  |    Value |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------: |
| Required Diagnostic Data. Send the minimum data necessary to Microsoft to keep Viva Learning secure, up-to-date, and performing as expected                           | Disabled |
| Optional Diagnostic Data. Additional data that helps us make product improvements and provides enhanced information to help us detect, diagnose, and remediate issues | Disabled |

### Whiteboard

| Item                                                                                                                            |    Value |
| ------------------------------------------------------------------------------------------------------------------------------- | -------: |
| Turn on Whiteboard for everyone in your org                                                                                     |  Enabled |
| Neither - No diagnostic data about Whiteboard client software running on the devices in your organizations is sent to Microsoft | Selected |
| Allow the use of optional connected experiences in legacy Whiteboard                                                            | Disabled |
| Enable easy sharing of legacy whiteboards from Surface Hub                                                                      | Disabled |

### Related information

#### Security & Governance

* None identified
  
#### Design

* None identified
  
#### Configuration

* None identified

#### References

* None identified
