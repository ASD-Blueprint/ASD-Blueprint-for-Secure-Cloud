---
Title: 
weight: 30
description: "This section describes the configuration of device configuration profiles within Microsoft Intune associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Intune portal blade at the following URL:

https://intune.microsoft.com/#view/Microsoft_Intune_DeviceSettings/DevicesMenu/~/configurationProfiles
 
The settings described in these tables should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

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

None

### Scope tags

| Item       |   Value |
| ---------- | ------: |
| Scope tags | Default |

### Configuration settings

#### App Store, Doc Viewing, Gaming

| Item                                                        | Value |
| ----------------------------------------------------------- | ----: |
| Block viewing corporate documents in unmanaged apps         |   Yes |
| Allow unmanaged apps to read from managed contacts accounts |   Yes |
| Treat AirDrop as an unmanaged destination                   |   Yes |
| Block viewing non-corporate documents in corporate apps     |   Yes |
| Allow copy/paste to be affected by managed open-in          |   Yes |
| Block App store                                             |   Yes |
| Block automatic app downloads                               |   Yes |

#### Built-in apps

| Item                                                    |                                            Value |
| ------------------------------------------------------- | -----------------------------------------------: |
| Block Siri                                              |                                              Yes |
| Require Safari fraud warnings                           |                                              Yes |
| Block internet search results from Spotlight            |                                              Yes |
| Safari cookies                                          | Block all cookies, and block cross site tracking |
| Block Safari JavaScript                                 |                                              Yes |
| Block Safari pop-ups                                    |                                              Yes |
| Block Siri for dictation                                |                                              Yes |
| Block Siri for translation                              |                                              Yes |
| Block camera                                            |                                              Yes |
| Block FaceTime                                          |                                              Yes |
| Block Apple Books                                       |                                              Yes |
| Block iMessage                                          |                                              Yes |
| Block Podcasts                                          |                                              Yes |
| Music service                                           |                                              Yes |
| Block iTunes Radio                                      |                                              Yes |
| Block iTunes store                                      |                                              Yes |
| Block Find My iPhone                                    |                                              Yes |
| Block Find My Friends                                   |                                              Yes |
| Block user modification to the Find My Friends settings |                                              Yes |
| Block removal of system apps from device                |                                              Yes |
| Block Safari                                            |                                              Yes |
| Block Safari Autofill                                   |                                              Yes |

#### Cloud and Storage

| Item                                                 | Value |
| ---------------------------------------------------- | ----: |
| Force encrypted backup                               |   Yes |
| Block managed apps from storing data in iCloud       |   Yes |
| Block backup of enterprise books                     |   Yes |
| Block notes and highlights sync for enterprise books |   Yes |
| Block iCloud Photos sync                             |   Yes |
| Block iCloud Photo Library                           |   Yes |
| Block My Photo Stream                                |   Yes |
| Block Handoff                                        |   Yes |
| Block iCloud backup                                  |   Yes |
| Block iCloud document and data sync                  |   Yes |
| Block iCloud Keychain sync                           |   Yes |

#### Connected devices

| Item                                               | Value |
| -------------------------------------------------- | ----: |
| Force Apple Watch wrist detection                  |   Yes |
| Require AirPlay outgoing requests pairing password |   Yes |
| Block Apple Watch auto unlock                      |   Yes |
| Block AirDrop                                      |   Yes |
| Block pairing with Apple Watch                     |   Yes |
| Block modifying Bluetooth settings                 |   Yes |
| Block pairing with non-Configurator hosts          |   Yes |
| Block AirPrint                                     |   Yes |
| Block setting up new nearby devices                |   Yes |
| Block access to USB drive in Files app             |   Yes |
| Disable near-field communication (NFC)             |   Yes |

#### General

| Item                                                                     | Value |
| ------------------------------------------------------------------------ | ----: |
| Block sending diagnostic and usage data to Apple                         |   Yes |
| Block screenshots and screen recording                                   |   Yes |
| Block untrusted TLS certificates                                         |   Yes |
| Block over-the-air PKI updates                                           |   Yes |
| Force limited ad tracking                                                |   Yes |
| Block trusting new enterprise app authors                                |   Yes |
| Limit Apple personalized advertising                                     |   Yes |
| Block remote AirPlay, view screen by Classroom app, and screen sharing   |   Yes |
| Allow Classroom app to perform AirPlay and view screen without prompting |   Yes |
| Block modification of account settings                                   |   Yes |
| Block Screen Time                                                        |   Yes |
| Block users from erasing all content and settings on device              |   Yes |
| Block modification of device name                                        |   Yes |
| Block modification of notifications settings                             |   Yes |
| Block modification of Wallpaper                                          |   Yes |
| Block configuration profile changes                                      |   Yes |
| Allow activation lock                                                    |   Yes |
| Block removing apps                                                      |   Yes |
| Block app clips                                                          |   Yes |
| Force automatic date and time                                            |   Yes |
| Block VPN creation                                                       |   Yes |
| Block modification of eSIM settings                                      |   Yes |

