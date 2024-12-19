---
title: ACEScc Specification
---


ACEScc – A Quasi-Logarithmic Encoding of ACES Data for use within Color Grading Systems
========================================================================================


Introduction 
----------------
The Academy Color Encoding Specification (ACES) defines a common color encoding method using half- precision floating point values corresponding to linear exposure values encoded relative to a fixed set of extended-gamut RGB primaries. Many digital-intermediate color grading systems have been engineered assuming image data with primaries similar to the grading display and a logarithmic relationship between relative scene exposures and image code values.

This document describes a 32-bit single precision floating-point logarithm encoding of ACES known as ACEScc.

The logarithmic encoding of ACES for use in 10-bit and 12-bit integer systems is known as ACESproxy and is specified in a separate document, “Academy S-2013-001.” ACEScc provides compatibility for color grading systems with on-set look metadata generated using the ACESproxy specification. Both encodings use the same color primaries. ACESproxy has a restricted range of values; the minimum and maximum ACES values that can be represented in ACESproxy correspond to a range between 0.0 and 1.0 of ACEScc encoding. ACEScc, however, uses values above 1.0 and below 0.0 to encode the entire range of ACES values. ACEScc values should not be clamped except as part of color correction needed to produce a desired artistic intent.

There is no image file container format specified for use with ACEScc as the encoding is intended to be transient and internal to software or hardware systems, and is specifically not intended for interchange or archiving.


Scope
-----
This document describes a 32-bit floating point encoding of ACES for use within color grading systems. It is intended to be compatible with on-set look metadata generated from systems using the ACESproxy encodings specified in “Academy S-2013-001.” Equivalent functions may be used for implementation purposes as long as correspondence of grading parameters to this form of log implementation is properly maintained. This document is intended as a guideline to aid developers who are integrating an ACES workflow into a color correction system.


References
----------
The following standards, specifications, articles, presentations, and texts are referenced in this text:

