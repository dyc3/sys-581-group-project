= Data Streaming Protocol (DSP)

The Data Streaming Protocol (DSP) facilitates the streaming of metric data from probes and the issuance of commands to probes. It is optimized for minimal connection setup time and robustness to packet loss and signal degradation.

== Architecture

The Data Streaming Protocol (DSP) is a specialized communication framework designed to facilitate real-time data streaming from space probes across vast distances. It comprises a dual-module setup with client-side components on the probes and server-side components at Earth stations. 

== Subsystem Components

The DSP has a dual module setup.

- Client Module: Located on space probes; responsible for data collection, encoding, and transmission.

- Server Module: Situated at Earth stations; tasked with data reception, decoding, and processing.

== Data Handling

- Encoding and Compression: On the probe side, the DSP utilizes the Rice algorithm to prepare sensor data for transmission. The rice algorithm is a lossless algorithm which preserves the integrity and quality of scientific data. The encoding process also includes metadata tagging, making data easier to categorize upon reception.

- Decoding and Decompression: At Earth stations, the server module decodes the incoming data streams. In this step, the compression algorithm is reverse to restore the original data. The metadata is also checked to correctly route the data for analysis.

== Communication and Transmission

- Transmission Control: The DSP will use the Additive Increase/Multiplicative Decrease (AIMD) algorithm. Data transmission rates will slowly increase until packet loss is detected, at which point the transmission rate is significantly reduced.

- Error Handling: The DSP will use an ARQ error-control strategy, or automatic repeat request. This process is described in detail in @Figure::dsp-arq.

== Signal Integrity

The DSP will employ a modulation technique called phase-shift keying. Phase-shift keying helps mantain signal clarity over vast distances.

== Security

The DSP will implement a security framework developed by NASA called the Genomic and Proteomic Information Security Protocol. It utilizes advanced encryption and authentication techniques derived from genomic and proteomic data. 

== Networking and Interfaces

The DSP is designed to seamlessly interface with existing network infrastructures and protocols used by space agencies and research institutions. NASA already has an international array of giant radio antennas that support interplanetary spacecraft missions which will be crucial for the DSP.

== Robustness

Due to the low transmission power of probes, the DSP is engineered to be robust against packet loss and signal degradation. This ensures reliable communication even in challenging environmental conditions.

== Packet Structure

Communication in the DSP is packet-based. Each packet consists of a header and a payload. The header contains essential information such as packet type and length. The payload carries the actual data or command being transmitted.

== Acknowledgment Mechanism

Upon receiving a packet, the receiving node sends an acknowledgment to the transmitting node to confirm successful receipt. In case of packet loss, the transmitting node can retransmit the packet.

#figure(
  image("figures/dsp/dsp-arq.svg"),
  caption: [Sequence diagram illustrating the automatic repeat request (ARQ) error-control strategy.],
) <Figure::dsp-arq>