// severity colors
#let critical = rgb("#EB6F92")
#let major = rgb("#EA9A97")
#let minor = rgb("#F6C177")
#let info = rgb("#e0def4")

// status colors
#let resolved = rgb("#73D480")
#let acknowledged = rgb("#F1A03A")
#let identified = rgb("#ED706B")

// other colors
#let table_header = rgb("#E5E5E5")

// table cells
#let cell = rect.with(
    inset: 10pt,
    fill: rgb("#F2F2F2"),
    width: 100%,
    height: 50pt,
    radius: 2pt
)

#let tx_link(url, content) = {
  link(url, underline(text(fill: rgb("#007bff"), content)))
} 

// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let report(
  title: "",
  authors: (),
  date: none,
  repo: "",
  body,
) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set page(fill: rgb("#222222"))
  set text(font: "Linux Libertine", lang: "en", fill: white)
  set heading(numbering: "1.a -")

  // Title page.
  // The page can contain a logo if you pass one with `logo: "logo.png"`.
  v(0.6fr)
  align(right, image("img/txpipe.png", width: 26%))
  v(9.6fr)

  text(1.1em, date)
  v(1.2em, weak: true)
  text(2em, weight: 700, title)

  // Author information.
  pad(
    top: 0.7em,
    right: 20%,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(start, strong(author))),
    ),
  )

  v(2.4fr)
  pagebreak()
  set page(numbering: "1", number-align: center, fill: none)
  set text(fill: black)


  // Table of contents.
  outline(depth: 2, indent: true)
  pagebreak()



  // Main body.
  set par(justify: true)

  body
  
  [
    = Appendix

    #v(1em)

    == Disclaimer

    #v(1em)
    
    This report is governed by the terms in the agreement between TxPipe (*TXPIPE*) and Ape Society (*CLIENT*). This report cannot be shared, referred to, altered, or relied upon by any third party without TXPIP's written consent. This report does not endorse or disapprove any specific project, team, code, technology, asset or similar. It provides no warranty or guarantee about the quality or nature of the technology analyzed.

    *TXPIPE DISCLAIMS ALL WARRANTIES, EXPRESSED OR IMPLIED*, related to this report, its content, and the related services and products. This report is provided as-is. TxPipe does not take responsibility for any product or service advertised or offered by Client or any third party. *TXPIPE IS NOT RESPONSIBLE FOR MONITORING ANY TRANSACTION BETWEEN YOU AND CLIENT AND/OR ANY THIRD-PARTY PROVIDERS OF PRODUCTS OR SERVICES.*

    This report should not be used for making investment or involvement decisions with any project, services or assets. This report provides general information and is not a form of financial, investment, tax, legal, regulatory, or other advice.

    TxPipe created this report as an informational review of the due diligence performed on the Client's smart contract. This report provides no guarantee on the security or operation of the smart contract on deployment or post-deployment. *TXPIPE HAS NO DUTY TO MONITOR CLIENT'S OPERATION OF THE PROJECT AND UPDATE THE REPORT ACCORDINGLY.*

    The information in this report may not cover all vulnerabilities. This report represents an extensive assessment process intended to help increase the quality of the Client's code. However, blockchain technology and cryptographic assets present a high level of ongoing risk, including unknown risks and flaws.

    TxPipe recommends multiple independent audits, a public bug bounty program, and continuous security auditing and monitoring. Errors in the manual review process are possible, and TxPipe advises seeking multiple independent opinions on critical claims. *TXPIPE BELIEVES EACH COMPANY AND INDIVIDUAL IS RESPONSIBLE FOR THEIR OWN DUE DILIGENCE AND CONTINUOUS SECURITY.*

    #pagebreak()
    
    == Issue Guide

    === Severity
    #v(1em)
    
    #grid(
      columns: (20%, 80%),
      gutter: 1pt, 
      cell(fill: table_header, height: auto)[
        #set align(horizon + center)
        *Severity*
      ],
      cell(fill: table_header, height: auto)[
        #set align(horizon + center)
        *Description*
      ],
      cell(fill: critical)[
        #set align(horizon + center)
        Critical
      ],
      cell()[
        #set align(horizon)
        Critical issues highlight exploits, bugs, loss of funds, or other vulnerabilities
        that prevent the dApp from working as intended. These issues have no workaround.
      ],
      cell(fill: major)[
        #set align(horizon + center)
        Major
      ],
      cell()[
        #set align(horizon)
        Major issues highlight exploits, bugs, or other vulnerabilities that cause unexpected
        transaction failures or may be used to trick general users of the dApp. dApps with Major issues
        may still be functional.
        
      ],
      cell(fill: minor)[
        #set align(horizon + center)
        Minor
      ],
      cell()[
        #set align(horizon)
        Minor issues highlight edge cases where a user can purposefully use the dApp
        in a non-incentivized way and often lead to a disadvantage for the user.
      ],
      cell(fill: info)[
        #set align(horizon + center)
        Info
      ],
      cell()[
        #set align(horizon)
        Info are not issues. These are just pieces of information that are beneficial to the dApp creator. These are not necessarily acted on or have a resolution, they are logged for the completeness of the audit. 
      ],
    )

    #v(1em)
    
    === Status
    #v(1em)

    #grid(
      columns: (20%, 80%),
      gutter: 1pt, 
      cell(fill: table_header, height: auto)[
        #set align(horizon + center)
        *Status*
      ],
      cell(fill: table_header, height: auto)[
        #set align(horizon + center)
        *Description*
      ],
      
      cell(fill: resolved)[
        #set align(horizon + center)
        Resolved
      ],
      cell()[
        #set align(horizon)
        Issues that have been *fixed* by the *project* team.
      ],
      cell(fill: acknowledged)[
        #set align(horizon + center)
        Acknowledged
      ],
      cell()[
        #set align(horizon)
        Issues that have been *acknowledged* or *partially fixed* by the *project* team. Projects
        can decide to not *fix* issues for whatever reason.
      ],
      cell(fill: identified)[
        #set align(horizon + center)
        Identified 
      ],
      cell()[
        #set align(horizon)
        Issues that have been *identified* by the *audit* team. These
        are waiting for a response from the *project* team.
      ],
    )

    #pagebreak()
    
    == Revisions
    #v(1em)
    
    This report was created using a git based workflow. All changes are tracked in a github repo and the report is produced
    using #tx_link("https://typst.app")[typst]. The report source is available #tx_link(repo)[here]. All versions with downloadable PDFs can be found on the #tx_link(repo + "/releases")[releases page].

    #v(1em)
    
    == About Us
    #v(1em)

    TxPipe is a blockchain technology company responsible for many projects that are now a critical part
    of the Cardano ecosystem. Our team built #tx_link("https://github.com/oura")[Oura], #tx_link("https://github.com/txpipe/scrolls")[Scrolls], #tx_link("https://github.com/txpipe/pallas")[Pallas], #tx_link("https://demeter.run")[Demeter], and we're the original home of #tx_link("https://aiken-lang.org")[Aiken]. We're passionate
    about making tools that make it easier to build on Cardano. We believe that blockchain adoption can be accelerated by improving developer experience. We develop blockchain tools, leveraging the open-source community and its methodologies.
    
    #v(1em)

    === Links

    #v(1em)

    - #tx_link("https://txpipe.io")[Website]
    - #tx_link("hello@txpipe.io")[Email]
    - #tx_link("https://twitter.com/txpipe_tools")[Twitter]
    
  ]
}

