<!-- SPDX-License-Identifier: CC-BY-4.0 -->
<!-- Copyright Contributors to the ACES Documentation -->


Reference ACES Components
=========================

The ACES system consists of the many Academy-supplied transforms – standard color space conversions, inputs, outputs, looks, and utilities – as well as vendor or user-contributed transforms – also including color space conversions, inputs, outputs, looks, and utilities – and finally documentation and metadata files.

Github
------
The ACES components are distributed across a few separate Github repositories:

*   [`aces`](https://github.com/ampas/aces): This is used to track the system version of ACES and to manage the following submodules that contain ACES' modular components. The build number helps developers to reference a specific set of components, while still allowing for the addition of custom components.

    *   [`aces-core`](https://github.com/ampas/aces-dev/tree/v2-dev-release) contains the maths and algorithms that are at the core of the ACES rendering transforms
    !!! note 
        This repository was previously named `aces-dev` and contains the tags and file history of all ACES versions pre-2.0.
    *   [`aces-colorspace-and-input`](https://github.com/ampas/aces-colorspace-and-input) contains color space definitions and the conversion between them to and/or from ACES (or another color space)
        * All Input Transforms are Color Space Transforms but not all Color Space Transforms are Input Transforms. Some ACES Color Space transforms can be used as Input Transforms, or if they convert the other direction, as Inverse Input Transforms
    *	[`aces-output`](https://github.com/ampas/aces-output) houses transforms that store preset parameters corresponding to commonly used display standards and outputs. These depend on the functions defined in `aces-core` to process.
    *	[`aces-look`](https://github.com/ampas/aces-look) contains any transforms that serve to modify the default appearance of images through an ACES pipeline. These can be analytical or empirical transforms.
    *	[`aces-amf`](https://github.com/ampas/aces-amf) holds the XSD schema and example files for ACES Metadata File (AMF)

*	[`aces-docs`](https://github.com/ampas/aces-docs) is where the very ACES documentation that you are currently viewing is written in markdown and published using mkdocs

Versioning
----------
The `aces` repository contains submodules to the component repositories of the Academy Color Encoding System. It serves as a convenient way to manage and reference various versions of ACES.

The major version number of ACES reflects changes to the ACES core algorithms. The build number serves to identify the specific collection of modular components (e.g., Input and Color Space Transforms, Output Transforms, etc.).

### Semantic Versioning Structure
MAJOR.MINOR.PATCH: Reflects changes to the core ACES algorithms.
Build Number: Identifies the specific collection of modular components provided by the ACES team, as well as other contributions from the community.

### Modular Components
The modular components of ACES can be updated at any time by the ACES team or by end users. These components do not affect the core functionality of ACES, which is why they are not included in the MAJOR.MINOR.PATCH version number.

### Component independence
The ACES system components are divided across separate repositories to enforce the notion that the system is flexible and extensible, and new transforms can be added without breaking compatibility with the rest of the system. The addition of a new Input, Output, or Look Transform should have no impact on the ACES System Version number. 

For example, if a new camera is released, an Input Transform can be developed for that camera and contributed to the `aces-input` repository. This is done independent of the overall ACES system and thus does not warrant a change to the current version of ACES. Transforms also need not be included in an “official” release in order to be deemed usable on an ACES project. New transforms can be created as needed to meet the needs of a particular project.

Contributions and Customization
-------------------------------
Developers and end users may generate their own modular components. When doing so, they should:

* Create an ACES Transform ID for their components.
* Provide a mechanism for sharing these components with other users (e.g via a CLF referenced in an AMF file). 

End users and developers are not required to share their modular components with the community, which allows for extensive customization while preserving the core integrity of the ACES system. For example, a developer might create custom Look Transforms or Color Space Conversion Transforms for use on a specific project. While they may choose not to share these with the wider community, they should still create an ACES TransformID and CLF files to facilitate sharing these transforms with other vendors involved in the same project.

!!! note
    Sharing custom transforms may necessitate that the software used on the project supports reading CLF and AMF files and can correctly apply these custom transforms within the ACES pipeline.
