<!-- SPDX-License-Identifier: CC-BY-4.0 -->
<!-- Copyright Contributors to the ACES Documentation -->


Look Transforms
===============

The ACES Look Transform imparts an image-wide creative ‘look’ to the appearance of ACES images through an Output Transform and can offer extraordinary flexibility in ACES-based workflows. A Look Transform precedes the selected ACES Output Transform. 

!!! note
    "Look Transform" is the preferred nomenclature but are often referred to using the acronym, "LMT", which is derived from their original name, "Look Modification Transform". 


What Is A Look Transform?
-------------------------
A Look Transform is defined as "an ACES-to-ACES transform that systematically changes the appearance of ACES-encoded data to be viewed through an Output Transform".

Any adjustment away from the original "native" ACES2065 data is considered a “look” within an ACES framework. By this definition, a “look” can be as simple as ASC CDL values established on-set and carried into post-production. Some Look Transforms encapsulate much more compmlex image modification and can serve to model another  pre-established color rendering and/or carry a "show LUT" that sets a base look upon with a colorist makes further adjustments.

The LMT precedes the sequential application of an ACES Output Transform, and allows custom and systematic color changes to a set of clips or entire timeline to realize a chosen creative intent.

LMTs are always ACES-to-ACES transforms. In other words, ACES2065-1 data directly translated from camera-native image data via an Input Transform is manipulated by the LMT to output new ACES2065-1 data (designated in diagrams as ACES’) that is then viewed through an ACES Output Transform.



Applications
------------

## Creating a Starting Point for Color Correction
LMTs supplement traditional colorists’ tools for grading and manipulating images. They can be used project-wide to reduce contrast and saturation across all shots, providing what might be a more preferred starting point for colorists accustomed to flatter and more muted starting images.

## Matching or Transferring an Existing Look
LMTs can also encapsulate a preset creative look, while still remaining within the context of an ACES-based workflow and viewing through the ACES Output Transform. Very complex creative looks, such as film print emulation, are more easily modeled in a systematically derived transform than by asking a colorist to manually match using only the controls in a color corrector. Having a preset for a complex creative look can make colorists’ work more efficient by allowing them to quickly get the creative look they (and the filmmaker) want, and to spend more time on shot- and/or region-specific creative color requests from clients.

The following graphic represents the workflow of emulating a desired print-film emulation of a post production facility in an ACES environment.

In ACES, well-designed LMTs are interchangeable. This means, for example, that LMTs designed to match a camera-specific rendering can be used for other cameras, or print film emulation LMTs can be used with digital cameras.


### Why Use a Look Transform?
Look Transforms exist because some color manipulations can be complex, and having a pre-set for a complex look can make a colorist’s work more efficient. In addition, emulation of traditional color reproduction methods such as the projection of film print requires complex interactions of colors that are better modeled in a systematic transform than by requiring a colorist to match 'by eye.’

The Look Transform is intended to supplement – not replace – a colorist’s traditional tools for grading and manipulating images. While the colorist’s grading tools allow manipulation of either the overall image or of selected pieces of the image, the Look Transform is designed to work only across the overall image.

### Where Does It Go?
As part of the ACES viewing pipeline, the Look Transform takes ACES color-encoded values as inputs, and outputs modified ACES-encoded values that may then be immediately processed by an Output Transform (in this case, the Output Transform appropriate for the colorist's display).

``` mermaid
flowchart LR
    n1["Original
    ACES"] --> n2["Look
    Transform"];
    n2 --> n3["Modified
    ACES"]
    n3 --> n4["Output
    Transform"];
    n4 --> n5["Display
    Code
    Values"]
    n5 --> n6("Display")
    style n1 stroke:none,fill:transparent
    style n2 stroke:4px
    style n3 stroke:none,fill:transparent
    style n5 stroke:none,fill:transparent
```
<figcaption><b>Figure 1.</b> Placement of a Look Transform before an Output Transform</figcaption>

### Baking In A Look
Outside an immediate ACES viewing pipeline, the Look Transform's output can additionally (or alternatively) be saved, creating a new ACES image container file that has ‘baked in’ the effect of the Look Transform on the original image. When this new file with ‘baked in’ changes is viewed using the standard ACES viewing pipeline, the creative intent reflected in the prior application of the Look Transform to the original will be preserved.

### Reusability
Look Transforms can be reused across multiple shots or even across an entire production. They are separate from an individual shot’s ‘grade’ or a particular vendor’s color grade file.

Key characteristics of a well-designed Look Transform are portability across applications, and preservation (to the extent that is both possible and practical) of ACES’s high dynamic range and wide color gamut while still imparting a designed, creative, target look.
