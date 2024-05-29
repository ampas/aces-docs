ACES Compenents
===
The ACES system consists of the many Academy-supplied transforms – standard color space conversions, inputs, outputs, looks, and utilities – as well as vendor or user-contributed transforms – also including color space conversions, inputs, outputs, looks, and utilities – and finally documentation and metadata files.

## Github
The ACES components are distributed across a few separate Github repositories:

*   `aces-core` : Algorithms and maths that are the core of the ACES rendering transforms
*   `aces-colorspace-and-input` : Contains color space definitions and the conversion between them to and/or from ACES (or another color space)
    * All Input Transforms are Color Space Transforms but not all Color Space Transforms are Input Transforms. Some ACES Color Space transforms can be used as Input Transforms, or if they convert the other direction, as Inverse Input Transforms
*	`aces-output` : Transforms that are wrapper functions with preset parameters to common display standards, and which rely on the functions defined in aces-core
*	`aces-look` : Transforms that modify the default appearance of images through an ACES pipeline. Can be analytical or empirical transforms.
*	`aces-util` : Any transforms that are not essential to any of the other categories but might have some use when building a pipeline or debugging (e.g. Unity). Some of these might also be called with certain preset parameters to be used as Look Transforms (e.g. ASC_CDL, exposure adjustment, etc.)
*	`aces-amf` : XSD schema and example files for ACES Metadata File (AMF)
*	`aces-docs` : ACES documentation written in markdown and published using mkdocs

## Rationale
The ACES system components are divided across separate repositories to enforce the notion that the system is flexible and extensible, and that new transforms can be added without breaking compatibility with the rest of the system. The addition of a new Input, Output, or Look Transform should have no impact on the ACES System Version number. For example, if a new camera is released, an Input Transform can be developed for that camera and contributed to the aces-input repository. This is done independent of the overall ACES system and thus does not warrant a change to the current version of ACES. 

In the opposite sense, transforms need not be included in an “official” release in order to be deemed usable on an ACES project. New transforms can be considered “official” as soon as they have been reviewed and accepted into the repository. Developers can choose to keep up with adding support for new inputs or outputs however best fits into their development cycles. From time to time, we will “roll up” these changes into a commit on the main branch to summarize the new additions and provide a milestone marker against which to compare one’s available presets.
