DICOM - The Digital Imaging and Communication in Medicine is a file format which has a specific protocol to be followed for sending and storing Medical imaging data.

**Note** All the data given here are in connection with orthanc ( Dunno what it means but we will see )

It can be segmented into

1. the file format
2. the network protocol

# The File Format

- The medical info encoded in a DICOM file is called its data set. this data set is in the form of key value pairs.
- The keys are called "Dicom tag"s. each tag is represented by two hexadecimal numbers. example: Birth date of patient is associated with the dicom tag (0x0010, 0x0030). the 0x can also be dropped and just (0010 , 0030) can be used. Usually for better readability these tags can also be nicknamed with camel case.
- The tags are associated with data types such as string, date or float called its value.

- Mandatory or optional tags are also specified for each modality( CT, MR, XR ). These specifications are called _"Storage Service Object Pair - storage SOP"_

they have names associated

- type1 - mandatory tags
- type2 - mandatory tags with null values
- type3 - optional tags<br>

- There are also proprietary tags which vendors can use for their own purposes. that have the first hexadecimal value odd (0x0009, 0x0010)

## The pixel data

- The image can be found in the dicom tag PixelData (0x7fe0, 0x0010). this image can be compressed with various formats(like JPEG, Lossless JPEG ), But lossless compression should always be preferred. Since most imaging devices don't support compression, most images are uncompressed.

- The compression algorithm( called the transfer syntax ) can be identified in the header of the DICOM file.

- The Orthanc server can recieve store and send any kind of DICOM images. The server can also convert uncompressed Dicom images to png.

Thats the basics of the Dicom file format
