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
