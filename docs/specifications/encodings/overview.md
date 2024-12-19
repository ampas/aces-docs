ACES Encodings
====

## What encodings are part of ACES?
While the linear and wide-gamut attributes of ACES2065-1 are ideal as an encoding space for archival, in practice, many existing production tools are designed to work with data that has non-linear encoding characteristics. Therefore, depending on the present use case within a workflow, a reversible conversion from one encoding representation to another will lead to more optimal results when working within that context.

There are three primary color spaces recommended for use in an ACES-based workflow:

* ACES2065-1 - linear, AP0 primaries
* ACEScg - linear, AP1 primaries
* ACEScct - non-linear, AP1 primaries

!!! note
    There _are_ actually two other encodings previously defined - ACEScc and ACESproxy - but they are considered outdated and their use is only recommended in specific use cases or for legacy workflows.


## Why different spaces?
It may seem like the logical method for creating such a uniform framework would be to have one single color space that every input device transforms to and every output device transforms from. The reason why there are 5 spaces is that real-world implementations of a complete color pipeline rely on steps where there are systemic architectural differences like, for example, the capability of internally handling floating-point color code values instead of purely integer maths. These color spaces were designed to be interoperable to maintain ACES’s consistent color appearance while making it easier to perform transformations and operations on the encoded color of images.

ACES colorimetry (e.g… after any mapping by Input Transforms) is always scene-referred. It only becomes output-referred after mapping by an Output Transform (actually just after the “RRT part” of it).
For ACES color spaces, whitepoint chromaticity is (x, y) = (0.32168, 0.33767) and two different gamuts are alternatively used: determined by the primaries AP0 or AP1.

Primaries are used to define the extent of colors in an x,y space utilizing metamerism. AP0 was designed to encompass the entire visible spectral locus and AP1 is much more akin to rec. 2020.

This is just a review of the color spaces and common situations where they should be used in an ACES pipeline.

### ACES2065-1 
ACES2065-1 is photometrically linear and uses the ACES (or AP0) primaries. It is the primary ACES encoding colorspace, sometimes also referred to as “Linear ACES”, "ACES2065"“SMPTE2065-1” or just “ACES". ACES2065 is the desired space for any file write-outs for interchange between facilities or archival purposes. 

### ACEScg
ACEScg is photometrically linear like ACES2065-1, but is encoded relative to the AP1 primaries. This space is preferred by VFX as it works better with existing CG rendering, compositing, painting and other VFX processes. Tools used to synthetically render imagery (CGI) have long used certain optimizations that are different than in typical color management scenarios and sometimes do not work well with such wide-gamut primaries AP0.

### ACEScct
A variant of ACEScc color space, except that it adds a “toe” to make it more akin to traditional “log” curves to generate a distinct “milking” or “fogging” of shadows under lift operations, which is typical of some film looks. This comes from requests to provide colorists with a grading environment more similar to that of traditional legacy log film scan encodings when grading using a working space from the “ACES” family of color spaces.

### ACEScc 
Also known as “Log ACES”, ACEScc uses AP1 wide-gamut set of primaries and a logarithmic transfer characteristics, which means the control representation is more proportional to visual perception —a desire of traditional color-correction operators. This encoding can be internally used for color grading/correction. Many colorists have preferences to use log color spaces for how the controls of color correction boards operate. The parameters of Color Decision Lists (CDLs) implemented in ACES workflows are meaningful when generated and/or interpreted on top of ACEScc code values.


### ACESproxy 
ACESproxy is ACEScc encoded with integer code values in the AP1 gamut. It is another encoding related to design constraints by certain video transport systems, like the SDI infrastructure, that are used for either real-time and color-grading operations. Code values employ integer arithmetics (either 10- or 12-bits/channel), but with the same logarithmic transfer characteristics as ACEScc.

ACESproxy has been designed to place scene details into the SMPTE “legal range” of video systems. Scene detail from about 7 stops under mid-gray to 10 stops over mid-gray should be visible within normal legal-range monitor setups. No rescaling of the device output signal should be needed for direct viewing, but is required before applying color grading transforms

*Always remember that ACESproxy is a video-legal signal in order to be correctly displayed by compliant broadcast equipment. ACESproxy is a temporary colorspace, and is just for transports like camera feeds and LUTs on reference monitors for real-time colour evaluation. The parameters of CDLs implemented in ACES workflows may be generated on top of ACESproxy code values, to be later (re-)interpreted on top of ACEScc.