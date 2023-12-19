---
title: "Solution Overview"
weight: 10
description: "This section provides an overview of the architecture, design considerations and decisions associated with system(s) built on ASD's Blueprint for Secure Cloud."
---

### Purpose

ASD's *Blueprint for Secure Cloud* (the Blueprint) provides organisations a secure, flexible, and scalable platform for key services including productivity and collaboration, and user operated endpoints (laptops, desktops, and mobile devices). It also provides a controlled base allowing organisations to deploy its own hosted additional services, workloads, and third party web services. The Blueprint describes a secure architecture, with implementation and operation guidance, and associated security documentation necessary for organisations to make well informed risk based decisions on implementations tailored to the operating context.

### Where to start

This overview is suitable for all users as a starting point.

The technical aspects of the Blueprint are made up of 3 main sections:

* **Platform design** -- All base and supporting components, services, functions, and configuration for secure implementation of Microsoft 365 and endpoint devices
* **Endpoints design** -- Specific information relating to configuration of Windows and iOS endpoint devices
* **Shared Services design** -- Information regarding the services within the Blueprint, including:
  * Exchange Online
  * SharePoint Online
  * OneDrive for Business
  * Teams
  * Power Platform.

For each component in the solution, the blueprint artefacts provide:

* a brief description of the component
* decision points
* the decision itself
* a justification for that decision.

Example as-built-as-configured (ABAC) pages detail specific technical configurations for manual implementation. Provided configuration files also enable for automated deployment of the Blueprint using the [Microsoft 365 Desired State Configuration (DSC) PowerShell utility](https://microsoft365dsc.com/).

The use of placeholders like ‘organisation.gov.au' and ‘tenant-name' are used in the ABAC documents where appropriate. Given the large amount of settings covered within the Blueprint, the ABAC documents do not provide justification for individual settings. The pages highlight sections where there are differences between hybrid and cloud only solutions.

### What is covered in this overview section?

This overview section describes the design principles, requirements, scope, design decisions, assumptions, and a summary of the architecture.
