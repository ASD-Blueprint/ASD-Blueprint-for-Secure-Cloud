---
title: "Corporate Branding"
weight: 75
description: "This section describes the design decisions associated with corporate branding on Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

Corporate branding enables a consistent corporate user experience. Windows 10 and 11 permit the image displayed on the lock screen, logon screen and desktop wallpaper to be customised and support various resolutions. The appropriate resolution is selected based on an image file name. Windows will automatically select the appropriate image based on the current screen resolution. If a file matching the screen resolution cannot be found, a default image file is used, and the picture stretched to fit the screen.

Custom themes can be deployed to workstations either enforcing the theme or enabling a user to customise it after the initial Standard Operating Environment (SOE) deployment. Each organisation would be required to provide information necessary to customise the branding.

Although a system is capable of being assessed as PROTECTED, banners and backgrounds should not be set to PROTECTED in the SOE or desktop background until an IRAP assessment has been completed.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                         | Design decision            | Justification                                                                                                    |
|----------------------------------------|----------------------------|------------------------------------------------------------------------------------------------------------------|
| Lock Screen                            | Custom Corporate wallpaper | Customised to the organisation corporate wallpaper to provide a corporate look and feel.                         |
| Logon Screen                           | Custom Corporate wallpaper | Customised to the organisation corporate wallpaper to provide a corporate look and feel.                         |
| Wallpaper                              | Custom Corporate wallpaper | Customised to the organisation corporate wallpaper to provide a corporate look and feel.                         |
| Default Account Picture                | Custom organisation logo   | Customised to the organisation logo to provide a corporate look and feel.                                        |
| Theme                                  | Organisation choice        | Customised to the organisation's requirements.                                                                   |
| Theme Colour                           | Organisation choice        | Customised to the organisation's requirements.                                                                   |
| Windows Colour                         | Default                    | Customised to the organisation's requirements.                                                                   |
| Corporate Account Picture              | Default                    | The default account picture will be displayed as the user account picture to provide a consistent look and feel. |
| User Ability to Change Account Picture | Disabled                   | Disabled to provide a consistent configuration for all organisation users.                                       |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* [Entra ID Tenant Settings]({{<ref "design/platform/identity/tenant.md">}})

#### Configuration

* None identified

#### References

* None identified