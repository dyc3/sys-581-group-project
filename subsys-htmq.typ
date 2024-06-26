#import "@preview/bytefield:0.0.5": *
#import "@preview/in-dexter:0.2.0": *
#import "lib/pugh.typ": *

= High Throughput Message Queue (HTMQ)

The High Throughput Message Queue (HTMQ) is the backbone #index[backbone] of interplanetary communications. The immediate goal is to enable reliable communication between Earth and Mars, but eventually to be able to scale up to connect future colonies #index[colonies] in the solar system. It is a high data transfer #index[data transfer], high capacity, high reliability message queue that is used to send messages between network #index[network] nodes #index[node] within the solar system. The HTMQ is a store-and-forward message queue #index[queue] that is designed to handle the high latency #index[latency] and high error rates of interplanetary #index[interplanetary] communications. It is a distributed system that is implemented as a network of message queues #index[message queue]#index[queue] that are connected by high-speed optical #index[optical] laser #index[laser] links. The HTMQ is designed to be fault-tolerant and scalable #index[scalable] to meet future needs.

== Architecture

The HTMQ is a distributed system that is implemented as a network of priority #index[priority] message queues. Each message queue is a node in the network #index[network]. The system keeps track of the physical location of each node #index[node] so that it can route #index[route] messages to the correct next hop #index[next hop]. The system is designed to be fault-tolerant so that it can continue to operate even if some nodes #index[node] are temporarily unavailable #index[unavailable] or lost. The system is analogous to the Internet #index[Internet], but with a focus on interplanetary communications.

=== Alternatives Considered

A few alternative systems have been considered for long range communication.

#figure(
	pugh(
		("Physical Shipment", "Optical Message Queue", "RF Message Queue"),
		(
			(criterion: "Data Throughput", weight: 5),
			(criterion: "Weight Efficiency", weight: 3),
			(criterion: "Power Efficiency", weight: 4),
			(criterion: "Physical Volume", weight: 2),
			(criterion: "Reliability", weight: 3),
			(criterion: "Directionality", weight: 1),
			(criterion: "Cost", weight: 4),
		),
		(
			(5, 4, 1),
			(2, 5, 3),
			(1, 5, 3),
			(1, 5, 2),
			(3, 5, 5),
			(4, 5, 1),
			(1, 5, 5),
		)
	),
	caption: [Pugh matrix comparing the HTMQ to alternative #index[alternative] systems.],
) <Table::htmq-pugh>

// TODO: explain the alternatives

== Handshaking and Connection Establishment

Due to the highly directional nature of laser #index[laser] communications, establishing a laser #index[laser] link requires alignment of the transmitter and receiver. This is done as a part of the handshaking #index[handshake] process.

As shown in @Figure::htmq-handshake, first, the transmitter sends a beacon #index[beacon] signal addressed to the receiver over traditional RF #index[RF] communications. Using reaction wheels, the spacecraft can adjust its orientation to align the laser #index[laser] with the receiver. Once the laser link is established, the transmitter and receiver perform a PQXDH #index[PQXDH] key exchange to establish a secure connection. @kret2023pqxdh Once complete, the connection is considered fully established and message transfer can begin.

#figure(
	image("figures/htmq/htmq-handshake.svg"),
	caption: [Sequence diagram of the HTMQ handshake process.],
) <Figure::htmq-handshake>

=== Encryption #index[Encryption]

The HTMQ uses the PQXDH #index[PQXDH] key exchange #index[key exchange] algorithm #index[algorithm] to establish a secure #index[secure] connection #index[connection] between nodes #index[node]. PQXDH is a post-quantum key exchange algorithm that is designed to be secure against quantum #index[quantum] computers. @kret2023pqxdh @cryspenPQXDH

Notably, the PQXDH #index[PQXDH] key exchange #index[key exchange] algorithm has three parties: Alice (the sender), Bob (the receiver), and the server, the purpose of which is to support asynchronisity in the time Alice sends the message and Bob receives it. @kret2023pqxdh However, for the purpose of internode communication in the HTMQ, the server is not used. Instead, the sender and receiver directly exchange keys #index[keys]. Bob takes the role of both the receiver and the server.

== Data Transfer

High speed data transfer is one of the key features of the HTMQ. This high data transfer rate allows the HTMQ to handle the large amounts of data that are generated by interplanetary missions. The HTMQ will be able to handle the data transfer requirements of future missions, including but not limited to manned missions to Mars. Note that because of the laws of physics, this does not mean that latency is low. Rather, transfer speed merely refers to the amount of data that can be transferred in a given time frame.

Using optical #index[optical] laser #index[laser] links, the HTMQ can transfer data at speeds of up to 200 Gbps bidirectionally in the vacuum of space. @NASAfastestlaserlink Laser #index[laser] links are used because they are faster than radio #index[radio] links and have a significantly higher bandwidth #index[bandwidth], and the directed nature of lasers makes intercepting messages difficult. @NASAlasercomms

