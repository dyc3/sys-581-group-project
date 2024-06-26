#import "metadata.typ": *
#set document(
	title: "Mars Colony Mission: Communication, Command, and Control System",
	author: authors.map(author => author.name),
)

#import "lib/glossary.typ": glossary, glossaryWords, glossaryShow
#show glossaryWords("glossary.yml"): word => glossaryShow("glossary.yml", word)
#metadata("!glossary:disable")

#include "cover.typ"

#set heading(numbering: "1.")
#set page(numbering: "1")

#metadata("!glossary:enable")
#include "abstract.typ"
#pagebreak()
#metadata("!glossary:disable")
#outline(
	indent: auto,
)
#pagebreak()
#metadata("!glossary:enable")

#include "intro.typ"
#pagebreak()
#include "problem-definition.typ"
#pagebreak()
#include "functional-breakdown.typ"
#pagebreak()
#include "system-concept.typ"
#pagebreak()
#include "major-subsystems.typ"
#pagebreak()
#include "integration-testing.typ"
#pagebreak()
#include "system-robustness.typ"
#pagebreak()

#metadata("!glossary:disable")
#glossary("glossary.yml")
#pagebreak()
#include "index.typ"
#pagebreak()
#bibliography(
	"bibfile.bib",
	title: "References",
)
