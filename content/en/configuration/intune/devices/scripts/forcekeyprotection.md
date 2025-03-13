---
title: Force Key Protection
weight: 10
description: "This section describes the configuration of Powershell scripts within Microsoft Intune associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below script outlines the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Intune portal at the following URL:

https://intune.microsoft.com/#view/Microsoft_Intune_DeviceSettings/DevicesMenu/~/scripts

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Properties

#### Basics

| Item        | Value              |
| ----------- | ------------------ |
| Name        | ForceKeyProtection |
| Description | No Description     |

#### Script settings

| Item                                            | Value                                                                                                                                                                                          |
| ----------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| PowerShell script                               | {{% download file="/content/files/configscripts/ForceKeyProtection.txt" %}} ForceKeyProtection {{% /download %}}.ps1 <br> *Note: download the linked .txt file, and rename to .ps1 for upload* |
| Run this script using the logged on credentials | No                                                                                                                                                                                             |
| Enforce script signature check                  | No                                                                                                                                                                                             |
| Run script in 64 bit PowerShell Host            | No                                                                                                                                                                                             |

#### Assignments

| Item            | Value              |
| --------------- | ------------------ |
| Included groups | No Included groups |
| Excluded groups | No Excluded groups |

### Related information

#### Security & Governance

* None identified
  
#### Design

* None identified
  
#### Configuration

* None identified

#### References

* [Microsoft Intune ACSC Windows Hardening Guidelines](https://github.com/microsoft/Intune-ACSC-Windows-Hardening-Guidelines)
* [Intune Management Extension Powershell Scripts](https://docs.microsoft.com/mem/intune/apps/intune-management-extension)
