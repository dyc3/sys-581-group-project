= Integration and Testing

In order to ensure that the system is working as expected, it is necessary to perform integration and testing.

== System Verification

There are several physical aspects of the system that need to be verified that determine the feasibility and performance of the system.

=== HTMQ Backbone Satellites <Section::test-htmq-backbone>

Firstly, we need to verify that the desired configuration of HTMQ backbone satellites is feasible, and whether or not the timeline of that deployment is realistic and within the Mars Colony Mission timeline. This involves assessing:
- Is it realistic to deploy the satellites in those orbits?
- How long will it take to do so?
- What are the physical characteristics of the optical laser links operating in a vacuum and not through the atmosphere?
- Will the satellites be able to establish optical laser links with each other using the proposed technology?

The deployment plan and timeline can be verified by running simulations of the deployment process. However, the physical characteristics of the optical laser links will need to be tested in space. This can be done by deploying a 2-3 satellites in the desired orbits and testing the optical laser links between them. To build a good model of the optical laser links, the satellites need to be in unequal orbits such that the distance between them is increasing and decreasing throughout the test. This will allow us to test the optical laser links at different distances and angles.

Some tests have already been conducted that make us very confident that we will be able to achieve a 200 Gbps data rate between planet surfaces and the gateway satellites. The TBIRD (Terabyte Infrared Delivery) mission demonstrated a 200 Gbps downlink from a satellite in low earth orbit. @schieler2022200 Given that Mars' atmosphere is much thinner than Earth's, we can expect that the test results will generally be applicable to Mars.

NASA is also planning some additional tests around optical laser links in space. They are planning to perform a test of optical communications between Earth and the Moon in 2025, called "Orion Artemis II Optical Communications System (O2O)". @NASAOrionArtemisII2024 This will verify whether or not optical communications can be used for long-range communication in space.

To test the computational aspects of the system, the HTMQ can be simulated using a network simulator that models the behavior of the laser links and the message queues. This simulation can be used to test the performance of the HTMQ under different conditions, such as high traffic loads or node failures. Additionally, the HTMQ can be tested using a hardware-in-the-loop testbed that simulates the laser links and the message queues. This testbed can be used to verify that the HTMQ can handle the data transfer requirements.

=== Other Subsystems and Components

The DSP system uses primarily preexisting technologies, and as such, the feasibility of the system is not in question. The system uses already established infrastructure, such as the Deep Space Network, which is already proven to work in the field.

The IP network uses commercial off the shelf hardware, can be easily verified by setting up the equipment and testing the network, as the deployment of the hardware won't change between Earth and Mars. The network can be tested for performance, reliability, and security using conventional stress and penetration testing techniques.

The SRR subsystem can be tested by creating a test enclosure that simulates the conditions on Mars.

One example of a full system integration test would be to see if the system can record SRR transmissions and have them end up in Mission Control's storage. This would involve the following steps:
+ Having the system record some SRR transmissions
+ Assert that the recorded transmissions are stored in the IP Network's storage
+ Send that recording the the HTMQ dispatcher
+ Receive the recording on the Mission Control side
+ Assert that the recording's integrity is intact

== Modeling and Simulation

We performed a functional simulation of the HTMQ network to determine the expected performance of the system. The simulated timespan was from 2028 to 2032, using the proposed network configuration in @Section::htmq-deploy.

#figure(
	image("figures/htmq/htmq-msg-travel-distance.svg"),
	caption: [The actual distance between Earth and Mars vs the distance along the network over time.],
) <Figure::htmq-msg-travel-distance>

The variance in @Figure::htmq-msg-travel-distance can be attributed to the elliptical orbits of Earth and Mars. The distance between the two planets's orbits varies. This can be minimized by adjusting the orbits of the relay satellites.

At the time of writing, there have been a few real world tests of optical communications in space, listed in @Table::htmq-optical-tests.

#figure(
	table(
		columns: 3,
		[Test], [Distance (km)], [Data Rate (bit/s)],
		link("https://www.jpl.nasa.gov/news/nasas-tech-demo-streams-first-video-from-deep-space-via-laser")[Taters],[31000000],[267 Mbit/s],
		link("https://www.nasa.gov/missions/psyche-mission/nasas-optical-comms-demo-transmits-data-over-140-million-miles/")[Psyche],[226000000],[25 Mbit/s],
		link("https://ntrs.nasa.gov/api/citations/20210026855/downloads/spie2022-tbird-v1.pdf")[TBIRD @schieler2022200],[482.803],[200 Gbit/s],
		link("https://www.nasa.gov/missions/tech-demonstration/laser-communications-relay/historic-demonstration-proves-laser-communication-possible/")[LLCD],[384400],[662 Mbit/s],
	)
) <Table::htmq-optical-tests>

From these tests, we can produce a very rough model for transmission distance vs data rate, shown in @Figure::htmq-data-rate-estimation. This model not entirely representative of the system, as more tests are needed to determine the actual characteristics of the optical links in space to space communication (as outlined in @Section::test-htmq-backbone). Additionally, these tests were conducted with fairly low laser wattage, and the data rate could be increased by using more powerful lasers.

#figure(
	image("figures/htmq/htmq-data-rate-estimation.svg"),
	caption: [Model of the expected distance between nodes to data rate ratio.],
) <Figure::htmq-data-rate-estimation>

Using the model in @Figure::htmq-data-rate-estimation, we can estimate the data rate of the HTMQ network over time, shown in @Figure::htmq-data-rate.

#figure(
	image("figures/htmq/htmq-data-rate.svg"),
	caption: [Estimated data rate of the HTMQ network over time.],
) <Figure::htmq-data-rate>

