---
title: "Classification Labels"
weight: 60
description: "This section describes the design decisions associated with Microsoft 365 security features for system(s) built using ASD's Blueprint for Secure Cloud."
---

Classification labels, located within Microsoft Purview, offers the ability to both control the data flow of sensitive information and control the retention of data. Classifications labels consists of the following:

* **Sensitivity Labels** – Enable label specific protection policy settings to be enforced
* **Retention Labels** – Enable label specific retention policy settings to be enforced

Sensitivity labels can be applied in the supported Microsoft applications either in Office 365 ProPlus, Microsoft Online or using the Azure Information Protection (AIP) unified labelling client.

Classification labels are published to users using Label Policies. Label Policies define the users who can utilise the label and the locations within Microsoft 365 where it can be used. Classification labels can be applied in the following ways:

* **Manually** - The label is applied manually by the end-user
* **Automatically applied based on the location of the document** - Labels can be configured to automatically apply based on the location of the document. For example, SharePoint
* **Automatically applied based on detected Sensitive Information Type** - Labels can be configured to automatically apply based on the type of sensitive information found. For example, documents containing Australia driver's license numbers

At the time of writing, sensitivity labels cannot be configured to satisfy all of the requirements listed in the Protective Security Policy Framework (PSPF). Some of these limitations are:

* Sensitivity labels, Exchange Transport rules or data loss prevention (DLP), cannot set the `X-Protective-Marking` header `*Origin-` parameter prescribed in the PSPF.
* When using DLP or Auto Labeling policies to set a  `X-Protective-Marking` header:
  * certain characters prescribed in the PSPF are not supported (such as `:` and `,`) 
  * a character limit of 64 characters is the maximum
  * Exchange Transport rules do not have these character limitations
* When downgrading a sensitivity label, the downgrade cannot be prevented, only forcing the user to justify the downgrade

The following Microsoft Purview Information Protection (formerly Microsoft Information Protection; MPIP) methods can be used to assist with PSPF compliance:

* For calendar invites, advise users to add the classification to the body, and use transport rules or DLP to add the required subject and header values.
* Update the `X-Protective-Marking` header associated with the MPIP label at the email gateway with the `ORIGIN=user@organisation.gov.au` property. Note, internal emails inside the organisation wouldn't be tagged using this method.

Example email gateway rules that work with MPIP are available in the [Network Configuration ABAC document]({{< ref "configuration">}}). These rules are based on regular expressions and are easily adaptable to vendor specific email gateways.

Sensitivity labels create a protective marking within the message header and when combined with Exchange mail flow rules the subject can be modified to prepend text in the subject according to the sensitivity.

Email gateway rules are available in the [Network Configuration section]({{< ref "configuration">}}). These rules are based on regular expressions and are easily adaptable to vendor specific email gateways.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point            | Design Decision       | Justification                                                                                                                                                                                                                                                                                                    |
|---------------------------|-----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Sensitivity Labels        | Enabled               | Labels will be applied in accordance with the latest guidance from the PSPF.                                                                                                                                                                                                                                     |
| Retention Labels          | Enabled               | Labels are recommended to be applied to automate retention configuration and compliance, but the development of specific retention labels is out of scope for this project.                                                                                                                                      |
| Labelling Policy          | Enabled               | Users will apply labels manually initially.                                                                                                                                                                                                                                                                      |
| Subject line modification | Configured            | DLP policies are available to modify the subject line in accordance with PSPF guidance based on matching sensitivity labels.                                                                                                                                                                                     |
| Auto-labeling             | Configured            | Automatic Label (auto-labeling) polices will be configured to add the correct sensitivity label to inbound emails when an email is configured with a classification outside of the organisation's tenant or through a 3rd party marking tool.                                                                    |
| Protected Marking Header  | Organisation Decision | organisations can best determine the method to set the `x-protective-marking` header based on their requirements. As of February 2022, the most effective method natively is using Exchange Transport rules in conjunction with the gateway rules (for hybrid or PROTECTED deployments) due to character limitations. |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* [Learn about sensitivity labels](https://docs.microsoft.com/microsoft-365/compliance/sensitivity-labels?view=o365-worldwide)
