---
title: "Local Administrator"
weight: 55
description: "This section describes the design decisions associated with local administrator accounts on Windows 10 and 11 endpoints configured according to guidance in ASD's Blueprint for Secure Cloud."
---

The default local Administrator account is a highly privileged user account found on every Windows operating system. The Administrator account is the first account that is created during the installation for all Windows client operating systems.

The Administrator account can be used to create local users and assign user rights and access control permissions. It can also be used take control of local resources at any time simply by changing the user rights and permissions.

The default Administrator account cannot be deleted or locked out, but it can be renamed and / or disabled. It is Microsoft best practice and an ASD hardening guideline recommendation to leave the Administrator account disabled and renamed.

If there is a requirement to utilise the local Administrator account in an on-premises environment, Microsoft provides Local Administrator Password Solution (LAPS), an Active Directory integrated Access Control List (ACL) protected password management tool.

LAPS allows system administrators the ability to set a different, random password for the common local administrator account on each computer in the domain and store the password for the computer's local administrator account in Active Directory, secured in a confidential attribute in the computer's corresponding Active Directory object.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                          | Design Decision | Justification                                                                                                                                                                                                                                                                                              |
|-----------------------------------------|-----------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Local Administrator Account             | Disabled        | The local administrator account will be disabled to align with ASD's [*Hardening Microsoft Windows 10 version 21H1 Workstations*](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/hardening-microsoft-windows-10-version-21h1-workstations) guidance.                                                                                                                                                                                                        |
| Local Administrator Account Name        | Renamed         | The local administrator account will be renamed during the image deployment<br>In line with [Microsoft recommendations for securing the local administrator account](https://learn.microsoft.com/windows/security/threat-protection/security-policy-settings/accounts-rename-administrator-account). |
| Local Administrator Account Password    | Randomised      | To align with ASD's *Hardening Microsoft Windows 10 version 21H1 Workstations* guidance.                                                                                                                                                                                                                                                         |
| Additional Local Administrator Accounts | Not Configured  | Additional administrator accounts will not be created during the image deployment.                                                                                                                                                                                                                         |
| LAPS                                    | Not Configured  | Not required for the solution. The local Administrator account will be disabled and renamed.                                                                                                                                                                                                               |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* None identified