= Major Subsystems

== Linking Subsystems to Functions

As specified in @Section::top-level-functions, the C3 system has to perform three main functions in order to accomplish the mission. These are delivering messages between Earth and Mars, commanding manned and unmanned missions from Earth, and allowing for interpersonal communication on the colony.

To accomplish this, we have devised four major subsystems that work together to achieve these functions. These subsystems are the High Throughput Message Queue (HTMQ), the Data Streaming Protocol (DSP), the Short Range Radio (SRR), and the Internet Protocol (IP) network. Each of these subsystems has a specific role to play in the overall system, and they work together to ensure that the C3 system can meet the needs of the Mars colony.

#figure(
	table(
		columns: 3,
		[Subsystem], [Purpose], [Top Level Function],
		[HTMQ], [Allows messages to be sent across the solar system within range of the satellite network], [Deliver messages between Earth and Mars],
		[DSP], [Manages the metrics and commands sent between Earth and Mars], [Command manned and unmanned missions from Earth],
		[IP Network], [Provides a means for colonists to communicate with each other and interact with the HTMQ], [Allow for interpersonal communication on the colony],
		[SRR], [Allows colonists to communicate with each other and with the colony], [Allow for interpersonal communication on the colony],
	),
	caption: [Subsystems to Functions],
) <Table::subsystems-to-functions>

== Key Subsystems Interfaces

Each subsystem has a very specific role to play as outlined above. However, for this system to work effectively, they must be able to communicate with each other.

The HTMQ has the Dispatcher to interface with services on the IP Network. It will also have internal interfaces to determine the best route and time to send messages to Earth.

The DSP will have internal interfaces with other subsystems to receive commands from Earth, send data to Earth, and pass information/metrics along the satellite chain. It will have external interfaces to allow people to upload commands to the subsystem.

The IP Network will have internal interfaces to receive messages from the HTMQ and send them to services. It will also have internal interfaces to receive messages from other subsystems like the SRR and send them to the HTMQ. It will have external interfaces to allow colonists to connect to the network and use it for transmission.

The SRR will have internal interfaces to store communication logs and send messages to the IP Network. It will have external interfaces to allow colonists to connect to the network and use it for transmission.


== Design Tradeoffs

A big limiting factor is cost. Everything sent to the colony is extremely expensive due to sheer cost of delivering it. This means we have to be very selective on which subsystems we physically set up on Mars and which satellite systems we use.

As a result, we are prioritizing reuse of existing NASA technology such as the Deep Space Network and the Mars Reconnaissance Orbiter. This will allow us to leverage existing infrastructure and reduce the cost of the mission. These systems are already in place and have been tested in space, so we can be confident in their reliability while utilizing them as the foundation for subsystems like the HTMQ.

It would be ideal to create completely novel solutions for each subsystem, but the cost and lower reliability of such subsystems make them impossible and dangerous. In the detailed subsystem explanations, we explain how reuse of existing technologies will be used to create an overall reliable and cost-effective system, all while not breaking the bank.

#[
	#set heading(offset: 1)

	#include "subsys-htmq.typ"
	#include "subsys-dsp.typ"
	#include "subsys-srr.typ"
]

