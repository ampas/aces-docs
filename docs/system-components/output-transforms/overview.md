Overview
========


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



Implementers

Which Transforms Do We Need to Support?

That's up to you



Minimal set of rendering transforms to implement
These are the same rendering transform but only the display encoding is different

If you enumerate pre-computed LUTs at varous peak luminances, then you should provide a provisiion for a user to add a custom LUT generated externally.
