---
title: ACESproxy Specification
---


ACESproxy – An Integer Log Encoding of ACES Image Data
========================================================================================


Introduction 
----------------
This document specifies a logarithmic-type integer encoding for the Academy Color Encoding System (ACES) for use in 10-bit and 12-bit hardware systems that need to transmit a representation of an ACES floating-point image.

The Academy Color Encoding Specification prescribes a digital encoding method using the IEEE half-precision floating-point encoding defined in IEEE 754-2008. Many production systems do not support the use of 16-bit-per-color component transmission especially where hardware video systems are utilized. Some systems used for preview, look creation, and color grading are limited to common 10-bit and 12-bit video signals. In some cases, it is still necessary for a user to see a representation of the ACES image without it having been rendered for the output device using an Output Transform, and where no 16-bit floating-point capability exists in the hardware and software.

This document specifies an encoding of ACES using 10-bit or 12-bit integer data types for compatibility with those systems. This encoding is defined and named herein as ACESproxy.

10-bit and 12-bit integer data types cannot store the full range of ACES data with the same level of precision provided by the ACES half-precision floating-point format. To make appropriate use of the limited range of the 10-bit and 12-bit integer data types, the ACESproxy encoding uses a middle portion of the possible range of ACES values and is encoded using a logarithmic transfer function. To better facilitate on-set look creation, ACESproxy also uses a smaller color gamut. ACES values outside of this encoded range cannot be transmitted using ACESproxy and are assumed to be clipped to the maximum and minimum ACESproxy values.

ACESproxy is appropriate as a working-space encoding for on-set preview and look creation systems since those systems are typically designed to work with other image data encoded in a similar fashion. The ACESproxy encoding is specifically designed to work well when graded using the American Society of Cinematographers Color Decision List (ASC CDL).

The ACESproxy encoding was designed for the transmission of images across transports such as High Definition Serial Digital Interface (HD-SDI), for use within hardware systems limited to 10- or 12-bit operation, and for the creation of look metadata such as ASC CDL values.

