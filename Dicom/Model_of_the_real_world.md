The Model of the real world is a hierarchical way of looking at DICOM. Here,

Each of these is called a dicom resource( any patient, study, series or instance can be called a DICOM resource ). Patient -> Study -> Series -> Instance

### Patient

a patient can have multiple studies made and benefit from them

### Study

Each study in turn can have multiple series in them.

### Series

A series is a collection of instances, that contribute towards one. So any PET-CT scan will have a PET series and a CT series. ( Series can also include, a single 2d image, a 3d scan, a 3d + t image (sequence of temporal x rays) , a pdf report, a structured report or a 2d + t).

### instance

Each series is comprised of different instances. Each of these instances is in itself a single DICOM file.


# DICOM Identifiers
there are specified tags for indexing a single dicom resource.

- Patients - PatientID (0x0010, 0x0020), Patient module
- Study - StudyInstanceUID (0x0020, 0x000d), study module
- Series - SeriesInstanceUID (0x0020, 0x000e), series module
- Instances - SOPInstanceUID (0x0008, 0x0018), SOP module



%Note% Patient ID need not be unique. even though it is unique within the hospital, it need not be unique across hospitals

But it is ordered by the standard that StudyInstanceUID, SeriesInstanceUID, SOPInstanceUID are unique and two devices should never generate the same identifiers.
