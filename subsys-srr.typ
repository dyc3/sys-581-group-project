#import "@preview/bytefield:0.0.5": *
#import "lib/pugh.typ": *

= Short Range Radio (SRR)

The Short Range Radio (SRR) is the system used to let colonists speak to each other on the colony. The goal of this system to enable colonists to have reliable communication amongst themselves in any conditions at long-distance so that missions can be conducted on the surface without being directly next to each other. The focus is reliability, as being able to talk during missions is as vital as a life support system. It will utilize commonly used radio equipment that is slightly modified to better fit the use-case of an interplanetary mission.
== Architecture

The overview of the SRR is similar to a commonly found short range radio communication system on Earth. Each colonist will have a walkie-talkie device equipped with an omni-directional transceiver in the form of a whip antenna. This will allow them to communicate by sending voice messages up to 6 miles away. However, we also plan to send the colonists with a separate transceiver that can be attached to the tallest point on the base, which can allow voice messages to be sent to other colonists at a range of 15-20 miles. The biggest limiting factor is the height of the transceivers, but by using the UHF (ultra high frequency) band as the communication medium, we hope to keep the range as far as physically possible.
=== Alternatives Considered

For short range communication, alternatives include physical conversation (no technology required), or creating an entire novel method of communication.

The alternatives have huge issues, though. Physical conversation is implausible as there needs to be more distance than immediate arms-length to allow for conversation for missions and communication across the colony. A novel method may have a better upside of range, but to create an entire novel SRR system would greatly risk the reliability necessary for the system. It is also extremely implausible to create an entire new methodology within an already high-risk mission.

As a result, we did not believe a Pugh matrix was necessary to showcase that, of all possibilities, using established radio technology is most definitely the way to go.


== Handheld Radio Devices

The most fundamental part of this system is the handheld radio device that each colonist will have. It is, by all intents and purposes, a walkie-talkie. However, it will be specifically resilient to impact, dusty conditions, and radiation. It will be encased in a plastic-covered lead plating that ensures that it can endure the conditions of the Martian surface. 

Further, it will have an omni-directional whip antenna & transceiver, to ensure the longest possible range at any direction. The default range expected is 6 miles.

These are extremely portable and lightweight compared to other cargo coming with them on the mission, enabling easy transport to the planet. The familiar platform will ensure each colonist does not need any special training to operate the handheld devices.

They will also be equipped with solar panels and rechargeable batteries in order to keep the low amount of power they need for a very extended amount of time.

=== On-Base Antenna

The largest prohibitor of range is the curvature of the planet, and the higher a transceiver is, the further it can send a message.

A secondary component to combat this issue that will be sent with the colonists is another transceiver that will be mounted atop the colony at the highest point. This antenna will allow messages to be sent from the colony to people travelling at a much greater range than just using the handheld device of around 15-20 miles.

There is one pull back to this method to be aware of: The longer range of sending messages is exclusively for sending from the colony and not receiving. The height of the transceiver does not affect the range of messages being received, only messages sent. 

We still believe it is worth bringing the transceiver because even if there is not two-way communication at a longer distance, the colonists can still direct people out on mission about critical information even if they venture beyond the 6 mile radius. 

=== Radio Methodology

The radio waves we will be using are Ultra-High Frequency, or UHF, waves. These are frequencies in the range of 300 megahertz to 3 gigahertz and are regularly used on Earth for radio walkie-talkie communications.

These waves travel the best in line-of-sight applications, and hold a better accuracy of data transmission as compared to lower frequencies.

A further, and much more critical concern, with using traditional lower-range high frequency, or HF, waves is that they work by bouncing off the ionosphere of Earth to travel long distance. The ionosphere of Mars is thinner, and will not perform nearly as well as it will on Earth. Mars is also covered in a layer of iron, which will greatly impede the radio transmission distance and accuracy of the transmission using these waves.

As a result, the UHF waves provide the best middle-ground of being compatible with the environment and being very easy to set up and use.


== Interactions with Other Systems

=== Standalone System

The SRR is designed to be a standalone system with no interdependencies on the other communications systems. If all else were to go down, colonists will still be able to communicate amongst themselves and conduct short-range missions. This is intentional to act as a safeguard so that there is never a total communication outage on the colony.

== Integration and Deployment

There is a two-step process to the SRR:
- Each colonist carries one handheld radio communication device.
- The colony base is equipped with a dedicated transceiver for a longer range of transmission.

@Figure::colony-radio-range showcases the range differences and how this will exist on the colony.

#figure(
	image("figures/srr/colony-radio-range.png", width: 70%),
	caption: [Example of Radio Communication Distance for colonists with handheld devices and colony base with dedicated transceiver.],
) <Figure::colony-radio-range>