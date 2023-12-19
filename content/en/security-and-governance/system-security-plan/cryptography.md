---
title: "Cryptography"
linkTitle: "Cryptography"
weight: 105
type: docs
description: This page provides a template and guidance to assist organisations in documenting their approach to cryptography, TLS, SSH, S/MiME and IPSec associated with their system(s) built on ASD's Blueprint for Secure Cloud.
---

{{% alert title="Instruction" color="dark" %}}

The cryptography section of a System Security Plan (SSP) should document an organisation's approach to cryptography, TLS, SSH, S/MiME and IPSec. As with other sections of the SSP, information in the email section should be documented according to the relevant controls outlined in ASD's ISM and the SSP Annex. 

All template text refers to a typical implementation of a system built using the Blueprint, and includes reference to organisational policies, processes and technical configurations to be implemented in addition to the technical controls that may be configured using guidance from the Blueprint. Any implementation implied by the below text should not be considered as prescriptive of how the organisation must scope, build, document, or assess its system.

When completing the below template, organisations should insert and update information where relevant to ensure it accurately represents their approach to cryptography, TLS, SSH, S/MiME and IPSec. When complete, remove any instructional boxes throughout. 

{{% /alert %}}

### Cryptographic fundamentals

#### Applicability

ISM controls relating to cryptography, including cryptographic algorithms as implemented by Microsoft as part of its Microsoft 365 services, within `<SYSTEM-NAME>`'s system boundary are applicable to and covered by this section of the SSP. `<ORGANISATION-NAME>` has assessed the implementation of these components as documented in Microsoft's IRAP assessments, and available in Microsoft's [Service Trust Portal](https://servicetrust.microsoft.com/), and is satisfied with their implementation as they relate to `<SYSTEM-NAME>`.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

No organisational policies or processes have been implemented in `<SYSTEM-NAME>` relating to cryptographic fundamentals.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

