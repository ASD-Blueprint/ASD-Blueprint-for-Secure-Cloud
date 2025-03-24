---
title: "Mail Migration"
weight: 35
description: "This section describes the design decisions associated with Mail Migration for system(s) built using ASD's Blueprint for Secure Cloud."
---

The implementation of Exchange Online can be coupled with a migration from the existing on-premises Exchange infrastructure. If a migration is not required, the deployment is referred to as a greenfield deployment of Exchange Online. There are three migration options:

* **Hybrid Migration** – Often referred to as a staged migration, is where the on-premises Exchange environment is extended to Office 365 through departmental relationships or federation. During migration user mailboxes will be spread between the online and on-premises environments, this necessitates planning to ensure free/busy, calendar and mailbox sharing all continue to work.
* **Cutover Migration** – A cutover migration is only recommended for organisations with less than 150 mailboxes and occurs over one or a few days. During this period email access may be unavailable. Prior to the migration event, a connection between the on-premises Exchange organisation and Exchange Online needs to be established.
* **PST Migration** – A Personal Storage Table (PST) migration is where PST files with a mapping file are either shipped to or uploaded into Office 365. The Exchange Online instance is a greenfield deployment with no configuration required on the on-premises Exchange environment.

{{% alert title="Design decisions" color="warning" %}}

| Decision point    | Design decision | Justification                                                                               |
| ----------------- | --------------- | ------------------------------------------------------------------------------------------- |
| Office 365 Tenant | Single tenant   | Exchange Online services will be hosted within the organisation's secure Office 365 tenant. |


{{% /alert %}}

### Cloud native deployments

{{% alert title="Design decisions" color="warning" %}}

| Decision point    | Design decision      | Justification                                       |
|-------------------|----------------------|-----------------------------------------------------|
| Deployment Type   | Exchange Online only | No migration of mail from on prem or other services.|

{{% /alert %}}

### Hybrid deployments

{{% alert title="Design decisions" color="warning" %}}

| Decision point    | Design decision  | Justification                                                               |
|-------------------|------------------|-----------------------------------------------------------------------------|
| Deployment Type   | Hybrid Migration | User mailboxes should be migrated from the on-premises Exchange environment.|

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