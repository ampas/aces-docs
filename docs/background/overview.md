System Overview 
===============

Components
----------

The Academy Color Encoding System (ACES) defines a standardized framework for color management across the motion picture and television industries. This framework allows users to build tailored workflows by inserting the appropriate components into a consistent structured pipeline. So, while the framework itself is fixed, the individual components (or "building blocks") can vary depending on project needs, including camera types, post-production demands, output deliverables, and creative intent.

The ACES system includes several key component categories:

### Encodings 
Encodings are numeric representations of image data relative to defined color spaces, including:

  - **ACES2065-1**: Linear encoding in a wide-gamut RGB color space (AP0); the core interchange encoding in ACES.
  - **ACEScg**: Linear encoding using AP1 primaries, optimized for computer graphics rendering and compositing.
  - **ACEScct**: Logarithmic encoding using AP1 primaries, designed for scene-referred color grading.
  - **APD (Academy Printing Density)**: A printing-density-based encoding derived from spectral characteristics film print stocks and printer light source.
  - **ADX**: Integer-based (10-bit or 16-bit) encoding of APD, intended for film negative and inter-negative scanning workflows.

### Transforms
Transforms are fixed, sequential operations that convert between different ACES encodings and color spaces. These include:

  - **Input Transforms (IDTs)**: Convert camera-native data into ACES2065-1
  - **Color Space Conversion Transforms (CSCs)**: Convert between color encodings. IDTs are a specific type of CSC.
  - **Output Transforms (ODTs)**: Render ACES data to display-referred color spaces.
  - **Look Transforms (LMTs)**: Apply technical or creative adjustments to scene-referred ACES2065-1.
      - **Reference Gamut Compression** - 

### Metadata Files 
Metadata files contain information used to track the color processing history, transform versions, and viewing context. 

  - **ACES Metadata File (AMF)**: Tracks the transforms used to process ACES images in a production, including Input Transform(s), Look Transform(s), and Output Transform(s).

### File Formats
Various file formats have been defined 

  - **ACES OpenEXR**: ACES-compliant image format used for interchange and archival of ACES2065-1 images
  - **Common LUT Format (CLF)**: A flexible XML-based format that can communicate an arbitrary chain of color operators, including 1D and 3D LUTs, matrices, ASC-CDL values, log and exponential shaper functions, and range scaling. While not ACES specific, CLF has seen increasing use in carrying CSC and Look Transforms. 

!!! note
    Many ACES encodings and file formats have been formally standardized through SMPTE. Refer to [SMPTE ACES Standards](https://www.smpte.org/standards/aces-standards) for a complete list of related documents.


Basic ACES Workflow
-------------------

<figure markdown="span">
  ![Sample Workflow](./images/Sample-ACES-Workflow-light.png#only-light)
  ![Sample Workflow](./images/Sample-ACES-Workflow-dark.png#only-dark)
  <figcaption>Sample Workflow using ACES</figcaption>
</figure>


ACES 1.0 was the first official release of these components. It was anticipated that at some point after initial adoption, the ACES system would require a revision to address user feedback, fix bugs and create a stable release that could have all its components standardized. In addition, ACES would always require updates to add new transforms to support new cameras, displays, or industry standards. Therefore, a specification for versioning of ACES system components and a guide to consistent naming of components is needed.

This document describes the versioning of the various engineering components that comprise the ACES System Release. These attributes can be referenced in the ACES Metadata File to describe the exact transforms used when ACES image files were viewed, created, or modified.

A separate document (Academy TB-2014-002) addresses naming of transforms and presentation of versioning information to end-users within the context of software or hardware implementing ACES transforms.
