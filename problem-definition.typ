#import "@preview/in-dexter:0.2.0": *

= Problem Definition

In order for a Mars colony to be established, the colony needs to be able to communicate with Mission Control #index[Mission Control], and vice versa. Additionally, the colonists need to be able to communicate with each other, and with their families and friends on Earth. The Mars C3 system is designed to meet these needs.

== Operational Need

There are 3 primary operational needs for the Mars C3 system:
- Interplanetary communication between Mars and Mission Control
- Intra-colony communication on Mars
- Command and control of manned and unmanned missions

Interplanetary communication is important so that Mission Control can be kept informed of the status of the Mars colony, and so that the Mars colony can request assistance from Mission Control if needed. Command and control is important so that Mission Control remains in control of all deployed assets, and so that the Mars colony can be directed to perform specific tasks. Intra-colony communication is important so that the colonists can communicate and coordinate with each other while on Mars during their daily activities.

== Key Specifications

The Mars C3 system must meet the following key functional requirements:
- The Mars colony must be able to communicate with Mission Control on Earth.
- Mission Control must be able to communicate with the Mars colony.
- Colonists must be able to wirelessly communicate with each other, regardless of physical proximity within the colony.
- Colonists outside in EVA suits must be able to communicate with each other and with the colony.
- Interplanetary communication must be capable of handling a high volume of data (hundreds of gigabytes per day).
- Mission Control must be able to command unmanned and manned missions to Mars.

#[
	#set heading(offset: 1)

	#include "stakeholders.typ"
]

== Primary System Features

The C3 communication system was designed with multiple features to meet the varied requirements of communication between Earth and Mars. At it's core, we have an advanced orbital satellite network for global coverage and constant connectivity. This is crucial for high-speed data transfer and real-time communication. Each planet has ground-based deep space communication arrays, which manage large amounts of data and transmit commands. Both the HTMQ and DSP will use this satellite network.

The SRR and IP subsystem are significantly more simple. The SRR is a standalone system. Colonists on Mars will have both a handheld radio, and a built in radio tuned to the same frequency as the handhelds in their space suits. It will use an UHF frequency band to try maximize the effective range. The IP subsystem is essentially an internet network on Mars. It is directly analogous to the internet on planet Earth. The IP network will be capable of interfacing with the HTMQ to both send and receive messages.