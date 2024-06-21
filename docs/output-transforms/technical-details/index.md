Overview
========


Introduction
------------
The Output Transform is a display rendering transform essential to consistently and predictably rendering scene-referred ACES2065 image data to a rendered state suitable for display on a particular output device. The Output Transform is applied using a simplified version of the [Hellwig 2022](https://doi.org/10.1002/col.22792) Color Appearance Model (CAM). Like most CAMs, the model helps produce a number of different color correlates. Three specific correlates are used for the purposes of applying the display rendering of the ACES 2.0 Output Transform, specifically:

- **J** : perceived lightness
- **M** : perceived colorfulness
- **h** : perceived hue

### Overview of the rendering steps
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
  F[Display 
  Encoding] --> 
  G(Display 
  RGB 
  Output);
```
<figcaption>The flow of the ACES 2.0 Display Rendering Transform (DRT)</figcaption>

Design Goals
------------
