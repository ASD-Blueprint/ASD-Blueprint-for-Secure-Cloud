---
title: "Themes"
weight: 30
description: "This section describes the design decisions associated with Microsoft 365 Themes for system(s) built using ASD's Blueprint for Secure Cloud."
---

Microsoft 365 Themes provide a method to customise the portal look and feel for users. Themes may assist users with familiarisation and adoption of the Microsoft 365 environment as they can be applied to reflect existing organisation systems and styles. 

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point      | Design Decision | Justification                                                                               |
|---------------------|-----------------|---------------------------------------------------------------------------------------------|
| Custom Portal Theme | Configured      | Customising the theme setting assists user to identify that they are in the correct portal. |

{{% /alert %}}

{{% alert title="Note" color="info" %}}

Themes are the responsibility of the organisation and should align with both the organisation's style guide and the [Australian Government Style Manual](https://www.stylemanual.gov.au) where appropriate.

{{% /alert %}}

### Configuration

| Configuration                                                                            | Value                      | Description                                                                                                                                                                     |
|------------------------------------------------------------------------------------------|----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Logo Image                                                                               | Organisation logo          | Under 10 KB, 200 x 30 pixels in JPG, PNG, GIF, or SVG format. SVG is the preferred format so as to maintain high resolution presentation.                                       |
| Background Image                                                                         | Organisation image or logo | 15 KB or less, 1366 x 50 pixels in JPG, PNG, or GIF format. This is in line with Microsoft best practice.                                                                       |
| Prevent users from overriding their theme                                                | Yes                        | Prevent users from choosing their own theme from the Microsoft theme gallery. Enabled to maintain cadence between potential personal tenancies and the 'corporate' environment. |
| Navigation bar colour                                                                    | Default                    | Based on organisation style guidance. To maintain cadence with corporate standards.                                                                                             |
| Text and icon colour                                                                     | Default                    | Based on organisation style guidance.                                                                                                                                           |
| Accent Colour                                                                            | Default                    | Based on organisation style guidance.                                                                                                                                           |
| Show the users name on the top navigation bar when the user is signed in                 | Yes                        | The users name will be shown to identify who is signed in.                                                                                                                      |

### Related information

#### References

* None identified

#### Related design decisions

* None identified