ACESproxy images are designed to be viewed through an ACES viewing pipeline as detailed in [Appendix A](#appendixA). When viewed without an ACES output transform, ACESproxy images are dim and low in contrast and saturation, but allow all of the sensors image data to be viewed.

ACESproxy-encoded images are intermediate encodings and are not replacements for ACES image data in postproduction color grading or finishing environments. There is no image file container format specified for use with ACESproxy. ACESproxy encoding is specifically not intended for interchange, mastering finals, or archiving, all of which are better completed using the original ACES files.


Scope
-----
This document specifies 10-bit and 12-bit integer encodings of ACES for use with imaging systems that produce look metadata such as ASC CDL, and with transport systems such as HD-SDI. The color encoding provided in this format represents ACES relative exposure values as RGB triplets in a logarithmic encoding, and does not define the interfaces or signals that may carry this encoding.


References
----------
The following standards, specifications, articles, presentations, and texts are referenced in this text:

* [ST 2065-1:2021 - SMPTE Standard - Academy Color Encoding Specification (ACES)](https://doi.org/10.5594/SMPTE.ST2065-1.2021)
* [RP 177:1993 - SMPTE Recommended Practice - Derivation of Basic Television Color Equations](https://doi.org/10.5594/SMPTE.RP177.1993)


Specification
-------------

### Naming conventions
Both the 10-bit and 12-bit logarithmic integer encoding of ACES specified in this document shall be known as ACESproxy.

Systems that are limited to the display of 8 characters for control labels shall use the abbreviation ACESPRXY.

Systems that are limited to the display of 5 to 7 characters for control labels shall use the abbreviation ACSPX.

### Color space chromaticities {#color-space}
ACESporxy uses a different set of primaries than the ACES RGB primaries defined in SMPTE ST 2065-1. The CIE 1931 colorimetry of the ACESproxy RGB primaries and white are specified below.

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
    ACESproxy RGB primaries chromaticity values
</figcaption> 

#### White point
The white point shall be:

<div align="center" markdown>
|       | **R** | **G** | **B** |   | **CIE x** | **CIE y** |
|-------|-------|-------|-------|---|-----------|-----------|
| White |  1.0  |  1.0  |  1.0  |   |  0.32168  |  0.33767  |
</div>

<figcaption align="center">
    ACESproxy RGB white point chromaticity values
</figcaption>

### ACESproxy 10-bit definition {#acesproxy10}
The following functions shall be used to convert between ACES values, encoded according to SMPTE ST 2065-1, and 10-bit integer ACESproxy values.

#### Encoding Function
ACES $R$, $G$, and $B$ values shall be converted to $lin_{AP1}$ $R$, $G$, and $B$ values using the transformation matrix ($TRA_1$) calculated and applied using the methods provided in Section 4 of SMPTE RP 177:1993.

$lin_{AP1}$ $R$, $G$, and $B$ values shall be converted to ACESproxy10 values according to [Equation 1](#eq-1).

<a name="eq-1"></a>

\begin{equation} 
    ACESproxy = \left\{ 
    \begin{array}{l l }
		64; 	& \quad lin_{AP1} \leq 2^{-9.72} \\[10pt]
        \mathrm{FLOAT2CV10}[(log_{2}(lin_{AP1}) + 2.5) \times 50 + 425]; 	& \quad lin_{AP1} > 2^{-9.72} \\    
    \end{array} \right.
\end{equation}

Where:

$\mathrm{FLOAT2CV10}(\mathbf{a})$ returns MAX$(64,$ MIN$(940,$ ROUND$(\mathbf{a})))$

ROUND($\mathbf{a}$) returns the integer value closest to the floating point value $\mathbf{a}$

MAX$(\mathbf{a}, \mathbf{b})$ returns the greater of $\mathbf{a}$ or $\mathbf{b}$

MIN$(\mathbf{a}, \mathbf{b})$ returns the lesser of $\mathbf{a}$ or $\mathbf{b}$

<figcaption align="center">
    <b>Equation 1:</b> Linear AP1 to ACESproxy10
</figcaption>

!!! note
	[Equation 2](#eq-2) shows the relationship between ACES $R$, $G$, and $B$ values and $lin_{AP1}$ $R$, $G$, and $B$ values. $TRA_{1}$, rounded to 10 significant digits, is derived from the product of $NPM_{AP1}$ inverse and $NPM_{AP0}$ calculated using methods provided in Section 3.3 of SMPTE RP 177:1993.<br>
	AP0 are the primaries of ACES specified in SMPTE ST 2065-1.<br>
	AP1 are the primaries of ACESproxy specified in [Color space chromaticities](#color-space).

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
	ACESproxy values encoded using the equation above are not appropriate for storage or for archiving. They are intended for use only with digital transport interfaces unable to carry half-precision floating-point values, and with integer-based grading systems designed to generate look metadata that will guide the color grading applied to ACES image data later in the post-production process.

!!! note
	ACESproxy encodes values into the SMPTE “legal-range” for video systems; grading systems should use this as their nominal range.

#### Decoding Function
ACESproxy $R$, $G$, and $B$ values shall be converted to $lin_{AP1}$ values using [Equation 3](#eq-3).

<a name="eq-3"></a>

\begin{equation}
    lin_{AP1} = 2^{\left(\dfrac{ACESproxy10-425}{50}-2.5\right)}
\end{equation}

<figcaption align="center">
    <b>Equation 3:</b> ACESproxy10 to linear AP1
</figcaption>

$lin_{AP1}$ $R$, $G$, and $B$ values shall be converted to ACES $R$, $G$, and $B$ values using the transformation matrix ($TRA_{2}$) calculated and applied using the methods provided in Section 4 of SMPTE RP 177:1993.

!!! note
	[Equation 4](#eq-4) shows the relationship between ACES $R$, $G$, and $B$ values and ACESproxy $R$, $G$, and $B$ values. $TRA_{2}$, rounded to 10 significant digits, is derived from the product of $NPM_{AP0}$ inverse and $NPM_{AP1}$ calculated using methods provided in Section 3.3 of SMPTE RP 177:1993.<br>
	AP0 are the primaries of ACES specified in SMPTE ST 2065-1.<br>
	AP1 are the primaries of ACESproxy specified in [Color space chromaticities](#color-space).

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


### ACESproxy 12-bit definition {#acesproxy12}
The following functions shall be used to convert between ACES values, encoded according to SMPTE ST 2065-1, and 10-bit integer ACESproxy values.

#### Encoding Function
ACES $R$, $G$, and $B$ values shall be converted to $lin_{AP1}$ $R$, $G$, and $B$ values using the transformation matrix ($TRA_1$) calculated and applied using the methods provided in Section 4 of SMPTE RP 177:1993.

$lin_{AP1}$ $R$, $G$, and $B$ values shall be converted to ACESproxy12 values according to [Equation 5](#eq-1).

<a name="eq-5"></a>

\begin{equation} 
    ACESproxy = \left\{ 
    \begin{array}{l l }
		256; 	& \quad lin_{AP1} \leq 2^{-9.72} \\[10pt]
        \mathrm{FLOAT2CV12}[(log_{2}(lin_{AP1}) + 2.5) \times 200 + 1700]; 	& \quad lin_{AP1} > 2^{-9.72} \\    
    \end{array} \right.
\end{equation}

Where:

$\mathrm{FLOAT2CV12}(\mathbf{a})$ returns MAX$(256,$ MIN$(3760,$ ROUND$(\mathbf{a})))$

ROUND($\mathbf{a}$) returns the integer value closest to the floating point value $\mathbf{a}$

MAX$(\mathbf{a}, \mathbf{b})$ returns the greater of $\mathbf{a}$ or $\mathbf{b}$

MIN$(\mathbf{a}, \mathbf{b})$ returns the lesser of $\mathbf{a}$ or $\mathbf{b}$

<figcaption align="center">
    <b>Equation 5:</b> Linear AP1 to ACESproxy12
</figcaption>

!!! note
	[Equation 6](#eq-6) shows the relationship between ACES $R$, $G$, and $B$ values and $lin_{AP1}$ $R$, $G$, and $B$ values. $TRA_{1}$, rounded to 10 significant digits, is derived from the product of $NPM_{AP1}$ inverse and $NPM_{AP0}$ calculated using methods provided in Section 3.3 of SMPTE RP 177:1993.<br>
	AP0 are the primaries of ACES specified in SMPTE ST 2065-1.<br>
	AP1 are the primaries of ACESproxy specified in [Color space chromaticities](#color-space).

	<a name="eq-6"></a>

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
		<b>Equation 6:</b> ACES to linear AP1
	</figcaption>

!!! note
	ACESproxy values encoded using the equation above are not appropriate for storage or for archiving. They are intended for use only with digital transport interfaces unable to carry half-precision floating-point values, and with integer-based grading systems designed to generate look metadata that will guide the color grading applied to ACES image data later in the post-production process.

!!! note
	ACESproxy encodes values into the SMPTE “legal-range” for video systems; grading systems should use this as their nominal range.

#### Decoding Function
ACESproxy $R$, $G$, and $B$ values shall be converted to $lin_{AP1}$ values using [Equation 7](#eq-7).

<a name="eq-7"></a>

\begin{equation}
    lin_{AP1} = 2^{\left(\dfrac{ACESproxy12-1700}{200}-2.5\right)}
\end{equation}

<figcaption align="center">
    <b>Equation 7:</b> ACESproxy12 to linear AP1
</figcaption>

$lin_{AP1}$ $R$, $G$, and $B$ values shall be converted to ACES $R$, $G$, and $B$ values using the transformation matrix ($TRA_{2}$) calculated and applied using the methods provided in Section 4 of SMPTE RP 177:1993.

!!! note
	[Equation 8](#eq-8) shows the relationship between ACES $R$, $G$, and $B$ values and ACESproxy $R$, $G$, and $B$ values. $TRA_{2}$, rounded to 10 significant digits, is derived from the product of $NPM_{AP0}$ inverse and $NPM_{AP1}$ calculated using methods provided in Section 3.3 of SMPTE RP 177:1993.<br>
	AP0 are the primaries of ACES specified in SMPTE ST 2065-1.<br>
	AP1 are the primaries of ACESproxy specified in [Color space chromaticities](#color-space).

	<a name="eq-8"></a>

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
		<b>Equation 8:</b> Linear AP1 to ACES
	</figcaption>


Appendices
----------

### Appendix A: Encoding of negative values
As a part of the ACES system, images encoded in ACESproxy form are intended to be decoded into ACES values and viewed using an ACES Output Transform appropriate for an intended viewing device.

Without such a transform in place, viewed ACESproxy images will appear dim, severely low in contrast and desaturated. However, directly viewing the unrendered log-encoded images is sometimes useful, for example while looking at the wide range of captured image data in the highlights and shadows that are preserved in the ACES system.

ACESproxy has been designed to place scene details into the SMPTE “legal-range” of video systems. Scene detail from about 7 stops under mid-gray to 10 stops over mid-gray should be visible within normal legal- range monitor setups. No rescaling of the device output signal should be needed for direct viewing, but is required before applying color grading transforms as described in [Appendix C](#appendixC).

The ACESproxy encoding allows an amount of ‘headroom’ beyond the current dynamic range capabilities of digital motion picture cameras, and it is expected that the range of exposed highlight values seen on a waveform monitor will be lower on a monitors scale than the corresponding range that would be shown if other forms of log encoding were used.

Specific knowledge of the dynamic range of a camera system and its output encoding can be used to determine the maximum value that will appear on a waveform monitor indicating an exposure has reached full saturation of the sensor.

On a waveform monitor displaying ACESproxy values in IRE units, a gray card representing an 18% reflectance would appear at a level of 41% IRE under a normal exposure assumption. A perfect white reflector under the same conditions would appear at 55% IRE. A camera which reaches sensor saturation at 7 stops above 18% reflectance would not show any values above 81% IRE.



### Appendix B: Range of ACES values  {#appendixB}
This appendix is intended for developers who wish to validate the accuracy of their implementation.

The table below contains the results of conversions using exact 16-bit ACES codes. 16-bit ACES has higher precision than either form of ACESproxy so rounding of ACES values will occur. These numbers are accurate for neutral values where R=G=B.

<div align="center" markdown>
| **ACES 16-bit half-float Hex Code** |     **ACES**    | **ACESproxy 10-bit CV** | **ACESproxy 12-bit CV** | **ACES decoded from 10-bit ACESproxy** | **ACES decoded from 12-bit ACESproxy** |
|:-------------------------------:|:-----------:|:-------------------:|:-------------------:|:----------------------------------:|:----------------------------------:|
|               14DA              | 0.001184464 |          64         |         256         |             0.001185417            |             0.001185417            |
|               31C3              | 0.180053711 |         426         |         1705        |             0.179199219            |             0.179809570            |
|               5AF7              |   222.875   |         940         |         3760        |               222.875              |               222.875              |
</div>


### Appendix C: Convention for use of ACESproxy SMPTE range
This appendix defines the equivalent of a [0.0 ... 1.0] range in both 10-bit and 12-bit ACESproxy for use in applications.

For consistency in using ACESproxy values in video systems designed around the [0.0 . . . 1.0] video range (encoded in 10-bit video as the range 64-940), the following ACES values are considered the equivalents to 0.0 and 1.0 for both 10-bit and 12-bit video.

<div align="center" markdown>
| **Video normalized scale** | **IRE** | **10-bit CV** | **12-bit CV** | **ACES**    |
|:--------------------------:|:-------:|:-------------:|:-------------:|:-----------:|
| 0.0                        | 0%      | 64            | 256           | 0.001185417 |
| 1.0                        | 100%    | 940           | 3760          | 222.875     |
</div>


ASC CDL values are applied to values in the range [0.0 ... 1.0] which by this convention are set to ACES values 0.001185417 to 222.875. In integer based color grading systems this is typically accomplished by scaling from “legal” to full range before applying ASC CDL transforms. The ASC CDL application is further defined in a separate document.


### Appendix D: ACESproxy function derivation
The ACESproxy 10-bit and 12-bit logarithmic encoding and decoding functions have been derived from the single mathematical function described below. A series of parameters are defined and the values for the parameters specified based on the bit depth of the encoding.

#### Math functions
The following general-use math functions are defined for use within the equations.

<div style="padding-left: 40px;" markdown="1">
$\mathrm{ROUND}(a)$ 

:	Math function taking a floating-point value $a$, and returning the integer value closest to $a$ <br>

$\mathrm{MAX}(a, b)$

:	Math function returning the greater of $a$ or $b$ <br>

$\mathrm{MIN}(a, b)$
:	Math function returning the lesser of $a$ or $b$ <br>

$\mathrm{FLOAT2CV}(a)$

:	Math function returning $\mathrm{MAX}(\mathrm{CV_{min}}, \mathrm{MIN}[\mathrm{CV_{max}},\mathrm{ROUND}(a)])$
</div>

#### Parameters
The following parameters are defined for each bit-depth.

* $\mathrm{CV_{min}}$ is the minimum code value available for representation of ACES image data
* $\mathrm{CV_{max}}$ is the maximum code value available for representation of ACES image data
* $StepsPerStop$ is the number of code values representing a change of 1 stop in exposure
* $\mathrm{MidCVOffset}$ is the integer code value representing the assigned midpoint of the exposure scale for a particular bit-depth encoding. (e.g. the point to which a mid-grey exposure value would be mapped)
* $\mathrm{MidLogOffset}$ is the base 2 logarithmic value representing the assigned midpoint of the exposure scale in log space, [e.g. $\mathrm{MidLogOffset} = log_{2}(2^{−2.5}) = −2.5$ ]

<div align="center" markdown>
|   | **ACESproxy 10-bit CV** | **ACESproxy 12-bit CV** |
|---|:-----------------------:|:-----------------------:|
| $\mathrm{CV_{min}}$ | 64 | 256 |
| $\mathrm{CV_{max}}$ | 940 | 3760 |
| $\mathrm{StepsPerStop}$ | 50 | 200 |
| $\mathrm{MidCVOffset}$ | 425 | 1700 |
| $\mathrm{MidLogOffset}$ | -2.5 | -2.5 |
</div>

!!! note
	$\mathrm{MidCVOffset}$ is not equal to the ACESproxy value that most closely represents an ACES mid-gray value of 0.18. <br>ACES 0.18 is most closely represented by a 10-bit ACESproxy code value of 426 or a 12-bit ACESproxy code value of 1705.

#### Encoding function
The following floating-point equation is used to convert linear values to integer code values.

\begin{equation} 
    \mathrm{ACESproxy} = \left\{ 
    \begin{array}{l l}
        \mathrm{CV_{min}};    & \mathrm{lin} \leq 2^{\left({\frac{(\mathrm{CV_{min}}-\mathrm{MidCVOffset})}{\mathrm{StepsPerStop}}-\mathrm{MidLogOffset}}\right)} \\
        \mathrm{FLOAT2CV}\left[\left(\log_2(lin)-\mathrm{MidLogOffset}\right)\times \mathrm{StepsPerStop}+\mathrm{MidCVOffset}\right];        & \mathrm{lin} > 2^{\left({\frac{(\mathrm{CV_{min}}-\mathrm{MidCVOffset})}{\mathrm{StepsPerStop}}-\mathrm{MidLogOffset}}\right)} \\
    \end{array} \right.
\end{equation}

where $\mathrm{ACESproxy}$ is the resulting integer code value in the range of code values from $\mathrm{CV_{min}}$ to $\mathrm{CV_{max}}$. 


An implementation may use mathematically equivalent forms of this encoding equation.


#### Decoding function
The following floating-point equation is used to convert ACESproxy integer code values to linear values.


\begin{equation}
\mathrm{lin} = 2^{\left( \dfrac{(\mathrm{ACESproxy}-\mathrm{MidCVOffset})}{\mathrm{StepsPerStop}} + \mathrm{MidLogOffset}\right)}
\end{equation}

The conversion to linear creates the closest value in 16-bit half precision floating-point to the floating-point result of the equation. Linear values resulting from this equation are limited to the range of values that can be encoded in ACESproxy as illustrated in [Appendix B](#appendixB). This decoding function does not produce negative values.


An implementation may use mathematically equivalent forms of this decoding equation.





<!-- Include acronyms-->
--8<-- "mkdocs/includes/acronyms.md"

<!-- Include section numbering -->
<style>
    @import "../../stylesheets/sections.css"
</style>