---
title: "Windows Search and Cortana"
weight: 55
description: "This section describes the design decisions associated with Windows search and Cortana on Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

The Windows Search feature of Windows 10 and 11 provides indexing capability of the operating and file system enabling rapid searching for content stored on an attached hard disk. Once indexed, a file can be searched using either the file name or the content contained within the file.

Cortana is a voice search capability of Windows 10. Cortana's features include being able to set reminders, recognise natural voice without the user having to input a predefined series of commands, and answer questions using information from Bing (like current weather and traffic conditions, sports scores, and biographies).

Cortana can be used to perform tasks like setting a reminder, asking a question, or launching the app.

Configuration of Cortana features can be managed by GPO or modern management (such as Microsoft Intune).

Windows Search is text-based and is built into the local operating system.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point | Design Decision                          | Justification                                                                                                   |
|----------------|------------------------------------------|-----------------------------------------------------------------------------------------------------------------|
| Cortana        | Disabled                                 | As per ASD's [*Hardening Microsoft Windows 10 version 21H1 Workstations*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/hardening-microsoft-windows-10-version-21h1-workstations) guidance the Cortana feature will be disabled to comply with security requirements. |
| Windows Search | Enabled and configured for local content | Windows search will be limited to local items only to prevent data leakage.                                     |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* [ASD Windows Hardening Guidelines]({{<ref "configuration/intune/devices/configuration-profiles/asd-windows-hardening-guidelines.md">}})

#### References

* None identified