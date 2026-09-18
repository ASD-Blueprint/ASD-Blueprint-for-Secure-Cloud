---
title: "iOS/iPadOS"
weight: 30
description: "This section describes the settings for device configuration profiles within Microsoft Intune associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the _as built_ configuration for ASD's _Blueprint for Secure Cloud_ (the Blueprint) for the Microsoft Intune portal at the following URL:

<https://intune.microsoft.com/#view/Microsoft_Intune_DeviceSettings/DevicesMenu/~/configuration>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Basics

| Item         |               Value |
| ------------ | ------------------: |
| Name         |            Ios/Ipad |
| Description  |                     |
| Platform     |          iOS/iPadOS |
| Profile type | Device restrictions |

### Assignments

#### Included groups

None

#### Excluded groups

| Item   |              Value |
| ------ | -----------------: |
| Groups | No groups selected |

### Scope tags

| Item       |   Value |
| ---------- | ------: |
| Scope tags | Default |

### Configuration settings

#### App Store, Doc Viewing, Gaming

| Item                                                                |                Value |
| ------------------------------------------------------------------- | -------------------: |
| Block viewing corporate documents in unmanaged apps                 |                  Yes |
| Allow unmanaged apps to read from managed contacts accounts         |                  Yes |
| Treat AirDrop as an unmanaged destination                           |                  Yes |
| Block viewing non-corporate documents in corporate apps             |                  Yes |
| Allow copy/paste to be affected by managed open-in                  |                  Yes |
| Require iTunes Store password for all purchases                     |       Not configured |
| Block in-app purchases                                              |       Not configured |
| Block download of explicit sexual content in Apple Books            |       Not configured |
| Allow managed apps to write contacts to unmanaged contacts accounts |       Not configured |
| Ratings region                                                      | No region configured |
| Block App Store                                                     |                  Yes |
| Block installing apps using App Store                               |       Not configured |
| Block automatic app downloads                                       |                  Yes |
| Block playback of explicit music, podcast, and iTunes U             |       Not configured |
| Block adding Game Center friends                                    |       Not configured |
| Block Game Center                                                   |       Not configured |
| Block multiplayer gaming in the Game Center                         |       Not configured |
| Block access to network drive in Files app                          |       Not configured |

#### Built-in apps

| Item                                                    |                                            Value |
| ------------------------------------------------------- | -----------------------------------------------: |
| Block Siri                                              |                                              Yes |
| Block Siri while device is locked                       |                                   Not configured |
| Require Safari fraud warnings                           |                                              Yes |
| Block internet search results from Spotlight            |                                              Yes |
| Safari cookies                                          | Block all cookies, and block cross site tracking |
| Block Safari JavaScript                                 |                                              Yes |
| Block Safari pop-ups                                    |                                              Yes |
| Block Siri for dictation                                |                                              Yes |
| Block Siri for translation                              |                                              Yes |
| Block camera                                            |                                              Yes |
| Block FaceTime                                          |                                   Not configured |
| Require Siri profanity filter                           |                                   Not configured |
| Block user-generated content in Siri                    |                                   Not configured |
| Block Apple News                                        |                                   Not configured |
| Block Apple Books                                       |                                              Yes |
| Block iMessage                                          |                                              Yes |
| Block Podcasts                                          |                                              Yes |
| Music service                                           |                                              Yes |
| Block iTunes Radio                                      |                                              Yes |
| Block iTunes Store                                      |                                              Yes |
| Block Find My iPhone                                    |                                              Yes |
| Block Find My Friends                                   |                                              Yes |
| Block user modification to the Find My Friends settings |                                              Yes |
| Block removal of system apps from device                |                                              Yes |
| Block Safari                                            |                                              Yes |
| Block Safari Autofill                                   |                                              Yes |

#### Cloud and Storage

| Item                                                 |          Value |
| ---------------------------------------------------- | -------------: |
| Force encrypted backup                               |            Yes |
| Block managed apps from storing data in iCloud       |            Yes |
| Block backup of enterprise books                     |            Yes |
| Block notes and highlights sync for enterprise books |            Yes |
| Block iCloud Photos sync                             |            Yes |
| Block iCloud Photo Library                           |            Yes |
| Block My Photo Stream                                |            Yes |
| Block Handoff                                        |            Yes |
| Block iCloud backup                                  |            Yes |
| Block iCloud document and data sync                  |            Yes |
| Block iCloud Keychain sync                           |            Yes |
| Block iCloud Private Relay                           | Not configured |

#### Connected devices

