---
title: "Microsoft Stream"
weight: 50
description: "This section describes the design decisions associated with SharePoint based Microsoft Stream video service for system(s) built using ASD's Blueprint for Secure Cloud."
---

Stream (on SharePoint) is an intelligent enterprise video experience that is part of Microsoft 365. It enables users to record, upload, discover, share, and manage video just as they would any other file. Stream seamlessly integrates with apps across Microsoft 365, to provide the same experience regardless of where the user engages with the video content.

Microsoft Stream provides two platforms :

* Stream (on SharePoint) is uploading and using video files directly stored in SharePoint, Teams, and OneDrive.

* Stream (Classic) is using video files stored on the retiring Azure based microsoftstream.com service

{{% alert title="Design decisions" color="warning" %}}

| Decision point                | Design decision                                                                                 | Justification                                                                                                                             |
|-------------------------------|-------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| Usage of Stream on SharePoint | Utilise Microsoft Stream (Built on SharePoint) experience rather than Stream Classic experience | Stream Classic experience is being deprecated.<br>Storing Stream videos in SharePoint Online provides additional compliance capabilities. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* None identified

#### References

* None identified