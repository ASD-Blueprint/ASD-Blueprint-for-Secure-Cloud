---
title: "SPF, DMARC and DKIM"
weight: 30
description: "This section describes the design decisions associated with Microsoft 365 for system(s) built using ASD's Blueprint for Secure Cloud."
---

Sender Policy Framework (SPF), Domain Key Identified Mail (DKIM), and Domain-based Message Authentication, Reporting and Conformance (DMARC) are tools for email authentication. These tools can coexist to provide enhanced capabilities.

These tools can coexist to provide enhanced capabilities.

* SPF - SPF is a DNS entry which lists the servers which can send emails from a specific domain. It enables recipients to verify the identity of incoming mail
* DKIM - DKIM, unlike SPF is a tool to verify whether the content of the message is trustworthy. This is completed using a public/private key signing process
* DMARC - DMARC enables both SPF and DKIM using policy. A DMARC policy sets out how to handle messages which do not align to what the receiver knows about the sender. This can include rejecting the message; suggesting the message is quarantined; or allowing the message

While DKIM within Microsoft 365 can sign messages, the organisation gateway may also be configured to do this which may cause issues with DMARC verification.

{{% alert title="Note" color="info" %}}

Organisations that enable DKIM signing within Microsoft 365 and also add additional business logic to email at the egress mail gateway, such as adding a default organisation email disclaimer, will fail DKIM authentication. Contents of the email will have  changed after the email had exited Exchange Online. In this scenario consider migrating the business logic from the mail gateway to Exchange Online transport rules.

{{% /alert %}}

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point | Design Decision | Justification                                                                                                                                                                                                                                                                                                                                                                                       |
|----------------|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| SPF            | Configured      | Configuration of SPF record(s) are required as a baseline for the deployment  The SPF record(s) are configured for all such authorised senders for that domain, including the Office 365 SPF sender address (spf.protection.outlook.com) if applicable to ensure mail sent from Exchange Online passes SPF. SPF record(s) are to be configured by the DNS provider that that organisation consumes. |
| DKIM           | Configured      | DKIM is a public/private key signing process used to verify the content of an email.<br>DKIM signing should be enabled on emails originating from an organisation's domains as per ASD's recommendations. DKIM is either enabled on the organisation mail gateway solution (hybrid) or within Exchange Online (cloud native).                                                                               |
| DMARC          | Configured      | One DMARC policy is to be configured per organisation domain as per ASD's recommendations. This is to be configured at the gateway that the organisation consumes.<br>DMARC records are configured for all domains such that emails are rejected if they fail SPF or DKIM checks.                                                                                                                    |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### Configuration

* None identified

#### References

* None identified

#### Related design decisions

* None identified