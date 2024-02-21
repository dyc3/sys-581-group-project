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
	- The key to developing anything is communication. To develop and establish a colony on Mars, commuication will have to happen internally and externally.
	- Communications must be reliable and scalable in order to establish and maintain the quality and integrity of the communications system.
]

#polylux-slide[
	#slidehead([= Stakeholders])

	#only(1)[
		*Nasa Command Center*
	  - Be able to send and receive messages reliably.
		- Solution must be compatible with existing infrastructure and try to minimize budget.
		- Must have secure communication channels to prevent unauthorized access.
		- Control unmanned missions reliably and monitor systems on Mars.
		- Should support text, image, and video.
	]

	#only(2)[
		*Colonists*
		- Be able to send and receive messages reliably.
		- Be able to communicate with mission command to ask about issues or give status reports.
		- Have personal access to stay in touch with family on Earth.
	]
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
		- Utilize Mars Relay Network as first nodes in system
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

#polylux-slide[
	#slidehead([= System Concept])
	Queue based message passing system

	#only(1)[
		- "Slow Internet"
		- Messages are stored in a queue until next hop is available
		- Nodes can be added or removed from network, routing is dynamic
		- Utilize existing NASA Deep Space Network for sending signals and Mars Relay Network to receive.
	]
	#only(2)[
		#set text(size: 18pt)
		#grid(
			columns: (auto, auto, auto, auto),
			figure(
				image("figures/storyboard/step1.png"),
				caption: [Mission Control queues a message to Mars]
			),
			figure(
				image("figures/storyboard/step2.png"),
				caption: [Relay becomes available, and the queues are flushed]
			),
			figure(
				image("figures/storyboard/step3.png"),
				caption: [Message transmitted to Mars Relay]
			),
			figure(
				image("figures/storyboard/step4.png"),
				caption: [Colony comes in range, and the message is delivered]
			),
		)
	]
]

#polylux-slide[
	#slidehead([= How It Fits In])

	- Will use electricity from the power subsystem
	- Provides the networking infrastructure to by used as a backbone for other systems
]

#polylux-slide[
	#slidehead([= Key Specifications])

	- Guaranteed delivery of messages
	- Resilient to data corruption and loss
	- Graceful handling of transmission windows and occlusions
]

#polylux-slide[
	#set align(horizon)
	#set text(size: 40pt)

	#slidehead([= Thank You])
]
