ACES Compenents
===
The ACES system consists of the many Academy-supplied transforms – standard color space conversions, inputs, outputs, looks, and utilities – as well as vendor or user-contributed transforms – also including color space conversions, inputs, outputs, looks, and utilities – and finally documentation and metadata files.

## Github
The ACES components are distributed across a few separate Github repositories:

* `aces-core`
    * Intended for the core algorithms and math that is ACES 
* `aces-colorspace-and-input`
    * Intended for color space definitions and their conversion to/from ACES (or another color space)
    * All Input Transforms are Color Space Transforms but not all Color Space Transforms are Input Transforms. Some ACES Color Space transforms can be used as Input Transforms, or if they convert the other direction, as Inverse Input Transforms
*	`aces-output`
    * Output Transforms structured essentially as “macros” that call aces-core transforms with preset parameters
*	`aces-look`
    * Any Transform that modifies the default appearance of images through an ACES pipeline. Can be empirical or analytical Transforms.
*	`aces-util`
    * Functions that are not core essential to any of the other categories but might have use when building a pipeline or debugging (e.g. Unity). Some of these might also be called with certain preset parameters to be used as Look Transforms (e.g. ASC_CDL, exposure adjustment, etc.)
*	`aces-amf`
    * schema and example files for ACES Metadata File (AMF)
*	`aces-docs`
    * ACES documentation hosted in mkdocs

The components are divided across separate repositories to enforce the notion that the system is flexible and extensible, and that new transforms can be added without breaking compatibility with the rest of the system. The addition of a new input, output, or look transform should have no impact on the ACES System Version number. For example, if a new camera is released, an Input Transform can be developed for that camera and contributed to the aces-input repository. This is done independent of the overall ACES system and thus does not warrant a change to the current version of ACES. 

In the opposite sense, transforms need not be included in an “official” release in order to be deemed usable on an ACES project. New transforms can be considered “official” as soon as they have been reviewed and accepted into the repository. Developers can choose to keep up with adding support for new inputs or outputs however best fits into their development cycles. From time to time, we will “roll up” these changes into a commit on the main branch to summarize the new additions and provide a milestone marker against which to compare one’s available presets.
