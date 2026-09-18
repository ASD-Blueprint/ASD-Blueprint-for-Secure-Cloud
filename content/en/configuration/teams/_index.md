---
title: "Microsoft Teams"
weight: 080
description: "This section describes the configuration of Microsoft Teams associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the _as built_ configuration for ASD's _Blueprint for Secure Cloud_ (the Blueprint) for the Microsoft Teams admin portal at the following URL:

<https://admin.teams.microsoft.com/>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

settings in a Microsoft 365 tenancy exactly as outlined in the Configuration pages of the Blueprint. Organisations should ensure they customise configuration of their Microsoft 365 tenancies in accordance with their own design decisions and requirements, deviating from the Blueprint (including automated configuration files) where appropriate.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Automated Configuration Deployment and Assessment

#### Overview

Some of the Teams configurations can be automatically deployed using Microsoft 365 Desired State Configuration (DSC).

Some of the Teams configurations cannot be assessed using a DSC blueprint. Please refer to those configuration pages to conduct a manual assessment.

| Configuration              | Blueprint automation provided |
| -------------------------- | ----------------------------- |
| **Teams & Channels**       |                               |
| - Teams                    | Yes (DSC)<sup>1</sup>         |
| - Teams update management  | Yes (DSC)                     |
| - Migrating to Teams       | Yes (DSC)                     |
| **External collaboration** |                               |
| - Guest access             | Yes (DSC)                     |
| - B2B member access        | No                            |
| **Apps**                   | Yes (DSC)                     |
| **Meetings & Events**      |                               |
| - Audio conferencing       | Yes (DSC)                     |
| - Meetings                 | Yes (DSC)<sup>2</sup>         |
| - Themes & customization   | No                            |
| - Live events              | Yes (DSC)                     |
| - Events                   | Yes (DSC)<sup>3</sup>         |
| **Messaging**              | Yes (DSC)                     |
| **Voice**                  |                               |
| - Calling                  | Yes (DSC)                     |
| - Call park                | Yes (DSC)                     |
| - Caller ID                | No                            |
| - Mobility                 | Yes (DSC)                     |
| - Voicemail                | Yes (DSC)                     |
| - Voice applications       | No                            |
| **Emergency**              | Yes (DSC)                     |
| **Enhanced encryption**    | Yes (DSC)                     |
| **Users**                  | Yes (DSC)                     |
| **Teams apps**             | No                            |

1: The _Notifications and feeds_, _Tagging_, _Email integration_, _Search by name_, _Safety and communication_ and _Shared channels_ configurations must be set manually.

2: The _Include attendees in the report_, _Real-time-text (RTT)_, _Allow streaming media input_ and _Anonymous users can interact with apps in meetings_ configurations must be set manually.

3: The _Recording & transcription_ configurations must be set manually.

#### Desired State Configuration

Before using the below DSC file, please refer to the [setup](/tools/deployment-and-assessment/desired-state-configuration-setup) and [automated deployment](/tools/deployment-and-assessment/automated-deployment) pages for instructions.

Do not proceed with the automated deployment instructions until you've familiarised yourself with the [addition configuration](#additional-configuration) required below.

**Desired State Configuration file**<br>Download the {{% download file="/content/files/automation/dsc/BlueprintTeamsDsc.txt" %}} Teams DSC file {{% /download %}} and rename the linked .txt file to .ps1.

**Configuration data file**<br>Download the {{% download file="/content/files/automation/dsc/ConfigurationData.txt" %}} configuration data file {{% /download %}} and rename the linked .txt file to .psd1.

{{% alert title="Non-global policy settings" color="info" %}}

Teams includes a number of pre-configured default policies to help simplify onboarding by providing baseline settings for common scenarios. These policies are typically found in the _custom policies_ sections of the Teams admin centre.

The DSC file includes settings for managing global policies but does not modify the pre-configured or custom policies.

{{% /alert %}}

{{% alert title="Warning" color="danger" %}}

Any existing settings in a tenancy that match the name or UID of any settings in the DSC will be overwritten.

{{% /alert %}}

##### Service principal permissions

For organisations importing the DSC as per the instructions on the [automated deployment](/tools/deployment-and-assessment/automated-deployment) page, the following permissions will need to be added to the M365DSC app:

```powershell
"TeamsAppPermissionPolicy", "TeamsAudioConferencingPolicy", "TeamsCallHoldPolicy", "TeamsCallingPolicy", "TeamsChannelsPolicy", "TeamsClientConfiguration", "TeamsComplianceRecordingPolicy", "TeamsDialInConferencingTenantSettings", "TeamsEventsPolicy", "TeamsFederationConfiguration", "TeamsFeedbackPolicy", "TeamsGroupPolicyAssignment", "TeamsGuestCallingConfiguration", "TeamsGuestMeetingConfiguration", "TeamsGuestMessagingConfiguration", "TeamsMeetingBroadcastConfiguration", "TeamsMeetingBroadcastPolicy", "TeamsMeetingConfiguration", "TeamsMeetingPolicy", "TeamsMessagingPolicy", "TeamsOrgWideAppSettings", "TeamsPstnUsage", "TeamsShiftsPolicy", "TeamsTemplatesPolicy", "TeamsTenantDialPlan", "TeamsTenantNetworkRegion", "TeamsTenantNetworkSite", "TeamsTranslationRule", "TeamsUpdateManagementPolicy", "TeamsUpgradeConfiguration"
```

##### Additional configuration

The following instructions must be completed before _step 6 Deploy the configuration_, on the [automated deployment](/tools/deployment-and-assessment/automated-deployment) page:

- Assign the Entra, Teams Administrator role to the M365DSC service principal.
