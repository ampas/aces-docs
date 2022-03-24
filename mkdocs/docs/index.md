ACES Documentation
================

System Documentation
----------------

### :fontawesome-solid-arrow-down-wide-short:{ .icons } [Project Organization and Development Procedure](https://aces.mp/P-2019_001)
Provides details on the organizational and decision making structure to be used in the development of the ACES.

### :fontawesome-solid-arrow-down-1-9:{ .icons } [Versioning System](http://j.mp/S-2014-002)
Describes versioning numbers and format of TransformIDs for components the ACES system.

### :fontawesome-solid-arrow-down-a-z:{ .icons } [Component Names](http://j.mp/TB-2014-012)
Describes preferred terminology for key ACES component names for ACES 1.0.

### :fontawesome-solid-file-export:{ .icons } [Input Transforms (IDTs)](http://j.mp/P-2013-001)
Describes methods to create Input Transforms (IDTs) for use within ACES.

### :fontawesome-solid-fill-drip:{ .icons } [Look Modification Transforms](http://j.mp/TB-2014-010)
Describes the design, integration and use of Look Modification Transforms.

### :material-arrow-collapse:{ .icons } [Reference Gamut Compression User Guide](guides/rgc-user/) :material-new-box:{ .new-icons }
Describes suggested user workflows for on set, dailies, visual effects, and finishing using the ACES Reference Gamut Compression (RGC)

### :fontawesome-solid-file-code:{ .icons } [Reference Gamut Compression Implementation Guide](guides/rgc-implementation/) :material-new-box:{ .new-icons }
Implementation guidelines related to the usage of the Reference Gamut Compression.

### :fontawesome-solid-desktop:{ .icons } [UX Guidelines](http://j.mp/TB-2014-002)
Provides guidelines on how best to present ACES terminology and concepts within products to end-users.

### :fontawesome-solid-file-code:{ .icons } [Common LUT Format Specification](specifications/clf/)
Specifies a flexible XML-based file format for color Look-Up Tables (LUTs) and other basic image operators.

### :fontawesome-solid-file-code:{ .icons } [Common LUT Format Implementation Guide](guides/clf/) :material-new-box:{ .new-icons }
Implementation guidelines related to the usage of the Common LUT Format.

### :fontawesome-solid-file-code:{ .icons } [ACES Metadata File Specification](https://aces.mp/S-2019-001)
Specifies a ‘sidecar’ XML file intended to exchange the metadata required to recreate ACES viewing pipelines.

### :fontawesome-solid-file-code:{ .icons } [ACES Metadata File Implementation Guidelines and Best Practices](guides/amf/) :material-new-box:{ .new-icons }
Implementation guidelines and best practices related to the usage of the ACES Metadata File (AMF) in various workflows

### :fontawesome-solid-glasses:{ .icons } [Alternate Viewing Pipeline](http://j.mp/TB-2014-013)
Describes an alternate approach to implementing and presenting the ACES viewing pipeline.

### :fontawesome-solid-file-arrow-down:{ .icons } [ACES White Point Derivation](http://j.mp/TB-2018-001)
Describes the derivation of the ACES white point and why the chromaticity coordinates were chosen.

----------------

ACES Encodings
----------------

### :fontawesome-solid-file-contract:{ .icons } [ACES 2065-1](http://j.mp/TB-2014-004)
Specifies ACES, the fundamental colorimetric encoding in the Academy Color Encoding System.
*See SMPTE 2065-1*

### :fontawesome-solid-file-contract:{ .icons } [ACEScct](/specifications/acescct/)
Defines a logarithmic colorimetric encoding more appropriate for legacy color correction operators.

### :fontawesome-solid-file-contract:{ .icons } [ACEScg](http://j.mp/S-2014-004)
Defines a colorimetric encoding appropriate as a working space for use in CGI tools such as compositors, paint and rendering systems.

### :fontawesome-solid-file-contract:{ .icons } [ACEScc](http://j.mp/S-2014-003)
Defines a logarithmic colorimetric encoding appropriate for legacy color correction operators.

