#import "lib/pugh.typ": *

= System Concept

== Evaluation of System Alternatives

At a high level, there are a few different architectures that we could pursue.
+ *Direct Communication*: A direct communication link between Mars and Earth. Both planets would transmit and receive signals directly to each other.
+ *Orbital Message Relays*: Effectively a direct communication link between Mars and Earth. Both planets would transmit and receive signals directly to each other via satellite orbiting their respective planets.
+ *Interplanetary Message Relay Network*: A network of satellites deployed around the solar system to relay messages between planets.
+ *Interplanetary Message Queue Network*: A network of satellites deployed around the solar system to relay messages between planets, but with a message queue system to handle message delivery.

#figure(
	pugh(
		("Direct Communication", "Orbital Message Relays", "Interplanetary Message Relay Network", "Interplanetary Message Queue Network"),
		(
			(criterion: "Message Delivery Reliability", weight: 5),
			(criterion: "Uptime", weight: 3),
			(criterion: "Cost to Deploy", weight: 3),
			(criterion: "Complexity", weight: 2),
			(criterion: "Possible Data Throughput", weight: 5),
		),
		(
			(1, 1, 2, 5),
			(0, 0, 5, 5),
			(5, 4, 2, 2),
			(5, 4, 3, 2),
			(0, 1, 5, 5),
		)
	),
	caption: [Pugh matrix comparing C3 systems.],
) <Table::c3-pugh>

#[
	#set heading(offset: 1)

	#include "system-overview.typ"
	#pagebreak()
]

== System Interactions

Our system is composed of several subsystems that interact with each other to accomplish the mission, shown in @Table::interactions-internal. Additionally, our system interacts with external systems and the environment to achieve its goals, shown in @Table::interactions-external.

#figure(
  table(
		columns: 4,
    [Source Subsystem], [Interface], [Destination Subsystem], [Purpose],
    [HTMQ], [HTMQ Dispatcher], [IP Network], [Deliver messages to services on the IP network],
    [IP Network], [HTMQ Dispatcher], [HTMQ], [Queue messages to be delivered on the HTMQ network],
    [SRR], [Radio Transceiver], [IP Network], [Record audio/video logs to the IP network's storage],
  ),
  caption: [Internal Subsystem Interactions],
) <Table::interactions-internal>

#figure(
  table(
		columns: 4,
    [Subsystem], [Interface], [External System], [Purpose],
    [(All subsystems)], [Electrical], [Power], [Required for operation],
    [IP Network], [Internet Protocol], [Water], [Monitoring subsystems will be colocated on the same network],
    [IP Network], [Internet Protocol], [Habitat], [Monitoring subsystems will be colocated on the same network],
    [IP Network], [Physical], [Habitat], [Equipment will be deployed inside the habitat],
    [SRR], [Physical], [Habitat], [Main transceiver will be deployed on the habitat],
		[DSP], [RF Signal], [Spacecraft], [Command and Control (Primary purpose)]
  ),
  caption: [External System Interactions],
) <Table::interactions-external>
