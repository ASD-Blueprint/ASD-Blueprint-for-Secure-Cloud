---
title: "Security & privacy"
linkTitle: "Security & privacy"
weight: 00
description: "This section describes the configuration of security and privacy settings in Microsoft 365 associated with systems built according to the guidance provided by ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft 365 portal at the following URL:

<https://admin.microsoft.com/Adminportal/Home?#/Settings/SecurityPrivacy>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Customer lockbox

| Item                                          |   Value |
| --------------------------------------------- | ------: |
| Require approval for all data access requests | Enabled |

### Help & support query collection

| Item                                       |    Value |
| ------------------------------------------ | -------: |
| Allow Microsoft to collect support queries | Disabled |

### Idle session timeout

| Item                                                                                         |   Value |
| -------------------------------------------------------------------------------------------- | ------: |
| Turn on to set the period of inactivity for users to be signed off of Microsoft 365 web apps | Enabled |
| When do you want users signed out                                                            |  1 hour |

### Password expiration policy

| Item                          |   Value |
| ----------------------------- | ------: |
| Set passwords to never expire | Enabled |

### Privacy profile

| Item                           |                                    Value |
| ------------------------------ | ---------------------------------------: |
| Organization privacy statement |     *URL to organisation privacy policy* |
| Organisation privacy contact   | *email for organisation privacy contact* |

### Privileged access

| Item                                                                 |   Value |
| -------------------------------------------------------------------- | ------: |
| Allow privileged access requests and choose a default approval group | Enabled |

### Sharing

| Item                                        |    Value |
| ------------------------------------------- | -------: |
| Let user add new guests to the organization | Disabled |

### Related information

#### Security & Governance

* None identified
  
#### Design

* [Customer Lockbox]({{<ref "design/shared-services/microsoft-365/lockbox">}})
  
#### Configuration

* None identified

#### References

* None identified
