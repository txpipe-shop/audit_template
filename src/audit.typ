#import "templates/report.typ": *

// the following shell command can be used to build this table:
// find . -type f -name "*.ak" -exec sh -c 'for file; do sha256sum "$file"; done' sh {} + | awk '{printf "( \"%s\", \"%s\" ),\n", $2, $1}'
#let audited_files = (
  ("path/to/file", "hash"),
)

#show: report.with(
  client: "[CLIENT]",
  title: "[TITLE]",
  // date: "[DATE]", // Default: Today.
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
// i.e., this is the commit hash resulting from all resolutions, if any.

#files_audited(
  items: audited_files.map(t => t.first())
)

#pagebreak()

= Specification

== UTxOs

// - Use singular "UTxO" for singletons: UTxO types that are designed to have
//   only one instance sitting at an address.
//   Example: "Protocol Settings UTxO"
// - Use plural "UTxOs" for UTxO types that are designed to have multiple
//   instances.
//   Example: "Order UTxOs"

=== Example UTxO/s

_Briefly explain here the purpose of the UTxO/s._

- Address:
  - Parameters: ...
- Value:
  - ADA:
  - Asset A: _(policy and token name)_
  - ...
- Datum: _(datum type and fields)_

== Assets

== Transactions

The purpose of the transaction diagrams that follow is to outline the key
aspects of each operation in the protocol.
To provide a clearer presentation, we omit details such as the minimum ADA
required in each UTxO, transaction fees, the sources of that ADA, etc.

=== Example transaction

_Briefly explain here the purpose of the transaction._

See @fig:example for an example transaction diagram.

#let example_transaction = vanilla_transaction(
  "Example Tx",
  mint: (
    "Example1 NFT": 1,
    "Example2 NFT": -1,
    "Example3 FT": "N",
    "Example4 FT": [_N_],
  ),
  withdrawals: (
    "withdrawal_addr1",
    "withdrawal_addr2",
  ),
  inputs: (
    (
      name: "Input 1",
      address: "example_addr1",
      value: (
        "ADA": "N",
      ),
      datum: (
        field0: "",  // no value or type
        field1: "Type",
        field2: [*value*],
        field3: 42,  // integer value
        field4: [],  // also no value or type
        field5: (
          subfield1: "SubType",
          subfield2: [*subvalue*],
        ),
        "...": [],  // ellipsis if needed
      ),
    ),
    (
      reference: true,
      name: "Ref. Input 1",
      address: "example_addr2",
      value: (
        "Ref. Input NFT": 1,
      ),
      datum: (
        field1: "Type",
        field2: [*value*],
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
        field0: "",  // no value or type
        field1: "Type",
        field2: [*value*],
      ),
    ),
  ),
  notes: [
    - note 1
    - note 2
  ],
)

#figure(
  example_transaction,
  caption: [
    Example transaction
  ]
) <fig:example>


#pagebreak()

= Findings
#v(1em)
#findings(items: (
  (
    id: [XXX-NNN],         // first digit corresponds to severity (see below)
    title: [Finding title],// diagnosis: write it as a fact about the
                           // current version of the code. Do not write it
                           // as a recommendation
    severity: "Critical",  // Critical (0), Major (1), Minor (2), Info (3)
    status: "Resolved",    // Resolved, Acknowledged, Identified
    category: "Bug",       // Bug, Redundancy, Optimization, Robustness, etc.
    commit: "",            // commit hash at which it was arranged to perform
                           // the audit. If the codebase is updated, a new
                           // milestone commit hash must be agreed upon. Later
                           // findings use the new commit hash.
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