Technical controls for `<SYSTEM-NAME>`'s implementation of cryptography are configured with reference to ASD's [*Blueprint for Secure Cloud*](https://blueprint.asd.gov.au) including the following technical configurations:

- Microsoft BitLocker is configured on endpoints for disk encryption leveraging AES which is an AACA
- Microsoft BitLocker is configured to provide full disk encryption of `<SYSTEM-NAME>`'s mobile devices, implementing AES-256 
- BitLocker recovery keys are stored in Microsoft Entra ID
- TLS with AES is used to protect traffic to and from Azure and Microsoft 365 servers over the internet.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### ASD-approved cryptographic algorithms

#### Applicability

ISM controls relating to cryptography, including cryptographic algorithms as implemented by Microsoft as part of its Microsoft 365 services, within `<SYSTEM-NAME>`'s system boundary are applicable to and covered by this section of the SSP. `<ORGANISATION-NAME>` has assessed the implementation of these components as documented in Microsoft's IRAP assessments, and available in Microsoft's [Service Trust Portal](https://servicetrust.microsoft.com/), and is satisfied with their implementation as they relate to `<SYSTEM-NAME>`.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

No organisational policies or processes have been implemented in `<SYSTEM-NAME>` relating to ASD-approved cryptographic algorithms.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

Technical controls for `<SYSTEM-NAME>`'s implementation of AACAs are configured with reference to ASD's [*Blueprint for Secure Cloud*](https://blueprint.asd.gov.au) including the following technical configurations:

- BitLocker is configured to use AES-256 encryption.

`<SYSTEM-NAME>`'s use of Microsoft 365 also inherits the following technical configurations from Microsoft:

- Microsoft Azure and Microsoft 365 services:
  - implement AACAs where possible
  - implement Elliptic-Curve Diffie-Hellman Ephemeral (ECDHE) as the preferred algorithm
  - do not use Diffie-Hellman (DH)
  - do not use Digital Signature Algorithm (DSA)
  - implement National Institute of Standards and Technology (NIST) P-256 and P-384
  - use a 256-bit key where possible for Elliptic-Curve Diffie-Hellman (ECDH)
  - use a 2048-bit key for Rivest–Shamir–Adleman (RSA)
  - use separate RSA key pairs for these purposes
  - use SHA-384 as the preferred hashing algorithm for Microsoft 365 TLS components.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### ASD-approved cryptographic protocols

#### Applicability

ISM controls relating to cryptography, including cryptographic algorithms as implemented by Microsoft as part of its Microsoft 365 services, within `<SYSTEM-NAME>`'s system boundary are applicable to and covered by this section of the SSP. `<ORGANISATION-NAME>` has assessed the implementation of these controls as documented in Microsoft's IRAP assessments, and available in Microsoft's [Service Trust Portal](https://servicetrust.microsoft.com/) and is satisfied with their implementation as they relate to `<SYSTEM-NAME>`.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

No organisational policies or processes have been implemented in `<SYSTEM-NAME>` relating to ASD-approved cryptographic protocols.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical Controls Implemented

`<SYSTEM-NAME>`'s use of Microsoft 365 inherits the following technical controls from Microsoft:
- Microsoft Azure and Microsoft 365 services implement AACPs where possible.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Transport Layer Security (TLS)

#### Applicability

ISM controls relating to implementation of TLS, including TLS as implemented by Microsoft as part of its Microsoft 365 services, within `<SYSTEM-NAME>`'s system boundary are applicable to and covered by this section of the SSP. `<ORGANISATION-NAME>` has assessed the implementation of these components as documented in Microsoft's IRAP assessments, and available in Microsoft's [Service Trust Portal](https://servicetrust.microsoft.com/), and is satisfied with their implementation as they relate to `<SYSTEM-NAME>`.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

No organisational policies or processes have been implemented in `<SYSTEM-NAME>` relating to TLS.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

`<SYSTEM-NAME>`'s use of Microsoft 365 inherits the following technical controls from Microsoft:

- Microsoft Azure and Microsoft 365 services: 
  - implement TLS
    - however, `<ORGANISATION-NAME>` notes that Microsoft services do not currently allow organisations to select which TLS versions to use
  - implement AES in Galois Counter Mode (GCM)
  - implement secure renegotiation
  - implement ECDHE as the preferred algorithm
    - Perfect Forward Secrecy is used when ECDHE is prioritised
  - use SHA-2 based certificates
  - use SHA-2 as part of the Message Authentication Code and Pseudo-Random Function
  - disable TLS compression.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Secure Shell (SSH)

#### Applicability

The section of the SSP is not applicable as `<SYSTEM-NAME>` does not directly implement Secure Shell (SSH) in its administration or configuration. However, `<SYSTEM-NAME>` does rely on other systems and services that implement SSH as part of their administration and configuration.

In particular, `<SYSTEM-NAME>` uses both physical and logical networking components as implemented by Microsoft as part of its Microsoft 365 services. `<ORGANISATION-NAME>` has assessed the implementation of these components as documented in Microsoft's IRAP assessments, and available in Microsoft's [Service Trust Portal](https://servicetrust.microsoft.com/), and is satisfied with their implementation as they relate to `<SYSTEM-NAME>`.

If and when SSH is implemented in future use as part of `<SYSTEM-NAME>`, `<ORGANISATION-NAME>` will assess and implement appropriate security controls in relation to its configuration at that time.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

No organisational policies or processes have been implemented in `<SYSTEM-NAME>` relating to SSH.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

No technical controls are implemented in `<SYSTEM-NAME>` relating to SSH.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Secure/Multipurpose Internet Mail Extension (S/MiME)

#### Applicability

This section of the SSP is not applicable as `<SYSTEM-NAME>` does not implement S/MIME in its administration or configuration, nor does it leverage the use of S/MIME within `<ORGANISATION-NAME>`.

If and when S/MIME is implemented in future use as part of `<SYSTEM-NAME>`, `<ORGANISATION-NAME>` will assess and implement appropriate security controls in relation to its configuration at that time.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

No organisational policies or processes have been implemented in `<SYSTEM-NAME>` relating to S/MiME.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

No technical controls are implemented in `<SYSTEM-NAME>` relating to S/MiME.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Internet Protocol Security (IPsec)

#### Applicability

The section of the SSP is not applicable as `<SYSTEM-NAME>` does not directly implement IPsec in its administration or configuration. However, `<SYSTEM-NAME>` does rely on other systems and services that implement IPsec as part of their administration and configuration.

In particular, `<SYSTEM-NAME>` leverages both physical and logical networking components as implemented by Microsoft as part of its Microsoft 365 services. `<ORGANISATION-NAME>` has assessed the implementation of these components as documented in Microsoft's IRAP assessments, and available in Microsoft's [Service Trust Portal](https://servicetrust.microsoft.com/), and is satisfied with their implementation as they relate to `<SYSTEM-NAME>`.

If and when IPSec is implemented in future use as part of `<SYSTEM-NAME>`, `<ORGANISATION-NAME>` will assess and implement appropriate security controls in relation to its configuration at that time.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Organisational policies and processes implemented

No organisational policies or processes have been implemented in `<SYSTEM-NAME>` relating to IPsec.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

#### Technical controls implemented

No technical controls are implemented in `<SYSTEM-NAME>` relating to IPsec.

`<INSERT ADDITIONAL INFORMATION AS APPROPRIATE>`

### Related information

#### Security & Governance

-   None Applicable

#### Design

-   None Applicable

#### External documentation

- ASD's [*Guidelines for Cryptography*](https://www.cyber.gov.au/resources-business-and-government/essential-cyber-security/ism/cyber-security-guidelines/guidelines-cryptography)
- Microsoft's [Service Trust Portal](https://servicetrust.microsoft.com/)