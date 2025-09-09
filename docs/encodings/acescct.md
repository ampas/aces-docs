---
title: ACEScct Specification
---


ACEScct – A Quasi-Logarithmic Encoding of ACES Data for use within Color Grading Systems
========================================================================================


Introduction 
----------------
The Academy Color Encoding Specification (ACES) defines a common color encoding method using half-precision floating point values corresponding to linear exposure values encoded relative to a fixed set of extended-gamut RGB primaries. Many digital-intermediate color grading systems have been engineered assuming image data with primaries similar to the grading display and a logarithmic relationship between relative scene exposures and image code values.

This document describes a 32-bit single precision floating-point logarithm encoding of ACES known as ACEScct.

ACEScct uses values above 1.0 and below 0.0 to encode the entire range of ACES values. ACEScct values should not be clamped except as part of color correction needed to produce a desired artistic intent.

There is no image file container format specified for use with ACEScct as the encoding is intended to be transient and internal to software or hardware systems, and is specifically not intended for interchange or archiving.

For ACES values greater than 0.0078125, the ACEScct encoding function is identical to the pure-log encoding function of ACEScc. Below this point, the addition of a ”toe” results in a more distinct ”milking” or ”fogging” of shadows when a lift operation is applied when compared to the same operation applied in ACEScc. This difference in grading behavior is provided in response to colorist requests for behavior more similar to that of traditional legacy log film scan encodings.


Scope
-----
This document describes a 32-bit floating point encoding of ACES for use within color grading systems.

Equivalent functions may be used for implementation purposes as long as correspondence of grading param- eters to this form of log implementation is properly maintained. This document is intended as a guideline to aid developers who are integrating an ACES workflow into a color correction system.


References
----------
The following standards, specifications, articles, presentations, and texts are referenced in this text:

