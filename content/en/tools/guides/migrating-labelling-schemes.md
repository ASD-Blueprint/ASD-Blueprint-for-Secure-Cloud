---
Title: "Migrating labelling schemes"
linkTitle: "Migrating labelling schemes"
weight: 10
description: "This section describes how to migrate labelling schemes within Microsoft Purview for system(s) built using ASD's Blueprint for Secure Cloud."
---

### Migrating from old labelling schemes

Organisations intending to migrate from currently in-place labelling schemes to newer sensitivity label naming, priority ordering or grouping, or to use revised [PSPF markings in emails](https://www.protectivesecurity.gov.au/publications-library/australian-government-email-protective-marking-standard), should consider the following priority outcomes:

* The new scheme is correct in terms of label naming, priority ordering and grouping from a user experience perspective
* Implementing the new scheme incurs minimal impact to business operations
* Data security controls associated with labelling are maintained

The simplest approach can be to delete old sensitivity labels and all label-dependent configurations and start again from first principles. However this may not be possible while ensuring the above outcomes. The following caveats should be considered before proceeding with any label migration activity.

#### Duplicate label identifiers

Sensitivity labels have several distinct identifiers including a GUID for programmatic use and service integration, a *name* which is used an administrative identifier, and a *display name* which is presented for selection by users in applications and workflows. Conflicts can arise when creating labels with the same name, or same display name:

* Purview will prevent the use of duplicate label names
* Purview will only permit the use of duplicate label display names if the labels are created as sub-labels under different parent labels
* Purview will prevent label priority ordering changes to move labels into, or out of, label groups
* Azure Rights Management will prevent the creation of new labels with the same name as those used with archived protection templates (from a deleted label)

{{% alert title="Handling label naming conflicts" color="info" %}}

When creating a new labelling scheme, existing sensitivity labels should be preserved where possible. Conflicts in label names can be resolved by appending a version number to the label name (not display name). The most recent version would be used in policies and made visible to users, enabling efforts to deprecate old labels to continue in the background.

| Label property     | Old label | New label    |
| ------------------ | --------- | ------------ |
| Label name         | OFFICIAL  | OFFICIAL v02 |
| Label display name | OFFICIAL  | OFFICIAL     |

{{% /alert %}}

#### Relabelling

It is currently not possible to use conventional Purview mechanisms, like auto-labelling and data loss prevention, to detect the existence of old sensitivity labels and apply new ones. It is possible to manipulate the labels applied to information via a combination of PowerShell or Power Automate flows with Graph API calls, or Defender for Cloud Apps with the *apply a label* governance action. Whether such an approach should be invested in will largely depend on the extent to which old labels have been used.

{{% alert title="Find information with old-labels" color="info" %}}

Use [Purview eDiscovery Content search](https://learn.microsoft.com/en-au/purview/ediscovery-content-search-overview) to find out the extent of old-label use. eDiscovery can search tenant-wide (including encrypted information) and includes conditions for sensitivity labels, with KeyQL queries also supporting label metadata keywords.

{{% /alert %}}

#### Managing old labels

Deleting old sensitivity labels and not relabelling relies on the lifecycle of information for new labels to be applied as users access and modify old labelled information. While this approach may result in some information never getting labels reapplied, the information would appear similarly to other information created *pre-Purview*. Old-labelled information would still have content markings in place after label deletion.

Leaving old sensitivity labels in place is simple in terms of upfront effort, but may require ongoing maintenance to keep label and related policy configurations maintained. Even though old labels would not be published, they would continue to appear associated with emails, documents and containers; users would need to be made aware of the variation, which could also be used as a prompt to manually relabel information as it's noticed. Old labels can also have their display name renamed to indicate their deprecated status. Data loss prevention policies and other label-based security mechanisms can also remain in place, continuing to protect information.

#### Azure Rights Management

Azure Rights Management usage rights associated with old sensitivity labels can add complexity to a decision to relabel information, or to maintain or delete old labels:

* If the intent is to relabel information and the old label usage rights do not permit reprotection, the [usage rights may need modification](https://learn.microsoft.com/en-au/azure/information-protection/configure-usage-rights).
* If a label is deleted, the usage rights and protection template associated with that label remain archived in the Azure Information Protection tenant, allowing information associated with the old label to still be accessed. If the archived protection templates are to persist after label deletion, and if usage rights associated with new equivalent labels were ever updated, the old protection templates also require updating to maintain parity.

{{% alert title="Warning" color="warning" %}}

Deleting archived protection templates that are still in use will result in any information associated with them being inaccessible.

{{% /alert %}}

### Label migration plan

The following steps are example of how to migrate from one labelling scheme to another.

#### Backup old label metadata

The metadata associated with old sensitivity label configurations may be the only links to match dangling label configurations or implement relabelling after a label has been deleted. Before deleting any old labels, back up the old label metadata as well as any Azure Rights Management usage rights and protection template metadata.

#### Implement the new labelling scheme

1. Create the new [labels]({{<ref "configuration/purview/information-protection/sensitivity-labels">}}) in accordance with the Blueprint
1. Modify publishing policies to use the new labels
1. Modify auto-labelling policies to use the new labels
1. Modify data loss prevention policies to use the new labels

{{% alert title="Maintaining multiple labelling schemes" color="info" %}}

While it is possible to operate both new and old labelled schemes concurrently and progressively migrate users from one scheme to the other, the number of operations involved can be substantial with consequential risks, and with additional duplicate naming issues encountered for policy configurations. Reusing existing policy configurations and performing a direct changeover within a nominal change window can reduce potential impacts.

{{% /alert %}}

In the example table below:

* The *OFFICIAL Sensitive* label can exist as a top-level label and as a sub-label under the *OFFICIAL Sensitive (group)* parent label, as long as the new label's name is different, for example *OFFICIAL Sensitive v02*.
* The old labels pending deletion can have their display names renamed to highlight their status, for example renaming *OFFICIAL Sensitive* to *OFFICIAL Sensitive deprecated* (or an equivalent abbreviation).

| Old label scheme (example)             | Old label action            | New label scheme (Blueprint)                | New label action |
| -------------------------------------- | --------------------------- | ------------------------------------------- | ---------------- |
| UNOFFICIAL                             | Preserve                    | UNOFFICIAL                                  | *NA*             |
| OFFICIAL                               | Preserve                    | OFFICIAL                                    | *NA*             |
| OFFICIAL Sensitive                     | Rename,<br>pending deletion | OFFICIAL Sensitive (group)                  | Create           |
| OFFICIAL Sensitive Personal Privacy    | Rename,<br>pending deletion | - OFFICIAL Sensitive                        | Create           |
| OFFICIAL Sensitive Legal Privilege     | Rename,<br>pending deletion | - Personal Privacy                          | Create           |
| OFFICIAL Sensitive Legislative Secrecy | Rename,<br>pending deletion | - Legal Privilege                           | Create           |
| PROTECTED                              | Rename,<br>pending deletion | - Legislative Secrecy                       | Create           |
|                                        |                             | OFFICIAL Sensitive NATIONAL CABINET (group) | Create           |
|                                        |                             | - OFFICIAL Sensitive NATIONAL CABINET       | Create           |
|                                        |                             | - Personal Privacy                          | Create           |
|                                        |                             | - Legal Privilege                           | Create           |
|                                        |                             | - Legislative Secrecy                       | Create           |
|                                        |                             | PROTECTED (group)                           | Create           |
|                                        |                             | - PROTECTED                                 | Create           |
|                                        |                             | - Personal Privacy                          | Create           |
|                                        |                             | - Legal Privilege                           | Create           |
|                                        |                             | - Legislative Secrecy                       | Create           |
|                                        |                             | PROTECTED NATIONAL CABINET (group)          | Create           |
|                                        |                             | - PROTECTED NATIONAL CABINET                | Create           |
|                                        |                             | - Personal Privacy                          | Create           |
|                                        |                             | - Legal Privilege                           | Create           |
|                                        |                             | - Legislative Secrecy                       | Create           |
|                                        |                             | PROTECTED CABINET (group)                   | Create           |
|                                        |                             | - PROTECTED CABINET                         | Create           |
|                                        |                             | - Personal Privacy                          | Create           |
|                                        |                             | - Legal Privilege                           | Create           |
|                                        |                             | - Legislative Secrecy                       | Create           |

#### Migrate old-labelled information to the new labelling scheme

The utility of old sensitivity labels is limited if not associated with any policies. However, depending on the how long the old labels were available to users, they could have been associated with a large number of emails, documents or containers. The options to relabel information vary in complexity and effort depending on where labels have been applied and how extensively they've been used. The following steps may assist organisations seeking to migrate old-labelled information to a new labelling scheme.

{{% alert title="Update lag" color="info" %}}

Programmatic relabelling operations may take up to 24 hours to appear in applications.

{{% /alert %}}

##### 1. Create an eDiscovery Content search

Before deleting any sensitivity labels, create an eDiscovery Content search using condition builder to specify the labels to search for across your tenant data sources. Download the search exports and analyse the content for where to focus relabelling efforts.

##### 2. Relabel Teams, M365 groups and SharePoint sites

Containers can be relabelled via the Security & Compliance PowerShell using the relabelling-like process documented in Microsoft's [convert classifications for Microsoft 365 groups to sensitivity labels](https://learn.microsoft.com/en-au/purview/sensitivity-labels-teams-groups-sites#use-powershell-to-convert-classifications-for-microsoft-365-groups-to-sensitivity-labels) guidance.

##### 3. Relabel emails

Methods to relabel existing email messages do not currently exist. However, considering the primary security mechanisms associated with labelled emails are applied when they're in transit (not at rest in a mailbox or copied to a file system); and considering that emails associated with deleted labels will be treated as unlabelled (and the user forced to label them when replying or forwarding); the implications of not relabelling email are less significant.

Emails secured with Azure Rights Management are the exception, and should not have their associated protection templates deleted to ensure continued protection.

##### 4. Relabel documents

Relabelling documents in SharePoint and OneDrive requires the use of a protected Graph API for the [driveItem: assignSensitivityLabel](https://learn.microsoft.com/en-au/graph/api/driveitem-assignsensitivitylabel?view=graph-rest-1.0&WT.mc_id=M365-MVP-9501&tabs=htt) function.

Relabelling documents stored locally on desktop endpoints (not in OneDrive) can be performed via the [Purview Information Protection client](https://learn.microsoft.com/en-au/purview/information-protection-client?tabs=devices%2Cinstall-client-exe%2Cclassification-file-types%2Cexcluded-folders), and using the [Set-FileLabel](https://learn.microsoft.com/en-au/powershell/module/purviewinformationprotection/set-filelabel?view=azureipps) command.

{{% alert title="Updating content markings" color="info" %}}

Programmatic relabelling operations are not able to apply or modify content watermarks, headers and footers.

{{% /alert %}}

##### 5. Repeat the eDiscovery Content search

Ensure that relabelling efforts have been completed to the required degree by redoing the initial eDiscovery Content search.

#### Delete old label configurations

Delete any policies or rules associated with old sensitivity labels after any relabelling has been completed. After such policies have been deleted, the labels themselves can be deleted.

If relabelling was not performed and a label deleted the information will appear unlabelled, triggering the *require users to apply a label to their emails and documents* publishing policy setting.

{{% alert title="Test label deletion" color="warning" %}}

Deleting labels carries some caveats which are documented in Microsoft's [removing and deleting labels](https://learn.microsoft.com/en-au/purview/create-sensitivity-labels#removing-and-deleting-labels) guidance.

{{% /alert %}}

### Related information

#### Security & Governance

* [Guidelines for email]({{<ref "content\en\security-and-governance\system-security-plan\email.md">}})

#### Design

* [Azure Rights Management]({{<ref "design/shared-services/purview/azure-rights-management">}})
* [Email handling]({{<ref "design/shared-services/purview/email-handling">}})
* [Data Loss Prevention]({{<ref "design/shared-services/purview/data-loss-prevention">}})
* [Labelling and classification]({{<ref "design/shared-services/purview/labelling-and-classification">}})

#### Configuration

* [Sensitivity labels]({{<ref "configuration/purview/information-protection/sensitivity-labels">}})

#### References

* [Australian Government Email Protective Marking Standard](https://www.protectivesecurity.gov.au/publications-library/australian-government-email-protective-marking-standard)
* [Australian Government Protective Security Policy Framework (PSPF)](https://www.protectivesecurity.gov.au/pspf-annual-release)
* [Configure usage rights for Azure Information Protection](https://learn.microsoft.com/en-au/azure/information-protection/configure-usage-rights)
* [driveItem: assignSensitivityLabel](https://learn.microsoft.com/en-au/graph/api/driveitem-assignsensitivitylabel?view=graph-rest-1.0&WT.mc_id=M365-MVP-9501&tabs=htt)
* [Microsoft Purview Information Protection client](https://learn.microsoft.com/en-au/purview/information-protection-client?tabs=devices%2Cinstall-client-exe%2Cclassification-file-types%2Cexcluded-folders)
* [Overview of Content search](https://learn.microsoft.com/en-au/purview/ediscovery-content-search-overview)
* [Removing and deleting labels](https://learn.microsoft.com/en-au/purview/create-sensitivity-labels#removing-and-deleting-labels)
* [Set-FileLabel](https://learn.microsoft.com/en-au/powershell/module/purviewinformationprotection/set-filelabel?view=azureipps)
* [Use PowerShell to convert classifications for Microsoft 365 groups to sensitivity labels](https://learn.microsoft.com/en-au/purview/sensitivity-labels-teams-groups-sites#use-powershell-to-convert-classifications-for-microsoft-365-groups-to-sensitivity-labels)