#### Locked Screen Experience

| Item                                            | Value |
| ----------------------------------------------- | ----: |
| Block Control Center access in lock screen      |   Yes |
| Block Notification Center access in lock screen |   Yes |
| Block Today view in lock screen                 |   Yes |
| Block Wallet notifications in lock screen       |   Yes |


#### Password

| Item                                                          |        Value |
| ------------------------------------------------------------- | -----------: |
| Require password                                              |          Yes |
| Block simple passwords                                        |          Yes |
| Required password type                                        | Alphanumeric |
| Number of non-alphanumeric characters in password             |            1 |
| Minimum password length                                       |           14 |
| Number of sign-in failures before wiping device               |           11 |
| Maximum minutes after screen lock before password is required |  Immediately |
| Maximum minutes of inactivity until screen locks              |     1 Minute |
| Password expiration (days)                                    |          365 |
| Prevent reuse of previous passwords                           |            5 |
| Block Touch ID and Face ID unlock                             |          Yes |
| Block passcode modification                                   |          Yes |
| Block modification of Touch ID fingerprints and Face ID faces |          Yes |
| Block password AutoFill                                       |          Yes |
| Block password proximity requests                             |          Yes |
| Block password sharing                                        |          Yes |

#### Restricted Apps

| Item                         |         Value |
| ---------------------------- | ------------: |
| Type of restricted apps list | Approved apps |

##### Apps list

| App store URL                                                          |                    App bundle ID |                     App name |             Publisher |
| ---------------------------------------------------------------------- | -------------------------------: | ---------------------------: | --------------------: |
| https://apps.apple.com/au/app/adobe-acrobat-reader-for-pdf/id469337564 |           com.adobe.Adobe-Reader | Adobe Acrobat Reader for PDF |             Adobe Inc |
| https://apps.apple.com/us/app/microsoft-authenticator/id983156458      | com.microsoft.azureauthenticator |      Microsoft Authenticator | Microsoft Corporation |
| https://apps.apple.com/us/app/microsoft-edge/id1288723196              |             com.microsoft.msedge |               Microsoft Edge | Microsoft Corporation |
| https://apps.apple.com/us/app/microsoft-excel/id586683407              |       com.microsoft.Office.Excel |              Microsoft Excel | Microsoft Corporation |
| https://apps.apple.com/us/app/microsoft-onedrive/id477537958           |           com.microsoft.skydrive |           Microsoft OneDrive | Microsoft Corporation |
| https://apps.apple.com/au/app/microsoft-onenote/id410395246            |            com.microsoft.onenote |            Microsoft OneNote | Microsoft Corporation |
| https://apps.apple.com/au/app/microsoft-powerpoint/id586449534         |  com.microsoft.Office.Powerpoint |         Microsoft PowerPoint | Microsoft Corporation |
| https://apps.apple.com/us/app/microsoft-outlook/id951937596            |     com.microsoft.Office.Outlook |            Microsoft Outlook | Microsoft Corporation |
| https://apps.apple.com/au/app/microsoft-sharepoint/id1091505266        |         com.microsoft.sharepoint |         Microsoft SharePoint | Microsoft Corporation |
| https://apps.apple.com/us/app/microsoft-teams/id1113153706             |        com.microsoft.skype.teams |              Microsoft Teams | Microsoft Corporation |
| https://apps.apple.com/us/app/microsoft-word/id586447913               |        com.microsoft.Office.Word |               Microsoft Word | Microsoft Corporation |
| https://apps.apple.com/au/app/power-apps/id1047318566                  |             com.microsoft.msapps |                    PowerApps | Microsoft Corporation |

#### Shared iPad

| Item                                  | Value |
| ------------------------------------- | ----: |
| Block Shared iPad temporary sessions​ |   Yes |

#### Wireless

| Item                                       | Value |
| ------------------------------------------ | ----: |
| Block voice dialing while device is locked |   Yes |

### Related information

#### Security & Governance

* None identified
  
#### Design

* None identified
  
#### Configuration

* None identified

#### References

* None identified