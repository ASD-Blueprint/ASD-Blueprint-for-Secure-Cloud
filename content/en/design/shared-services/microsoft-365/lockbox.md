---
title: "Customer Lockbox"
weight: 30
description: "This section describes the design decisions associated with Customer Lockbox for system(s) built using ASD's Blueprint for Secure Cloud."
---

Customer Lockbox is a means to ensure Microsoft is restricted from accessing an organisations content without explicit approval from an authorised organisation representative. The service is used to address situations where Microsoft Engineers require access to client data within Microsoft 365 to resolve an incident. Similar to PIM role activations, Customer Lockbox requests are time-boxed with all actions performed by the Microsoft engineer logged in the audit log, which the organisation can review within their audit records. The audit logs contain the following information:

| Audit record property | Description                                                                                                                             |
|-----------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| Date                  | Date and time when the action was performed. The action will be performed within 4 hours of the Customer Lockbox request approval time. |
| IP address            | The IP Address of the machine Microsoft engineer used.                                                                                  |
| User                  | Microsoft Operator; this value indicates the record is related to a Customer Lockbox request.                                           |
| Activity              | Name of the activity performed by the Microsoft engineer.                                                                               |

Per the support agreement terms and conditions, when an organisation has not enabled Customer Lockbox, Microsoft support engineers will use an internal Microsoft approval process, but will be able to access content without an organisations approval. Enabling the Customer Lockbox provides the ability to deny access requests, providing additional security.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point   | Design Decision | Justification                                                                                                                                                           |
|------------------|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Customer Lockbox | Enabled         | This is to ensure that Microsoft support engineers cannot access the organisation's content to perform a service operation without the organisation's explicit approval.|

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* [Lockbox Overview](https://docs.microsoft.com/microsoft-365/compliance/customer-lockbox-requests)
* [Data Access](https://www.microsoft.com/trust-center/privacy/data-access)
* [Data Privacy](https://view.officeapps.live.com/op/view.aspx?src=https%3A%2F%2Fquery.prod.cms.rt.microsoft.com%2Fcms%2Fapi%2Fam%2Fbinary%2FRWDpgU&wdOrigin=BROWSELINK)