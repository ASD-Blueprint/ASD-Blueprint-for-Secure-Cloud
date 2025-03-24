---
title: "Start Menu"
weight: 85
description: "This section describes the design decisions associated with the start menu on Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

The Windows 10 Start Menu contains tiles that represent different programs that a user can launch by clicking on the tile. The Windows 11 Start Menu has been further updated to include both pinned applications and recommended documents by default.

The default Start Menu layout can be configured for all users that use the device. Applications can be pinned to the start menu by administrators to ensure a consistent user experience across the environment. There are three levels of enforcement which are possible within the start menu:

* **Full enforcement** – The start menu is deployed centrally and cannot be altered by users in any way. Applications dictated by administrators are the only items which are present in the start menu. 
* **Partial enforcement** – The start menu is deployed centrally and can be altered by users. An application group is deployed for corporate shortcuts and users can then add applications to the start menu in a separate application group. The centrally deployed application group cannot be altered.
* **No enforcement** – No start menu is defined centrally, and users can make any modification to the start menu.

{{% alert title="Design decisions" color="warning" %}}

| Decision point             | Design decision | Justification                                                                                                                                                                                                                                                                     |
|----------------------------|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Start Menu Layout Enforced | Partially       | Corporate application group will be enforced, with the rest of the application group able to be customised by users. End-users can customise the Start Menu to suit specific needs, including the ability to resize, reorganise and choose whether to list most recent shortcuts. |

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