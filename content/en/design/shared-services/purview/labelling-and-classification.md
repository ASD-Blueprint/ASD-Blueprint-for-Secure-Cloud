---
Title: "Information labelling and classification"
linkTitle: "Information labelling and classification"
weight: 10
description: "This section describes the design decisions associated with the labelling and classification of information with Microsoft Purview for system(s) built using ASD's Blueprint for Secure Cloud."
---

### Labelling and classification

The labelling and classification of information are key capabilities within the Microsoft Purview suite:

* Labels are logical tags, unique to each Purview tenant or organisation, that enable the control and categorisation of information in accordance with operational, security and privacy requirements.
* Classifiers are patterns and rules that assist the identification of data types within information.

{{% alert title="Design decisions" color="warning" %}}

| Decision point          | Design decision                         | Justification                                                         |
| ----------------------- | --------------------------------------- | --------------------------------------------------------------------- |
| Labelling information   | Use Purview sensitivity labels          | Enable the categorisation and control of organisational information   |
| Classifying information | Use Purview sensitive information types | Enable the detection of sensitive and security classified information |

{{% /alert %}}

#### Implementing sensitivity labels

Sensitivity labels are applied or associated with certain types of emails, documents and containers within Microsoft 365 services, applications and endpoints, this process is primarily to provide content marking and to mitigate unauthorised access.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                  | Design decision              | Justification                                                                          |
| ------------------------------- | ---------------------------- | -------------------------------------------------------------------------------------- |
| Implementing sensitivity labels | Provide document marking     | Mark information in-line with Protective Security Policy Framework (PSPF) requirements |
| Implementing sensitivity labels | Mitigate unauthorised access | Protect sensitive and security classified information                                  |

{{% /alert %}}

#### Implementing sensitive information types

Sensitive information types are pattern-based classifiers that can be developed to identify information with a degree of confidence for any number of use cases. While the development of sensitive information types can be straightforward, implementing them can be difficult without knowledge of the organisational specific context in which information is stored, used and shared. Implementation without considering this context can result in excess false positive or false negatives, excess administrative alerts or events, and a poor user experience.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                           | Design decision                                        | Justification                                                                                                     |
| ---------------------------------------- | ------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------- |
| Implementing sensitive information types | Provide sensitive information types with base patterns | Enable the detection of sensitive and security classified information for auto-labelling and data loss prevention |

{{% /alert %}}

Auto-labelling and data loss prevention policy configurations using sensitive information types have not been specified. However, organisations should use the provided [sensitive information type]({{<ref "configuration/purview/information-protection/classifiers/sensitive-info-types">}}) configurations as a starting point to develop their own, organisational specific policies. Such policies can be used in simulation mode to assess their effectiveness before being set to enforce. Example use cases include:

* Detecting unlabelled information, or emails or documents with markings but without a label
* Detecting mis-labelled information
* Detecting malicious label downgrades
* Mapping historical PSPF markings to current equivalents
* Detecting sensitive personal, financial or technical information
* Detecting SECRET or TOP SECRET information

#### Applying labels

Sensitivity labels can be applied by default, manually or automatically, with the method selected being dependent on the Microsoft 365 service, application or endpoint used, and an organisation's ability to implement classifiers.

Default labels are not able to be widely used in a security context without understanding the risks associated with mis-labelled information, and the potential lack of personal accountability for PSPF marking decisions. Auto-labelling has similar risks which can be minimised by ensuring the trigger for an auto-labelling action is based on relatively deterministic conditions, like an email's X-Protective-Marking X-header value, for example. Residual risks can be mitigated to a degree by the use of sensitive information types (or other classifiers) to detect, alert and prompt the user to take action on mis-labelled or incorrectly marked information.

