= Data Streaming Protocol (DSP)

The Data Streaming Protocol (DSP) facilitates the streaming of metric data from probes and the issuance of commands to probes. It is optimized for minimal connection setup time and robustness to packet loss and signal degradation.

== Robustness

Due to the low transmission power of probes, the DSP is engineered to be robust against packet loss and signal degradation. This ensures reliable communication even in challenging environmental conditions.

== Packet Structure

Communication in the DSP is packet-based. Each packet consists of a header and a payload. The header contains essential information such as packet type and length. The payload carries the actual data or command being transmitted.

== Acknowledgment Mechanism

Upon receiving a packet, the receiving node sends an acknowledgment to the transmitting node to confirm successful receipt. In case of packet loss, the transmitting node can retransmit the packet.

== Error Correction

The DSP will use an ARQ error-control strategy, or automatic repeat request. This process is described in detail in @Figure::dsp-arq.

#figure(
  image("figures/dsp/dsp-arq.svg"),
  caption: [Sequence diagram illustrating the automatic repeat request (ARQ) error-control strategy.],
) <Figure::dsp-arq>