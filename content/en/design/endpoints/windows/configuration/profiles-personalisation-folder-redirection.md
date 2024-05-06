---
title: "Profiles, personalisation, and folder redirection"
weight: 95
description: "This section describes the design decisions associated with profiles and personalisation on Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

Profiles are a collection of data and settings for each user of a Windows computer. Examples of data captured as part of a user's profile are user settings, desktop shortcuts, and application settings.

Profile configuration values are specific to a single user and are stored in a single folder known as the 'User Profile'. These configuration parameters (themes, window colour, wallpapers, and application settings) determine the look and feel of the operating environment for a specific user.

Microsoft includes several standard options for user profiles. Alternatively, technologies such as Microsoft UE-V or FSLogix can be used to address user profile and personalisation requirements. If no user profile is configured, a desktop local profile is used, which does not backup options but performs well.

Microsoft provide the following profile management solutions:

* **Local Profiles** – Local user profiles are stored on the workstation. When the user logs on for the first time, a local user profile is created for the user and stored by default in `C:\Users\%USERNAME%`. Whenever a user logs on to the workstation, the user's local user profile is loaded. When the user logs off the workstation, any configuration changes made to the user's profile are saved in the user's profile
* **Mandatory Profiles** – Mandatory profiles are a profile that does not save profile changes and are enforced at each logon
* **Roaming Profiles** – Roaming user profiles are stored in a central location on the network, which is generally a shared folder on a server. When the user logs on to a workstation, the roaming user profile is downloaded from the network location and loaded onto the workstation. When the user logs off the workstation, any profile changes are saved to the network share. In addition to maintaining a copy of the roaming profile on the network share, Windows also keeps a locally cached copy of the roaming profile on each workstation that the user logs on. 

Windows 10 and 11 provides two main roaming profile technologies in User Experience Virtualization (UE-V) and FSLogix. FSLogix is now the preferred Roaming Profile option as it provides a consistently higher performance than UE-V and can provide a cloud-based roaming profile when configured with suitable Azure cloud storage blobs.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point     | Design Decision                | Justification                                                                                                                             |
|--------------------|--------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| Folder Redirection | Redirect Windows Known Folders | Users can continue using the folders they are familiar with. Files are automatically backed up to the users OneDrive folder in the cloud. |

{{% /alert %}}

### Cloud native deployments

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                         | Design Decision            | Justification                                                                                                                                                                                                                                             |
|----------------------------------------|----------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Profile Type                           | Local Profiles             | Local profiles will be configured to support end-user assigned devices. This configuration assumes that users will not share devices and do not require profile backups.<br>Enterprise State Roaming will be enabled for key backup of key user settings. |
| Known Folder Redirection Configuration | Configured as listed below | To enable user personalisation and provide backup of essential user data.                                                                                                                                                                                 |

{{% /alert %}}

Known Folder Redirection Configuration applicable to organisations leveraging a cloud native implementation.

| Folder     | Path                                     |
|------------|------------------------------------------|
| AppData    | Not Configured                           |
| Contacts   | Not Configured                           |
| Desktop    | `C:\Users\%username%\OneDrive\Desktop`   |
| Documents  | `C:\Users\%username%\OneDrive\Documents` |
| Downloads  | Not Configured                           |
| Favourites | Not Configured                           |
| Links      | Not Configured                           |
| Searches   | Not Configured                           |
| Music      | Not Configured                           |
| Pictures   | `C:\Users\%username%\OneDrive\Pictures`  |
| Videos     | Not Configured                           |

### Hybrid deployments

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                         | Design Decision  | Justification                                                                                                                                                                                                       |
|----------------------------------------|------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Profile Type                           | Roaming Profiles | Roaming profiles will be configured to support end-user assigned devices. A roaming profile management product is recommended by the vendor, Microsoft.<br>This configuration assumes that users can share devices. |
| Known Folder Redirection Configuration | configured below | To enable user personalisation and backup of essential user data.                                                                                                                                                   |

{{% /alert %}}

Known Folder Redirection Configuration applicable to organisations leveraging a hybrid implementation.

| Folder     | Path                                                   |
|------------|--------------------------------------------------------|
| AppData    | Not Configured                                         |
| Contacts   | Not Configured                                         |
| Desktop    | `\\\\server\share\Users\%username%\OneDrive\Desktop`   |
| Documents  | `\\\\server\share\Users\%username%\OneDrive\Documents` |
| Downloads  | Not Configured                                         |
| Favourites | Not Configured                                         |
| Links      | Not Configured                                         |
| Searches   | Not Configured                                         |
| Music      | Not Configured                                         |
| Pictures   | `\\\\server\share\Users\%username%\OneDrive\Pictures`  |
| Videos     | Not Configured                                         |

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* None identified

#### References

* None identified