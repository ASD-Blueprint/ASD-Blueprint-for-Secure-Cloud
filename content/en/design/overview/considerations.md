---
title: Service Provisioning Considerations
weight: 30
description: "This section provides a framework of considerations when looking at provisioning new Microsoft 365 services associated with system(s) built on ASD's Blueprint for Secure Cloud."
---

### Implementation type

ASD's *Blueprint for Secure Cloud* (the Blueprint) includes guidance for cloud native and hybrid deployments (implementation types). It can also be for staged deployments to leverage hybrid configurations as a transition step to cloud only transformation.

Considerations for implementation include whether an organisation has on-premises instances of:

*   Microsoft Exchange
*   SharePoint
*   Identity management
*   Multiple active directories
*   Significant investment in infrastructure with serviceable life

A hybrid implementation can use Microsoft Endpoint Configuration Manager (MECM) or Microsoft Intune for client management, depending on the organisation's cloud maturity.

Blueprint artefacts provide guidance on integration between MECM and Intune for hybrid deployments. Organisations with existing infrastructure can migrate device management from MECM to Intune with no impact to the organisation's existing cyber security posture.

### Organisation classification

The Blueprint assumes the organisation has available the licencing level of Microsoft 365 E5, or equivalent Microsoft 365 E3 with Microsoft 365 E5 security and compliance add-ons. See [Microsoft 365 Maps](https://m365maps.com/) for feature matrices and comparison diagrams. Australian Government consumers of the Blueprint can use the Microsoft Volume Sourcing Arrangement (VSA) Common Cloud Commitment which consists of:

*   Windows E5
*   Microsoft 365 E5
*   Enterprise Mobility and Security E5
*   Productivity server licences (Exchange Server, SharePoint Server, Lync/Skype Server)
*   Microsoft Device licences

At a minimum, Microsoft also recommends the following licensing in addition to the VSA Common Cloud Commitment to satisfy security requirements laid out within the Blueprint:

*   Microsoft 365 E5 Security
*   Microsoft 365 E5 Compliance

Components that transfer PROTECTED information outside of an organisation's environment include:

### GovLINK

[NOTE: Below information provided by Dept. of Finance. Updates to the text should be vetted by the Dept. of Finance GovLINK team]: #

GovLINK provides secure, encrypted, and trusted communication between Commonwealth entities across the internet, allowing information transmission up to the security classification of PROTECTED. Email messages classified at PROTECTED must be sent and received over GovLINK.

A Transport Layer Security (TLS) solution for GovLINK is available enabling a direct interface between Microsoft 365 Exchange Online and the GovLINK solution.

More information on GovLINK is available on [the Department of Finance website](https://www.finance.gov.au/government/whole-government-information-communications-technology-services/govlink). Enquires on the GovLINK TLS solution can also be directed to [govlinkenquiries@finance.gov.au](mailto:govlinkenquiries@finance.gov.au) or via the above website.

ASD can also provide further guidance to organisations and reference sites of how other Commonwealth entities have achieved secure connections using GovLINK.

### Information management

Each organisation determines information management approaches specific to its operational requirements.

The following information management tools are available within the Blueprint:

*   **OneDrive**: data relevant to an individual user. When used in conjunction with the desktop client, data stored on the users endpoint device is automatically synchronised to Microsoft 365 cloud so it is available anywhere and afforded the same protections as all other data stored within the organisations Microsoft 365 tenant. Data within OneDrive can be shared with other parties (depending on security settings) from the desktop client, via the OneDrive web interface, or when sharing information via one-to-one Teams chats. OneDrive also stores recordings for one-to-one Microsoft Teams meetings.
*   **SharePoint Online**: any file relevant to teams, projects or organisations, and additionally recordings for Microsoft Teams meetings. SharePoint, by default, allows for setting of document permissions at a file, site, and organisation level. Users can be added to the groups according to the permission they require: Permissions are:
    *   Document Owners (full control)
    *   Contributors (read/write)
    *   Visitors (read only)
*   **Exchange Online**: primarily for storage of email-related items such as messages, contacts, calendar items, tasks, and notes. Exchange Online also provides storage capabilities for a number of other services within the Microsoft 365 ecosystem including voicemail, Microsoft Forms and associated responses, Sway files, tasks, Microsoft Teams chats, To-Do, and Viva Engage conversations and comments
*   **Microsoft Teams**:  Teams itself does not store data; however, it processes data through a number of interfaces and also enables screen sharing where data can be visually shared with one or more users

In addition to the above user data, Microsoft Defender, Microsoft Purview, and LogAnalytics all store data relating to auditing an

### Information protection

Information protection covers the application of labels to documents and emails according to the classification of the content.

Within the Blueprint there are two options for labelling documents and emails. These are:

*   Microsoft Information Protection, including Azure Information Protection (AIP)
*   third-party application

The Blueprint provides guidance for application of Microsoft Information Protection. Implementation of a third-party labelling solution is not covered and guidance should be sort from the relevant vendor.

### Collaboration

The Blueprint enables cross-organisation collaboration between two or more consenting organisations using Microsoft Teams, SharePoint Online and Microsoft Planner.

Microsoft Teams provides the following collaboration functionality using several Microsoft supporting products:

*   Individual and group chat/instant messaging
*   Individual and group voice call
*   Individual and group video call
*   Voicemail
*   Document collaboration
*   Screen and application sharing
*   Online meetings
*   Email-enabled channels
*   Organisation chart
*   Planning

Collaboration between organisations requires considerations in addition to the base Blueprint security controls.

The extra risks and considerations include:

*   Personnel clearances
*   Physical security requirements and the secure creation
*   Governance of content
*   Storage and destruction of physical artefacts

Considerations need to be assessed for security risk on a case-by-case basis.

### Secure internet gateway

A Secure Internet Gateway (SIG) is an information flow control mechanism to manage the flow of information between networks from differing security domains. The Department of Home Affairs' Protective Security Policy Framework (PSPF) [Policy 11: Robust ICT Systems](https://www.protectivesecurity.gov.au/publications-library/policy-11-robust-ict-systems) lists implementation of a SIG as a requirement to safeguard systems. The Blueprint does not include design information for implementation of a SIG.

### Secure system administration

A secure administration solution may include privileged access workstations (PAW) and/or jump hosts, sometimes referred to as bastion host, jump box, or jump server. These solutions server as a single point of entry between different networks or security boundaries enabling a secure and resilient boundary for the administration of critical assets.

Initially, cloud native environments will not have a secure administration solution. Hybrid organisations may already have a secure administration model with set policies and procedures.

Secure administration solutions should comprise:

*   **Separate credentials** are provided for non-privileged and privileged duties
*   **Hardened PAW** (Windows operating system) enrolled into Intune and coupled with conditional access polices to provide a zero trust entry point into the associated cloud apps to administer. Local administrative privileges should be restricted on the PAW, it is used to access the jump server solution or direct access to cloud admin portals
*   **Web filtering system** to restrict privileged accounts to the set of organisation approved admin portals only. This product could be a risk assessed cloud platform or built as an infrastructure as a service server. The web filtering solution should be mandatory on the jump host or PAWs. [Tenant restrictions](https://docs.microsoft.com/azure/active-directory/manage-apps/tenant-restrictions) should be implemented to prevent misuse or data exfiltration to other Microsoft tenancies
*   **Virtual jump host** solution may be built leveraging Azure Virtual Desktop (AVD) session hosts, which seamlessly provides Multi-Factor Authentication (MFA) through Conditional Access policies. This jump host may be the trusted location where admin portals are used, as well as a secure place to administer other hybrid assets. Network security groups can be used to restrict management traffic flows to these jump hosts only
*   **Restriction of management traffic flows** limited to only critical assets should be implemented where possible. This could be achieved by utilising the Windows Defender native firewall functionality, web filtering, network security groups on cloud hosted jump hosts, and Conditional Access policies.

The Blueprint provides information on implementing a secure administration solution suitable for Microsoft 365.

Review ASD's [Information Security Manual's (ISM's) controls for systems management](https://www.cyber.gov.au/acsc/view-all-content/publications/secure-administration) to assist with the implementation of a secure administration model.

### Virtual private network

When implementing Apple iOS devices such as iPhones and iPads, ASD's [*Security Configuration Guide for Apple iOS Devices*](https://www.cyber.gov.au/acsc/view-all-content/publications/security-configuration-guide-apple-ios-14-devices) suggests use of a virtual private network to protect in transit communications. Whilst the selection and configuration of a VPN solution is the responsibility of the organisation, the Blueprint includes a [suggested per app VPN configuration]({{< ref "configuration">}}). The organisation is responsible for assessing and documenting the risk applicability for the selection, implementation, and configuration of a VPN solution.
