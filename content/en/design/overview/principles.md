---
title: "Design Principles"
weight: 20
description: "This section provides an overview of the key design principles associated with system(s) built on ASD's Blueprint for Secure Cloud."
---

At the foundation of ASD's *Blueprint for Secure Cloud's* (the Blueprint's) architecture lies a set of core design principles which serve as a base for subsequent design decisions across business, technical, and security domains.

The design principles are intentionally aspirational to help organisations strive for an optimum design of the target architecture. Use these principles in implementation of the Blueprint as a guide to enable addition of future Microsoft 365 services and expansion into other cloud technologies. Organisations choosing to deploy the Blueprint should look to apply and maintain the design principles and understand the impact and trade-offs associated with deviation.

### Impact of deviations

There are valid reasons to deviate from the design principles. For example, organisational requirements might dictate specific outcomes or approaches for designing a solution. In such cases, it is important to understand the impact the deviation has on the design and future operations. Carefully consider the trade-offs when updating each principle.

As a general rule, be prepared to balance requirements, functionality, and security. A cloud journey to a conceptual architecture evolves over time as requirements change and organisations learn from implementation. For example, using preview services and depending on service roadmaps can remove technical blockers during adoption.

### Principles

#### Risk-based security

Cloud services and systems should implement security controls appropriate to the organisations risk profile and data protection requirements. Use policy-driven guard rails to guide, not block security configuration and architecture.

#### Automate

Automation is critical to rapid provisioning and updating of security controls in a cloud environment. It can also help identify and remediate misconfigurations and other security gaps in real time. Systems and services should automation provisioning, configuration, deployment, and operations with minimal user interaction.

#### Visibility

As an organisations cloud usage expands to include multi-cloud deployments, visibility will become more complex. Design, implement, and configure systems and services to enable proactive monitoring of service usage, health, and costs through correlated security and audit events, automated and manual incident response procedures, and centralised security information and event management tools.

#### Cloud friendly governance

Cloud services enables more rapid configuration changes as new features and capabilities are released. Changes to cloud system and services should follow organisation change management processes, but where possible reduce process overhead and complexity through reusable accreditation via use of building blocks.
