#import "templates/report.typ": *

#show: report.with(
  client: "XXXXX",
  title: "XXXXX",
  repo: "XXXXX",
  date: "XXXXX",
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

=== Files Audited
#v(1em)

Below is a list of all files audited in this report, any files *not* listed here were *not* audited.
The final state of the files for the purposes of this report is considered to be commit `XXXX`.

#files_audited(
  items: (
    "XXXX",
  ) 
)

#pagebreak()

= Findings
#v(1em)
#findings(items: (
  (
    id: [XXX],
    title: [XXXXXXX],
    severity: "Critical",
    status: "Resolved",
    category: "Bug",
    commit: "",
    description: [XXXXXXX],
    recommendation: [XXXXXXX],
    resolution: [Resolved in commit `XXXX`],
  ),
))
