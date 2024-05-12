= Data Streaming Protocol (DSP)

The Data Streaming Protocol (DSP) facilitates the streaming of metric data from probes and the issuance of commands to probes. It is optimized for minimal connection setup time and robustness to packet loss and signal degradation.

== Architecture

The Data Streaming Protocol (DSP) is a specialized communication framework designed to facilitate real-time data streaming from space probes across vast distances. It comprises a dual-module setup with client-side components on the probes and server-side components at Earth stations.  The infrastructure to transmit messages to probes is already in place on Earth. NASA has three Deep Space Network sites with large antenna satellites which are approximately 120 degrees apart on Earth so that as Earth rotates, at least one station is able to capture and transmit signals to any deep space mission. @nasa_scan

== Subsystem Components

The DSP has a dual module setup.

- Client Module: Located on space probes; responsible for data collection, encoding, and transmission.

- Server Module: Situated at Earth stations; tasked with data reception, decoding, and processing.

== Data Handling

- Encoding and Compression: On the probe side, the DSP utilizes the Rice algorithm to prepare sensor data for transmission. The Rice algorithm is a lossless algorithm which is particularly effective at conserving the integrity and quality of scientific data. The algorithm operates by converting data into a simpler, predictable format that takes up less space. It involves a preprocessor that decorrelates data samples, mapping them into symbols suitable for entropy coding. This coding then compresses the data by exploiting the reduced randomness. @nasa_19940017310 The encoding process also includes metadata tagging, making data easier to categorize upon reception. 

- Decoding and Decompression: At Earth stations, the server module decodes the incoming data streams. In this step, the compression algorithm is reverse to restore the original data. The metadata is also checked to correctly route the data for analysis.

== Communication and Transmission

- Transmission Control: The DSP will use the Additive Increase/Multiplicative Decrease (AIMD) algorithm. Each node starts with a certain access probability which is periodically adjusted: it increases by a small fixed amount if conditions are favorable (no congestion detected), and decreases multiplicatively when congestion occurs. @li2013aimdmac

- Error Handling: The DSP will use an ARQ error-control strategy, or automatic repeat request. This process is described in detail in @Figure::dsp-arq.

== Signal Integrity

The DSP will employ a modulation technique called phase-shift keying. Phase-shift keying helps maintain signal clarity over vast distances. The DSP will specifically use Offset Quadrature Phase Shift Keying (Offset-QPSK). PSK can have some confusion over the signal's phase, which can make it tricky for the receiver to understand the data correctly. Offset-QPSK helps by reducing this confusion from four possible phases to just two, making it easier and more reliable for the receiver to pick up the correct signal. @nasa_techbrief_20110016690

== Security

The DSP will implement a security framework developed by NASA called the Genomic and Proteomic Information Security Protocol. It utilizes advanced encryption and authentication techniques derived from genomic and proteomic data. This protocol utilizes genomic and proteomic information for key generation, employing the processes of transcription and translation as mechanisms for encryption and authentication. This method allows for three levels of encryption and authentication, enhancing security through the inherent variability and randomness of genetic codes. @nasa_patent_tops_186

== Networking and Interfaces

The DSP is designed to seamlessly interface with existing network infrastructures and protocols used by space agencies and research institutions. NASA already has an international array of giant radio antennas that support interplanetary spacecraft missions which will be crucial for the DSP.

== Robustness

Due to the low transmission power of probes, the DSP is engineered to be robust against packet loss and signal degradation. This ensures reliable communication even in challenging environmental conditions.

== Command Transmission

The DSP subsystem utilizes NASA's Deep Space Network (DSN) satellite arrays to transmit commands to probes. The DSP is composed of three sophisticated ground-based antennas located strategically around Earth. It enables the DSP subsystem to maintain robust and reliable communication channels across the interplanetary distances involved. Commands are first sent to the gateway satellites in orbit around Earth. Commands will hop from these gateway satellites to relay satellites and finally to the space probe the command is meant for. The DSN also provides two way communication between Earth based equipment and probes, which allows NASA to track them with a high degree of accuracy.

== Packet Structure

Communication in the DSP is packet-based. Each packet consists of a header and a payload. The header contains essential information such as packet type and length. The payload carries the actual data or command being transmitted.

== Acknowledgment Mechanism

Upon receiving a packet, the receiving node sends an acknowledgment to the transmitting node to confirm successful receipt. In case of packet loss, the transmitting node can retransmit the packet.

#figure(
  image("figures/dsp/dsp-arq.svg"),
  caption: [Sequence diagram illustrating the automatic repeat request (ARQ) error-control strategy.],
) <Figure::dsp-arq>