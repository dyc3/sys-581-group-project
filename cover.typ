#import "metadata.typ": authors

#page()[
	#let gray = luma(120)
	#set align(center + horizon)
	#set text(size: 1.5em)
	#heading(outlined: false)[
		#set text(size: 30pt, font: "Aquire")
		Mars Colony Mission
	]
	#heading(outlined: false, level: 2)[
		#set text(style: "italic")
		Communication, Command, and Control System
	]


	#text(style: "italic", fill: gray)[
		SYS 581: Introduction to Systems Engineering
	]

	#grid(
		gutter: 10pt,
		..authors.map(author => [
			#author.name
		])
	)

	#text(size: 0.8em, fill: gray)[
		Document rendered on #datetime.today().display()
		]
]
