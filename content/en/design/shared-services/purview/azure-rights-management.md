---
title: "Azure Rights Management"
linkTitle: "Azure Rights Management"
weight: 20
description: "This section describes the design decisions associated with Azure Rights Management with Microsoft Purview for system(s) built using ASD's Blueprint for Secure Cloud."
---

### Azure Information Protection, Azure Rights Management and sensitivity labels

The Azure Information Protection (AIP) service underpins [sensitivity label access controls]({{<ref "design/shared-services/purview/labelling-and-classification#access-control">}}) and is used to apply encryption, usage rights, and other restrictions to labelled information. When AIP is used in the context of Purview Information Protection it is known as Azure Rights Management, or the Azure Rights Management Service (Azure RMS). Rights Management defines controls like whether online and offline access is permitted and for what length of time, the types of operations permitted, and who the rights are assigned to.

{{% alert title="Design decisions" color="warning" %}}

| Decision point              | Design decision                                                                                                    | Justification                                                  |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------- |
| Using labels with Azure RMS | Expire access to offline information after 3-days                                                                  | Help mitigate inactive user access to information              |
| Using labels with Azure RMS | Assign *owner* usage rights to user groups approved for access to PROTECTED classified information                 | Allow other authorised users to change labels                  |
| Using labels with Azure RMS | Assign *owner* usage right to external organisations approved to collaborate with PROTECTED classified information | Allow users in other authorised organisations to change labels |

{{% /alert %}}

{{% alert title="Offline access and outages" color="warning" %}}

Expiring offline access may have an impact on business continuity if the expiry timeframe is too short to cater for potential outages.

{{% /alert %}}

{{% alert title="AIP evolution" color="info" %}}

Azure Information Protection has evolved from a number of technologies used to provide encryption and rights management services, [this](https://learn.microsoft.com/en-us/azure/information-protection/aka) page attempts to clarify any confusion on branding and terminology. The [Azure Information Protection FAQ](https://learn.microsoft.com/en-us/azure/information-protection/faqs) should also be checked for additional insights.

{{% /alert %}}

#### Rights Management Issuer and Owner

When a sensitivity label that uses Azure RMS is applied to a document or email, the account that applies the label automatically becomes the Rights Management Issuer and Owner and is granted *full control* or *owner* usage rights for that document or email.

#### Owner usage rights

Owner usage rights permits any operation on a document or email, and includes the ability to remove protection and reprotect the document or email. When such rights are associated with a sensitivity label, a user is able to *reprotect* or apply a different label to already labelled information.

#### Using other usage rights

Organisations may implement alternative usage rights to further improve security for access to sensitive and security classified information:

* Rights can be customised to permit or deny specific operations, for example Microsoft 365 Copilot uses the `EXTRACT` permission to summarise information protected with Azure RMS, removing this permission would limit access by Copilot to the labelled information.
* Rights can independently grant different levels of access to different users for the same labelled information, for example one user can have owner rights for a document, while another user can have viewer rights for the same document.

#### Assigning usage rights

Usage rights can be assigned to specific users, groups and domains, including for use by external organisations:

* Ensure consistency by assigning usage rights for sensitivity labels to the same groups as used for [publishing labels]({{<ref "design/shared-services/purview/labelling-and-classification#label-publishing">}}) and set in [publishing policy configurations]({{<ref "configuration/purview/information-protection/policies/publishing-policies/users-up-to-p-policy">}}).
* Permit external organisations the ability to change the sensitivity label of shared documents and email by assign owner usage rights at the domain level. Note that it would be up to the external organisations to also implemented their own restrictions for approved recipients to access information, something that is be accomplished with the Purview configurations herein.

#### Ownership of auto-labelled information

Auto-labelling policies with sensitivity labels that use Azure RMS should specify an account as the Rights Management Owner with owner usage rights for all information labelled by the policy. The account must be appropriately licensed and considered highly privileged as it would have access to all information labelled by the policy.

The [auto-labelling policy configurations]({{<ref "configuration/purview/information-protection/policies/auto-labeling-policies">}}) for emails ensure that all incoming PROTECTED classified emails will be protected by Azure RMS with the nominated Rights Management Owner account.

### The super user feature

The super user feature ensures that authorised users or services will always have access to information protected with Azure RMS for the tenant. By defining super users and activating the feature, an administrator will have owner usage rights tenant-wide. This ensures that if information is ever required to have its encryption removed or rights modified, for example in preparing for a records transfer to the National Archives, administrators using the super user feature can perform the required changes.

### Related information

#### Security & Governance

* [Guidelines for email]({{<ref "content\en\security-and-governance\system-security-plan\email">}})

#### Design

* [Labelling and classification]({{<ref "design/shared-services/purview/labelling-and-classification">}})

#### Configuration

* [Auto-labeling policies]({{<ref "configuration/purview/information-protection/policies/auto-labeling-policies">}})
* [Sensitivity labels]({{<ref "configuration/purview/information-protection/sensitivity-labels">}})
* [Users up to PROTECTED publishing policy]({{<ref "configuration/purview/information-protection/policies/publishing-policies/users-up-to-p-policy">}})

#### References

* [Azure Information Protection - also known as ...](https://learn.microsoft.com/en-us/azure/information-protection/aka)
* [Configure usage rights for Azure Information Protection](https://learn.microsoft.com/en-us/azure/information-protection/configure-usage-rights)
* [Configuring super users for Azure Information Protection and discovery services or data recovery](https://learn.microsoft.com/en-us/azure/information-protection/configure-super-users)
* [Frequently asked questions for Azure Information Protection (AIP)](https://learn.microsoft.com/en-us/azure/information-protection/faqs)
* [Protect your sensitive data with Microsoft Purview](https://learn.microsoft.com/en-au/purview/information-protection)
* [Restrict access to content by using sensitivity labels to apply encryption](https://learn.microsoft.com/en-au/purview/encryption-sensitivity-labels)
* [What is Azure Information Protection?](https://learn.microsoft.com/en-us/azure/information-protection/what-is-information-protection)
