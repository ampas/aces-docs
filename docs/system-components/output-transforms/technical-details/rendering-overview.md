Overview of Output Transfroms in ACES 2
========


ACES 2
------
 The ACES 2 Output Transform is applied using a simplified version of the [Hellwig 2022](https://doi.org/10.1002/col.22792) Color Appearance Model (CAM). Like most CAMs, the model helps produce a number of different color correlates. Three specific correlates are used for the purposes of applying the display rendering of the ACES 2.0 Output Transform, specifically:

- **J** : perceived lightness
- **M** : perceived colorfulness
- **h** : perceived hue


Looking inside the Output Transform one can see a conceptual split between the target rendering or limiting gamut and the display encoding to prepare the intended colorimetry for a particular display. This is intentional and there are distinct benefits to maintaining this segmentation when porting the CTL to native implmentations. Let's explore.

ACES 2 also includes the choice of the adapted white point (creative white) as part of the target rendering. This defines what chromaticity is assumed as the "neutral" white point for an observer. 



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
