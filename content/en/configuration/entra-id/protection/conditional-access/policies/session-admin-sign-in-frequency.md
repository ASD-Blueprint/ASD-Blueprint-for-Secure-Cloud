---
title: "SESSION - Admin Sign-in Frequency"
weight: 10
type: docs
description: "This page describes the configuration of policies for conditional access within Microsoft Entra ID associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Entra ID portal blade at the following URL:

https://entra.microsoft.com/#view/Microsoft_AAD_ConditionalAccess/ConditionalAccessBlade/~/Policies
 
The settings described in these tables should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Name

| Item |                             Value |
| ---- | --------------------------------: |
| Name | SESSION - Admin Sign-in Frequency |

### Assignments

#### Users

| Item                                                |                   Value |
| --------------------------------------------------- | ----------------------: |
| **Include**                                         | Select users and groups |
| Guest or external users                             |             Not checked |
| Directory roles                                     |                 Checked |
| - Application Administrator                         |                 Checked |
| - Application Developer                             |                 Checked |
| - Attack Payload Author                             |                 Checked |
| - Attack Simulation Administrator                   |                 Checked |
| - Attribute Assignment Administrator                |                 Checked |
| - Attribute Assignment Reader                       |                 Checked |
| - Attribute Definition Administrator                |                 Checked |
| - Attribute Definition Reader                       |                 Checked |
| - Attribute Log Administrator                       |             Not checked |
| - Attribute Log Reader                              |             Not checked |
| - Authentication Administrator                      |                 Checked |
| - Authentication Policy Administrator               |                 Checked |
| - Azure DevOps Administrator                        |                 Checked |
| - Azure Information Protection Administrator        |                 Checked |
| - B2C IEF Keyset Administrator                      |                 Checked |
| - B2C IEF Policy Administrator                      |                 Checked |
| - Billing Administrator                             |                 Checked |
| - Cloud App Security Administrator                  |                 Checked |
| - Cloud Application Administrator                   |                 Checked |
| - Cloud Device Administrator                        |                 Checked |
| - Compliance Administrator                          |                 Checked |
| - Compliance Data Administrator                     |                 Checked |
| - Conditional Access Administrator                  |                 Checked |
| - Customer LockBox Access Approver                  |                 Checked |
| - Desktop Analytics Administrator                   |                 Checked |
| - Device Join                                       |             Not checked |
| - Device Managers                                   |             Not checked |
| - Device Users                                      |             Not checked |
| - Directory Readers                                 |                 Checked |
| - Directory Synchronization Accounts                |                 Checked |
| - Directory Writers                                 |                 Checked |
| - Domain Name Administrator                         |                 Checked |
| - Dynamics 365 Administrator                        |                 Checked |
| - Dynamics 365 Business Central Administrator       |             Not checked |
| - Edge Administrator                                |                 Checked |
| - Exchange Administrator                            |                 Checked |
| - Exchange Recipient Administrator                  |                 Checked |
| - Extended Directory User Administrator             |             Not checked |
| - External ID User Flow Administrator               |                 Checked |
| - External ID User Flow Attribute Administrator     |                 Checked |
| - External Identity Provider Administrator          |                 Checked |
| - Fabric Administrator                              |                 Checked |
| - Global Administrator                              |                 Checked |
| - Global Reader                                     |                 Checked |
| - Global Secure Access Administrator                |             Not checked |
| - Groups Administrator                              |                 Checked |
| - Guest Inviter                                     |                 Checked |
| - Guest User                                        |             Not checked |
| - Helpdesk Administrator                            |                 Checked |
| - Hybrid Identity Administrator                     |                 Checked |
| - Identity Governance Administrator                 |                 Checked |
| - Insights Administrator                            |                 Checked |
| - Insights Analyst                                  |                 Checked |
| - Insights Business Leader                          |                 Checked |
| - Intune Administrator                              |                 Checked |
| - Kaizala Administrator                             |                 Checked |
| - Knowledge Administrator                           |                 Checked |
| - Knowledge Manager                                 |                 Checked |
| - License Administrator                             |                 Checked |
| - Lifecycle Workflows Administrator                 |                 Checked |
| - Message Center Privacy Reader                     |                 Checked |
| - Message Center Reader                             |                 Checked |
| - Microsoft 365 Migration Administrator             |             Not checked |
| - Microsoft Entra Joined Device Local Administrator |                 Checked |
| - Microsoft Hardware Warranty Administrator         |                 Checked |
| - Microsoft Hardware Warranty Specialist            |                 Checked |
| - Modern Commerce Administrator                     |                 Checked |
| - Network Administrator                             |                 Checked |
| - Office Apps Administrator                         |                 Checked |
| - Organizational Messages Writer                    |                 Checked |
| - Partner Tier1 Support                             |             Not checked |
| - Partner Tier2 Support                             |             Not checked |
| - Password Administrator                            |                 Checked |
| - Permissions Management Administrator              |                 Checked |
| - Power Platform Administrator                      |                 Checked |
| - Printer Administrator                             |                 Checked |
| - Printer Technician                                |                 Checked |
| - Privileged Authentication Administrator           |                 Checked |
| - Privileged Role Administrator                     |                 Checked |
| - Reports Reader                                    |                 Checked |
| - Restricted Guest User                             |             Not checked |
| - Search Administrator                              |                 Checked |
| - Search Editor                                     |                 Checked |
| - Security Administrator                            |                 Checked |
| - Security Operator                                 |                 Checked |
| - Security Reader                                   |                 Checked |
| - Service Support Administrator                     |                 Checked |
| - SharePoint Administrator                          |                 Checked |
| - Skype for Business Administrator                  |                 Checked |
| - Teams Administrator                               |                 Checked |
| - Teams Communications Administrator                |                 Checked |
| - Teams Communications Support Engineer             |                 Checked |
| - Teams Communications Support Specialist           |                 Checked |
| - Teams Devices Administrator                       |                 Checked |
| - Tenant Creator                                    |                 Checked |
| - Usage Summary Reports Reader                      |                 Checked |
| - User                                              |             Not checked |
| - User Administrator                                |                 Checked |
| - Virtual Visits Administrator                      |                 Checked |
| - Viva Goals Administrator                          |                 Checked |
| - Viva Pulse Administrator                          |             Not checked |
| - Windows 365 Administrator                         |                 Checked |
| - Windows Update Deployment Administrator           |                 Checked |
| - Workplace Device Join                             |             Not checked |
| - Yammer Administrator                              |                 Checked |
| Users and groups                                    |             Not checked |

