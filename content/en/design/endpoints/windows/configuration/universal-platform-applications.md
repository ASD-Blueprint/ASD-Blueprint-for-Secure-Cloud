---
title: "Universal Platform Applications"
weight: 35
description: "This section describes the design decisions associated with universal platform applications on Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

Universal Windows Platform (UWP) applications are applications that run on Windows 10 and newer devices. Developers can build line of business Windows Store apps using standard programming languages. The Windows Runtime (WinRT) supports C#, C++, JavaScript and Visual Basic.

UWP applications cannot access user resources unless the application specifically declares a need to use those resources. This ensures a clear connection between apps and the types of resources the app has access to.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point        | Design Decision | Justification                                                                                                                                                                                             |
|-----------------------|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Windows SOE Footprint | Reduce          | The organisation will reduce the size of the Windows SOE footprint by configuring the settings in the next table unless the organisation has a specific requirement for these applications to be enabled. |

{{% /alert %}}

### Configuration

| Configuration                  | Value                                                          | Description                                                                                                                                                            |
| ------------------------------ | -------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Alarms and Clock               | Provisioned                                                    | A versatile combination of alarm clock app, world clock, timer, and stopwatch.                                                                                         |
| Bing                           | Removed                                                        | Weather and News.                                                                                                                                                      |
| Calculator                     | Provisioned                                                    | A calculator that includes standard, scientific, and programmer modes, as well as a unit converter.                                                                    |
| Camera                         | Removed                                                        | The redesigned Camera is faster and simpler than ever before.                                                                                                          |
| Mail and Calendar              | Removed                                                        | The Mail and Calendar apps provides access to a user's email, schedule, and contacts. This access will be granted through Outlook.                                     |
| Maps                           | Removed                                                        | Provides search functionality for places to get directions, contact numbers, business info, and reviews.                                                               |
| Microsoft OneDrive             | OneDrive personal removed. OneDrive for Business will be used. | OneDrive is a cloud storage, file hosting service that enables a user to synchronise files and later access them from a web browser or mobile device.                   |
| Microsoft Solitaire Collection | Removed                                                        | Microsoft Solitaire Collection on Windows 10.                                                                                                                          |
| Microsoft Video                | Removed                                                        | The Movies & TV app brings a user the latest entertainment in one simple, fast, and elegant app on Windows.                                                            |
| Mixed Reality                  | Removed                                                        | 3D Viewer, Print 3D, Mixed Reality Portal.                                                                                                                             |
| Mobile                         | Removed                                                        | Phone, Mobile Plans, Connect App.                                                                                                                                      |
| OfficeHub                      | Removed                                                        | MyOffice.                                                                                                                                                              |
| OneNote                        | Provisioned                                                    | Microsoft OneNote Application.                                                                                                                                         |
| Paint3D                        | Provisioned                                                    | Microsoft Paint3D Application.                                                                                                                                         |
| People                         | Removed                                                        | The People app in Windows is a modern take on the flat contact lists of the past. It is built for the way people communicate today and is connected to cloud services. |
| Photos                         | Provisioned                                                    | The best place to enjoy, organise, edit, and share digital memories.                                                                                                   |
| Snip and Sketch                | Provisioned                                                    | Capture a specific area of the screen.                                                                                                                                 |
| MS Paint                       | Provisioned                                                    | Creative paint and drawing tool.                                                                                                                                       |
| Sticky Notes                   | Provisioned                                                    | Sticky Notes.                                                                                                                                                          |
| Store                          | Microsoft Store for Business will be used.                     | Shopfront for purchasing and downloading applications.                                                                                                                 |
| Microsoft Xbox                 | Removed                                                        | The Xbox experience on Windows. The Xbox app brings together friends, games, and accomplishments across Xbox One and Windows devices.                                  |
| Zune                           | Removed                                                        | Groove Music and Movies.                                                                                                                                               |

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* None identified

#### References

* None identified