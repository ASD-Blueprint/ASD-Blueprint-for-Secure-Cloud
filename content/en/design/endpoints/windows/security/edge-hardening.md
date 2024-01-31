---
title: "Microsoft Edge Hardening"
weight: 15
description: "This section describes the design decisions associated with Microsoft Edge on Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

The Microsoft Edge security settings support Edge version 90 and later. The Microsoft Edge security settings detailed in this section are based on Microsoft best practice and ASD's [*Hardening Microsoft Windows 10 version 21H1 Workstations*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/hardening-microsoft-windows-10-version-21h1-workstations) guidance.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                                                               | Design Decision                                   | Justification                                        |
|------------------------------------------------------------------------------|---------------------------------------------------|------------------------------------------------------|
| Allow download restrictions                                                  | Block potentially dangerous or unwanted downloads | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance. |
| Configure Do Not Track                                                       | Enable                                            | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance. |
| Control the mode of DNS-over-HTTPS                                           | Disable DNS-over-HTTPS                            | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance. |
| Control where developer tools can be used                                    | Don't allow using the developer tools             | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance. |
| DNS interception checks enabled                                              | Disabled                                          | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance. |
| Default pop-up window setting                                                | Do not allow any site to show pop-ups              | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance. |
| Enable saving passwords to the password manager                              | Disable                                           | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance. |
| Configure Windows Defender SmartScreen                                       | Enabled                                           | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance. |
| Prevent bypassing Microsoft Defender SmartScreen prompts for sites           | Enabled                                           | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance. |
| Prevent bypassing of Microsoft Defender SmartScreen warnings about downloads | Enabled                                           | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance. |
| Prevent users and apps from accessing dangerous websites                     | Enabled (Block)                                   | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance. |
| Turn on Windows Defender Application Guard in Managed Mode                   | Enabled                                           | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance. |

{{% /alert %}}

### Web Advertisement Blocking

Web advertisements may be used by threat actors to deliver malicious code or to attempt to phish legitimate users.

The ASD recommends blocking browsers from processing web advertisements as part of the Essential Eight. Microsoft Edge's native web advertisement capability is limited and does not provide an effective mitigation against the risk of malicious web advertisement. Edge supports third-party add-ons to provide greater web advertisement blocking with examples including uBlock Origin and Ad Block Plus. However, please note that the ASD does not explicitly recommend either product or other third-party add-ons. Instead, organisations should perform their own risk-based assessment prior to using them as part of a deployment.

If supported by their existing web content filtering implementations, organisations may also implement web advertisement blocking at the proxy level for additional protection against web advertisement-based threats.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                     | Design Decision              | Justification                                                     |
|------------------------------------|------------------------------|-------------------------------------------------------------------|
| Native Edge advertisement blocking | Enabled - BlockAds (default) | To leverage native capabilities within the browser.               |
| Third-party add-on                 | Deployed via MEM             | To align with Essential Eight user application hardening guidance |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* None identified