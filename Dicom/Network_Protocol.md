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

####DICOM server
1. *DicomServerEnabled* must be true
2. *DicomAET* must be set to the AET reserved for orthanc
3. *DicomPort* specifies the TCP port for the Dicom server

####DICOM client

to configure a dicom client a list of all remote DICOM servers must be listed in the *DicomModalities* option. for each, the following must be defined

1. User friendly *name* of the server, (possibily its AET)
2. the *AET* of the remote server
3. the *IP address* or its Hostname
4. the *DicomPort* (usually 104 or if the server is also orthanc 4242)






#PACS (Picture Archival and Communication System)
PACS is a medical imaging technology which we use to store and retrieve images from multiple modalities. This was placed so as to eliminate the need to fetch the files manually.
componenets:
 - Modality - the machines used to take the images are called modalities.(CT, PET, MRI)
 - A secure network to transfer these images.
 - Workstations to view the images.
 - Archives for storage and retrieval of images and reports.
