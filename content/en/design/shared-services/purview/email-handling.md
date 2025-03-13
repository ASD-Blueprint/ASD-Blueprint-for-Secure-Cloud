---
title: "Email handling"
linkTitle: "Email handling"
weight: 40
description: "This section describes how email is handled within Microsoft Purview for system(s) built using ASD's Blueprint for Secure Cloud."
---

While the actions of data loss prevention (DLP) and auto-labelling policies are visible in their rules' configurations, Purview also takes separate action on emails under certain circumstances. Understanding how Purview handles email in different scenarios ensures that labelling actions are predictable, and enable effective data security.

### Using a shared labelling scheme

For inter-organisation email collaboration using a Purview-based shared labelling scheme as described herein, and as is the case for organisations implementing the [Australian Government Email Protective Marking Standard](https://www.protectivesecurity.gov.au/publications-library/australian-government-email-protective-marking-standard) with Purview, the following roles apply:

* **The role of a user** is to ensure an appropriate sensitivity label is applied to an email. The act of applying the label implements the content marking (link) in the email body.
* **The role of DLP** is to check the sensitivity label applied to an email and insert an equivalent X-protective-marking X-header and subject marking. DLP will act on both incoming and outgoing email, and is sequenced to occur after auto-labelling on incoming email.
* **The role of auto-labelling** is to check the X-protective-marking X-header and subject marking applied to an email and apply an equivalent label.

### The influence of msip_labels metadata on auto-labelling

When an email is sent, metadata associated with the sensitivity label applied to the email is inserted in the [*msip_labels*](https://learn.microsoft.com/en-us/information-protection/develop/concept-mip-metadata) X-header. As an email is replied to or forwarded between tenants, each tenant adds metadata associated with its own label applied to the email (if any) into the X-header. An X-header can have metadata for multiple tenant's labels, but only metadata for one label per tenant - if a label is changed on a replied to or forwarded email, the metadata associated with the previous label is overwritten.

When an email is received the *msip_labels* X-header is checked for any metadata associated with a label configured in the local tenant. If such metadata is found it can cause auto-labelling policy rules to be ignored and the label associated with the metadata applied instead, unless the *automatically replace existing labels that have the same or lower priority* option is checked in applicable auto-labelling policies. The setting is mentioned [here](https://learn.microsoft.com/en-us/purview/apply-sensitivity-label-automatically#creating-an-auto-labeling-policy) in point 10.

The following *msip_labels* X-header example has been formatted with linebreaks for visibility and was the result of an email an email exchange between users in different tenant:

```code
msip_labels:
 MSIP_Label_sk000l77-6d8b-48f7-8b7c-sd98fk451k22_Enabled=True;
 MSIP_Label_sk000l77-6d8b-48f7-8b7c-sd98fk451k22_SiteId=5a4e6e65-497e-4a97-9833-jshd7774jnde;
 MSIP_Label_sk000l77-6d8b-48f7-8b7c-sd98fk451k22_SetDate=2025-02-14T01:52:31.1226213Z;
 MSIP_Label_sk000l77-6d8b-48f7-8b7c-sd98fk451k22_Name=OFFICIAL;
 MSIP_Label_sk000l77-6d8b-48f7-8b7c-sd98fk451k22_ContentBits=3;
 MSIP_Label_sk000l77-6d8b-48f7-8b7c-sd98fk451k22_Method=Standard;
 MSIP_Label_xnhhs654-6695-41a4-a39b-kkk2hs887xc6_Enabled=True;
 MSIP_Label_xnhhs654-6695-41a4-a39b-kkk2hs887xc6_SiteId=21f12302-fa43-4a63-a360-1234hjduim98;
 MSIP_Label_xnhhs654-6695-41a4-a39b-kkk2hs887xc6_SetDate=2025-02-14T01:52:19.218Z;
 MSIP_Label_xnhhs654-6695-41a4-a39b-kkk2hs887xc6_Name=OFFICIAL;
 MSIP_Label_xnhhs654-6695-41a4-a39b-kkk2hs887xc6_ContentBits=0;
 MSIP_Label_xnhhs654-6695-41a4-a39b-kkk2hs887xc6_Method=Privileged
```

{{% alert title="Preventing mislabelled email" color="info" %}}

For inter-organisation email collaboration using a Purview-based shared labelling scheme, ensuring the *automatically replace existing labels that have the same or lower priority* option is checked in applicable auto-labelling policies is critical to ensuring that email is labelled correctly when both the following conditions occur:

1. An email is received back from an external tenant in a reply or forward, and
1. The email's label has been changed in the email exchange

{{% /alert %}}

### Related information

#### Security & Governance

* [Guidelines for email]({{<ref "content\en\security-and-governance\system-security-plan\email.md">}})

#### Design

* [Data Loss Prevention]({{<ref "design/shared-services/purview/data-loss-prevention">}})
* [Labelling and classification]({{<ref "design/shared-services/purview/labelling-and-classification">}})

#### Configuration

* [Auto-labeling policies]({{<ref "configuration/purview/information-protection/policies/auto-labeling-policies">}}))
* [Data Loss Prevention policies]({{<ref "configuration/purview/data-loss-prevention/policies">}})

#### References

* [Australian Government Email Protective Marking Standard](https://www.protectivesecurity.gov.au/publications-library/australian-government-email-protective-marking-standard)
* [Automatically apply a sensitivity label to Microsoft 365 data](https://learn.microsoft.com/en-us/purview/apply-sensitivity-label-automatically)
* [Microsoft Information Protection SDK - Metadata](https://learn.microsoft.com/en-us/information-protection/develop/concept-mip-metadata)
