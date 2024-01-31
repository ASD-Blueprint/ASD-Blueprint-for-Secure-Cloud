---
Title: Settings
weight: 010
description: "This section describes the configuration of Microsoft Power Platform associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}
 
The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* for the Microsoft Exchange Online portal blade at the following URL: 
 
https://admin.powerplatform.microsoft.com/

The settings described on these pages should be used to provide reference to a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.
 
{{% /alert %}}

### Developer environment assignments

| Item                                             |    Value |
| ------------------------------------------------ | -------: |
| Who can create and manage developer environments | Everyone |

### Tenant capacity summary view

| Item                                     |              Value |
| ---------------------------------------- | -----------------: |
| Who can view the tenant capacity summary | Only Tenant Admins |

### Tenant licensing summary view

| Item                                      |              Value |
| ----------------------------------------- | -----------------: |
| Who can view the tenant licensing summary | Only Tenant Admins |

### Auto-claim policies

| Item                                                 |                     Value |
| ---------------------------------------------------- | ------------------------: |
| Where should license auto-claim policies be applied? | Only Managed Environments |

### Production environment assignments

| Item                                              |    Value |
| ------------------------------------------------- | -------: |
| Who can create and manage production environments | Everyone |

### Trial environment assignments

| Item                                         |    Value |
| -------------------------------------------- | -------: |
| Who can create and manage trial environments | Everyone |

### Add-on capacity assignments

| Item                                             |                 Value |
| ------------------------------------------------ | --------------------: |
| Who can allocate add-on capacity to environments | Any environment admin |

### Analytics

| Item                   |   Value |
| ---------------------- | ------: |
| Tenant-level analytics | Disable |

### Customer Lockbox

| Item             |   Value |
| ---------------- | ------: |
| Customer Lockbox | Disable |

### Publish bots with AI features

| Item                          |   Value |
| ----------------------------- | ------: |
| Publish bots with AI features | Enabled |

### Desktop flow actions in DLP

| Item                                      |    Value |
| ----------------------------------------- | -------: |
| Show desktop flow actions in DLP policies | Disabled |

### AI Builder credits

| Item                                      |   Value |
| ----------------------------------------- | ------: |
| Allow users to consume unassigned credits | Checked |
