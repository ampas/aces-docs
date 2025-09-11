<!-- SPDX-License-Identifier: CC-BY-4.0 -->
<!-- Copyright Contributors to the ACES Documentation -->


Introduction to Common LUT Format (CLF)
=======================================

In the motion picture industry, look-up tables, more commonly referred to as "LUTs", are a common implementation for transformations from one set of color values to another. With a large number of product developers providing software and hardware solutions for LUTs, there is an explosion of unique vendor-specific LUT file formats, which are often only trivially different from each other. This can create workflow problems when a LUT being used on a production is not supported by one or more of the applications being used. Furthermore, many LUT formats are designed for a particular use case only and lack the quality, flexibility, and metadata needed to meet modern requirements.

The Common LUT Format (CLF) can communicate an arbitrary chain of color operators (also called processing nodes) which are sequentially processed to achieve an end result. The set of available operator types includes matrices, 1D LUTs, 3D LUTs, ASC-CDL, log and exponential shaper functions, and more. Even when 1D or 3D LUTs are not present, CLF can be used to encapsulate any supported color transforms as a text file conforming to the XML schema.

Further Resources
-----------------

Those looking for details about CLF can find more information in the Technical Documentation:

<div class="annotate" markdown>

[:octicons-arrow-right-24: **CLF Specification**](./specification/index.md) (1)

[:octicons-arrow-right-24: **CLF Implemenation Guide**](./guides/index.md) 

</div>

1.  CLF is in the late stages of standardization through SMPTE. The standards document was based off this specification, but has changed structurally. When published, the standard will supercede this specification of CLF v3.0.
