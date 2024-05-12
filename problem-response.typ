= Problem Response
The system will respond primarily to problems with processes and software, since responding to hardware problems would be difficult, if not impossible to properly address.
== Detection
Detection of problems in the HTMQ subsystem consists of message buffer health checks, connection metrics and hardware sensors. For the message buffer, continuous S.M.A.R.T (Self-Monitoring, Analysis, and Reporting Technology) checks are made to the onboard data drives to give an indication of the current health status of the drives. Additional checks are made to monitor the capacity of the drives and ensure sufficient space is available for incoming messages. Messages are verified to ensure there is no loss in data, and incomplete messages cause an error message to be sent to the user while the cause of the error is determined. Connection metrics are monitered to ensure stable connections between nodes by measuring the amount of blocks delivered and which ones were sent after retrying. Finally, hardware sensors are in place to monitor and detect any problems that occur in the hardware.
== Response
Functional software problems are addressed through emergency software updates to address critical flaws or errors. Non-functional problems such as performance improvement are addressed with version releases. As stated before, problems with the hardware of the system are difficult to fix since the deployment of the nodes are in space and would require missions to fix the node which is costly. Instead, the nodes with malfunctioning hardware would be decommissioned and then replaced with a new node. The new node is activated and aligned with the system before the old node is decommissioned and removed.

= Risks and Mitigations
== Risks
There are several risks that could arise when deploying the C3 system, mainly in the HTMQ subsystem. Since the nodes in the HTMQ are deployed in orbit around the sun, there is a significantly high risk of blackout periods due to obstruction. If too few nodes are deployed than there is a high probability of that the system would slow and unreliable. When establishing connections in the DSP, data integrity could be compromised when a handshaking process is not in place. The commercial hardware used for the system might not be optimized for power efficiency. Finally, noise and atmospheric disturbances can greatly affect transmission of data in the optical laser links as well as the SRR subsystem. 

#figure(
	image("figures/stoplight_matrix.png"),
	caption: [A comprehensive visualization of the probable impact and likelihood of each risk. @biswas2003deep],
) <Figure::stoplight-matrix>
== Mitigations
To mitigate the risk of blackout periods, each node would be equipped with storage drives to store messages during blackout periods. The nodes would employ store and forward protocols to ensure all messages are sent, even if they take a while. If not enough nodes are provided, system monitoring would be implemented to measure performance and identify key issues proactively. Load balancing algorithms would also be integrated to distribute message queuing across nodes to prevent congestion. To mitigate potentially compromising data integrity in the DSP, error correction algorithms would be integrated. Mitigating the risk of unpotimized power efficiency in commercial hardware would involve prioritizing the acquisition of low-power variants of the hardware. Finally, reducing noise and atmospheric disturbances would involve increasing the power of the optical laser when initiating the first node-link up and installing bandpass filters and optical filters to reject undesired frequencies.