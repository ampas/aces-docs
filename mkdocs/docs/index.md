ACES Documentation
================

System Documentation
----------------

### [:fontawesome-solid-arrow-down-wide-short:{ .icons } Project Organization and Development Procedure](https://www.dropbox.com/s/0bew0bf4otq77fd/P-2019-001.pdf?dl=0)
Provides details on the organizational and decision making structure to be used in the development of the ACES.

### [:fontawesome-solid-arrow-down-1-9:{ .icons } Versioning System](https://www.dropbox.com/s/cnrak5pvu4agfk4/S-2014-002.pdf?dl=0)
Describes versioning numbers and format of TransformIDs for components the ACES system.

### [:fontawesome-solid-desktop:{ .icons } UX Guidelines](https://www.dropbox.com/s/v5tghz6wl2629nf/TB-2014-002.pdf?dl=0)
Provides guidelines on how best to present ACES terminology and concepts within products to end-users.

### [:fontawesome-solid-glasses:{ .icons } Alternate Viewing Pipeline](https://www.dropbox.com/s/psq88v9fkt61bl4/TB-2014-013.pdf?dl=0)
Describes an alternate approach to implementing and presenting the ACES viewing pipeline.

### [:fontawesome-solid-file-arrow-down:{ .icons } ACES White Point Derivation](tb/white-point)
Describes the derivation of the ACES white point and why the chromaticity coordinates were chosen.


--------------

System Components
----------------

### [:fontawesome-solid-arrow-down-a-z:{ .icons } Component Names](tb/component-names/)
Describes preferred terminology for key ACES component names for ACES 1.0.

### [:fontawesome-solid-file-export:{ .icons } Input Transforms (IDTs)](https://www.dropbox.com/s/ouwnid1aevqti5d/P-2013-001.pdf?dl=0)
Describes methods to create Input Transforms (IDTs) for use within ACES.

### [:fontawesome-solid-fill-drip:{ .icons } Look Modification Transforms](tb/lmt/)
Describes the design, integration and use of Look Modification Transforms.

### [:fontawesome-solid-file-code:{ .icons } Reference Gamut Compression Specification](specifications/rgc/)
Specifies a Look Transform to bring pixel values within AP1.

### [:material-arrow-collapse:{ .icons } Reference Gamut Compression User Guide](guides/rgc-user/)
Describes suggested user workflows for on set, dailies, visual effects, and finishing using the ACES Reference Gamut Compression (RGC)

### [:fontawesome-solid-file-code:{ .icons } Reference Gamut Compression Implementation Guide](guides/rgc-implementation/)
Implementation guidelines related to the usage of the Reference Gamut Compression.

### [:fontawesome-solid-file-code:{ .icons } Common LUT Format (CLF) Specification](specifications/clf/)
Specifies a flexible XML-based file format for color Look-Up Tables (LUTs) and other basic image operators.

### [:fontawesome-solid-file-code:{ .icons } Common LUT Format (CLF) Implementation Guide](guides/clf/)
Implementation guidelines related to the usage of the Common LUT Format.

### [:fontawesome-solid-file-code:{ .icons } ACES Metadata File (AMF) Specification](https://www.dropbox.com/s/4phjfkae2gykctt/S-2019-001.pdf?dl=0)
Specifies a ‘sidecar’ XML file intended to exchange the metadata required to recreate ACES viewing pipelines.

### [:fontawesome-solid-file-code:{ .icons } ACES Metadata File (AMF) Implementation Guidelines and Best Practices](guides/amf/)
Implementation guidelines and best practices related to the usage of the ACES Metadata File (AMF) in various workflows


----------------

ACES Encodings
----------------

