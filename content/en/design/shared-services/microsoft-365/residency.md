---
title: "Microsoft 365 Organisation Residency"
weight: 30
description: "This section describes the design decisions associated with Microsoft 365 for system(s) built using ASD's Blueprint for Secure Cloud."
---

Microsoft 365 is a global service which is offered in many different physical regions. Choosing a region to store data is required to ensure that organisation data is not transferred or stored offshore. Microsoft 365 tenant residency is critical when setting up the organisations's Microsoft 365 tenant. The region where the Microsoft 365 tenant is set up determines where the data is stored. Details of Microsoft 365 data residency can be found within the [Microsoft 365 for enterprise site](https://learn.microsoft.com/microsoft-365/enterprise/o365-data-locations?view=o365-worldwide).

Microsoft 365 tenant data residency is critical to ensure the organisation's tenant is created and the data is stored in Australia.

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point       | Design Decision | Justification                                                                |
|----------------------|-----------------|------------------------------------------------------------------------------|
| Microsoft 365 Region | Australia       | Aligns with ASD's guidance to utilise cloud services located within Australia |

{{% /alert %}}

### Microsoft 365 Service Locations 

| Service                                                    | Location                          |
| ---------------------------------------------------------- | --------------------------------- |
| Exchange Online                                            | Australia                         |
| OneDrive for Business                                      | Australia                         |
| SharePoint Online                                          | Australia                         |
| Microsoft Teams                                            | Australia                         |
| Office Online & Mobile                                     | Australia                         |
| Exchange Online Protection (EOP)                           | Australia                         |
| Microsoft Intune                                           | Australia                         |
| Planner                                                    | Australia                         |
| Sway                                                       | United States                     |
| Yammer                                                     | United States                     |
| OneNote Services                                           | Australia                         |
| Stream                                                     | Australia                         |
| Whiteboard                                                 | Australia                         |
| Forms                                                      | United States                     |
| Viva Connections                                           | Australia                         |
| Viva Topics                                                | Australia                         |
| Viva Learning                                              | Global Geography 2 – Asia Pacific |
| Viva Insights - Personal                                   | Australia                         |
| Viva Insights - Manager/Leader Entra org data only         | Global Geography 2 – Asia Pacific |
| Viva Insights - Manager/Leader with 3rd party HR data only | United States                     |
| Viva Insights - Advanced                                   | United States                     |

### Related information

#### References

* [Where your Microsoft 365 customer data is stored](https://docs.microsoft.com/microsoft-365/enterprise/o365-data-locations?view=o365-worldwide)

#### Related design decisions

* None identified