* [Academy S-2013-001 - ACESproxy - An Integer Log Encoding of ACES Data](/specifications/acesproxy/)
* [ST 2065-1:2021 - SMPTE Standard - Academy Color Encoding Specification (ACES)](https://doi.org/10.5594/SMPTE.ST2065-1.2021)
* [RP 177:1993 - SMPTE Recommended Practice - Derivation of Basic Television Color Equations](https://doi.org/10.5594/SMPTE.RP177.1993)
* [754-2019 - IEEE Standard for Floating-Point Arithmetic](https://ieeexplore.ieee.org/document/8766229)


Specification
-------------

### Naming conventions
The logarithmic encoding of ACES specified in this document shall be known as ACEScc.

### Color component value encoding
ACEScc values are encoded as 32-bit floating-point numbers. This floating-point encoding uses 32 bits per component as described in IEEE 754.

### Color space chromaticities {#color-space}
ACEScc uses a different set of primaries than the ACES RGB primaries defined in SMPTE ST 2065-1. The CIE 1931 colorimetry of the ACEScc RGB primaries and white are specified below.

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
    ACEScc RGB primaries chromaticity values
</figcaption> 

#### White point
The white point shall be:

<div align="center" markdown>
|       | **R** | **G** | **B** |   | **CIE x** | **CIE y** |
|-------|-------|-------|-------|---|-----------|-----------|
| White |  1.0  |  1.0  |  1.0  |   |  0.32168  |  0.33767  |
</div>

<figcaption align="center">
    ACEScc RGB white point chromaticity values
</figcaption>

### ACEScc {#acescc}
The following functions shall be used to convert between ACES values, encoded according to SMPTE ST 2065-1, and ACEScc.

#### Encoding Function
ACES $R$, $G$, and $B$ values shall be converted to $lin_{AP1}$ $R$, $G$, and $B$ values using the transformation matrix ($TRA_1$) calculated and applied using the methods provided in Section 4 of SMPTE RP 177:1993.

$lin_{AP1}$ $R$, $G$, and $B$ values shall be converted to ACEScc values according to [Equation 1](#eq-1).

<a name="eq-1"></a>

\begin{equation} 
    ACEScc = \left\{ 
    \begin{array}{l l }
        \dfrac{\log_{2}(2^{-16}) + 9.72}{17.52}; 	& \quad lin_{AP1} \leq 0 \\[10pt]
        \dfrac{\log_{2}(2^{-16} + lin_{AP1} \times 0.5) + 9.72}{17.52}; 	& \quad lin_{AP1} < 2^{-15} \\[10pt]
        \dfrac{\log_{2}(lin_{AP1}) + 9.72}{17.52}; 	& \quad lin_{AP1} \geq 2^{-15} \\    
    \end{array} \right.
\end{equation}

<figcaption align="center">
    <b>Equation 1:</b> Linear AP1 to ACEScc
</figcaption>

!!! note
	[Equation 2](#eq-2) shows the relationship between ACES $R$, $G$, and $B$ values and $lin_{AP1}$ $R$, $G$, and $B$ values. $TRA_{1}$, rounded to 10 significant digits, is derived from the product of $NPM_{AP1}$ inverse and $NPM_{AP0}$ calculated using methods provided in Section 3.3 of SMPTE RP 177:1993.<br>
	AP0 are the primaries of ACES specified in SMPTE ST 2065-1.<br>
	AP1 are the primaries of ACEScc specified in [Color space chromaticities](#color-space).

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

!!! note
	Clipping ACES values below 0 in the above function is not required. Implementers are encouraged to encode negative values or take care when clipping color outside the ACEScc gamut. See [Appendix A](#appendix-A) for details.

#### Decoding Function
ACEScc $R$, $G$, and $B$ values shall be converted to $lin_{AP1}$ values using [Equation 3](#eq-3).

<a name="eq-3"></a>

\begin{equation}
    lin_{AP1} = \left\{ 
    \begin{aligned}
        &\left( 2^{(ACEScc \times 17.52-9.72)} - 2.0^{-16}\right)\times 2.0 ;	& ACEScc& \leq \dfrac{9.72-15}{17.52} \\[10pt]
        &2^{(ACEScc \times 17.52-9.72)}; &	\dfrac{9.72-15}{17.52} \leq ACEScc & < \dfrac{\log_{2}(65504)+9.72}{17.52} \\[10pt]
        &65504; & ACEScc& \geq \dfrac{\log_{2}(65504)+9.72}{17.52} \\    
    \end{aligned} \right.
\end{equation}

<figcaption align="center">
    <b>Equation 3:</b> ACEScc to linear AP1
</figcaption>

$lin_{AP1}$ $R$, $G$, and $B$ values shall be converted to ACES $R$, $G$, and $B$ values using the transformation matrix ($TRA_{2}$) calculated and applied using the methods provided in Section 4 of SMPTE RP 177:1993.

!!! note
	[Equation 4](#eq-4) shows the relationship between ACES $R$, $G$, and $B$ values and ACEScc $R$, $G$, and $B$ values. $TRA_{2}$, rounded to 10 significant digits, is derived from the product of $NPM_{AP0}$ inverse and $NPM_{AP1}$ calculated using methods provided in Section 3.3 of SMPTE RP 177:1993.<br>
	AP0 are the primaries of ACES specified in SMPTE ST 2065-1.<br>
	AP1 are the primaries of ACEScc specified in [Color space chromaticities](#color-space).

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

### Appendix A: Encoding of negative values
Very small ACES scene referred values below 7 1/4 stops below 18% middle gray are encoded as negative ACEScc values. These values should be preserved per the encoding in [ACEScc](#acescc) so that all positive ACES values are maintained.

When ACES values are matrixed into the smaller ACEScc color space, colors outside the ACEScc gamut can generate negative values even before the log encoding. If these values are clipped, a conversion back to ACES will not restore the original colors. A specific method of preserving negative values produced by the transformation matrix has not been defined in part to help ease adoption across various color grading systems that have different capabilities and methods for handling negative values. Clipping these values has been found to have minimal visual impact when viewed through the Reference Rendering Transform (RRT) and an appropriate Output Device Transform (ODT) on currently available display technology. However to preserve creative choice in downstream processing and to provide the highest quality archival master, developers implementing ACEScc encoding are encouraged to adopt a method of preserving negative values so that a conversion from ACES to ACEScc and back can be made lossless. Alternatively, a gamut mapping algorithm may be applied to minimize hue shifts resulting from clipping negative ACEScc values. Specific methods for handling negative values may be added to the ACEScc specification in the future.



### Appendix B: Application of ASC CDL parameters to ACEScc image data

American Society of Cinematographers Color Decision List (ASC CDL) slope, offset, power, and saturation modifiers can be applied directly to ACEScc image data. ASC CDL color grades created on-set with ACESproxy images per the ACESproxy specification will reproduce the same look when applied to ACEScc images. ACEScc images however arent limited to the ACESproxy range. To preserve the extended range of ACEScc values, no limiting function should be applied with ASC CDL parameters. The power function, however, should not be applied to any negative ACEScc values after slope and offset are applied. Slope, offset, and power are applied with the following function.


\begin{equation}
    ACEScc_{out} = \left\{ 
    \begin{array}{l r }
        ACEScc_{in} \times slope + offset; & \quad ACEScc_{slopeoffset} \leq 0 \\
        (ACEScc_{in} \times slope + offset)^{power}; & \quad ACEScc_{slopeoffset} > 0 \\
    \end{array} \right. \\ 
\end{equation}

\begin{equation}
    \begin{array}{l}
    \text{Where:}\\
    ACEScc_{slopeoffset} = ACEScc_{in} \times slope + offset
    \end{array}
\end{equation}

ASC CDL Saturation is also applied with no limiting function:

\begin{gather*}
    luma = 0.2126 \times ACEScc_{red} + 0.7152 \times ACEScc_{green} + 0.0722 \times ACEScc_{blue} \\
    \begin{aligned}
        ACEScc_{red} &= luma + saturation \times (ACEScc_{red} - luma) \\
        ACEScc_{green} &= luma + saturation \times (ACEScc_{green} - luma) \\        
        ACEScc_{blue} &= luma + saturation \times (ACEScc_{blue} - luma) \\ 
    \end{aligned}
\end{gather*}






<!-- Include section numbering -->
<style>
    @import "../../../stylesheets/sections.css"
</style>