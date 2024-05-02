@0x93279c61cef9bd48;

struct Message {
	id @0 :List(UInt8); # UUIDv4, encoded as 128 bits
	service @1 :Text; # Service name (e.g., "telemetry")
	source @2 :List(UInt8); # The address of the sender, encoded as 128 bits
	dest @3 :List(UInt8); # The address of the receiver encoded as 128 bits
	contentlength @4 :UInt64; # The length of the content in bytes
	priority @5 :UInt8; # The priority of the message
	blocksize @6 :UInt64; # The size of each block in bytes
	blocks @7 :List(Block); # The blocks that make up the message
}

struct Block {
	index @0 :UInt64; # The index of the block in the message
	checksum @1 :Text; # The checksum of the block, SHA256
	blob @2 :Data; # The content of the block
}
