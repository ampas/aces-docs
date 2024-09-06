What's New In ACES 2.0?
===

ACES 2.0 was designed based on collected feedback and requests from ussers of ACES 1.x.  The changes are designed to improve on many known issues or to complete previously unfinished pieces of the system that help make ACES 2.0 a more complete, robust, and consistent product.

Highlights of the changes in ACES 2.0 are as follows:

* New output transforms, including:
    * A less aggressive tone scale
    * More intuitive controls to create custom outputs to non-standard displays
    * Robust gamut mapping to improve perceptual uniformity
    * Improved performance of the inverse transforms
* Enhanced AMF specification
* OpenEXR compression recommendations
* Updated tools for generating Input Transforms and recommendations for characterizing prosumer cameras
* Look Transform Library
* Expanded documentation

## Rendering Transform
The most substantial change in ACES 2.0 is a complete redesign of the rendering transform. 

ACES 2.0 was built as a unified system, rather than through piecemeal additions. Different deliverable outputs "match" better and making outputs to display setups other than the provided presets is intended to be user-driven. The rendering transforms are less likely to produce undesirable artifacts "out of the box", which means less time can be spent fixing problematic images and more time making pictures look the way you want.

## Key design goals
* Improve consistency of tone scale and provide an easy to use parameter to allow for outputs between preset dynamic ranges
* Minimize hue skews across exposure range in a region of same hue
* Unify for structural consistency across transform type
* Easy to use parameters to create outputs other than the presets 
* Robust gamut mapping to improve harsh clipping artifacts
* Fill extents of output code value cube (where appropriate and expected)
* Invertible - not necessarily reversible, but Output > ACES > Output round-trip should be possible
* Accomplish all of the above while maintaining an acceptable “out-of-the box” rendering

##  
Once the $M x N$ factorial combinations are a number of preset combinations.

Providing all of the same outputs with a D60 creative white automatically doubles the number of presets. The common workflow would seem to be that a user would decide their creative white point at the start of their show and use transforms with that white point throughout their project's lifetime. Therfore, the D60 and D65 transforms are divided at the top level into their own directories, with the same list of targeted displays for each.

### Notes to implementers on UI Presentation
If implemented blindly, users would be required to select "the right transform" from a long list of very similar looking but very subtly different names. In many instances the differences between two different outputs are solely in the signal encoding step while the intended rendering appearance is identical. The presets listed in the "aces-output" directory 

A list of outputs that we believe should be minimally supported are identified on the list, with all parameters that when combined and put into the Output Transform and Display Encoding functions would produce an output as intended for that rendering/device combination.

How you implement the selection of these is up to your team to determine the best was to fit it into your software's color management menus or otherwise.

For example, a trasnform labeled `Rec709-D65_100nit_as_Rec709-D65_BT1886` would be a typical 100-nit SDR video rendering inteneded for display on a device configured to Rec.709 primaries with the BT.1886 transfer function. Another transform such as `Rec709-D65_100nit_as_Rec2100-D65_ST2084` targets the same rendering characteristics and so would produce a matching rendering. The only difference here is that the intended Rec.709 colorimetry is the display encoding, i.e. the RGB is encoded relative to the Rec.2100 primaries and using the PQ encoding function.