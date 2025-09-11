<!-- SPDX-License-Identifier: CC-BY-4.0 -->
<!-- Copyright Contributors to the ACES Documentation -->


Overview of Output Transform Structure
======================================

Overall Structure
---------
The Output Transform is a concatenation of two separate submodules, the "Rendering Transform" and the "Display Encoding Transform" ([Figure 1](#output-transform-structure)). 

The Rendering Transform determines the image appearance, and is informed by the luminance of peak white as well as the limiting gamut (primaries and white point). 

The Display Encoding Transform's role is to simply encodee the colorimetry produced by the Rendering Transform so that it is displayed as intended according to the device configuration (i.e. display primaries, calibrated white point, EOTF).

<a name="output-transform-structure"></a>
``` mermaid
flowchart LR
  id1((("ACES
  2065-1")))-->id2{{"Rendering
  Transform"}}
  subgraph box1 ["Output Transform"]
    id2 -->|"CIE
    XYZ"|id3["Display
    Encoding"]
    end
  id3 -->|"Code
    values"|id4(Display)
```
<figcaption markdown>**Figure 1:** The two main submodules of an Output Transform.</figcaption>


Rendering Transform Structure
-----------------------------

The Rendering Transform portion of the Output Transform follows a progression as seen in [Figure 2](#rendering-transform-structure)

<a name="rendering-transform-structure"></a>
``` mermaid
flowchart LR
  B[ACES 
  to 
  JMh]
  C["Tonescale 
  (J Only)"]
  D["Chroma 
  Compression 
  (M Only)"]
  E["Gamut 
  Compression 
  (J & M)"]
  F[JMh to
  Limiting RGB]
  subgraph box1 ["Rendering Transform"]
    direction LR
    B --> C --> D --> E --> F
    end;
```
<figcaption markdown>**Figure 2:** The main processing modules in the Rendering Transform.</figcaption>


The Rendering Transform applies tone-mapping and adjusts colorfulness based on the luminance and boundaries defined by the choice of target rendering gamut. 

The Rendering Transform operates in a "JMh" color correlate space derived using a simplified version of the [Hellwig 2022](https://doi.org/10.1002/col.22792) Color Appearance Model (CAM). In the JMh color space, **J** correlates to lightness, **M** is colorfulness, and **h** is hue.

Operating in this JMh space allows the rendering to meet the design requirements established for ACES 2, including hue preservation and achieving a better "match" between outputs. Applying the tone-mapping to only the J component and adjusting M independently allows for the hue of the original ACES value to be maintained into the rendering space and on to the display.


Combined Steps
--------------

Each step is explained thoroughly on its own page.

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
```