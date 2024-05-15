---
title: "System Security Plan"
linkTitle: "System Security Plan"
weight: 20
type: docs
description: This page provides a template and guidance to assist organisations in preparing an introduction to an SSP describing the organisational policies and processes, and technical controls implemented within system(s) built on ASD's Blueprint for Secure Cloud.
---

{{% alert title="Instruction" color="dark" %}}

This System Security Plan (SSP) template provides a guide and resource to assist organisations in preparing a SSP describing organisational policies and processes relating to, and technical controls implemented within, system(s) built on ASD's *Blueprint for Secure Cloud*. It provides guidance to facilitate decision-making, rather than prescriptive statements or measures, allowing organisations to tailor this document according to the controls implemented and the organisation's context.

When using this template, organisations should insert and update the required information to ensure it accurately represents all relevant organisational policies, processes and technical controls. This may include organisational controls or policies that are outside of the scope of the Blueprint, but are still relevant to the system — placeholders are included where relevant throughout this template. 

Text included in the guidance boxes throughout this template should be deleted from an organisation's final SSP.

{{% /alert %}}

### About this System Security Plan

This System Security Plan (SSP) describes the organisational policies and processes relevant to, and technical controls implemented within the core `<SYSTEM-NAME>` or network that includes `<ORGANISATION-NAME>`’s Microsoft Workloads (Cloud and Software as a Service), endpoints and `<OTHER SYSTEM COMPONENTS IN SCOPE>`.

|                   |            |
| ----------------- | ---------- |
| ISM Version used: | March 2024 |
|                   |            |

### Purpose of this System Security Plan

The purpose of this SSP is to describe the organisational policies and processes relevant to, and technical controls implemented within `<ORGANISATION-NAME>`'s `<SYSTEM-NAME>`, including the underlying components leveraged in the system's deployment. This document has been developed to comply with the Australian Signals Directorate's (ASD's) [*Information Security Manual's*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism) (ISM's) requirements in relation to documentation for system authorisation.

This document is written using descriptive and explanatory language to assist readers in understanding how `<SYSTEM-NAME>` operates securely, the controls implemented, and the residual controls that are addressed elsewhere by `<ORGANISATION-NAME>`.

For detailed information on how `<SYSTEM-NAME>` addresses specific controls in ASD's ISM, please refer to the [System Security Plan Annex]({{<ref "/security-and-governance/annex">}}).