| Item                                                                 |          Value |
| -------------------------------------------------------------------- | -------------: |
| Force Apple Watch wrist detection                                    |            Yes |
| Require AirPlay outgoing requests pairing password                   |            Yes |
| Block Apple Watch auto unlock                                        |            Yes |
| Block AirDrop                                                        |            Yes |
| Block pairing with Apple Watch                                       |            Yes |
| Block modifying Bluetooth settings                                   | Not configured |
| Block pairing with non-Configurator hosts                            |            Yes |
| Block AirPrint                                                       |            Yes |
| Block storage of AirPrint credentials in Keychain                    | Not configured |
| Require AirPrint to destinations with trusted certificates           | Not configured |
| Block iBeacon discovery of AirPrint printers                         | Not configured |
| Block setting up new nearby devices                                  |            Yes |
| Block access to USB drive in Files app                               |            Yes |
| Disable near-field communication (NFC)                               |            Yes |
| Allow users to boot devices into recovery mode with unpaired devices | Not configured |

#### General

| Item                                                                     |          Value |
| ------------------------------------------------------------------------ | -------------: |
| Block sending diagnostic and usage data to Apple                         |            Yes |
| Block screenshots and screen recording                                   |            Yes |
| Block untrusted TLS certificates                                         |            Yes |
| Block over-the-air PKI updates                                           |            Yes |
| Force limited ad tracking                                                |            Yes |
| Block trusting new enterprise app authors                                |            Yes |
| Limit Apple personalized advertising                                     |            Yes |
| Block modification of diagnostics settings                               | Not configured |
| Block remote AirPlay, view screen by Classroom app, and screen sharing   |            Yes |
| Allow Classroom app to perform AirPlay and view screen without prompting |            Yes |
| Block modification of account settings                                   |            Yes |
| Block Screen Time                                                        |            Yes |
| Block users from erasing all content and settings on device              |            Yes |
| Block modification of device name                                        |            Yes |
| Block modification of notifications settings                             |            Yes |
| Block modification of Wallpaper                                          |            Yes |
| Block configuration profile changes                                      |            Yes |
| Allow activation lock                                                    |            Yes |
| Block removing apps                                                      |            Yes |
| Block app clips                                                          |            Yes |
| Allow USB accessories while device is locked                             | Not configured |
| Force automatic date and time                                            |            Yes |
| Require teacher permission to leave Classroom app unmanaged classes      | Not configured |
| Allow Classroom to lock to an app and lock the device without prompting  | Not configured |
| Allow students to automatically join Classroom classes without prompting | Not configured |
| Block VPN creation                                                       |            Yes |
| Block modification of eSIM settings                                      |            Yes |
| Defer software updates                                                   | Not configured |
| Delay default visibility of software updates                             |         _None_ |

#### Keyboard and dictionary

| Item                         |          Value |
| ---------------------------- | -------------: |
| Block word definition lookup | Not configured |
| Block predictive keyboards   | Not configured |
| Block auto-correction        | Not configured |
| Block spell check            | Not configured |
| Block keyboard shortcuts     | Not configured |
| Block dictation              | Not configured |
| Block QuickPath              | Not configured |

#### Kiosk

| Item                         |          Value |
| ---------------------------- | -------------: |
| App to run in kiosk mode     | Not configured |
| Require AssistiveTouch       | Not configured |
| Require invert colours       | Not configured |
| Require mono audio           | Not configured |
| Require Voice Control        | Not configured |
| Require VoiceOver            | Not configured |
| Require zoom                 | Not configured |
| Block auto lock              | Not configured |
| Block ringer switch          | Not configured |
| Block screen rotation        | Not configured |
| Block screen sleep button    | Not configured |
| Block touch                  | Not configured |
| Block volume buttons         | Not configured |
| Allow AssistiveTouch control | Not configured |
| Allow invert colours control | Not configured |
| Speak on selected text       | Not configured |
| Allow Voice Control          | Not configured |
| Allow VoiceOver control      | Not configured |
| Allow zoom control           | Not configured |

#### Locked Screen Experience

| Item                                            | Value |
| ----------------------------------------------- | ----: |
| Block Control Center access in lock screen      |   Yes |
| Block Notification Center access in lock screen |   Yes |
| Block Today view in lock screen                 |   Yes |
| Block Wallet notifications in lock screen       |   Yes |

#### Password

| Item                                                                                           |          Value |
| ---------------------------------------------------------------------------------------------- | -------------: |
| Require password                                                                               |            Yes |
| Block simple passwords                                                                         |            Yes |
| Required password type                                                                         |   Alphanumeric |
| Number of non-alphanumeric characters in password                                              |              1 |
| Minimum password length                                                                        |             15 |
| Number of sign-in failures before wiping device                                                |             11 |
| Maximum minutes after screen lock before password is required                                  |    Immediately |
| Maximum minutes of inactivity until screen locks                                               |       1 Minute |
| Password expiration (days)                                                                     |            365 |
| Prevent reuse of previous passwords                                                            |              5 |
| Block Touch ID and Face ID unlock                                                              |            Yes |
| Block passcode modification                                                                    |            Yes |
| Block modification of Touch ID fingerprints and Face ID faces                                  |            Yes |
| Block password AutoFill                                                                        |            Yes |
| Block password proximity requests                                                              |            Yes |
| Block password sharing                                                                         |            Yes |
| Require Touch ID or Face ID authentication for AutoFill of password or credit card information | Not configured |

#### Restricted Apps

