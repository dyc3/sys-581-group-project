= Top Level Functions <Section::top-level-functions>

Our system must be able to perform these functions in order to accomplish our mission:
+ *Interplanetary Communication*: The primary function of the C3 system is to facilitate the exchange of messages and data across vast interplanetary distances. This system ensures that crucical information can be transmitted reliably to and form Earth.
+ *Command & Control:* The C3 system must be able to send commands to and receive data from manned and unmanned missions to Mars. This includes the ability to send commands to rovers, satellites, and other equipment on the Martian surface.
+ *Intracolony Communication*: The C3 system must provide a means for colonists to communicate with each other. This includes voice, video, documents, and text communication.

This is broken down further in @Figure::functional-breakdown.

#figure(
	image("figures/functional-breakdown.svg"),
	caption: "Functional Breakdown of the System",
) <Figure::functional-breakdown>

= Interaction between top level functions and external environment

+ Interplanetary Communication
  + Interacts with Mission Command & Control:
    + Mission controllers on Earth use the communication to send commands and receive data from manned and unmanned missions on Mars.
  + Interacts with Intracolony Communication:
    + Colonists on Mars use the communication system to send messages to family on Earth.
  + Interacts with External Environment:
    + Relies on communication infrastructure such as satellites and relay stations to transmit messages.
    + Environmental factors like solar flares, cosmic radiation, and planet alignment can affect the quality of communication.
+ Command & Control
  + Interacts with Interplanetary Communication:
    + Receives commands from mission controllers on Earth to send to manned and unmanned missions on Mars.
  + Interacts with External Environment:
    + Monitors environmental conditions on Mars through data collected by rovers and satellites.
+ Intracolony Communication:
  + Interacts with Interplanetary Communication:
    + Colonists on Mars use the communication system to send messages to family on Earth.