Auto-labelling can be performed via client-side (end-user application) or service-side (Microsoft 365 service) mechanisms, with the latter offering more flexibility in choosing conditions for labelling triggers. Service-side auto-labelling polices are able to be used in conjunction with data loss prevention policies to apply email X-header and subject markings to incoming and outgoing emails, respectively, and are discussed in more detail in the [email handling]({{<ref "design/shared-services/purview/email-handling">}}) page.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                    | Design decision                                                                                             | Justification                                                                                                                                                                                |
| --------------------------------- | ----------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Using default labels<sup>1</sup>  | Use default labels for Teams channels                                                                       | Help mitigate data spills by ensuring channel meetings and chats use the same label as the channel container                                                                                 |
| Manual labelling                  | Require users to apply a label to their emails, documents, groups, sites and related content                | Mark information in-line with PSPF requirements and protect sensitive and security classified information                                                                                    |
| Using client-side auto-labelling  | Use client-side auto-labelling with sensitive information types to apply labels where practical<sup>2</sup> | Auto-labelling using sensitive information types can assist in meeting PSPF, Information Security Manual (ISM), and other requirements but need organisational specific context to implement |
| Using service-side auto-labelling | Apply email X-header and subject marking to incoming emails                                                 | Mark information in-line with PSPF requirements                                                                                                                                              |
| Using service-side auto-labelling | Apply [usage rights](#access-control) to PROTECTED<sup>3</sup> labelled incoming emails                     | Protect sensitive and security classified information                                                                                                                                        |
| Using service-side auto-labelling | Use auto-labelling with sensitive information types to apply labels where practical                         | Auto-labelling using sensitive information types can assist in meeting PSPF, ISM, and other requirements but need organisational specific context to implement                               |

1: Default labels are not the sensitivity labels configured out-of-the-box in a new Purview tenant, they are settings related to applying a label by default.

2: Client-side auto-labelling features may not be consistently implemented across commonly used Microsoft 365 applications. Organisations should check suitability and test before implementing.

3: Including associated special handing and information management markings.

{{% /alert %}}

#### Changing labels

Similar to the initial application of a sensitivity label, a label can also be changed manually or automatically depending on the Microsoft 365 service, application or endpoint used, and an organisation's ability to implement classifiers.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                                      | Design decision                                                                      | Justification                                                                                                                                                  |
| --------------------------------------------------- | ------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Manual label changes                                | Allow manual label changes with justification on downgrade                           | Maintain visibility of label changes with logging and alerting while using sensitive information types to detect unauthorised label changes                    |
| Using service-side auto-labelling for label changes | Use label inheritance from email attachments to apply labels                         | Help mitigate mis-labelling information                                                                                                                        |
| Using service-side auto-labelling for label changes | Use auto-labelling with sensitive information types to modify labels where practical | Auto-labelling using sensitive information types can assist in meeting PSPF, ISM, and other requirements but need organisational specific context to implement |

{{% /alert %}}

#### Label naming, priority and grouping

While a sensitivity label's name can be arbitrary, it's important that users are easily able to associate the label with its purpose of controlling or categorising information. Labels can be created with a priority order and grouped to determine how they will display in applications, the priority of auto-labelling rules will apply when labelling conflicts occur, and the user experience when changing labels or moving labelled information.

{{% alert title="Design decisions" color="warning" %}}

| Decision point | Design decision                                                              | Justification                                                                                                                                                                    |
| -------------- | ---------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Label naming   | Labels are named in-line with PSPF requirements                              | Help mitigate mislabelling by associating the label name with the PSPF markings it applies                                                                                       |
| Label naming   | Limit parent and sub-label name length                                       | Help mitigate lengthy names from being obscured in mobile and low resolution displays, while ensuring accuracy in selecting the correct label, and visibility of selected labels |
| Label priority | Labels are ordered in-line with PSPF requirements                            | Maintain PSPF marking hierarchy                                                                                                                                                  |
| Label grouping | Labels are grouped according to classification and special handling markings | Require label change justifications and data-out-of-place alerting for parent labels, but prevent both effects for sub-labels of the same parent                                 |

{{% /alert %}}

The suggested sensitivity label naming, priority ordering and grouping is:

* UNOFFICIAL
* OFFICIAL
* OFFICIAL Sensitive (group)
  * OFFICIAL Sensitive
  * Personal Privacy
  * Legal Privilege
  * Legislative Secrecy
* OFFICIAL Sensitive NATIONAL CABINET (group)
  * OFFICIAL Sensitive NATIONAL CABINET
  * Personal Privacy
  * Legal Privilege
  * Legislative Secrecy
* PROTECTED (group)
  * PROTECTED
  * Personal Privacy
  * Legal Privilege
  * Legislative Secrecy
* PROTECTED NATIONAL CABINET (group)
  * PROTECTED NATIONAL CABINET
  * Personal Privacy
  * Legal Privilege
  * Legislative Secrecy
* PROTECTED CABINET (group)
  * PROTECTED CABINET
  * Personal Privacy
  * Legal Privilege
  * Legislative Secrecy

{{% alert title="Migrating labelling schemes" color="info" %}}

Organisations with existing labelling schemes may find the [migrating labelling schemes]({{<ref "tools/purview/migrating-labelling-schemes">}}) guidance useful when implementing new sensitivity labels.

{{% /alert %}}

#### Label publishing

Sensitivity labels must be published to specific users or groups which then allows them to be applied in supported Microsoft 365 applications and workflows.

{{% alert title="Design decisions" color="warning" %}}

| Decision point    | Design decision                                                                                              | Justification                                                    |
| ----------------- | ------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------- |
| Publishing labels | Labels up to OFFICIAL: Sensitive<sup>1</sup> are published to all users                                      | Publish labels suitable for use by all users in the organisation |
| Publishing labels | Labels above OFFICIAL: Sensitive<sup>1</sup> up to PROTECTED<sup>1</sup> are published to select user groups | Publish labels for use by appropriately cleared users only       |

1: Including associated special handing and information management markings.

{{% /alert %}}

#### Content marking

When a sensitivity label is applied to a document, email or meeting invite the process can add a watermark, header or footer to mark the information.

{{% alert title="Design decisions" color="warning" %}}

| Decision point              | Design decision                                                                | Justification                                   |
| --------------------------- | ------------------------------------------------------------------------------ | ----------------------------------------------- |
| Marking content with labels | Labels will apply headers and footers to documents, emails and meeting invites | Mark information in-line with PSPF requirements |

{{% /alert %}}

#### Access control

The access controls associated with sensitivity labels use Azure Rights Management usage rights and can be used to not only ensure the correct users are permitted or denied access, but can be used to apply encryption to documents, control offline access to information, and to restrict the specific operations allowed on information. These controls provide an effective means of mitigating risks associated with unauthorised access, and also serve to compliment and backstop many other related Microsoft 365 access controls and third party security services.

{{% alert title="Design decisions" color="warning" %}}

| Decision point              | Design decision                                                  | Justification                                                           |
| --------------------------- | ---------------------------------------------------------------- | ----------------------------------------------------------------------- |
| Using label access controls | Apply usage rights to PROTECTED<sup>1</sup> labelled information | Help protect information in motion and at rest from unauthorised access |

1: Including associated special handing and information management markings.

{{% /alert %}}

How label access controls are implemented is discussed in more detail in the [Azure Rights Management]({{<ref "design/shared-services/purview/azure-rights-management">}}) page.

#### Privacy

A sensitivity label can be used to apply privacy settings that will replace any existing privacy settings configured for a team or group site.

{{% alert title="Design decisions" color="warning" %}}

| Decision point | Design decision                                                                                                                                    | Justification                                              |
| -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------- |
| Label privacy  | For OFFICIAL: Sensitive<sup>1</sup> and above labelled groups and teams, ensure only owners and member have access and only owners can add members | Help maintain the confidentiality of sensitive information |

1: Including associated special handing and information management markings.

{{% /alert %}}

#### External sharing

A sensitivity label can be used to apply external sharing settings that provide restricted external sharing settings to what may be configured in SharePoint Online and at the container level. If there is a conflict in sharing permissions, the most restrictive sharing settings will always apply.

{{% alert title="Design decisions" color="warning" %}}

| Decision point         | Design decision                                                             | Justification                                                               |
| ---------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| Label external sharing | Prevent external sharing from PROTECTED<sup>1</sup> SharePoint Online sites | Back-stop SharePoint Online sharing settings (if modified to allow sharing) |

1: Including associated special handing and information management markings.

{{% /alert %}}

#### Conditional Access

By associating a sensitivity label with a Conditional Access Authentication Context, it is possible use the presence of a label as a condition to enforce a Conditional Access policy.

{{% alert title="Design decisions" color="warning" %}}

| Decision point           | Design decision                                                                   | Justification                                                                                                   |
| ------------------------ | --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| Label Conditional Access | Prevent unauthorised access to PROTECTED<sup>1</sup> SharePoint Online containers | Help mitigate access to PROTECTED classified information from PROTECTED site owners adding unauthorised members |

1: Including associated special handing and information management markings.

{{% /alert %}}

### Related information

#### Security & Governance

* [Guidelines for email]({{<ref "content\en\security-and-governance\system-security-plan\email.md">}})

#### Design

* [Azure Rights Management]({{<ref "design/shared-services/purview/azure-rights-management">}})
* [Email handling]({{<ref "design/shared-services/purview/email-handling">}})
* [Data Loss Prevention]({{<ref "design/shared-services/purview/data-loss-prevention">}})

#### Configuration

* [Authentication Contexts]({{<ref "configuration/entra-id/protection/conditional-access/authentication-contexts">}})
* [Data Loss Prevention]({{<ref "configuration/purview/data-loss-prevention">}})
* [Information Protection]({{<ref "configuration/purview/information-protection">}})
* [USR - B - Block access to PROTECTED information]({{<ref "configuration/entra-id/protection/conditional-access/policies/block-access-to-protected-info">}})

#### Tools

* [Migrating labelling schemes]({{<ref "tools/shared-services/purview/migrating-labelling-schemes">}})

#### References

* [Automatically apply a sensitivity label to Microsoft 365 data](https://learn.microsoft.com/en-us/purview/apply-sensitivity-label-automatically)
* [Conditional access policy for SharePoint sites and OneDrive](https://learn.microsoft.com/en-us/sharepoint/authentication-context-example)
* [Information Security Manual (ISM)](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism)
* [Learn about data loss prevention](https://learn.microsoft.com/en-au/purview/dlp-learn-about-dlp)
* [Microsoft Purview Information Protection Guide for Australian Government compliance with PSPF](https://learn.microsoft.com/en-us/compliance/anz/pspf-overview)
* [Protect your sensitive data with Microsoft Purview](https://learn.microsoft.com/en-au/purview/information-protection)
* [Protective Security Policy Framework Standards](https://www.protectivesecurity.gov.au/pspf-annual-release/pspf-standards)
* [Restrict access to content by using sensitivity labels to apply encryption](https://learn.microsoft.com/en-au/purview/encryption-sensitivity-labels)
* [What is Azure Information Protection?](https://learn.microsoft.com/en-us/azure/information-protection/what-is-information-protection)
