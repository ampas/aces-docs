Display Encoding
========

``` mermaid
flowchart LR
  A("ACES 
  RGB 
  Input") --> 
  B[ACES 
  to 
  JMh] --> 
  C["Tonescale 
  (J Only)"] --> 
  D["Chroma 
  Compression 
  (M Only)"] --> 
  E["Gamut 
  Compression 
  (J & M)"] --> 
  H["White
  Limiting"] --> 
  F["Display 
  Encoding"] --> 
  G(Display 
  RGB 
  Output);
  style F stroke-width:4px
```

## Overview

The display encoding step prepare the colorimetry from the rendering portion of the Output Transform for the expected decoding operators of a given display. Colorimetry is encoded relative to the selected color gamut (i.e. color primaries and white chromaticity) of the display and using the inverse EOTF.

## Primaries and White Chromaticities
[Graphics of primaries]

## Inverse EOTF
