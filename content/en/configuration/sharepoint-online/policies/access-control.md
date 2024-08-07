---
title: "Access Control"
linkTitle: "Access Control"
weight: 030
description: "This section describes the configuration of SharePoint associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the SharePoint admin portal at the following URL:

https://`<TENANT-NAME>`-admin.sharepoint.com/

`Home` > `Policies` > `Access Control`

These settings should be used to provide reference of a baseline implementation for a system configured using the blueprint. Any implementation implied by the below should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

### Unmanaged devices

| Item                           | Value |
| ------------------------------ | ----: |
| Allow limited, web-only access |  True |

### Idle session sign-out

| Item                                                 |     Value |
| ---------------------------------------------------- | --------: |
| Sign out inactive users automatically                |      True |
| Sign out users after:                                |    1 hour |
| Give users this much notice before signing them out: | 5 minutes |

### Network location

| Item                                              | Value |
| ------------------------------------------------- | ----: |
| Allow access only from specific IP address ranges | False |

### Apps that don't use modern authentication

| Item         | Value |
| ------------ | ----: |
| Block access |  True |

### OneDrive access restriction

| Item                                                                | Value |
| ------------------------------------------------------------------- | ----: |
| Restrict OneDrive access to only users in specified security groups | False |
