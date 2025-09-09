Overview
========


What Is An Output Transform?
------------
The Output Transform is essential to consistently and predictably transform scene-referred ACES-2065 image data into a rendered state suitable for display on a specific output device and set of viewing conditions. In other contexts, the equivalent to an Output Transform is sometimes called a rendering transform, viewing transform, or display rendering transform.

ACES supplies a variety of Output Transforms intended to support a wide range of commonly used display devices. These include standard dynamic range digital cinema projectors, broadcast monitors, computer desktop displays, and high dynamic range displays. 


Overall Structure
---------
The Output Transform is a concatenation of two separate submodules, the "Rendering Transform" and the "Display Encoding Transform" ([Figure 1](#output-transform-structure)). The Rendering Transform is informed by the luminance of peak white and the primary chromaticities and white point of the limiting gamut (i.e. the target for the rendering). 

Independent of the Rendering Transform is the Display Encoding Transform, which encodes the colorimetry produced by the Rendering Transform according to the characteristics (display primaries, calibrated white point, EOTF) of the display device on which the rendering will be viewed.

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
<figcaption>**Figure 1:** The two main submodules of an Output Transform.</figcaption>


??? note "ACES 1 vs ACES 2 Terminology"
    ACES 1 defined a Reference Rendering Transform (RRT) and an Output Device Transform (ODT). In ACES 1.1 and beyond, the RRT and ODT were concatenated and designated an Output Transform (RRT+ODT). The combination of the two simplified some steps in the rendering such as the tone scale mapping.

    ACES 2 maintains the simpler umbrella term of "Output Transform" as a the name for the overall transformation from scene-linear ACES data to an output-referred image specifically encoded for display on a specific device. 



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
<figcaption>**Figure 2:** The main processing modules in the Rendering Transform.</figcaption>

The Rendering Transform in ACES 2 applies tone-mapping and adjusts colorfulness based on the luminance and boundaries defined by the choice of target rendering gamut. 

While ACES 1 applied tonemapping directly to AP1 RGB channels, the ACES 2 Rendering Transform translates ACES RGB into an intermediary "JMh" color correlate space derived using a simplified version of the [Hellwig 2022](https://doi.org/10.1002/col.22792) Color Appearance Model (CAM). In the JMh color space, **J** correlates to lightness, **M** is colorfulness, and **h** is hue.

Operating in this JMh space allows the rendering to meet the design requirements established for ACES 2, including hue preservation and achieving a better "match" between outputs. Applying the tone-mapping to only the J component and adjusting M independently allows for the hue of the original ACES value to be maintained into the rendering space and on to the display.



