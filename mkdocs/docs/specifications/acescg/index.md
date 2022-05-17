ACEScg – A Working Space for CGI Render and Compositing
========================================================================================


Introduction 
----------------
SMPTE ST 2065-1:2012 defines a common color encoding method using half-precision floating point corresponding to linear exposure values encoded relative to a fixed set of RGB primaries. These primaries were designed to encompass the entire visual gamut. However, the algorithms commonly used to synthetically render imagery (CGI) have long used certain optimizations that are different than in typical color management scenarios and sometimes do not work well with very wide-gamut primaries. For example, in CGI rendering calculations, the RGB values of materials typically represent the percentage of light reflected. This is a different interpretation than in color science based on CIE colorimetry, where the RGBs are interpreted as tristimulus values with respect to a certain primary set. In other words, in CGI the RGB values often are used to describe a property of a material rather than the resulting color stimulus received by an observer.

This document describes the AP1 color primaries and their use as the basis of a 16-bit or 32-bit floating point working space for CGI rendering and compositing. These primaries are also the basis of the ACEScc working space, which was developed to better support color grading in the ACES workflow. They do lie slightly outside of the visual gamut - in order to be able to encompass both the Rec-2020 gamut and the DCI-P3 gamut for a range of white points.


Scope
-----
This document describes the translation of ACES2065-1 to/from ACEScg. ACEScg is intended as an appropriate working space for CGI rendering and compositing. ACEScg utilizes the AP1 color primaries for the purpose of rendering and compositing computer generated imagery (CGI).


References
----------
The following standards, specifications, articles, presentations, and texts are referenced in this text:

* [ST 2065-1:2021 - SMPTE Standard - Academy Color Encoding Specification (ACES)](https://doi.org/10.5594/SMPTE.ST2065-1.2021)
* [RP 177:1993 - SMPTE Recommended Practice - Derivation of Basic Television Color Equations](https://doi.org/10.5594/SMPTE.RP177.1993)
* [754-2019 - IEEE Standard for Floating-Point Arithmetic](https://ieeexplore.ieee.org/document/8766229)


Specification
-------------

### Naming convention
The encoding of ACES specified in this document shall be known as ACEScg.

### Color component value encoding
ACEScg shall be stored as either 16-bit (IEEE binary16) or 32-bit (IEEE binary32) floating point values.

### Color component value range
The value range for ACEScg color component values is [-65504.0, +65504.0].

The chromaticity coordinates of the defined ACEScg RGB primaries (AP1) form a triangle on the CIE chromaticity diagram. ACEScg RGB values which express visible colors are represented by points within this triangle that also lie within the visual gamut.

The set of valid ACEScg RGB values also includes members whose projection onto the CIE chromaticity diagram falls outside the region of the AP1 primaries. These ACEScg RGB values include those with one or more negative ACEScg color component values; Ideally these values would be preserved through any compositing operations done in ACEScg space but it is recognized that keeping negative values is not always practical, in which case it will be acceptable to replace negative values with zero.

Values well above 1.0 are expected and should not be clamped except as part of the color correction needed to produce a desired artistic intent.

### Color component transfer function
The color component transfer function directly encodes relative exposure values and is defined as

\begin{equation}
R=E_r, G=E_g, B=E_b
\end{equation}

where $E_r$, $E_g$ and $E_b$ represent relative exposure values that would be captured from the scene by the ACES Reference Image Capture Device (RICD) and $R$, $G$ and $B$ are the resulting ACES color component values transformed to ACEScg using the methods specified in [Converting ACES2065-1 RGB values to ACEScg RGB values](#aces2065-to-acescg).


### Color space chromaticities {#color-space}
ACEScg uses a different set of primaries than ACES RGB primaries defined in SMPTE ST 2065-1. The CIE 1931 colorimetry of the ACEScg RGB primaries and white are specified below.

#### Color space primaries
The chromaticity values of the RGB primaries (known as AP1) shall be those found below:

<div align="center" markdown>
|       | **R** | **G** | **B** |   | **CIE x** | **CIE y** |
|-------|-------|-------|-------|---|-----------|-----------|
| Red   |  1.0  |  0.0  |  0.0  |   |   0.713   |   0.293   |
| Green |  0.0  |  1.0  |  0.0  |   |   0.165   |   0.830   |
| Blue  |  0.0  |  0.0  |  1.0  |   |   0.128   |   0.044   |
</div>

<figcaption align="center">
    AP1 primaries chromaticity values
</figcaption> 

#### White point
The white point shall be:

<div align="center" markdown>
|       | **R** | **G** | **B** |   | **CIE x** | **CIE y** |
|-------|-------|-------|-------|---|-----------|-----------|
| White |  1.0  |  1.0  |  1.0  |   |  0.32168  |  0.33767  |
</div>

<figcaption align="center">
    ACES RGB white point chromaticity values
</figcaption>

!!! note
	The ACEScg white point is the same as the white point of ACES2065-1.

### ACEScg {#acescg}
The following functions shall be used to convert between ACES values, encoded according to SMPTE ST 2065-1, and ACEScg.

#### Converting ACES2065-1 RGB values to ACEScg RGB values
ACES2065-1 $R$, $G$, and $B$ values shall be converted to ACEScg $R$, $G$, and $B$ values using the transformation matrix ($TRA_1$) calculated and applied using the methods provided in Section 4 of SMPTE RP 177:1993.

!!! note
	[Equation 1](#eq-1) shows the relationship between ACES2065-1 $R$, $G$, and $B$ values and ACEScg $R$, $G$, and $B$ values. $TRA_{1}$, rounded to 10 significant digits, is derived from the product of $NPM_{AP1}$ inverse and $NPM_{AP0}$ calculated using methods provided in Section 3.3 of SMPTE RP 177:1993.<br>
	AP0 are the primaries of ACES specified in SMPTE ST 2065-1.<br>
	AP1 are the primaries of ACEScg specified in [Color space chromaticities](#color-space).

	<a name="eq-1"></a>

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
		R_{AP0}\\
		G_{AP0}\\
		B_{AP0}
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
		<b>Equation 1:</b> AP0 to AP1
	</figcaption>
	
#### Converting ACEScg RGB values to ACES2065-1 RGB values
ACEScg $R$, $G$, and $B$ values shall be converted to ACES2065-1 $R$, $G$, and $B$ values using the transformation matrix ($TRA_2$) calculated and applied using the methods provided in Section 4 of SMPTE RP 177:1993.

!!! note
	[Equation 2](#eq-2) shows the relationship between ACES2065-1 $R$, $G$, and $B$ values and ACEScg $R$, $G$, and $B$ values. $TRA_{2}$, rounded to 10 significant digits, is derived from the product of $NPM_{AP0}$ inverse and $NPM_{AP1}$ calculated using methods provided in Section 3.3 of SMPTE RP 177:1993.<br>
	AP0 are the primaries of ACES specified in SMPTE ST 2065-1.<br>
	AP1 are the primaries of ACEScg specified in [Color space chromaticities](#color-space).

	<a name="eq-2"></a>

	\begin{equation} 
		\begin{bmatrix}
			R_{AP0}\\
			G_{AP0}\\
			B_{AP0}
		\end{bmatrix}
		=
		TRA_{2}
		\cdot
		\begin{bmatrix}
			R_{AP1}\\
			G_{AP1}\\
			B_{AP1}
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
		<b>Equation 2:</b> AP1 to AP0
	</figcaption>




<!-- Include acronyms-->
--8<-- "mkdocs/includes/acronyms.md"

<!-- Include section numbering -->
<style>
    @import "../../stylesheets/sections.css"
</style>