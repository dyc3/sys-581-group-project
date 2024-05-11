#import "@preview/in-dexter:0.2.0": *
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

== System Requirements and Specifications

=== Requirements

- The system must be capable of transmitting and receiving messages between Earth and Mars.
- The system must ensure the reliability and integrity of the transmitted data.
- The system must guarantee message delivery at least once. Duplicate deliveries are acceptable.
- The system must be able to handle varying data sizes, from small text messages to large data packets from scientific instruments.
- The system must be resilient to environmental factors such as solar flares, cosmic radiation, and planet alignment.
- The system must be capable of sending commands to and receiving data from both manned and unmanned missions on and around Mars.
- The system must be able to process and present environmental data collected by rovers and satellites on Mars.
- The system must be able to interact with various communication infrastructures such as satellites and relay stations.
- The system should be scalable and adaptable to accommodate future expansion of the colony and missions.
- The system should minimize latency in communication as much as possible.
- The system must incorporate robust security measures to protect sensitive mission data and private communications.
- The system must have measures in place to detect and mitigate potential cyber threats.
- The system must be designed for easy maintenance and troubleshooting.
- The system must provide comprehensive logs for system monitoring and incident response.

=== Specifications

#figure(
	table(
		columns: 2,
		[Specification], [Value],
		[Data Throughput (Estimated)], [200 Gbps],
		[System Uptime], [99.9999%],
		[Encryption], [AES-256 Encryption, with PQXDH #index[PQXDH] key exchange],
		[Minimum Delivery Latency], [20 minutes],
		[Log Retention], [90 days],
		[Environmental Resilience], [Withstands radiation levels up to 500 millisieverts],
		[Security Measures], [ISO 27001 compliance],
	),
	caption: [C3 System Specifications],
)

==== Backbone Satellite Specifications

#figure(
	table(
		columns: 2,
		[Specification], [Value],
		[Orbit], [Heliocentric Orbits (30 \@ \~1.5 AU, 20 \@ \~0.85 AU from the Sun)],
		[Satellite Lifetime], [10 years],
		[Data Relay Range], [Up to 100 million km],
		[Data Relay Rate (Max)], [200 Gbps],
		[Power Source], [Solar Panels, 50W],
		[Optical Laser Links], [3, independently articulated],
		[Rotational Control], [Reaction Wheels],
	),
	caption: [Backbone Satellite Specifications (per satellite)],
)
