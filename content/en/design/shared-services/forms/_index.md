---
title: "Microsoft Forms"
weight: 50
description: "This section describes the design decisions associated with implementation of Microsoft Forms for system(s) built using ASD's Blueprint for Secure Cloud."
---

Microsoft Forms is a both a form and a survey tool. It offers a variety of external sharing and collaboration options including:
* **Sharing links** - Sharing the link to external party for form population.
* **Collaboration of layout and structure** - Collaboration on the design of a form.
* **Sharing templates** - Sharing a form as a template for external parties to leverage.
* **Sharing results** - Sharing the results of a form with external parties.

Forms can be configured to allow images from Bing and videos from YouTube to be embedded.

Microsoft Forms is capable of capturing the names of the organisational users who complete a form or survey. This functionality can also be configured globally or on a form-by-form basis.  

Surveys and forms can be leveraged for potentially malicious purposes. Phishing protection for Microsoft Forms scans forms for common phishing questions. If they are detected, the form is prevented from being distributed or shared. Phishing protection only protects internal organisation forms.

{{% alert title="Note" color="info" %}}

For new Microsoft 365 customers and those customers who have not previously used Forms, Microsoft Forms will store Forms data at rest within Australia. Existing customers should confirm the data storage location for Forms.

{{% /alert %}}

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                                                  | Design Decision | Justification                                                                                                                             |
|-----------------------------------------------------------------|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| External Sharing -  Sharing of link and collection of responses | Enabled         | Sharing of form links will be enabled, it is up to the organisation which forms they wish to publish.                                     |
| External Sharing -  Collaboration on the layout and structure   | Enabled         | Collaboration on the layout and structure of forms will be enabled, it is up to the organisation which forms they wish to collaborate on. |
| External Sharing -  Sharing of form as a template               | Enabled         | Sharing forms as a template will be enabled, it is up to the organisation which forms they wish to publish.                               |
| External Sharing -  Sharing of result summary                   | Disabled        | Prevents potential data spills from result exposure.                                                                                      |
| Record names by default                                         | Disabled        | Prevents the recording of user names where not required.                                                                                  |
| Bing search and YouTube video embedding                         | Disabled        | Prevents the use of Bing images and YouTube images within Forms.                                                                          |
| Phishing protection                                             | Enabled         | Blocks forms from being shared or distributed if they contain common phishing questions.                                                  |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* [Services]({{<ref "configuration/microsoft-365/settings/services">}})

#### References

* [Data Residency for Other Microsoft 365 Services - Microsoft Forms](https://learn.microsoft.com/microsoft-365/enterprise/m365-dr-workload-other?view=o365-worldwide#forms)
