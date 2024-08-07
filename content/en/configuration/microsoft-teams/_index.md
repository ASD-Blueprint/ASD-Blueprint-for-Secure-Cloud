---
title: "Microsoft Teams"
linkTitle: "Microsoft Teams"
weight: 080
description: "This section describes the configuration of Microsoft Teams associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Teams admin portal at the following URL:

<https://admin.teams.microsoft.com/>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

settings in a Microsoft 365 tenancy exactly as outlined in the Configuration pages of the Blueprint. Organisations should ensure they customise configuration of their Microsoft 365 tenancies in accordance with their own design decisions and requirements, deviating from the Blueprint (including automated configuration files) where appropriate.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Automated Configuration Deployment

#### Overview

All of the Teams configurations can be automatically deployed using Microsoft 365 Desired State Configuration (DSC).

#### Desired State Configuration

Before using the below Microsoft 365 Desired State Configuration (DSC) file, please refer to [Automated Deployment]({{<ref "automated-deployment">}}) for instructions.

| Desired State Configuration File                                                                                                                                                     |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Download {{% download file="/content/files/automation/dsc/asdbpsc-dsc-teams.txt"%}} Teams DSC {{% /download %}} (.ps1) <br> *Note: download the linked .txt file and rename to .ps1* |
| **Configuration Data File:**                                                                                                                                                         |
| The Configuration Data File can be found on the [Automated Deployment]({{<ref "automated-deployment">}}) page.                                                                       |

##### Service Principal permissions

To import the DSC as per the instructions on the [Automated Deployment]({{<ref "automated-deployment">}}) page, the following permissions will need to be added to the Service Principal:

```powershell
"TeamsAppPermissionPolicy", "TeamsAudioConferencingPolicy", "TeamsCallHoldPolicy", "TeamsCallingPolicy", "TeamsChannelsPolicy", "TeamsClientConfiguration", "TeamsComplianceRecordingPolicy", "TeamsDialInConferencingTenantSettings", "TeamsEventsPolicy", "TeamsFederationConfiguration", "TeamsFeedbackPolicy", "TeamsGroupPolicyAssignment", "TeamsGuestCallingConfiguration", "TeamsGuestMeetingConfiguration", "TeamsGuestMessagingConfiguration", "TeamsMeetingBroadcastConfiguration", "TeamsMeetingBroadcastPolicy", "TeamsMeetingConfiguration", "TeamsMeetingPolicy", "TeamsMessagingPolicy", "TeamsOrgWideAppSettings", "TeamsPstnUsage", "TeamsShiftsPolicy", "TeamsTemplatesPolicy", "TeamsTenantDialPlan", "TeamsTenantNetworkRegion", "TeamsTenantNetworkSite", "TeamsTranslationRule", "TeamsUpdateManagementPolicy", "TeamsUpgradeConfiguration"
```
