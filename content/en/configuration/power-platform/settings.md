---
title: "Settings"
linkTitle: "Settings"
weight: 010
description: "This section describes the configuration of Microsoft Power Platform settings associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below pages outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Power Platform admin portal at the following URL:

<https://admin.powerplatform.microsoft.com/tenantsettings>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Copilot in Power Apps

| Item                                                      | Value |
| --------------------------------------------------------- | ----: |
| Enable Copilot preview features for people who make apps. |   Off |

### Copilot feedback

| Item                                                                           | Value |
| ------------------------------------------------------------------------------ | ----: |
| When using Copilot in Power Apps, allow users to submit feedback to Microsoft. |   Off |

### Copilot data collection

| Item                                                                                                          | Value |
| ------------------------------------------------------------------------------------------------------------- | ----: |
| When using Copilot in Power Apps, allow users to share their prompts, questions, and requests with Microsoft. |   Off |

### Environment routing

| Item                                              | Value |
| ------------------------------------------------- | ----: |
| Create personal developer environments for makers |   Off |

### Weekly digest

| Item                                                                               |                       Value |
| ---------------------------------------------------------------------------------- | --------------------------: |
| Manage additional recipients for the weekly digest email for Managed Environments. | *Organisational preference* |

### Canvas app insights

| Item                                                         | Value |
| ------------------------------------------------------------ | ----: |
| Allow people to collect insights for individual canvas apps. |    On |

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

### Publish Copilots with AI features

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

### Copilot help assistance in Power Automate via Bing

| Item                                                                                                                           | Value |
| ------------------------------------------------------------------------------------------------------------------------------ | ----: |
| Allow the Copilot-enhanced help feature within Power Automate to enhance answers on product documentation through Bing Search. |   Off |

### Support requests visibility

| Item                                              | Value |
| ------------------------------------------------- | ----: |
| Show support requests to all users in the tenant. |   Off |

### Product feedback

| Item                                                                                       | Value |
| ------------------------------------------------------------------------------------------ | ----: |
| Allow users to receive and respond to in-product surveys from Microsoft.                   |   Off |
| Allow Microsoft to follow up on feedback submitted by users.                               |   Off |
| Allow users to include screenshots and attachments when they submit feedback to Microsoft. |   Off |

### Related information

#### Security & Governance

* [Power Platform Specific Conditional Access policies]({{<ref "design/shared-services/power-platform/conditional-access-policies.md">}})
  
#### Design

* [Power Platform]({{<ref "/design/shared-services/power-platform.md">}})
  
#### Configuration

* None identified

#### References

* [Tenant settings](https://learn.microsoft.com/en-us/power-platform/admin/tenant-settings)