* [ST 2065-1:2021 - SMPTE Standard - Academy Color Encoding Specification (ACES)](https://doi.org/10.5594/SMPTE.ST2065-1.2021)
* [RP 177:1993 - SMPTE Recommended Practice - Derivation of Basic Television Color Equations](https://doi.org/10.5594/SMPTE.RP177.1993)
* [754-2019 - IEEE Standard for Floating-Point Arithmetic](https://ieeexplore.ieee.org/document/8766229)


Specification
-------------

### Naming conventions
The quasi-logarithmic encoding of ACES specified in this document shall be known as ACEScct.

### Color component value encoding
ACEScct values are encoded as 32-bit floating-point numbers. This floating-point encoding uses 32 bits per component as described in IEEE 754.

### Color space chromaticities {#color-space}
ACEScct uses a different set of primaries than ACES RGB primaries defined in SMPTE ST 2065-1. The CIE 1931 colorimetry of the ACEScct RGB primaries and white are specified below.

#### Color primaries
The chromaticity values of the RGB primaries (known as AP1) shall be those found below:

<div align="center" markdown>
|       | **R** | **G** | **B** |   | **CIE x** | **CIE y** |
|-------|-------|-------|-------|---|-----------|-----------|
| Red   |  1.0  |  0.0  |  0.0  |   |   0.713   |   0.293   |
| Green |  0.0  |  1.0  |  0.0  |   |   0.165   |   0.830   |
| Blue  |  0.0  |  0.0  |  1.0  |   |   0.128   |   0.044   |
</div>

<figcaption align="center">
    ACEScct RGB primaries chromaticity values
</figcaption> 

#### White point
The white point shall be:

<div align="center" markdown>
|       | **R** | **G** | **B** |   | **CIE x** | **CIE y** |
|-------|-------|-------|-------|---|-----------|-----------|
| White |  1.0  |  1.0  |  1.0  |   |  0.32168  |  0.33767  |
</div>

<figcaption align="center">
    ACEScct RGB white point chromaticity values
</figcaption>

### ACEScct {#acescct}
The following functions shall be used to convert between ACES values, encoded according to SMPTE ST 2065-1, and ACEScct.

#### Encoding Function
ACES $R$, $G$, and $B$ values shall be converted to $lin_{AP1}$ $R$, $G$, and $B$ values using the transformation matrix ($TRA_1$) calculated and applied using the methods provided in Section 4 of SMPTE RP 177:1993.

$lin_{AP1}$ $R$, $G$, and $B$ values shall be converted to ACEScct values according to [Equation 1](#eq-1).

<a name="eq-1"></a>

\begin{equation} 
    ACEScct = \left\{ 
    \begin{array}{l l }
        10.5402377416545 \times lin_{AP1} + 0.0729055341958355;    & \quad lin_{AP1} \leq 0.0078125 \\[10pt]
        \dfrac{\log_{2}(lin_{AP1}) + 9.72}{17.52}; & \quad lin_{AP1} > 0.0078125 \\    
    \end{array} \right.
\end{equation}

<figcaption align="center">
    <b>Equation 1:</b> Linear AP1 to ACEScct
</figcaption>

!!! note
	[Equation 2](#eq-2) shows the relationship between ACES $R$, $G$, and $B$ values and $lin_{AP1}$ $R$, $G$, and $B$ values. $TRA_{1}$, rounded to 10 significant digits, is derived from the product of $NPM_{AP1}$ inverse and $NPM_{AP0}$ calculated using methods provided in Section 3.3 of SMPTE RP 177:1993.<br>
	AP0 are the primaries of ACES specified in SMPTE ST 2065-1.<br>
	AP1 are the primaries of ACEScct specified in [Color space chromaticities](#color-space).

	<a name="eq-2"></a>

	\begin{equation} 
	\begin{bmatrix}
		R_{lin_{AP1}}\\
		G_{lin_{AP1}}\\
		B_{lin_{AP1}}
	\end{bmatrix}
	=
	TRA_{1}
	\cdot
	\begin{bmatrix}
		R_{ACES}\\
		G_{ACES}\\
		B_{ACES}
	\end{bmatrix} \\
	\end{equation}

	\begin{equation}
	TRA_{1} =
	\begin{bmatrix}
		\phantom{-}1.4514393161 & -0.2365107469 & -0.2149285693 \\
	   -0.0765537734 &  \phantom{-}1.1762296998 & -0.0996759264 \\
		\phantom{-}0.0083161484 & -0.0060324498 &  \phantom{-}0.9977163014 \\
	\end{bmatrix} \\
	\end{equation}

	\begin{equation}
	TRA_{1} = NPM^{-1}_{AP1} \cdot NPM_{AP0}
	\end{equation}

	<figcaption align="center"> 
		<b>Equation 2:</b> ACES to linear AP1
	</figcaption>

#### Decoding Function
ACEScct $R$, $G$, and $B$ values shall be converted to $lin_{AP1}$ values using [Equation 3](#eq-3).

<a name="eq-3"></a>

\begin{equation}
    lin_{AP1} = \left\{ 
    \begin{aligned}
        &\dfrac{\left(ACEScct-0.0729055341958355\right)}{10.5402377416545};& ACEScct& \leq 0.155251141552511 \\[10pt]
        &2^{(ACEScct \times 17.52-9.72)}; &0.155251141552511 \leq ACEScct& < \dfrac{\log_{2}(65504)+9.72}{17.52} \\[10pt]
        &65504; & ACEScct& \geq \dfrac{\log_{2}(65504)+9.72}{17.52} \\    
    \end{aligned} \right.
\end{equation}

<figcaption align="center">
    <b>Equation 3:</b> ACEScct to linear AP1
</figcaption>

$lin_{AP1}$ $R$, $G$, and $B$ values shall be converted to ACES $R$, $G$, and $B$ values using the transformation matrix ($TRA_{2}$) calculated and applied using the methods provided in Section 4 of SMPTE RP 177:1993.

!!! note
	[Equation 4](#eq-4) shows the relationship between ACES $R$, $G$, and $B$ values and ACEScct $R$, $G$, and $B$ values. $TRA_{2}$, rounded to 10 significant digits, is derived from the product of $NPM_{AP0}$ inverse and $NPM_{AP1}$ calculated using methods provided in Section 3.3 of SMPTE RP 177:1993.<br>
	AP0 are the primaries of ACES specified in SMPTE ST 2065-1.<br>
	AP1 are the primaries of ACEScct specified in [Color space chromaticities](#color-space).

	<a name="eq-4"></a>

	\begin{equation} 
		\begin{bmatrix}
			R_{ACES}\\
			G_{ACES}\\
			B_{ACES}
		\end{bmatrix}
		=
		TRA_{2}
		\cdot
		\begin{bmatrix}
			R_{lin_{AP1}}\\
			G_{lin_{AP1}}\\
			B_{lin_{AP1}}
		\end{bmatrix}
	\end{equation}

	\begin{equation}
		TRA_{2} =
		\begin{bmatrix}
			\phantom{-}0.6954522414 & 0.1406786965 & 0.1638690622 \\
			\phantom{-}0.0447945634 & 0.8596711185 & 0.0955343182 \\
			-0.0055258826 & 0.0040252103 & 1.0015006723 \\
		\end{bmatrix}
	\end{equation}

	\begin{equation}
		TRA_{2} = NPM^{-1}_{AP0} \cdot NPM_{AP1}
	\end{equation}

	<figcaption align="center">
		<b>Equation 4:</b> Linear AP1 to ACES
	</figcaption>


Appendices
----------


### Appendix A: Application of ASC CDL parameters to ACEScct image data

American Society of Cinematographers Color Decision List (ASC CDL) slope, offset, power, and saturation modifiers can be applied directly to ACEScct image data. To preserve the extended range of ACEScct values, no limiting function should be applied with ASC CDL parameters. The power function, however, should not be applied to any negative ACEScct values after slope and offset are applied. Slope, offset, and power are applied with the following function.

!!! note
    ACEScct is not compatible with ASC CDL values generated on-set using the ACESproxy encoding. If there is a need to reproduce a look generated on-set where ACESproxy was used, ACEScc must be used in the dailies and/or DI environment to achieve a match.

\begin{equation}
    ACEScct_{out} = \left\{ 
    \begin{array}{l r }
        ACEScct_{in} \times slope + offset; & \quad ACEScct_{slopeoffset} \leq 0 \\
        (ACEScct_{in} \times slope + offset)^{power}; & \quad ACEScct_{slopeoffset} > 0 \\
    \end{array} \right. \\ 
\end{equation}

\begin{equation}
    \begin{array}{l}
    \text{Where:}\\
    ACEScct_{slopeoffset} = ACEScct_{in} \times slope + offset
    \end{array}
\end{equation}

ASC CDL Saturation is also applied with no limiting function:

\begin{gather*}
    luma = 0.2126 \times ACEScct_{red} + 0.7152 \times ACEScct_{green} + 0.0722 \times ACEScct_{blue} \\
    \begin{aligned}
        ACEScct_{red} &= luma + saturation \times (ACEScct_{red} - luma) \\
        ACEScct_{green} &= luma + saturation \times (ACEScct_{green} - luma) \\        
        ACEScct_{blue} &= luma + saturation \times (ACEScct_{blue} - luma) \\ 
    \end{aligned}
\end{gather*}




<!-- Include section numbering -->
<style>
    @import "../../../stylesheets/sections.css"
</style>