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

The display encoding step prepares colorimetry from the rendering portion of the Output Transform so that it will produce the expected result after the signal is decoded by a display. 

Colorimetry is encoded relative to the configured color gamut (i.e. color primaries and white chromaticity) of the display and using the inverse EOTF.

## Primaries and White Chromaticities
[Placeholder: Charts with various display primary sets]

## Inverse EOTF

