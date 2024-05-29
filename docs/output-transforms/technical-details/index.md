Overview
========


Introduction
------------
The Output Transform is a display rendering transform essential to consistently and predictably rendering ACES2065-encoded image date to a particular display. The Output Transform is based on a simplified version of the [Hellwig 2022](https://doi.org/10.1002/col.22792) Color Appearance Model (CAM). The Hellwig model represents color using a number of different color correlates, but for the purposes of display rendering in the ACES 2.0 Output Transform, three are used:

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