### :fontawesome-solid-file-contract:{ .icons } [ACESproxy](http://j.mp/S-2013-001)
Defines an integer logarithmic colorimetric encoding appropriate for on-set preview and on-set look management applications.

----------------

Informative Notes (legacy documents)
----------------

Some informative notes on some of the ACES-related SMPTE standards are provided via Technical Bulletins. In most cases, these include the original Academy documents that were modified into the SMPTE standards documents.

The SMPTE standards supercede these documents and links to purchase the standards are included in the next section.

### :fontawesome-solid-circle-info:{ .icons } [Academy Color Encoding Specification (ACES)](http://j.mp/TB-2014-006)
Provides background and contextual information on SMPTE ST 2065-1:2012.

### :fontawesome-solid-circle-info:{ .icons } [ACES Image Container File (OpenEXR)](http://j.mp/TB-2014-006)
Provides background and contextual information on SMPTE ST 2065-4:2013.

### :fontawesome-solid-circle-info:{ .icons } [ADX Image Container File (DPX)](http://j.mp/TB-2014-007)
Provides background and contextual information on SMPTE ST 268:2003 Am1:2012.

### :fontawesome-solid-circle-info:{ .icons } [APD and ADX](http://j.mp/TB-2014-005) 
Provides background and contextual information related to SMPTE ST 2065-2:2012 and SMPTE ST 2065-3:2012.

----------------

SMPTE Standards
----------------

Below are the ACES-related standards documents published through SMPTE to date. Those wishing to implement ACES should adhere to the SMPTE standards. These must be purchased in order to view.

### :fontawesome-solid-file:{ .icons } [ACES Encoding](https://ieeexplore.ieee.org/servlet/opac?punumber=7289893) 
SMPTE ST 2065-1 - Academy Color Encoding Specification

### :fontawesome-solid-file:{ .icons } [Academy Printing Density (APD)](https://ieeexplore.ieee.org/servlet/opac?punumber=7292041) 
SMPTE ST 2065-2 - Academy Printing Density (APD) — Spectral Responsivities, Reference Measurement Device and Spectral Calculation

### :fontawesome-solid-file:{ .icons } [Academy Density Exchange (ADX)](https://ieeexplore.ieee.org/servlet/opac?punumber=7291492) 
SMPTE ST 2065-3 - Academy Density Exchange Encoding (ADX) — Encoding Academy Printing Density (APD) Values

### :fontawesome-solid-file:{ .icons } [ACES Image Container (OpenEXR)](https://ieeexplore.ieee.org/servlet/opac?punumber=7290439) 
SMPTE ST 2065-4 - ACES Image Container File Layout

### :fontawesome-solid-file:{ .icons } [ACES with Material Exchange Format (MXF)](https://ieeexplore.ieee.org/servlet/opac?punumber=7748436) 
SMPTE ST 2065-5 - Material Exchange Format — Mapping ACES Image Sequences into the MXF Generic Container

### :fontawesome-solid-file:{ .icons } [ACES with Interoperable Master Format (IMF)](https://ieeexplore.ieee.org/document/8320049) 
SMPTE ST 2067-50 - SMPTE Standard - Interoperable Master Format — Application #5 ACES

### :fontawesome-solid-file:{ .icons } [ADX Image Container (DPX)](https://ieeexplore.ieee.org/servlet/opac?punumber=7291018) 
SMPTE ST 268:2014 – File Format for Digital Moving Picture Exchange (DPX) – Amendment 1

<!-- Page specific styles -->
<style>
    [data-md-color-scheme="aces-light"] { --md-typeset-a-color: #OOOOOO;}
    [data-md-color-scheme="slate"] { --md-typeset-a-color: #FFFFFF;}
    .icons { color: #e0b700; scale: 0.9; position: relative; top: 2px;} 
    .new-icons { color: #e0b700; scale: 1.3; position: relative; top: 2px; left: 5px;} 
    p { position: relative; top: -10px;}
    .md-sidebar--secondary .md-nav__list .md-nav__list {display: none}
</style>

<!-- Include acronyms-->
--8<-- "mkdocs/includes/acronyms.md"