| Item                         |         Value |
| ---------------------------- | ------------: |
| Type of restricted apps list | Approved apps |

##### Apps list

| App store URL                                                            |                    App bundle ID |                     App name |             Publisher |
| ------------------------------------------------------------------------ | -------------------------------: | ---------------------------: | --------------------: |
| <https://apps.apple.com/au/app/adobe-acrobat-reader-for-pdf/id469337564> |           com.adobe.Adobe-Reader | Adobe Acrobat Reader for PDF |             Adobe Inc |
| <https://apps.apple.com/us/app/microsoft-authenticator/id983156458>      | com.microsoft.azureauthenticator |      Microsoft Authenticator | Microsoft Corporation |
| <https://apps.apple.com/us/app/microsoft-edge/id1288723196>              |             com.microsoft.msedge |               Microsoft Edge | Microsoft Corporation |
| <https://apps.apple.com/us/app/microsoft-excel/id586683407>              |       com.microsoft.Office.Excel |              Microsoft Excel | Microsoft Corporation |
| <https://apps.apple.com/us/app/microsoft-onedrive/id477537958>           |           com.microsoft.skydrive |           Microsoft OneDrive | Microsoft Corporation |
| <https://apps.apple.com/au/app/microsoft-onenote/id410395246>            |            com.microsoft.onenote |            Microsoft OneNote | Microsoft Corporation |
| <https://apps.apple.com/au/app/microsoft-powerpoint/id586449534>         |  com.microsoft.Office.Powerpoint |         Microsoft PowerPoint | Microsoft Corporation |
| <https://apps.apple.com/us/app/microsoft-outlook/id951937596>            |     com.microsoft.Office.Outlook |            Microsoft Outlook | Microsoft Corporation |
| <https://apps.apple.com/au/app/microsoft-sharepoint/id1091505266>        |         com.microsoft.sharepoint |         Microsoft SharePoint | Microsoft Corporation |
| <https://apps.apple.com/us/app/teams/id1113153706>                       |        com.microsoft.skype.teams |              Microsoft Teams | Microsoft Corporation |
| <https://apps.apple.com/us/app/microsoft-word/id586447913>               |        com.microsoft.Office.Word |               Microsoft Word | Microsoft Corporation |
| <https://apps.apple.com/au/app/power-apps/id1047318566>                  |             com.microsoft.msapps |                    PowerApps | Microsoft Corporation |

#### Shared iPad

| Item                                  | Value |
| ------------------------------------- | ----: |
| Block Shared iPad temporary sessions​ |   Yes |

#### Wireless

| Item                                                                    |          Value |
| ----------------------------------------------------------------------- | -------------: |
| Block data roaming                                                      | Not configured |
| Block global background fetch while roaming                             | Not configured |
| Block voice dialling while device is locked                             |            Yes |
| Block voice roaming                                                     | Not configured |
| Block personal hotspot                                                  | Not configured |
| Block use of cellular data                                              |                |
| - Block use of cellular data                                            | Not configured |
| Block use of cellular data when roaming                                 |                |
| - Block use of cellular data when roaming                               | Not configured |
| Block changes to app cellular data usage settings                       | Not configured |
| Block changes to cellular plan settings                                 | Not configured |
| Block modification of personal hotspot                                  | Not configured |
| Require joining Wi‑Fi networks only using configuration profiles        | Not configured |
| Require Wi‑Fi always on                                                 | Not configured |
| Require devices to use Wi‑Fi networks set up via configuration profiles | Not configured |

### Related information

#### Security and governance

- [Enterprise mobility](/security-and-governance/system-security-plan/enterprise-mobility)
- [User application hardening](/security-and-governance/system-security-plan/system-hardening-user-apps)
- [System management](/security-and-governance/system-security-plan/system-management)
- [Essential Eight - Restrict Microsoft Office macros](/security-and-governance/essential-eight/restrict-microsoft-office-macros)
- [Essential Eight - Patch applications](/security-and-governance/essential-eight/patch-applications)
- [Essential Eight - Patch operating systems](/security-and-governance/essential-eight/patch-os)
- [Essential Eight - Regular backups](/security-and-governance/essential-eight/regular-backups)
- [System monitoring](/security-and-governance/system-security-plan/system-monitoring)
- [Enterprise mobility](/security-and-governance/system-security-plan/enterprise-mobility)
- [Essential Eight - Application control](/security-and-governance/essential-eight/application-control)

#### Design

- [Authentication](/design/platform/identity/authentication)
- [Securing iOS devices](/design/endpoints/ios/security/securing-ios-devices)

#### Configuration

- [iOS and iPadOS](/configuration/intune/apps/by-platform/ios-ipados)
- [Microsoft Intune - profile configurations](/configuration/intune/devices/configuration-policies)
- [Endpoint security policies](/configuration/defender/endpoints/configuration-management/endpoint-security-policies)
- [Permissions](/configuration/defender/system/settings/endpoints/permissions)
- [Rules](/configuration/defender/system/settings/endpoints/rules)

#### References

- None identified
