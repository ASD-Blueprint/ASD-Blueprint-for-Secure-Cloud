---
title: "Safe Links"
weight: 60
description: "This section describes the design decisions associated with Safe Links Microsoft 365 security features for system(s) built using ASD's Blueprint for Secure Cloud."
---

Microsoft Defender for Office 365 Safe Links helps to protect an organisation by providing 'time-of-click verification' of web addresses (URLs) in email messages, Office documents, and Teams messages. Safe Links is configured within the Microsoft 365 Defender portal using Safe Links policies.

Administrators can redirect URLs in order to avoid being sent to the original link. In addition, administrators can obfuscate the original link preventing users from copying and pasting the link into a web browser.

Real-time scanning of URLs provides an additional layer of protection by scanning links during transit and hold an email message from being delivered until the links have been scanned and considered safe.

Safe Links policies can be configured at an organisation level or on a per recipient basis and applied to Exchange Online, Teams, Office 365 applications, or combinations of the three.

How Safe Links works within Exchange Online:

* All incoming email goes through Exchange Online Protection, where IP and envelope filters, signature-based malware protection, anti-spam and anti-malware filters are applied
* An end-user signs into Office 365 and accesses their Exchange Online mailbox
* An end-user opens an email message containing a URL, and then clicks on the URL in the email message
* The ATP Safe Links feature immediately checks the URL before opening the website. The URL is identified as blocked, malicious, or safe
* If the URL sends an end-user to a website that is included in a custom "Do not rewrite" URLs list for a policy that applies to the user, the website opens
* If the URL sends an end-user to a website that is included in the organisation's custom blocked URLs list, a warning page opens
* If the URL sends an end-user to a website that has been determined to be malicious, a warning page opens
* If the URL goes to a downloadable file and the ATP Safe Links policies are configured to scan such content, the downloadable file is checked
* If the URL is considered safe, the end-user is taken to the website.

How Safe Links works within Office applications:

* A user opens a Word, Excel, PowerPoint, or Visio, and is signed in using their Office 365 security credentials. The document contains URLs
* When a user clicks on a URL in the document, the link is checked by the ATP Safe Links service
* If the URL sends an end-user to a website that is included in a custom "Do not rewrite" URLs list for a policy that applies to the user, that user is taken to the website
* If the URL sends an end-user to a website that is included in the organisation's custom blocked URLs list, the user is taken to a warning page
* If the URL sends an end-user to a website that has been determined to be malicious, the user is taken to a warning page
* If the URL goes to a downloadable file and the ATP Safe Links policies are configured to scan such downloads, the downloadable file is checked
* If the URL is considered safe, the end-user is taken to the website.

How Safe Links works within Teams:

{{% alert title="Design Decisions" color="warning" %}}

| Decision Point                                                                              | Design Decision                                                                                                             | Justification                                                                                                                                                                     |
|---------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Defender for Office 365 Safe Links                                                          | Configured                                                                                                                  | Configured to align with ACSC's Malicious Email Mitigation Strategies and Microsoft guidance.                                                                                     |
| **Settings that apply to content across Office 365**                                        |                                                                                                                             |                                                                                                                                                                                   |
| Block the following URL's                                                                   | No URLs defined                                                                                                             | Managing the Blocked URL list is an ongoing administrative task. Organisations will need to consider the resourcing requirements of maintaining a blocked URL list.               |
| **Settings that apply to content except mail**                                              |                                                                                                                             |                                                                                                                                                                                   |
| Use safe links in Office 365 ProPlus, Office for iOS and Android                            | Checked                                                                                                                     | Safe links will be checked by default within these Office 365 applications.                                                                                                       |
| For the locations selected above: Do not track when users click safe links                  | Unchecked                                                                                                                   | Information about when end-users click safe links in the Office 365 documents will be tracked.                                                                                    |
| For the locations selected above: Do not let users click through safe links to original URL | Checked                                                                                                                     | If end-users click on safe links in Office 365 documents, then they will be directed to a warning page and will not be presented with an option to continue to the original link. |
| Action for unknown or potentially malicious URLs within Microsoft Teams                     | Microsoft Teams will check against a list of known malicious links when user clicks on the link; URLs will not be rewritten | Configured to align with ACSC's Malicious Email Mitigation Strategies and Microsoft guidance.                                                                                     |
| Action for unknown potentially malicious URLs in messages                                   | URLs will be rewritten and checked against a list of known malicious links when user clicks on the link                     | Configured to align with ACSC's Malicious Email Mitigation Strategies and Microsoft guidance.                                                                                     |

{{% /alert %}}

### Related information

#### Security & Governance

* None identified

#### Design

* None identified

#### References

* [Safe Links in Microsoft Defender for Office 365](https://docs.microsoft.com/microsoft-365/security/office-365-security/safe-links?view=o365-worldwide)