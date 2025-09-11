<!-- SPDX-License-Identifier: CC-BY-4.0 -->
<!-- Copyright Contributors to the ACES Documentation -->


ACES 2 Presets
==============

The reference Output Transforms provided in CTL support a number of gamuts, white points, luminances, and display configurations.

## Rendering Transform Presets

### Color Primaries and Peak Luminance
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

### Creative white point
Each of the above are also provided two different preset creative white points: 

  * D65 white
  * ACES (~D60) white


## Display Encoding Transform Presets
The encoding gamut is defined with (x,y) chromaticities for red, green, blue and white. 

### Color Primaries
The preset display gamuts are as follows:

  * Rec.709 / sRGB
  * P3
  * Rec.2100
  * XYZ

### Inverse EOTF
The inverse EOTF is defined via a functional definition of the EOTF$^{-1}$.

In the CTL, the EOTF$^{-1}$ options are selected with enum values:

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