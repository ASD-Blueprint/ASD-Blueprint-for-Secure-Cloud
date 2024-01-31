---
title: "User consent settings"
linkTitle: "User consent settings"
weight: 10
type: docs
description: "This page describes the configuration of consent and permissions within Microsoft Entra ID associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Entra ID portal blade at the following URL: 

https://entra.microsoft.com/#view/Microsoft_AAD_IAM/ConsentPoliciesMenuBlade/~/UserSettings
 
The settings described in these tables should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

| Item                                                                                                                              |                            Value |
| --------------------------------------------------------------------------------------------------------------------------------- | -------------------------------: |
| Configure whether users are allowed to consent for applications to access your organization's data.                               |        Do not allow user consent |
| Configure whether group owners are allowed to consent for applications to access your organization's data for the groups they own | Do not allow group owner consent |

### Related information

#### Security & Governance

* None identified
  
#### Design

* None identified
  
#### Configuration

* None identified

#### References

* [Application management documentation](https://learn.microsoft.com/entra/identity/enterprise-apps/)