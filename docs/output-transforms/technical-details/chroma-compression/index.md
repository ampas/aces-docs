Chroma Compression
==================

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
  style D stroke-width:4px
```

### Introduction

Chroma Compression is a hue-preserving invertible photographic colour rendering technique developed for the ACES 2.0 Output Transforms, based on a modified Hellwig 2022 Colour Appearance Model (CAM). It uses the following perceptual correlates:

* J - perceived lightness
* M - perceived colourfulness
* h - perceived hue

The purpose of the Chroma Compression, together with the tonescale, is to create the photographic base look for the transforms.  Throughout the chroma compression the hue remains constant.

The Chroma Compression has the following goals:

* Provide saturation roll-off in the highlight

The chroma compression has two main steps:

* Rescaling of M
* In-gamut compression of M

### Rescaling of M

After the tonescale has compressed J to the target display peak luminance, the M correlate must also be rescaled or compressed down to the same range. This is done by using the $\frac{1}{cz}$ exponent defined in Hellwig2022 model in order maintain the correct M to J ratio. Maintaining the correct ratio keeps the chromaticities constant. The rescaling method is the following:

$$
M_s = M\cdot\left(\frac{J_{t}}{J}\right)^{\frac{1}{cz}}
$$

and its inverse:

$$
M = M_s\cdot\left(\frac{J_{t}}{J}\right)^{-\frac{1}{cz}}
$$

where,

$J_t$ is the tonescale compressed J
$J$ is the original J correlate
$c$ and $z$ are constants defined in the Hellwig2022 model

### In-gamut compression of M

The in-gamut compression step creates the main photographic colour rendering.   This step is a non-linear expansion and compression of M over both the J axis and M axis. That is, the amount of expansion and compression depends on both J and M.  Compression increases as J values increase, and reduces as M values increase. In other words, shadows are compressed less than highlights, and less saturated colours are compressed more than pure colours.

The limiting display gamut boundary is not taken into consideration.  All out of gamut colors will be mapped into the limiting gamut later by the gamut mapper.  The in-gamut compression mostly affects the interior of the gamut.

The in-gamut compression has the following steps:

* Normalization of M to AP1 as a maximum limit
* Expansion of M for shadows and mid-tones within AP1
* Compression of M within AP1

#### A toe function

At the heart of the in-gamut compression and expansion is an invertible “toe” function ([https://www.desmos.com/calculator/6vplvw14ti](https://www.desmos.com/calculator/6vplvw14ti)). The toe in the function will compress less saturated colors more than more saturated colors, and the size and shape of the toe will determine the aggressiveness of the compression.

In the forward direction the function performs compression. To perform expansion the function is driven in reverse. The expansion will expand less saturated colors less than more saturated colors.

Forward direction:

$$
toe(x, limit, c_1, c_2) = \frac{k_3 x - k_1+\sqrt{(k_3 x - k_1)^{2}+4k_2 k_3 x}}{2}
$$

and its reverse:

$$
toe_r(x, limit, c_1, c_2) = limit - toe(limit - x, limit - 0.001, c_1, c_2)
$$

Inverse direction:

$$
toe_{inv}(x, limit, c_1, c_2) = \frac{x^{2}+k_{1}x}{k_{3}\left(x+k_{2}\right)}
$$

and its reverse:

$$
toe_{invr}(x, limit, c_1, c_2) = limit - toe_{inv}(limit - x, limit - 0.001, c_1, c_2)
$$

where,

$$
k_{1}=\sqrt{c_1^{2}+k_{2}^{2}}
$$

$$
k_{2}=max(c_2, 0.001)
$$

$$
k_{3}=\frac{limit+k_{1}}{limit+k_{2}}
$$

The function is driven with three external parameters $limit$, $c_1$ and $c_2$ defined below.

#### Normalization of M to AP1

The purpose of the normalization step is to establish the maximum compression and expansion limit as a normalized distance, and to normalize the M value with AP1 gamut cusp to make the operations hue-dependent .

The maximum distance is limited to AP1.  That is, the compression and expansion will not affect M values beyond what would be AP1 in chromaticity space.  Values outside AP1 will later be clipped by the transform.  The limit value is calculated as follows:

$$
limit = J_{t}^{\frac{1}{cz}}\cdot\frac{AP1ReachM[h]}{AP1CuspM[h]}
$$

where,

$AP1ReachM$ is a hue dependent lookup table of AP1 M values at $J_{max}$
$AP1CuspM$ is a hue dependent lookup table of AP1 gamut cusp M values

The normalization of M with the AP1 gamut cusp M makes the compression and expansion operations hue dependent, so that different hues would be affected different amounts.  The normalization is done as follows:

$$
M_n =\frac{M}{AP1CuspM[h]}
$$

The compression and expansion is then performed using the normalized M and the calculated limit, described in the sections below.

After completing the operations the M is denormalized as follows:

$$
M =M_n\cdot{AP1CuspM[h]}
$$

The denormalization is the final step of the chroma compression and the transform moves on to the gamut mapping stage.

#### Expansion of M

The expansion step was found to be crucial to bring “life” into the image. After the rescaling step the colors come out dull in the mid-tones and shadows are very desaturated. The expansion step increases saturation in the shadows and mid-tones but not in the highlights.

The expansion applies the toe function in *reverse direction* with the following parameters:

$$
c_1 = saturation\cdot(1.0-\frac{J_{t}}{J_{max}})
$$

$$
c_2 = \sqrt{\frac{J_{t}}{J_{max}}^{2}+threshold}
$$

The $saturation$ parameter defines how aggressive the expansion is.  It scales down based on higher peak luminance for better appearance match with different displays.  It scales down because the model naturally gets more colorful with higher peak luminance.

The $threshold$ parameter is used to reduce expansion of noise by making the toe of the toe function less aggressive near black. It also scales down  because deep shadows get more desaturated with higher peak luminance.  As of CAM DRT v053 they are defined as follows:

$$
expand = 1.65
$$

$$
saturation= max(0.15,  expand - expand * 0.78 *  \log_{10}\left(\frac{L_{peak}}{100}\right))
$$

$$
threshold = \frac{0.5}{L_{peak}}
$$

#### Compression of M

The compression step creates the saturation roll-off in the highlights. It compresses less saturated colors more and more saturated colors less, preserving pure colors from compression. The compression affects highlights and mid-tones and does not compress shadows.

The compression applies the toe function in *forward direction* with the following parameters:

$$
c_1 =compression\cdot \frac{J_{t}}{J_{max}}
$$

$$
c_2 = 1.0-\frac{J_{t}}{J_{max}}
$$

The $compression$ parameter defines how aggressive the compression is. The parameter scales up based on higher peak luminance for better appearance match with different displays.  As of CAM DRT v053, it is defined as follows with an adjustable variable $compr$:

$$
compr = 3.5
$$

$$
compression = compr+ compr * 5.0 * \log_{10}\left(\frac{L_{peak}}{100}\right)
$$

#### Inverse of chroma compression

The chroma compression is fully invertible by applying the same set of operations described above but in reverse order and in inverse direction.