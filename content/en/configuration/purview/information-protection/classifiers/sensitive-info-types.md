---
title: "Sensitive info types"
linkTitle: "Sensitive info types"
weight: 010
description: "This section describes the configuration of sensitive info types within Microsoft Purview associated with systems built according to guidance in ASD's Blueprint for Secure Cloud."
---

{{% alert title="Instruction" color="dark" %}}

The below tables outline the *as built* configuration for ASD's *Blueprint for Secure Cloud* (the Blueprint) for the Microsoft Purview portal at the following URL:

<https://purview.microsoft.com/informationprotection/dataclassification/multicloudsensitiveinfotypes>

The settings described on these pages provide a baseline implementation for a system configured using the Blueprint. Any implementation implied by these pages should not be considered as prescriptive as to how an organisation must scope, build, document, or assess a system.

Implementation of the guidance provided by the Blueprint will differ depending on an organisation’s operating context and organisational culture. Organisations should implement the Blueprint in alignment with their existing change management, business processes and frameworks.

Placeholders such as `<ORGANISATION.GOV.AU>`, `<BLUEPRINT.GOV.AU>` and `<TENANT-NAME>` should be replaced with the relevant details as required.

{{% /alert %}}

***Sensitive info type index:***

- [UNOFFICIAL](#unofficial)
- [UNOFFICIAL (paragraph)](#unofficial-paragraph)
- [OFFICIAL](#official)
- [OFFICIAL (paragraph)](#official-paragraph)
- [OFFICIAL Sensitive](#official-sensitive)
- [OFFICIAL Sensitive (paragraph)](#official-sensitive-paragraph)
- [OFFICIAL Sensitive Personal Privacy](#official-sensitive-personal-privacy)
- [OFFICIAL Sensitive Legal Privilege](#official-sensitive-legal-privilege)
- [OFFICIAL Sensitive Legislative Secrecy](#official-sensitive-legislative-secrecy)
- [OFFICIAL Sensitive NATIONAL CABINET](#official-sensitive-national-cabinet)
- [OFFICIAL Sensitive NATIONAL CABINET Personal Privacy](#official-sensitive-national-cabinet-personal-privacy)
- [OFFICIAL Sensitive NATIONAL CABINET Legal Privilege](#official-sensitive-national-cabinet-legal-privilege)
- [OFFICIAL Sensitive NATIONAL CABINET Legislative Secrecy](#official-sensitive-national-cabinet-legislative-secrecy)
- [PROTECTED](#protected)
- [PROTECTED (paragraph)](#protected-paragraph)
- [PROTECTED Personal Privacy](#protected-personal-privacy)
- [PROTECTED Legal Privilege](#protected-legal-privilege)
- [PROTECTED Legislative Secrecy](#protected-legislative-secrecy)
- [PROTECTED NATIONAL CABINET](#protected-national-cabinet)
- [PROTECTED NATIONAL CABINET Personal Privacy](#protected-national-cabinet-personal-privacy)
- [PROTECTED NATIONAL CABINET Legal Privilege](#protected-national-cabinet-legal-privilege)
- [PROTECTED NATIONAL CABINET Legislative Secrecy](#protected-national-cabinet-legislative-secrecy)
- [PROTECTED CABINET](#protected-cabinet)
- [PROTECTED CABINET Personal Privacy](#protected-cabinet-personal-privacy)
- [PROTECTED CABINET Legal Privilege](#protected-cabinet-legal-privilege)
- [PROTECTED CABINET Legislative Secrecy](#protected-cabinet-legislative-secrecy)
- [SECRET](#secret)
- [SECRET (paragraph)](#secret-paragraph)
- [TOP SECRET](#top-secret)
- [TOP SECRET (paragraph)](#top-secret-paragraph)

### Sensitive info types

[//]: # (                                         * * * * * Note * * * * *                                                           )
[//]: # (                                                                                                                            )
[//]: # ( Regular expressions in tables include extra escape characters for formatting, do not copy and paste them from raw markdown )
[//]: # (                                                                                                                            )
[//]: # (                                         * * * * * Note * * * * *                                                           )

#### UNOFFICIAL

| Item                         |                                                            Value |
| ---------------------------- | ---------------------------------------------------------------: |
| Name                         |                                UNOFFICIAL classified information |
| Description                  |      Information containing the UNOFFICIAL classification marker |
| **Pattern #1**               |                                                                  |
| - Confidence level           |                                                Medium confidence |
| - Primary element            |                                               Regular expression |
| - ID                         |                                                       UNOFFICIAL |
| - Regular expression         |                                                 `\bUNOFFICIAL\b` |
|                              |                                                     String match |
| - Character proximity        | Detect primary AND supporting elements within **300** characters |
| Recommended confidence level |                                          Medium confidence level |

#### UNOFFICIAL (paragraph)

| Item                         |                                                                 Value |
| ---------------------------- | --------------------------------------------------------------------: |
| Name                         |                         UNOFFICIAL classified information (paragraph) |
| Description                  | Information containing the UNOFFICIAL classification paragraph marker |
| **Pattern #1**               |                                                                       |
| - Confidence level           |                                                     Medium confidence |
| - Primary element            |                                                    Regular expression |
| - ID                         |                                                  UNOFFICIAL paragraph |
| - Regular expression         |                                                              `\(UO\)` |
|                              |                                                          String match |
| - Character proximity        |      Detect primary AND supporting elements within **300** characters |
| Recommended confidence level |                                               Medium confidence level |

#### OFFICIAL

| Item                         |                                                            Value |
| ---------------------------- | ---------------------------------------------------------------: |
| Name                         |                                  OFFICIAL classified information |
| Description                  |        Information containing the OFFICIAL classification marker |
| **Pattern #1**               |                                                                  |
| - Confidence level           |                                                Medium confidence |
| - Primary element            |                                               Regular expression |
| - ID                         |                                                         OFFICIAL |
| - Regular expression         |                     `\b(?<!UN)OFFICIAL\b(?!( \|:\|: )Sensitive)` |
|                              |                                                     String match |
| - Character proximity        | Detect primary AND supporting elements within **300** characters |
| Recommended confidence level |                                          Medium confidence level |

#### OFFICIAL (paragraph)

| Item                         |                                                               Value |
| ---------------------------- | ------------------------------------------------------------------: |
| Name                         |                         OFFICIAL classified information (paragraph) |
| Description                  | Information containing the OFFICIAL classification paragraph marker |
| **Pattern #1**               |                                                                     |
| - Confidence level           |                                                   Medium confidence |
| - Primary element            |                                                  Regular expression |
| - ID                         |                                                  OFFICIAL paragraph |
| - Regular expression         |                                                             `\(O\)` |
|                              |                                                        String match |
| - Character proximity        |    Detect primary AND supporting elements within **300** characters |
| Recommended confidence level |                                             Medium confidence level |

#### OFFICIAL: Sensitive

| Item                         |                                                                                                                                                                                   Value |
| ---------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| Name                         |                                                                                                                                              OFFICIAL: Sensitive classified information |
| Description                  |                                                                                                                    Information containing the OFFICIAL: Sensitive classification marker |
| **Pattern #1**               |                                                                                                                                                                                         |
| - Confidence level           |                                                                                                                                                                       Medium confidence |
| - Primary element            |                                                                                                                                                                      Regular expression |
| - ID                         |                                                                                                                                                                      OFFICIAL Sensitive |
| - Regular expression         | `\bOFFICIAL( \|:\|: )Sensitive(?!(\s\|\/\/\| \/\/ \|, )(\bNATIONAL( \|-)CABINET\b\|[P,p]ersonal( \|-)[P,p]rivacy\|\b[L,l]egal( \|-)[P,p]rivilege\b\|[L,l]egislative( \|-)[S,s]ecrecy))` |
|                              |                                                                                                                                                                            String match |
| - Character proximity        |                                                                                                                        Detect primary AND supporting elements within **300** characters |
| Recommended confidence level |                                                                                                                                                                 Medium confidence level |

#### OFFICIAL: Sensitive (paragraph)

| Item                         |                                                                          Value |
| ---------------------------- | -----------------------------------------------------------------------------: |
| Name                         |                         OFFICIAL: Sensitive classified information (paragraph) |
| Description                  | Information containing the OFFICIAL: Sensitive classification paragraph marker |
| **Pattern #1**               |                                                                                |
| - Confidence level           |                                                              Medium confidence |
| - Primary element            |                                                             Regular expression |
| - ID                         |                                                   OFFICIAL Sensitive paragraph |
| - Regular expression         |                                                                      `\(O:S\)` |
|                              |                                                                   String match |
| - Character proximity        |               Detect primary AND supporting elements within **300** characters |
| Recommended confidence level |                                                        Medium confidence level |

#### OFFICIAL: Sensitive Personal Privacy

| Item                         |                                                                                 Value |
| ---------------------------- | ------------------------------------------------------------------------------------: |
| Name                         |                           OFFICIAL: Sensitive Personal Privacy classified information |
| Description                  | Information containing the OFFICIAL: Sensitive Personal Privacy classification marker |
| **Pattern #1**               |                                                                                       |
| - Confidence level           |                                                                     Medium confidence |
| - Primary element            |                                                                    Regular expression |
| - ID                         |                                                                                 OS PP |
| - Regular expression         |    `\bOFFICIAL( \|:\|: )Sensitive(\s\|\/\/\| \/\/ \|, )[P,p]ersonal( \|-)[P,p]rivacy` |
|                              |                                                                          String match |
| - Character proximity        |                      Detect primary AND supporting elements within **300** characters |
| Recommended confidence level |                                                               Medium confidence level |

#### OFFICIAL: Sensitive Legal Privilege

| Item                         |                                                                                Value |
| ---------------------------- | -----------------------------------------------------------------------------------: |
| Name                         |                           OFFICIAL: Sensitive Legal Privilege classified information |
| Description                  | Information containing the OFFICIAL: Sensitive Legal Privilege classification marker |
| **Pattern #1**               |                                                                                      |
| - Confidence level           |                                                                    Medium confidence |
| - Primary element            |                                                                   Regular expression |
| - ID                         |                                                                                OS LP |
| - Regular expression         |  `\bOFFICIAL( \|:\|: )Sensitive(\s\|\/\/\| \/\/ \|, )[L,l]egal( \|-)[P,p]rivilege\b` |
|                              |                                                                         String match |
| - Character proximity        |                     Detect primary AND supporting elements within **300** characters |
| Recommended confidence level |                                                              Medium confidence level |

#### OFFICIAL: Sensitive Legislative Secrecy

| Item                         |                                                                                    Value |
| ---------------------------- | ---------------------------------------------------------------------------------------: |
| Name                         |                           OFFICIAL: Sensitive Legislative Secrecy classified information |
| Description                  | Information containing the OFFICIAL: Sensitive Legislative Secrecy classification marker |
| **Pattern #1**               |                                                                                          |
| - Confidence level           |                                                                        Medium confidence |
| - Primary element            |                                                                       Regular expression |
| - ID                         |                                                                                    OS LS |
| - Regular expression         |    `\bOFFICIAL( \|:\|: )Sensitive(\s\|\/\/\| \/\/ \|, )[L,l]egislative( \|-)[S,s]ecrecy` |
|                              |                                                                             String match |
| - Character proximity        |                         Detect primary AND supporting elements within **300** characters |
| Recommended confidence level |                                                                  Medium confidence level |

#### OFFICIAL: Sensitive NATIONAL CABINET

| Item                         |                                                                                                                                                                                                       Value |
| ---------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| Name                         |                                                                                                                                                 OFFICIAL: Sensitive NATIONAL CABINET classified information |
| Description                  |                                                                                                                       Information containing the OFFICIAL: Sensitive NATIONAL CABINET classification marker |
| **Pattern #1**               |                                                                                                                                                                                                             |
| - Confidence level           |                                                                                                                                                                                           Medium confidence |
| - Primary element            |                                                                                                                                                                                          Regular expression |
| - ID                         |                                                                                                                                                                                                       OS NC |
| - Regular expression         | `\bOFFICIAL( \|:\|: )Sensitive(\s\|\/\/\| \/\/ \|, )\bNATIONAL( \|-)CABINET\b(?!(\s\|\/\/\| \/\/ \|, )([P,p]ersonal( \|-)[P,p]rivacy\|\b[L,l]egal( \|-)[P,p]rivilege\b\|[L,l]egislative( \|-)[S,s]ecrecy))` |
|                              |                                                                                                                                                                                                String match |
| - Character proximity        |                                                                                                                                            Detect primary AND supporting elements within **300** characters |
| Recommended confidence level |                                                                                                                                                                                     Medium confidence level |

#### OFFICIAL: Sensitive NATIONAL CABINET Personal Privacy

| Item                         |                                                                                                                             Value |
| ---------------------------- | --------------------------------------------------------------------------------------------------------------------------------: |
| Name                         |                                                                    OFFICIAL: Sensitive NATIONAL CABINET PP classified information |
| Description                  |     Information containing the OFFICIAL: Sensitive NATIONAL CABINET Personal Privacy classified information classification marker |
| **Pattern #1**               |                                                                                                                                   |
| - Confidence level           |                                                                                                                 Medium confidence |
| - Primary element            |                                                                                                                Regular expression |
| - ID                         |                                                                                                                          OS NC PP |
| - Regular expression         | `\bOFFICIAL( \|:\|: )Sensitive(\s\|\/\/\| \/\/ \|, )\bNATIONAL( \|-)CABINET\b(\s\|\/\/\| \/\/ \|, )[P,p]ersonal( \|-)[P,p]rivacy` |
|                              |                                                                                                                      String match |
| - Character proximity        |                                                                  Detect primary AND supporting elements within **300** characters |
| Recommended confidence level |                                                                                                           Medium confidence level |

#### OFFICIAL: Sensitive NATIONAL CABINET Legal Privilege

| Item                         |                                                                                                                                Value |
| ---------------------------- | -----------------------------------------------------------------------------------------------------------------------------------: |
| Name                         |                                                                       OFFICIAL: Sensitive NATIONAL CABINET LP classified information |
| Description                  |                                Information containing the OFFICIAL: Sensitive NATIONAL CABINET Legal Privilege classification marker |
| **Pattern #1**               |                                                                                                                                      |
| - Confidence level           |                                                                                                                    Medium confidence |
| - Primary element            |                                                                                                                   Regular expression |
| - ID                         |                                                                                                                             OS NC LP |
| - Regular expression         | `\bOFFICIAL( \|:\|: )Sensitive(\s\|\/\/\| \/\/ \|, )\bNATIONAL( \|-)CABINET\b(\s\|\/\/\| \/\/ \|, )\b[L,l]egal( \|-)[P,p]rivilege\b` |
|                              |                                                                                                                         String match |
| - Character proximity        |                                                                     Detect primary AND supporting elements within **300** characters |
| Recommended confidence level |                                                                                                              Medium confidence level |

#### OFFICIAL: Sensitive NATIONAL CABINET Legislative Secrecy

| Item                         |                                                                                                                                Value |
| ---------------------------- | -----------------------------------------------------------------------------------------------------------------------------------: |
| Name                         |                                                                       OFFICIAL: Sensitive NATIONAL CABINET LS classified information |
| Description                  |                            Information containing the OFFICIAL: Sensitive NATIONAL CABINET Legislative Secrecy classification marker |
| **Pattern #1**               |                                                                                                                                      |
| - Confidence level           |                                                                                                                    Medium confidence |
| - Primary element            |                                                                                                                   Regular expression |
| - ID                         |                                                                                                                             OS NC LS |
| - Regular expression         | `\bOFFICIAL( \|:\|: )Sensitive(\s\|\/\/\| \/\/ \|, )\bNATIONAL( \|-)CABINET\b(\s\|\/\/\| \/\/ \|, )[L,l]egislative( \|-)[S,s]ecrecy` |
|                              |                                                                                                                         String match |
| - Character proximity        |                                                                     Detect primary AND supporting elements within **300** characters |
| Recommended confidence level |                                                                                                              Medium confidence level |

#### PROTECTED

| Item                         |                                                                                                                                                                            Value |
| ---------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| Name                         |                                                                                                                                                 PROTECTED classified information |
| Description                  |                                                                                                                       Information containing the PROTECTED classification marker |
| **Pattern #1**               |                                                                                                                                                                                  |
| - Confidence level           |                                                                                                                                                                Medium confidence |
| - Primary element            |                                                                                                                                                               Regular expression |
| - ID                         |                                                                                                                                                                        PROTECTED |
| - Regular expression         | `\bPROTECTED(?!(\s\|\/\/\| \/\/ \|, )(CABINET\b\|\bNATIONAL( \|-)CABINET\b\|[P,p]ersonal( \|-)[P,p]rivacy\|\b[L,l]egal( \|-)[P,p]rivilege\b\|[L,l]egislative( \|-)[S,s]ecrecy))` |
|                              |                                                                                                                                                                     String match |
| - Character proximity        |                                                                                                                 Detect primary AND supporting elements within **300** characters |
| Recommended confidence level |                                                                                                                                                          Medium confidence level |

#### PROTECTED (paragraph)

| Item                         |                                                                Value |
| ---------------------------- | -------------------------------------------------------------------: |
| Name                         |                         PROTECTED classified information (paragraph) |
| Description                  | Information containing the PROTECTED classification paragraph marker |
| **Pattern #1**               |                                                                      |
| - Confidence level           |                                                    Medium confidence |
| - Primary element            |                                                   Regular expression |
| - ID                         |                                                  PROTECTED paragraph |
| - Regular expression         |                                                              `\(P\)` |
|                              |                                                         String match |
| - Character proximity        |     Detect primary AND supporting elements within **300** characters |
| Recommended confidence level |                                              Medium confidence level |

#### PROTECTED Personal Privacy

| Item                         |                                                                       Value |
| ---------------------------- | --------------------------------------------------------------------------: |
| Name                         |                           PROTECTED Personal Privacy classified information |
| Description                  | Information containing the PROTECTED Personal Privacy classification marker |
| **Pattern #1**               |                                                                             |
| - Confidence level           |                                                           Medium confidence |
| - Primary element            |                                                          Regular expression |
| - ID                         |                                                                        P PP |
| - Regular expression         |            `\bPROTECTED(\s\|\/\/\| \/\/ \|, )[P,p]ersonal( \|-)[P,p]rivacy` |
|                              |                                                                String match |
| - Character proximity        |            Detect primary AND supporting elements within **300** characters |
| Recommended confidence level |                                                     Medium confidence level |

#### PROTECTED Legal Privilege

| Item                         |                                                                      Value |
| ---------------------------- | -------------------------------------------------------------------------: |
| Name                         |                           PROTECTED Legal Privilege classified information |
| Description                  | Information containing the PROTECTED Legal Privilege classification marker |
| **Pattern #1**               |                                                                            |
| - Confidence level           |                                                          Medium confidence |
| - Primary element            |                                                         Regular expression |
| - ID                         |                                                                       P LP |
| - Regular expression         |          `\bPROTECTED(\s\|\/\/\| \/\/ \|, )[L,l]egal( \|-)[P,p]rivilege\b` |
|                              |                                                               String match |
| - Character proximity        |           Detect primary AND supporting elements within **300** characters |
| Recommended confidence level |                                                    Medium confidence level |

#### PROTECTED Legislative Secrecy

| Item                         |                                                                          Value |
| ---------------------------- | -----------------------------------------------------------------------------: |
| Name                         |                           PROTECTED Legislative Secrecy classified information |
| Description                  | Information containing the PROTECTED Legislative Secrecy classification marker |
| **Pattern #1**               |                                                                                |
| - Confidence level           |                                                              Medium confidence |
| - Primary element            |                                                             Regular expression |
| - ID                         |                                                                           P LS |
| - Regular expression         |            `\bPROTECTED(\s\|\/\/\| \/\/ \|, )[L,l]egislative( \|-)[S,s]ecrecy` |
|                              |                                                                   String match |
| - Character proximity        |               Detect primary AND supporting elements within **300** characters |
| Recommended confidence level |                                                        Medium confidence level |

#### PROTECTED NATIONAL CABINET

| Item                         |                                                                                                                                                                                     Value |
| ---------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| Name                         |                                                                                                                                         PROTECTED NATIONAL CABINET classified information |
| Description                  |                                                                                                               Information containing the PROTECTED NATIONAL CABINET classification marker |
| **Pattern #1**               |                                                                                                                                                                                           |
| - Confidence level           |                                                                                                                                                                         Medium confidence |
| - Primary element            |                                                                                                                                                                        Regular expression |
| - ID                         |                                                                                                                                                                                      P NC |
| - Regular expression         | `\bPROTECTED(\s\|\/\/\| \/\/ \|, )\bNATIONAL( \|-)CABINET\b(?!(\s\|\/\/\| \/\/ \|, )([P,p]ersonal( \|-)[P,p]rivacy\|\b[L,l]egal( \|-)[P,p]rivilege\b\|[L,l]egislative( \|-)[S,s]ecrecy))` |
|                              |                                                                                                                                                                              String match |
| - Character proximity        |                                                                                                                          Detect primary AND supporting elements within **300** characters |
| Recommended confidence level |                                                                                                                                                                   Medium confidence level |

#### PROTECTED NATIONAL CABINET Personal Privacy

| Item                         |                                                                                                           Value |
| ---------------------------- | --------------------------------------------------------------------------------------------------------------: |
| Name                         |                                                            PROTECTED NATIONAL CABINET PP classified information |
| Description                  |                    Information containing the PROTECTED NATIONAL CABINET Personal Privacy classification marker |
| **Pattern #1**               |                                                                                                                 |
| - Confidence level           |                                                                                               Medium confidence |
| - Primary element            |                                                                                              Regular expression |
| - ID                         |                                                                                                         P NC PP |
| - Regular expression         | `\bPROTECTED(\s\|\/\/\| \/\/ \|, )\bNATIONAL( \|-)CABINET\b(\s\|\/\/\| \/\/ \|, )[P,p]ersonal( \|-)[P,p]rivacy` |
|                              |                                                                                                    String match |
| - Character proximity        |                                                Detect primary AND supporting elements within **300** characters |
| Recommended confidence level |                                                                                         Medium confidence level |

#### PROTECTED NATIONAL CABINET Legal Privilege

| Item                         |                                                                                                            Value |
| ---------------------------- | ---------------------------------------------------------------------------------------------------------------: |
| Name                         |                                                             PROTECTED NATIONAL CABINET LP classified information |
| Description                  |                      Information containing the PROTECTED NATIONAL CABINET Legal Privilege classification marker |
| **Pattern #1**               |                                                                                                                  |
| - Confidence level           |                                                                                                Medium confidence |
| - Primary element            |                                                                                               Regular expression |
| - ID                         |                                                                                                          P NC LP |
| - Regular expression         | `\bPROTECTED(\s\|\/\/\| \/\/ \|, )\bNATIONAL( \|-)CABINET\b(\s\|\/\/\| \/\/ \|, )[L,l]egal( \|-)[P,p]rivilege\b` |
|                              |                                                                                                     String match |
| - Character proximity        |                                                 Detect primary AND supporting elements within **300** characters |
| Recommended confidence level |                                                                                          Medium confidence level |

#### PROTECTED NATIONAL CABINET Legislative Secrecy

| Item                         |                                                                                                              Value |
| ---------------------------- | -----------------------------------------------------------------------------------------------------------------: |
| Name                         |                                                               PROTECTED NATIONAL CABINET LS classified information |
| Description                  |                    Information containing the PROTECTED NATIONAL CABINET Legislative Secrecy classification marker |
| **Pattern #1**               |                                                                                                                    |
| - Confidence level           |                                                                                                  Medium confidence |
| - Primary element            |                                                                                                 Regular expression |
| - ID                         |                                                                                                            P NC LS |
| - Regular expression         | `\bPROTECTED(\s\|\/\/\| \/\/ \|, )\bNATIONAL( \|-)CABINET\b(\s\|\/\/\| \/\/ \|, )[L,l]egislative( \|-)[S,s]ecrecy` |
|                              |                                                                                                       String match |
| - Character proximity        |                                                   Detect primary AND supporting elements within **300** characters |
| Recommended confidence level |                                                                                            Medium confidence level |

#### PROTECTED CABINET

| Item                         |                                                                                                                                                                     Value |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| Name                         |                                                                                                                                  PROTECTED CABINET classified information |
| Description                  |                                                                                                        Information containing the PROTECTED CABINET classification marker |
| **Pattern #1**               |                                                                                                                                                                           |
| - Confidence level           |                                                                                                                                                         Medium confidence |
| - Primary element            |                                                                                                                                                        Regular expression |
| - ID                         |                                                                                                                                                                       P C |
| - Regular expression         | `\bPROTECTED(\s\|\/\/\| \/\/ \|, )CABINET\b(?!(\s\|\/\/\| \/\/ \|, )([P,p]ersonal( \|-)[P,p]rivacy\|\b[L,l]egal( \|-)[P,p]rivilege\b\|[L,l]egislative( \|-)[S,s]ecrecy))` |
|                              |                                                                                                                                                              String match |
| - Character proximity        |                                                                                                          Detect primary AND supporting elements within **300** characters |
| Recommended confidence level |                                                                                                                                                   Medium confidence level |

#### PROTECTED CABINET Personal Privacy

| Item                         |                                                                                           Value |
| ---------------------------- | ----------------------------------------------------------------------------------------------: |
| Name                         |                                       PROTECTED CABINET Personal Privacy classified information |
| Description                  |             Information containing the PROTECTED CABINET Personal Privacy classification marker |
| **Pattern #1**               |                                                                                                 |
| - Confidence level           |                                                                               Medium confidence |
| - Primary element            |                                                                              Regular expression |
| - ID                         |                                                                                          P C PP |
| - Regular expression         | `\bPROTECTED(\s\|\/\/\| \/\/ \|, )CABINET\b(\s\|\/\/\| \/\/ \|, )[P,p]ersonal( \|-)[P,p]rivacy` |
|                              |                                                                                    String match |
| - Character proximity        |                                Detect primary AND supporting elements within **300** characters |
| Recommended confidence level |                                                                         Medium confidence level |

#### PROTECTED CABINET Legal Privilege

| Item                         |                                                                                            Value |
| ---------------------------- | -----------------------------------------------------------------------------------------------: |
| Name                         |                                         PROTECTED CABINET Legal Privilege classified information |
| Description                  |               Information containing the PROTECTED CABINET Legal Privilege classification marker |
| **Pattern #1**               |                                                                                                  |
| - Confidence level           |                                                                                Medium confidence |
| - Primary element            |                                                                               Regular expression |
| - ID                         |                                                                                           P C LP |
| - Regular expression         | `\bPROTECTED(\s\|\/\/\| \/\/ \|, )CABINET\b(\s\|\/\/\| \/\/ \|, )[L,l]egal( \|-)[P,p]rivilege\b` |
|                              |                                                                                     String match |
| - Character proximity        |                                 Detect primary AND supporting elements within **300** characters |
| Recommended confidence level |                                                                          Medium confidence level |

#### PROTECTED CABINET Legislative Secrecy

| Item                         |                                                                                              Value |
| ---------------------------- | -------------------------------------------------------------------------------------------------: |
| Name                         |                                       PROTECTED CABINET Legislative Secrecy classified information |
| Description                  |             Information containing the PROTECTED CABINET Legislative Secrecy classification marker |
| **Pattern #1**               |                                                                                                    |
| - Confidence level           |                                                                                  Medium confidence |
| - Primary element            |                                                                                 Regular expression |
| - ID                         |                                                                                             P C LS |
| - Regular expression         | `\bPROTECTED(\s\|\/\/\| \/\/ \|, )CABINET\b(\s\|\/\/\| \/\/ \|, )[L,l]egislative( \|-)[S,s]ecrecy` |
|                              |                                                                                       String match |
| - Character proximity        |                                   Detect primary AND supporting elements within **300** characters |
| Recommended confidence level |                                                                            Medium confidence level |

{{% alert title="Note" color="info" %}}

The following sensitivity info types are used for detecting content not appropriate for processing or storage within the Microsoft 365 tenant.

{{% /alert %}}

#### SECRET

| Item                         |                                                            Value |
| ---------------------------- | ---------------------------------------------------------------: |
| Name                         |                                    SECRET classified information |
| Description                  |          Information containing the SECRET classification marker |
| **Pattern #1**               |                                                                  |
| - Confidence level           |                                                Medium confidence |
| - Primary element            |                                               Regular expression |
| - ID                         |                                                           SECRET |
| - Regular expression         |                                            `\b(?<!TOP )SECRET\b` |
|                              |                                                     String match |
| - Character proximity        | Detect primary AND supporting elements within **300** characters |
| Recommended confidence level |                                          Medium confidence level |

#### SECRET (paragraph)

| Item                         |                                                             Value |
| ---------------------------- | ----------------------------------------------------------------: |
| Name                         |                         SECRET classified information (paragraph) |
| Description                  | Information containing the SECRET classification paragraph marker |
| **Pattern #1**               |                                                                   |
| - Confidence level           |                                                 Medium confidence |
| - Primary element            |                                                Regular expression |
| - ID                         |                                                  SECRET paragraph |
| - Regular expression         |                                                           `\(S\)` |
|                              |                                                      String match |
| - Character proximity        |  Detect primary AND supporting elements within **300** characters |
| Recommended confidence level |                                           Medium confidence level |

#### TOP SECRET

| Item                         |                                                            Value |
| ---------------------------- | ---------------------------------------------------------------: |
| Name                         |                                TOP SECRET classified information |
| Description                  |      Information containing the TOP SECRET classification marker |
| **Pattern #1**               |                                                                  |
| - Confidence level           |                                                Medium confidence |
| - Primary element            |                                               Regular expression |
| - ID                         |                                                       TOP SECRET |
| - Regular expression         |                                                 `\bTOP SECRET\b` |
|                              |                                                     String match |
| - Character proximity        | Detect primary AND supporting elements within **300** characters |
| Recommended confidence level |                                          Medium confidence level |

#### TOP SECRET (paragraph)

| Item                         |                                                                 Value |
| ---------------------------- | --------------------------------------------------------------------: |
| Name                         |                         TOP SECRET classified information (paragraph) |
| Description                  | Information containing the TOP SECRET classification paragraph marker |
| **Pattern #1**               |                                                                       |
| - Confidence level           |                                                     Medium confidence |
| - Primary element            |                                                    Regular expression |
| - ID                         |                                                  TOP SECRET paragraph |
| - Regular expression         |                                                              `\(TS\)` |
|                              |                                                          String match |
| - Character proximity        |      Detect primary AND supporting elements within **300** characters |
| Recommended confidence level |                                               Medium confidence level |

### Related information

#### Security & Governance

- [Guidelines for email]({{<ref "content\en\security-and-governance\system-security-plan\email.md">}})

#### Design

- [Labelling and classification]({{<ref "design/shared-services/purview/labelling-and-classification">}})

#### Configuration

- None identified

#### References

- [Australian Government Protective Security Policy Framework (PSPF)](https://www.protectivesecurity.gov.au/pspf-annual-release)
- [Learn about sensitive information types](https://learn.microsoft.com/purview/sensitive-information-type-learn-about)
