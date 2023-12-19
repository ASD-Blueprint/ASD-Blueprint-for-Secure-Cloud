---
title: "Microsoft Office Hardening"
weight: 40
description: "This section describes the design decisions associated with Microsoft Office on Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

The following design components apply to the hardening of Microsoft 365 Apps for Enterprise.

The Microsoft Office security settings detailed in this section are based on Microsoft best practice and ASD's [*Hardening Microsoft 365, Office 2021, Office 2019 and Office 2016*](https://www.cyber.gov.au/acsc/view-all-content/publications/hardening-microsoft-365-office-2021-office-2019-and-office-2016) guidance.

{{% alert title="Design Decisions" color="warning" %}}

* Attack Surface Reduction
  * Justification: To align with ASD's ACSC Microsoft Office hardening guidance.
  * Attack Surface Reduction rules: Enabled
  * Block executable content from email client and webmail
```
BE9BA2D9-53EA-4CDC-84E5-9B1EEEE46550
```
  * Block all Office applications from creating child processes
```
D4F940AB-401B-4EFC-AADC-AD5F3C50688A
```
  * Block Office applications from creating executable content
```
3B576869-A4EC-4529-8536-B80A7769E899
```
  * Block Office applications from injecting code into other processes
```
75668C1F-73B5-4CF0-BB93-3ECF5CB7CC84
```
  * Block Win32 API calls from Office macro
```
92E97FA1-2EDF-4476-BDD6-9DD0B4DDDC7B
```
  * Block Office communication application from creating child processes
```
26190899-1602-49E8-8B27-EB1D0A1CE869
```
* Flash content
  * Justification: To align with ASD's ACSC Microsoft Office hardening guidance.
  * Block Flash activation in Office documents: Block all activation
* Loading external content
  * Justification: To align with ASD's ACSC Microsoft Office hardening guidance.
  * Always prevent untrusted Microsoft Query files from opening: Enabled
  * Don't allow Dynamic Data Exchange (DDE) server launch in Excel: Enabled
  * Don't allow Dynamic Data Exchange (DDE) server lookup in Excel: Enabled
  * Update automatic links at Open: Disabled
* Macros
  * Justification: To align with ASD's ACSC Microsoft Office hardening guidance.
  * See following section.
* Object Linking and Embedding packages
  * Justification: To align with ASD's ACSC Microsoft Office hardening guidance.
  * See following section.
* ActiveX
  * Justification: To align with ASD's ACSC Microsoft Office hardening guidance.
  * Disable All ActiveX: Enabled
* Add-ins
  * Justification: To align with ASD's ACSC Microsoft Office hardening guidance.
  * Disable Trust Bar Notification for unsigned application add-ins and block them: Enabled
  * Require that application add-ins are signed by Trusted Publishers: Enabled
* Extension Hardening
  * Justification: To align with ASD's ACSC Microsoft Office hardening guidance.
  * Force file extension to match file type: Enabled - Always match file type
* File Type Blocking
  * Justification: To align with ASD's ACSC Microsoft Office hardening guidance.
  * Set default file block behaviour: Enabled - Blocked files are not opened
  * Excel: File Block Settings
```
  dBase III / IV files, 
  Dif and Sylk files, 
  Excel 2 macrosheets and add-in files, 
  Excel 2 worksheets, 
  Excel 3 macrosheets and add-in files, 
  Excel 3 worksheets, 
  Excel 4 macrosheets and add-in files, 
  Excel 4 workbooks, 
  Excel 4 worksheets, 
  Excel 95 workbooks, 
  Excel 95-97 workbooks and templates, 
  Excel 97-2003 workbooks and templates, 
  Web pages and Excel 2003 XML spreadsheets
```
  * PowerPoint: File Block Settings
```
  PowerPoint 97-2003 presentations, shows, templates and add-in files
```
  * Visio: File Block Settings
```
  Visio 2000-2002 Binary Drawings, Templates and Stencils,
  Visio 2003-2010 Binary Drawings, Templates and Stencils, 
  Visio 5.0 or earlier Binary Drawings, Templates and Stencils 
```
  * Word: File Block Settings
```
  Word 2 and earlier binary documents and templates, 
  Word 2000 binary documents and templates, 
  Word 2003 binary documents and templates, 
  Word 2007 and later binary documents and templates, 
  Word 6.0 binary documents and templates, 
  Word 95 binary documents and templates, 
  Word 97 binary documents and templates, 
  Word XP binary documents and templates
```
* Office File Validation
  * Justification: To align with ASD's ACSC Microsoft Office hardening guidance.
  * Turn off file validation: Disabled (Excel, PowerPoint and Word)
* Running external programs
  * Justification: To align with ASD's ACSC Microsoft Office hardening guidance.
  * Run Programs: Disable (Don't run any programs)
* Protected View
  * Justification: To align with ASD's ACSC Microsoft Office hardening guidance.
  * Always open untrusted database files in Protected View: Enabled
  * Do not open files from the Internet zone in Protected View: Disabled
  * Do not open files in unsafe locations in Protected View: Disabled
  * Set document behaviour if file validation fails: Enabled (Block files)
  * Turn off Protected View for attachments opened from Outlook: Disabled
* Trusted documents
  * Justification: To align with ASD's ACSC Microsoft Office hardening guidance.
  * Turn off trusted documents: Enabled
  * Turn off trusted documents on the network: Enabled
* Hidden markup
  * Justification: To align with ASD's ACSC Microsoft Office hardening guidance.
  * Make hidden markup visible: Enabled (PowerPoint and Word)
* Reporting information
  * Justification: To align with ASD's ACSC Microsoft Office hardening guidance.
  * Allow including screenshot with Office Feedback: Disabled
  * Automatically receive small updates to improve reliability: Disabled
  * Configure the type of diagnostic data sent by Office to Microsoft: Enabled (Basic)
  * Disable Opt-in Wizard on first run: Enabled
  * Enable Customer Experience Improvement Program: Disabled
  * Send Office Feedback: Disabled
  * Send personal information: Disabled

  {{% /alert %}}

  ### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* None identified