Shown in @Figure::htmq-node-relay, once a connection is established, messages are relayed from node to node until they reach their destination. Each node in the network is responsible for routing messages to the correct next hop. Nodes can only dispose of a message once it receives an acknowledgment from the *destination* node. This ensures that messages are not lost in transit. Messages are broken down into packets, which are then sent over the laser link. The packets are reassembled at the destination node, and retransmission is attempted if any packets are lost.

#figure(
	image("figures/htmq/htmq-node-relay.svg", width: 70%),
	caption: [Sequence diagram of how messages are transferred once a connection is established.],
) <Figure::htmq-node-relay>

=== Messages #index[message]

Messages in the HTMQ are stored in a priority queue #[queue]. Each message has a priority level that determines the order in which it is processed. Messages with higher priority levels are processed before messages with lower priority levels. Messages are stored in the queue until they are delivered to their destination. The system is designed to handle messages of any size, from small telemetry packets to large image files.

Once a message is delivered to its destination, the destination node sends an acknowledgment back to the source node. This acknowledgment is used to confirm that the message was successfully delivered. If the acknowledgment is not received within a certain time frame, nodes in the network will attempt to resend the message along a different route.

== Routing

An important prerequisite for the HTMQ to be able to deliver messages is the ability to route messages to the correct next hop. The HTMQ uses a distributed routing algorithm to determine the next hop for each message.

The routing algorithm is based on a combination of the physical location of each node and the current network topology. Each node in the network maintains a routing table that contains the physical location of each node in the network. When a message is received, the node uses this routing table to determine the next hop for the message. The routing table is updated periodically to reflect changes in the network topology.

This works similarly to the Internet, where routers maintain a routing table that is used to determine the next hop for each packet. The HTMQ uses a similar approach to route messages between nodes in the network. The primary difference is that the HTMQ is designed to handle the high latency of interplanetary communications, and additionally takes into account the predicted movement of nodes in the network as they orbit their respective bodies.

// TODO: pseudocode for routing algorithm

=== Maintaining Network Topology #index[network]

The HTMQ uses a combination of predictive orbital mechanics and real-time range measurements to maintain an accurate network topology. Each node in the network periodically broadcasts its measurements to its neighbors. From this information, each node can calculate the relative position of its neighbors and update its routing table accordingly. Nodes that have authoritative absolute position information (e.g., Earth and Mars) allow the network to resolve relative positions into absolute positions.

=== Node Addresses #index[node] #index[address]

Node addresses uses the same notation as IPv6 addresses. They must be unique throughout the entire network #index[network]. They will be static and assigned as NASA sees fit, which allows NASA to organize the network in a way that makes sense for them.

== Link Protocol #index[link protocol] #index[protocol]

The HTMQ's Link Protocol is a custom protocol that is used to send messages between nodes in the network #index[network]. Using existing protocols such as TCP/IP would be inefficient due to the high latency and high error rates of interplanetary communications. @chan2006free

=== Packet Structure #index[packet]

Communication is structured as an exchange of packets. Each packet contains a header and a payload. The header contains information about the packet, such as the protocol version, the packet length, and a CRC32 checksum. The payload contains the actual content of the packet. All numbers are encoded as little endian.

#block(breakable: false)[
	The packet structure #index[packet structure] is shown in the following bytefield:

	#bytefield(
		bitheader(
			"bytes",
			0, [Bit],
			31, [Bit],
		),
		group(right, 3)[Header],
		bytes(2)[Protocol Version],
		bytes(2, fill: luma(180))[#text(style: "italic", "Reserved")],
		bits(32)[CRC32],
		bytes(4)[Packet Length],
		group(right, 6)[Payload],
		bytes(24)[Packet Content],
	)
]

=== Message Structure #index[message] #index[message structure]

Messages are the highest level of abstraction in the HTMQ. They are composed of blocks #index[block], which are sent as packets #index[packet] over the network. Each block #index[block] contains a portion of the message content, and the blocks are reassembled at the destination #index[destination] node to reconstruct the original message.

#figure(
	pugh(
		("Cap'n Proto", "Protobuf", "JSON", "XML"),
		(
			(criterion: "Serialization Speed", weight: 5),
			(criterion: "Deserialization Speed", weight: 5),
			(criterion: "Message Size", weight: 3),
			(criterion: "Error Handling", weight: 4),
			(criterion: "Extensibility", weight: 3),
		),
		(
			(5, 2, 2, 1),
			(4, 5, 2, 1),
			(1, 3, 4, 1),
			(5, 5, 3, 2),
			(4, 1, 3, 5),
		)
	),
	caption: [Pugh matrix comparing different wire formats for HTMQ messages.],
)


