<!-- SPDX-License-Identifier: CC-BY-4.0 -->
<!-- Copyright Contributors to the ACES Documentation -->


Notes for Implementers
======================


What Transforms Are In 2.0?
---------------------------
The [`aces-output` repository](https://github.com/ampas/aces-output) provides a number of high-level CTL files where the only difference is the filename and preset values to produce an output for display on devices calibrated to common display standards. The default transforms provided by the Academy are expected to cover most present-day deliverable needs, but do not attempt to support all possible permutations of parameters. To do so would make the list of transforms inordinately long (and the number of transforms provided as pre-sets is already quite large).

All Output Transforms utilize the same core algorithm to render scene-referred ACES to an output-referred image. Examination of an Output Transform CTL file will reveal the conceptual split between the Rendering Transform and Display Encoding. These two operators are concatenated in a single CTL file for convenience, but in implementations, it may be desirable to maintain the split into two steps to help reduce the number of permutations. 

For users to fully utilize ACES, they must be able to access the transforms needed for their given situation. However, for ACES to be easy to use, the user must not be overwhelmed with menus that have hundreds of different transforms. Hence product designers must somehow find a way to make their implementations both complete and yet easy to use.

Fundamentally, there are two main decisions to be made by the user: 

1.  **Rendering Target:** How should the image look?

    This choice would also include the decision of a creative white (i.e. D60 vs D65).
    
    *Example: 1000-nit P3-D65*

2. **Display Device:** What device is being used to view the images?

    *Example: 1000-nit P3-D65 display set to ST-2084 (PQ)*

Thus, instead of requiring the user to select a lenghty name from a long list with $M \times N$ choices, the user is able to make two separate choices, each from a much shorter set of options (of length $M$ and $N$, respectively). When combined, the two options together will produce the same final result as the combined form presented in the preset CTL Output Transforms.

!!! example
    A transform labeled `Rec709-D65_100nit_as_Rec709-D65_BT1886` would be a typical 100-nit SDR video rendering intended for display on standard Rec.709 video monitor (Rec.709 / BT.1886). <br>
    A different transform, `Rec709-D65_100nit_as_Rec2100-D65_ST2084`, renders to the same target gamut. The only difference is the rendered Rec.709 colorimetry from this transform is encoded differently so that it appears the same on a display with a different setup (i.e. the RGB is encoded relative to the Rec.2100 primaries and using the PQ encoding function).

!!! note
    In OpenColorIO, the "rendering target" (1) is referred to as the "View", and the "display device" (2) is the "Display".


Which Transforms Should Implementers Implement?
----------------------------------------------
The set of presets in `aces-output` defines the minimal set of rendering transforms that should be made available to a user. Therefore, the same transforms will be available to users across different software applications and compatibility will be maintained without needing to pass around additional files.

Users should be able to adjust parameters beyond those in the presets. It is recommended, if your software supports it, to port the core algorithm. Therefore, you too can call a single algorithm with parameters that match the user's settings.

If your implementation can not port the core algorithms and instead leverages pre-computed LUTs for each of the presets, then you should provide a method and instructions for how a user can add a new custom LUT generated externally from the CTL or other tool that supports customizing the parameters.


<!-- In ACES 2.0
-----------

#### Preset Rendering Transforms
The limiting gamuts and peak luminance combinations that are provided as presets include:

| Target Gamut | Target Luminance |
| ------------ | ---------------- |
| Rec.709 | 48/100 nit |
| P3 | 48/100 nit |
| P3 | 108 nit |
| P3 | 300 nit |
| P3 | 500 nit |
| P3 | 1000 nit |
| P3 | 2000 nit |
| P3 | 4000 nit |
| Rec.2020 | 500 nit |
| Rec.2020 | 1000 nit |
| Rec.2020 | 2000 nit |
| Rec.2020 | 4000 nit |

Each of the above are also provided two different preset creative white points: 

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

Other outputs and presets can be added if and when the need arises. -->