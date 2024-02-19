#import "@preview/polylux:0.3.1": *
// Docs for polylux: https://polylux.dev/book/polylux.html
#import "metadata.typ": *
#import "slides/lib.typ": *

#set page(
	paper: "presentation-16-9",
	margin: 1cm,
	fill: black
)
#set text(
	size: 24pt,
	font: "Kode Mono",
	fill: white
)
#show heading: set text(font: "Aquire")

#polylux-slide[
	#set align(horizon + center)

	= Mars Colonization Project Proposal
	== C3 Subsystem

	#authors.map(x => x.name).join(", ")
]

#polylux-slide[
	#slidehead([= Executive Summary])

	- Mars is the closest planet to Earth that can potentially support human life
	- Communication between Earth and Mars is crucial for the success of the Mars Colonization Project
]

#polylux-slide[
	#slidehead([= Operational Needs to be Addressed])

]

#polylux-slide[
	#slidehead([= Stakeholders])

]

#polylux-slide[
	#slidehead([= Key Features])

	#only(1)[
		*Extentability*
		- Platform for solar system scale communications
		- Interoperability with existing communication systems (eg. traditional computer networks)
		- Modularity: new nodes in the network can be added with minimal effort

		*Built on established standards and technology*
		- Based on decades of experience with computer networks and the internet
	]
	#only(2)[
		*Future Proof*
		- Scalable to support additional planets, moons, stations throughout the solar system
		- Versioned protocols to allow for future innovation and improvement
		- Encrypted to protect user privacy and against future threats

		*High Throughput*
		- Support for high throughput non-realtime data transfer
		  - High quality images, video, scientific data
	]
]


