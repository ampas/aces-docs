Overview
========


Introduction
------------
The Output Transform is a rendering transform essential to consistently and predictably transform scene-referred ACES-2065 image data into a rendered state suitable for display on a specific output device and set of viewing conditions.

The Output Transform is a concatenation of two separate modules, the "rendering transform" and the "display encoding". The rendering transform is informed by luminance of peak white and the limiting primaries and white chromaticities. Independent of the rendering transform is the display encoding, which encodes the colorimetry of the rendered image data according to the display primaries and calibrated white point and the inverse EOTF.

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

!!! note "ACES 1 vs ACES 2 Terminology"
    ACES 1 defined a Reference Rendering Transform and an Output Device Transform. In ACES 1.1 and beyond, the concatenation of the RRT and ODT were designated an Output Transform. The conceptual split between the two modules still existed but in practice, the combination of the two simplified some steps such as tone scale mapping.

    ACES 2 maintains the simpler umbrella term of "Output Transform" as a the name of the overall transformation from scene-linear ACES2065 image data to an output-referred image specifically encoded for display on a device with matching characteristics. 


What Transforms Are In 2.0?
---------------------------
The default transforms provided by the Academy are expected to cover most present-day deliverable needs. 

are provided from ACES2065-1 to a state ready for display on devices calibrated to common display standards. The presets that are provided do not attempt to support all possible combinations of parameters because, A) this would make the list of transforms inordinately long, and B) not all combinations make sense to provide as user options. 

Fundamentally, there are two main decisions to be made by the user: first, what device is being used to display the images; and second, how are the images to be viewed. As is the goal in UX design, the first decision, the display, is something that is intuitively obvious and expected.

By splitting the decision-making process into two steps, rather than requiring the user to select from a long list with M x N choices, they are able to make two separate choices, each from a much shorter set of options (of length M and N). (This is an over-simplification of the system, but hopefully the concept is clear.)

This particular decomposition into Viewing and Display Transforms allows ACES to fit into some color management UX models that are already in common use. For example, OpenColorIO already structures its viewing pipeline into View and Display choices.

All Output Transforms use the same core transform, but with the rendering output driven by a decision of the target color primaries and white point (limiting gamut) and the desired peak luminance of the output image. In the reference code, the display encoding step is contained in a single transform, but it would be completely logical to separate this step.

For a few of these output transforms, the rendering targets are identical and the only difference is in how the intended colormetry is encoded for display. 


### In ACES 2.0

#### Preset Rendering Targets
The limiting gamuts and peak luminances provided are as follows:

  * Rec.709 48/100 nit
  * P3 48/100 nit
  * P3 108 nit
  * P3 300 nit
  * P3 500 nit
  * P3 1000 nit
  * P3 2000 nit
  * P3 4000 nit
  * Rec.2100 500 nit
  * Rec.2100 1000 nit
  * Rec.2100 2000 nit
  * Rec.2100 4000 nit

(Each are provided for D60 and D65)

#### Preset Display Encoding Parameters
The encoding gamut is defined with (x,y) chromaticities for red, green, blue and white. 

The preset display gamuts are as follows:

  * Rec.709 / sRGB
  * P3
  * Rec.2100
  * XYZ

The inverse EOTF is defined via a functional definition of the EOTF$^{-1}$.

In the CTL, the EOTF$^{-1}$ options are selected with enum values, specifically:

<ol start="0">
  <li> Linear</li>
  <li> ST. 2084 (PQ)</li>
  <li> HLG</li>
  <li> Gamma 2.6</li>
  <li> BT.1886 (Gamma 2.4)</li>
  <li> Gamma 2.2</li>
  <li> sRGB IEC 61966-2-1:1999 (sRGB Piecewise)</li>
</ol>

Other outputs and presets can be added if and when the need arises.



``` mermaid
flowchart LR
  id1[/Camera 1/] --> id4["Input 
  Transform"] --> id7(((ACES)))
  id2[/Camera 2/] --> id5["Input 
  Transform"] --> id7
  id3[/CGI/] --> id6["ACEScg
  to
  ACES"] --> id7
  id7 --> id8{{"Output
  Transform"}} 
  id8 --> id9["Display 
  Encoding"] --> id12[/"HDR 
  Video"/]
  id8 --> id10["Display 
  Encoding"] --> id13[/"Cinema 
  Projector"/]
  id8 --> id11["Display 
  Encoding"] --> id14[/"SDR 
  Video"/]
  ;
```


 
 ## ACES 2

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




Implementers

Which Transforms Do We Need to Support?

That's up to you



Minimal set of rendering transforms to implement
These are the same rendering transform but only the display encoding is different

If you enumerate pre-computed LUTs at varous peak luminances, then you should provide a provisiion for a user to add a custom LUT generated externally.