#let files_audited(items: ()) = {
    grid(
        columns: (auto),
        gutter: 1pt,
        cell(fill: rgb("#E5E5E5"), height: auto)[*Filename*],
        ..items.map(
            row => cell(height: auto)[#row]
        )
    )
}

#let titles = ("ID", "Title", "Severity", "Status")

#let finding_titles = ("Category", "Commit", "Severity", "Status")

#let findings(items: ()) = {
  grid(
    columns: (1fr, 46%, 1fr, 1fr),
    gutter: 1pt,
    ..titles.map(t => cell(fill: table_header, height: auto)[
      #set align(horizon + center)
      *#t*
    ]),
    ..items
      .map(
        row => (
          cell()[
            #set align(horizon + center)
            *#row.id*
          ],
          cell()[
            #set align(horizon)
            #row.title
          ],
          cell(
            fill: if row.severity == "Critical" {
              critical
            } else if row.severity == "Major" {
              major
            } else if row.severity == "Minor" {
              minor
            } else {
              info
            }
          )[
            #set align(horizon + center)
            #row.severity
          ],
          cell(
            fill: if row.status == "Resolved" {
              resolved
            } else if row.status == "Acknowledged"  {
              acknowledged
            } else {
              identified
            }
          )[
            #set align(horizon + center)
            #row.status
          ]
        )
      )
      .flatten()
  )

  pagebreak()

  for finding in items {
    [
      = #finding.id #finding.title

      #v(1em)

      #grid(
        columns: (1fr, 46%, 1fr, 1fr),
        gutter: 1pt,
        ..finding_titles.map(t => cell(fill: rgb("#E5E5E5"), height: auto)[
          #set align(horizon + center)
          *#t*
        ]),
        cell(height: auto)[
          #set align(horizon + center)
          #finding.category
        ],
        cell(height: auto)[
          #set align(horizon + center)
          #finding.commit
        ],
        cell(
          height: auto,
          fill: if finding.severity == "Critical" {
            critical
          } else if finding.severity == "Major" {
            major
          } else if finding.severity == "Minor" {
            minor
          } else {
            info
          }
        )[
          #set align(horizon + center)
          #finding.severity
        ],
        cell(
          height: auto,
          fill: if finding.status == "Resolved" {
            resolved
          } else if finding.status == "Acknowledged"  {
            acknowledged
          } else {
            identified
          }
        )[
          #set align(horizon + center)
          #finding.status
        ]
      )

      #v(1em)

      == Description

      #v(1em)

      #finding.description

      #v(1em)

      == Recommendation

      #v(1em)

      #finding.recommendation

      #v(1em)

      == Resolution

      #v(1em)

      #finding.resolution
    ]

    pagebreak()
  }
}