= Integration and Testing

In order to ensure that the system is working as expected, it is necessary to perform integration and testing.

== System Verification

There are several physical aspects of the system that need to be verified that determine the feasibility and performance of the system.

=== HTMQ Backbone Satellites

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