### [:fontawesome-solid-file-contract:{ .icons } ACES 2065-1](#aces-2065) 
Specifies ACES, the fundamental colorimetric encoding in the Academy Color Encoding System. <br>
[*See SMPTE ST 2065-1*](#aces-2065)

### [:fontawesome-solid-file-contract:{ .icons } ACEScg](/specifications/acescg/)
Defines a colorimetric encoding appropriate as a working space for use in CGI tools such as compositors, paint and rendering systems.

### [:fontawesome-solid-file-contract:{ .icons } ACEScct](/specifications/acescct/)
Defines a logarithmic colorimetric encoding more appropriate for legacy color correction operators.

### [:fontawesome-solid-file-contract:{ .icons } ACEScc](/specifications/acescc/)
Defines a logarithmic colorimetric encoding appropriate for legacy color correction operators.

### [:fontawesome-solid-file-contract:{ .icons } ACESproxy](/specifications/acesproxy/)
Defines an integer logarithmic colorimetric encoding appropriate for on-set preview and on-set look management applications.

----------------

Informative Notes (legacy documents)
----------------

SMPTE standards supercede these legacy documents and links to purchase the standards are included in the [next section](#smpte).

Some informative notes on some of the ACES-related SMPTE standards are provided via Technical Bulletins. In most cases, these include the original Academy documents that were modified into the SMPTE standards documents.


### [:fontawesome-solid-circle-info:{ .icons } Academy Color Encoding Specification (ACES)](https://www.dropbox.com/s/0xhva7vniipx3zk/TB-2014-004.pdf?dl=0)
Provides background and contextual information on SMPTE ST 2065-1:2012.

### [:fontawesome-solid-circle-info:{ .icons } ACES Image Container File (OpenEXR)](https://www.dropbox.com/s/wr9swdgarlu4icq/TB-2014-006.pdf?dl=0)
Provides background and contextual information on SMPTE ST 2065-4:2013.

### [:fontawesome-solid-circle-info:{ .icons } ADX Image Container File (DPX)](https://www.dropbox.com/s/xop52a5nyq164to/TB-2014-007.pdf?dl=0)
Provides background and contextual information on SMPTE ST 268:2003 Am1:2012.

### [:fontawesome-solid-circle-info:{ .icons } APD and ADX](https://www.dropbox.com/s/3fbg5su99fpsvpl/TB-2014-005.pdf?dl=0) 
Provides background and contextual information related to SMPTE ST 2065-2:2012 and SMPTE ST 2065-3:2012.

----------------

SMPTE Standards   {#smpte}
----------------

Below are the ACES-related standards documents published through SMPTE to date. Those wishing to implement ACES should adhere to the SMPTE standards. These must be purchased in order to view.

### [:fontawesome-solid-file:{ .icons } SMPTE ST 2065-1 - Academy Color Encoding Specification](https://doi.org/10.5594/SMPTE.ST2065-1.2021) {#aces-2065}

### [:fontawesome-solid-file:{ .icons } SMPTE ST 2065-2 - Academy Printing Density (APD) — Spectral Responsivities, Reference Measurement Device and Spectral Calculation](https://doi.org/10.5594/SMPTE.ST2065-2.2020)

### [:fontawesome-solid-file:{ .icons } SMPTE ST 2065-3 - Academy Density Exchange Encoding (ADX) — Encoding Academy Printing Density (APD) Values](https://doi.org/10.5594/SMPTE.ST2065-3.2020)

### [:fontawesome-solid-file:{ .icons } SMPTE ST 2065-4 - ACES Image Container File Layout](https://doi.org/10.5594/SMPTE.ST2065-4.2013)

### [:fontawesome-solid-file:{ .icons } SMPTE ST 2065-5 - Material Exchange Format — Mapping ACES Image Sequences into the MXF Generic Container](https://doi.org/10.5594/SMPTE.ST2065-5.2016)

### [:fontawesome-solid-file:{ .icons } SMPTE ST 2067-50 - SMPTE Standard - Interoperable Master Format — Application #5 ACES](https://doi.org/10.5594/SMPTE.ST2067-50.2018)

### [:fontawesome-solid-file:{ .icons } SMPTE ST 268:2014 – File Format for Digital Moving Picture Exchange (DPX) – Amendment 1](https://doi.org/10.5594/SMPTE.ST268.2003Am1.2012)


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


