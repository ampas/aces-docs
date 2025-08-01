Overview
========


What Transforms Are In 2.0?
---------------------------
The Output Transforms all utilize the same core algorithm to render scene-referred ACES to an output-referred image. Output Transforms encapsulate the rendering step (to the rendering target) and the display encoding, e.g. preparing the rendered image for transmission "over-the-wire" to a display. The characteristics of the rendering target and the display encoding are controlled by parameters exposed in the top-level CTL transforms.

In the `aces-output` sub-repository, a number of pre-sets are provided from ACES2065-1 to a state ready for display on devices calibrated to common display standards. The default transforms provided by the Academy are expected to cover most present-day deliverable needs. 

However, the presets do not attempt to support all possible permutations of parameters. To do so would make the list of transforms inordinately long (and the number of transforms provided as pre-sets is already quite large).

Fundamentally, there are two main decisions to be made by the user: 
1. What is the rendering target? (e.g. 1000-nit P3-D65)
2. What device is being used to view the images?

``` Note
    In OCIO, the rendering target (1) is referred to as the "View", and the display device (2) is the "Display".

By splitting the decision-making process into two steps, rather than requiring the user to select from a long list with M x N choices, the user is able to make two separate choices, each from a much shorter set of options (of length M and N). 

Parameters
----------

Peak Luminance




### In ACES 2.0

Looking inside the Output Transform one can see a conceptual split between the target rendering or limiting gamut and the display encoding to prepare the intended colorimetry for a particular display. This is intentional and there are distinct benefits to maintaining this segmentation when porting the CTL to native implmentations. Let's explore.

ACES 2 also includes the choice of the adapted white point (creative white) as part of the target rendering. This defines what chromaticity is assumed as the "neutral" white point for an observer. 


A careful look at the supplied preset Output Transforms will reveal that grouping where the Rendering Transform is identical and the only difference is in the Display Encoding Transform (i.e. how the intended colormetry is encoded for display). Because the steps for the Display Encoding Transform are quite simple relative to the Rendering Transform, it makes sense to segment these as two separate choices.

#### Standard options
Here is a table of each parameter with the preset options that are used at least once. 
Note that any luminance from 100-10000 nits,  Each of these can be set to a value other

#### Preset Rendering Transforms
The limiting gamuts and peak luminance combinations that are provided as presets include:

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

However, each of the above are provided for two different preset creative white points: 
  * D65 white
  * ACES (~D60) white

#### Preset Display Encoding Transforms
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


### Notes to implementers on UI Presentation
If implemented blindly, users would be required to select "the right transform" from a long list of very similar looking but very subtly different names. In many instances the differences between two different outputs are solely in the signal encoding step while the intended rendering appearance is identical. Indeed, some of the presets provided in the `aces-output` respository differ only in what display they are intended to be viewed upon.

For example, a trasnform labeled `Rec709-D65_100nit_as_Rec709-D65_BT1886` would be a typical 100-nit SDR video rendering inteneded for display on a device configured to Rec.709 primaries with the BT.1886 transfer function. Another transform such as `Rec709-D65_100nit_as_Rec2100-D65_ST2084` targets the same rendering characteristics and so would produce a matching rendering. The only difference here is that the intended Rec.709 colorimetry is the display encoding, i.e. the RGB is encoded relative to the Rec.2100 primaries and using the PQ encoding function.

A list of outputs that we believe should be minimally supported are identified on the list, with all parameters that when combined and put into the Output Transform and Display Encoding functions would produce an output as intended for that rendering/device combination.

How you implement the selection of these is up to your team to determine the best was to fit it into your software's color management menus or otherwise.

Another important aspect to consider is that there is a tension between ease-of-use and completeness. On one hand, products should make it possible for users to use any available Output Transform. On the other hand, presenting all the possible permutations of associated with the various parameters in a single list can quickly overwhelm and confuse even the most knowledgeable user.

For users to fully utilize ACES, they must be able to access the transforms needed for their given situation. However, for ACES to be easy to use, the user must not be overwhelmed with menus that have hundreds of different transforms. Hence product designers must somehow find a way to make their implementations both complete and yet easy to use.

### Reducing the number of options 
Once the $M x N$ factorial combinations are a number of preset combinations.

For example, Providing all of the same outputs with a D60 creative white automatically doubles the number of presets. The common workflow would seem to be that a user would decide their creative white point at the start of their show and use transforms with that white point throughout their project's lifetime. Therfore, the D60 and D65 transforms are divided at the top level into their own directories, with the same list of targeted displays for each.
