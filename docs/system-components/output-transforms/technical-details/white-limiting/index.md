White Limiting
==============

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
  style H stroke-width:4px
```

When a device is calibrated to a white point chromaticity different from the chromaticity of the creative white, an issue can arise from the steps required to make encode the RGB values such that when sent to the display, the intended colorimetry is produced. 

For example, in order to produce an ACES white (~D60) on a display device calibrated to D65, the red channel must be higher than the red channel will be higher than green and blue in order to compensate for the "cooler" D65 white. Without white limiting, as a neutral value approaches the device maximum, the red channel will "hit the roof" first and clip, resulting in a chromaticity shift as the green and blue channels continue to increase. 

To avoid a chromaticity shift as channels clip at different points, a slight scale factor is applied to all three channels to reduce the largest channel to "hit the roof" smoothly.

[Placeholder: Example graphs to visualize the behavior with and without the white limiting step applied.]