#### Target Resources

| Item                               |          Value |
| ---------------------------------- | -------------: |
| Select what this policy applies to |     Cloud apps |
| **Include**                        | All cloud apps |
| **Exclude**                        |           None |

#### Conditions

| Item                                                                |          Value |
| ------------------------------------------------------------------- | -------------: |
| **User risk**                                                       | Not configured |
| **Sign-in risk**                                                    | Not configured |
| **Device platforms**                                                | Not configured |
| **Locations**                                                       | Not configured |
| **Client apps**<br>Select the client apps this policy will apply to |                |
| Browser                                                             |        Checked |
| Mobile apps and desktop clients                                     |        Checked |
| Exchange ActiveSync clients                                         |    Not checked |
| Other clients                                                       |        Checked |
| **Filter for devices**                                              | Not configured |

### Access Controls

#### Grant

| Item                                                |                                Value |
| --------------------------------------------------- | -----------------------------------: |
| Control access enforcement to block or grant access |                         Grant access |
| Require multifactor authentication                  |                              Checked |
| Require authentication strength                     |                          Not checked |
| Require device to be marked as compliant            |                          Not checked |
| Require Microsoft Entra hybrid joined device        |                          Not checked |
| Require approved client app                         |                          Not checked |
| Require app protection policy                       |                          Not checked |
| Require password change                             |                          Not checked |
| Acceptable Use Policy                               |                          Not checked |
| For multiple controls                               | Require one of the selected controls |

#### Session

| Item                                      |       Value |
| ----------------------------------------- | ----------: |
| Use app enforced restrictions             | Not checked |
| Use Conditional Access App Control        | Not checked |
| Sign-in frequency                         |     Checked |
| - Periodic reauthentication               |     4 hours |
| Persistent browser session                | Not checked |
| Customize continuous access evaluation    | Not checked |
| Disable resilience defaults               | Not checked |
| Use Global Secure Access security profile | Not checked |

### Enable policy

| Item          | Value |
| ------------- | ----: |
| Enable policy |    On |

### Related information

#### Security & Governance

* [Multi-factor Authentication]({{<ref "multi-factor-authentication">}})
* [Authentication Hardening]({{<ref "system-hardening-authentication">}})

#### Design

* [Conditional access]({{<ref "design/platform/identity/conditional-access">}})

#### Configuration

* None identified

#### References

* [Configure Microsoft Entra multifactor authentication settings](https://learn.microsoft.comentra/identity/authentication/howto-mfa-mfasettings)
* [System-preferred multifactor authentication - Authentication methods policy](https://learn.microsoft.com/entra/identity/authentication/concept-system-preferred-multifactor-authentication)
* [Protecting authentication methods in Microsoft Entra ID](https://learn.microsoft.com/entra/identity/authentication/concept-authentication-default-enablement)

