---
title: "Resource Mailboxes"
weight: 35
description: "This section describes the design decisions associated with Exchange Online for system(s) built using ASD's Blueprint for Secure Cloud."
---

A Resource Mailbox is a mailbox which is assigned to a resource as opposed to a user.

Resource Mailboxes have two types:

* **Room mailboxes** – Used for meeting rooms
* **Equipment mailboxes** – Used for non-location specific resources such as computers, projectors, microphones, or cars

Users book these resources using meeting requests. Resource Mailboxes can be configured to accept or decline the request based on their availability.

Room Mailboxes can be sorted into lists using Room Lists. Room Lists are leveraged to simplify the booking process by grouping all rooms that meet a certain requirement together (Room lists are usually configured by location). When a user books a meeting, they can select the appropriate room list and then see the available rooms for that time.

{{% alert title="Design decisions" color="warning" %}}

| Decision point                          | Design decision | Justification                                                                                                                                                      |
|-----------------------------------------|-----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Room Mailboxes                          | Configured      | There is a requirement for booking rooms within the solution. Rooms will be configured with a mailbox so that users can book them through their calendars.         |
| Equipment Mailboxes                     | Configured      | There is a requirement for booking equipment within the solution. Equipment will be configured with a mailbox so that users can book them through their calendars. |
| Room Lists                              | Configured      | There is a requirement for booking rooms within the solution. Room Assets will be configured with a list so that users can book them through their calendars.      |
| Naming standards for Resource mailboxes | Configured      | To distinguish between resource mailboxes an organisational naming standard should be followed for each resource mailbox.                                          |

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