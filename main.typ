#import "metadata.typ": *

// import and use whatever document format you want here


#import "lib/glossary.typ": glossary, glossaryWords, glossaryShow
#show glossaryWords("glossary.yml"): word => glossaryShow("glossary.yml", word)
// Index-Entry hiding : this rule makes the index entries in the document invisible.
#show figure.where(kind: "jkrb_index"): it => {}
#metadata("!glossary:disable")

// put outlines, title pages, etc here

#metadata("!glossary:enable")

#include "stakeholders.typ"
#pagebreak()
#include "top-level-functions.typ"
#pagebreak()
#include "system-overview.typ"
#pagebreak()
#include "subsys-htmq.typ"
#pagebreak()

#metadata("!glossary:disable")
#glossary("glossary.yml")
#pagebreak()
#include "index.typ"
#pagebreak()
#bibliography("bibfile.bib")
