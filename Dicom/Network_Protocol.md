The DICOM network protocol is one of the earliest web services. here, we have


- C-Echo : test connection between two devices
- C-Store : send images from local imaging device to a remote device
- C-Find : search content of a remote device. The specific kind or resource needed must be specified. Filters on specific DICOM tags can also be sent with the query.
- C-Move C-Get : retrieve images from a remote device



The client is called a SCU ( Service Class User )
and the server is called a SCP ( Service Class Provider )


the server sends a DICOM file( the command ) and the server returns a DICOM file. The connection between a client and a server is called an association. An association starts with a handshake with an  agreement of which commands can be exchanged and the transfer syntax( the encoding algorithm )


##Parameters
Since DICOMs act over a TCP/IP stack, it can be identified by its parameters on the network socket.

1. IP address ( or its DNS hostname )
2. Port Number ( for DICOM 104 by default, Orthanc uses 4242 by default )
3. The AET - Each imaging device(client or server) needs to be assigned a unique name called the AET (Applicaiton Entity Title). This name should be unique within an intranet.





###Configuration

An orthanc server can be configured as client or server based on the params in the config file.
