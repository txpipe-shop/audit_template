#import "templates/report.typ": *

// the following shell command can be used to build this table:
// find . -type f -name "*.ak" -exec sh -c 'for file; do sha256sum "$file"; done' sh {} + | awk '{printf "( \"%s\", \"%s\" ),\n", $2, $1}'
#let audited_files = (
  ("path/to/file", "hash"),
)

#show: report.with(
  client: "XXXXX",
  title: "XXXXX",
  // date: "XXXXX", // Default: Today.
  audited_files: audited_files,
)

= Summary
#v(1em)
#lorem(50)
#v(1em)

== Overview
#v(1em)
#lorem(50)
#v(1em)

== Process
#v(1em)
#lorem(50)
#pagebreak()

=== Audited Files
#v(1em)

Below is a list of all audited files in this report.
Any files *not* listed here were *not* audited.
The final state of the files for the purposes of this report is considered to be commit `XXXX`.

#files_audited(
  items: audited_files.map(t => t.first())
)

#pagebreak()

= Specification

== UTxOs

== Assets

== Transactions

The purpose of the transaction diagrams that follow is to outline the key
aspects of each operation in the protocol.
To provide a clearer presentation, we omit details such as the minimum ADA
required in each UTxO, transaction fees, the sources of that ADA, etc.

=== Example transaction

#let example_transaction = vanilla_transaction(
  "Example Tx",
  mint: (
    "Example NFT": (qty: 0, variables: ("1": 1)),
  ),
  inputs: (
    (
      name: "Input 1",
      address: "example_addr",
      value: (
        "ADA": "N",
      ),
      datum: (
        field1: [Type],
        field2: "Value",
      ),
    ),
  ),
  outputs: (
    (
      name: "Output 1",
      address: "example_addr",
      value: (
        "ADA": "N",
      ),
      datum: (
        field1: [Type],
        field2: "Value",
      ),
    ),
  ),
)

#figure(
  example_transaction,
  caption: [
    Example transaction
  ],
  gap: 1.5em
)


#pagebreak()

= Findings
#v(1em)
#findings(items: (
  (
    id: [XXX],             // first digit corresponds to severity (see below)
    title: [XXXXXXX],      // diagnosis: write it as a fact about the 
                           // current version of the code. Do not write it
                           // as a recommendation
    severity: "Critical",  // Critical (0), Major (1), Minor (2), Info (3)
    status: "Resolved",    // Resolved, Acknowledged, Identified
    category: "Bug",       // Bug, Redundancy, Optimization, Robustness, etc.
    commit: "",
    description: [
      XXXXXXX
    ],
    recommendation: [
      XXXXXXX
    ],
    resolution: [
      Resolved in commit `XXXX`.
      // Alternatively:
      // The project team decided not to resolve this ﬁnding.
    ],
  ),
))
