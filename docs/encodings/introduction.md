Overview of ACES Encodings
==========================

What is "ACES" encoding?
------------------------

The core encoding defined in the ACES system is known as ACES (Academy Color Encoding Specification). The ACES specification is now referred to as ACES2065-1, which is the number of its SMPTE standard document. (The ACES2065-1 name also helps to avoid ambiguity with the ACES system which uses the same acronym.) 

The linear wide-gamut attributes of ACES2065-1 are ideal as an encoding color space for interchange and archival purposes. 


Aren't there other encodings?
-----------------------------
Yes, there are three main color spaces recommended for use in an ACES-based workflow:

* **ACES2065-1** - linear, AP0 primaries
* **ACEScg** - linear, AP1 primaries
* **ACEScct** - non-linear, AP1 primaries

!!! note
    There _are_ actually two other encodings that were previously defined-ACEScc and ACESproxy. However, these are considered outdated and their use is only recommended in specific use cases for legacy workflows.

As long as floating point values are not explicitly clamped, conversions between these color spaces are reversible and lossless.



Why are there different spaces?
-------------------------------
As a linear, wide-gamut space, ACES2065-1 has many mathematical properties that make it ideal as an interchange space. 

In practice, however, many production tools-such as color correctors-were designed to expect data with a non-linear (e.g. "log") encoding characteristic. Therefore, a logarithmic representation of ACES data was established for these applications. 



More Information
----------------

Technical details about each of the main ACES encodings:

[:octicons-arrow-right-24: **ACES2065-1**](./aces2065-1.md) 

[:octicons-arrow-right-24: **ACEScg**](./acescg.md) 

[:octicons-arrow-right-24: **ACEScct**](./acescct.md) 