The following Cap'n Proto schema defines the structure of a message and its blocks:

#raw(read("data/htmq/htmq-message.capnp"), lang: "capnp", syntaxes: "data/capnp.sublime-syntax")

== Signal Integrity #index[signal] #index[signal integrity]

Due to the nature of any wireless communication, the HTMQ must be able to handle signal degradation. The HTMQ uses a combination of forward error correction (FEC) and automatic repeat request (ARQ) to ensure that messages are delivered correctly.

There are many sources of signal degradation in the HTMQ, outlined in @Figure::htmq-optical-loss-sources. @biswas2003deep

#figure(
	image("figures/htmq/htmq-optical-loss-sources.svg"),
	caption: [A comprehensive visualization of the sources of optical loss in the HTMQ. @biswas2003deep],
) <Figure::htmq-optical-loss-sources>

== Link Latency and Data Rates #index[latency] #index[data rate]

There are several factors that affect the latency of the HTMQ. The primary factor is the distance between the transmitter and receiver. The speed of light in a vacuum is approximately 299,792,458 meters per second. The HTMQ is designed to handle this high latency by using a store-and-forward message queue.

The HTMQ's data rate is determined by the speed of the laser links, which is also affected by several factors. @biswas2003deep
- Wavelength: #index[Wavelength] Shorter wavelengths allow for higher data rates, but are more susceptible to interference. As a result, the HTMQ uses a wavelength of 1550 nm, which is a good balance between data rate and interference.
- Power: #index[Power] Higher power lasers can transmit data for longer distances without degradation, but require more power.
- Receiver Size: #index[Receiver Size] Larger receivers can capture more light, allowing higher reliability at longer.
- Sender and Receiver Telescope Size: #index[Telescope Size] Longer telescopes can improve the signal-to-noise ratio, allowing for higher data rates.
- Atmospheric Conditions: #index[Atmospheric Conditions] The atmosphere can affect the transmission of light, which would affect the integrity of the signal. This causes additional retransmissions, which increases latency and lowers the effective data rate.

== Interactions with Other Systems

=== IP network #index[IP network]

As the HTMQ is used for long-range communication between spacecraft and planets, it is designed to work in conjunction with the IP network. The IP network is used for local communication within the colony and Mission Control. Applications running on the network can use the HTMQ dispatcher #index[dispatcher] to send and receive messages from the HTMQ network. The dispatcher is responsible for handling the details of sending and receiving messages over the HTMQ network, shown in @Figure::htmq-ip-interact-send and @Figure::htmq-ip-interact-recv.

#figure(
	image("figures/htmq/htmq-ip-interact-send.svg"),
	caption: [Sequence diagram of how the IP network interacts with the HTMQ to send a message.],
) <Figure::htmq-ip-interact-send>

Services running on the IP network must listen for incoming messages from the HTMQ dispatcher on port 14650 as an HTTP server. The service must implement the following OpenAPI spec:

#raw(read("data/htmq/htmq-consumer-api.yml"), lang: "yaml")

#figure(
	image("figures/htmq/htmq-ip-interact-recv.svg"),
	caption: [Sequence diagram of how the IP network interacts with the HTMQ to receive a message.],
) <Figure::htmq-ip-interact-recv>

== Integration and Deployment <Section::htmq-deploy> #index[deployment]

The backbone #index[backbone] of the HTMQ network will be deployed as a series of 50 relay satellites #index[satellite] in orbit around the Sun as seen in @Figure::htmq-network-deployment. The satellites will be placed in 2 rings:
- 20 satellites at 0.85 AU from the Sun, between Venus and Earth
- 30 satellites at 1.5 AU from the Sun, between Mars and Earth

Additionally, 2 satellites will be placed in orbit around Mars and Earth each (for a total of 4 gateway satellites) to act as gateways to the HTMQ network. This allows for the highest possible data transfer rate from ground to space. These gateway satellites will function identically to the relay satellites.

#figure(
	image("figures/htmq/htmq-network-deployment.svg"),
	caption: [Deployment of the HTMQ network in orbit around the Sun.],
) <Figure::htmq-network-deployment>

The backbone #index[backbone] satellites #index[satellite] will be equipped with 3 high-speed optical laser links that can individually articulate to establish connections with other satellites. The satellites will also be equipped with a flywheel system to maintain their orientation and a solar panel system to provide power.

This configuration has several benefits:
- Most satellites will be underutilized, but this allows for a high degree of fault tolerance.
- Lower priority traffic can be sent along unoptimal routes #index[route] while still making progress to the destination #index[destination].
- The shorter transmission distances allows for the highest possible data transfer rate with the least error rate, and the least amount of power consumption.
