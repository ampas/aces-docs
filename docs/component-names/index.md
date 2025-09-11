---
title: ACES Component Names
---

<!-- SPDX-License-Identifier: CC-BY-4.0 -->
<!-- Copyright Contributors to the ACES Documentation -->


Preferred ACES 1.0 Component Names
================


Introduction
------------

ACES component names have technical names that emerged from the engineering and development process. While the names make sense to the scientists, engineers and early adopters that “grew up” with the system, the larger adoption community targeted for adoption by ACES 1.0 does not have the historical knowledge and context of the ACES pioneers and a large majority of that community does not have the technical training needed to understand many of the existing names.

This Technical Bulletin documents the ACES component naming conventions as agreed to by the ACES Project Committee for the ACES 1.0 System Release.



Scope
----------------

This Technical Bulletin documents ACES 1.0 component names. These names were settled on after extensive discussions at ACES Project Committee meetings, feedback from the field, internal discussions amongst the ACES Leadership Team and the work of the ACES User Experience Working Group. The names documented herein rationalize naming approaches between diverse technical components, are technically correct, sensible for end users, acknowledge terminology that seems to have “stuck”, and accommodate system evolution. Full words instead of acronyms are used where possible, and the ACES prefix was liberally used to promote a system identity.



ACES Internal Components
----------------

The following component groups are components that color engineers, pipeline builders, technical directors, etc. might need to know about, but end users do not need to directly address if the applications they use follow ACES User Experience Guidelines.

### Color Primary Sets

1. Pre-release nomenclature: SMPTE 2065-1:2012 primaries, a.k.a. “ACES primaries” 

    ACES 1.0 name: “ACES Primaries 0” or “AP0”

2. Pre-release nomenclature: ACES “working space” primaries, a.k.a. “Rec.2020+”

    ACES 1.0 name: “ACES Primaries 1” or “AP1”

<br>
<div align="center" markdown>
|             **Pre-release nomenclature**             | **ACES 1.0 Name** | **Shorthand** |
|:----------------------------------------------------:|:-----------------:|:-------------:|
| SMPTE 2065-1:2012 primaries<br>a.k.a. “ACES primaries” |  ACES Primaries 0 |      AP0      |
|  ACES “working space” primaries<br>a.k.a. “Rec.2020+”  |  ACES Primaries 1 |      AP1      |
</div>

<figcaption align="center" markdown=1>
  <b>Table 1.</b> Color Primary Sets
</figcaption><br>


### Transforms

1. Pre-release nomenclature: “Reference Rendering Transform” or “RRT”

    ACES 1.0 name: “Reference Rendering Transform” or “RRT”
    
!!! note
	Use of Reference Rendering Transform or RRT should be deprecated in end-user documentation in favor of "ACES Output Transform". However, plain English explanations of the RRT may still be necessary to explain how “scene referred” images are prepared for viewing.

<br>
<div align="center" markdown>
|             **Pre-release nomenclature**             | **ACES 1.0 Name** | **Shorthand** |
|:----------------------------------------------------:|:-----------------:|:-------------:|
| Reference Rendering Transform<br>RRT |  Reference Rendering Transform |      RRT      |
</div>

<figcaption align="center" markdown=1>
  <b>Table 2.</b> Reference Rendering Transform
</figcaption><br>


ACES User-facing Components
----------------

### Encodings

There are five possible image encodings that can be used in ACES projects. All encodings might not be used in all workflows. The ACES prefix is used to identify the encodings as ACES components.

1. Pre-release nomenclature: SMPTE 2065-1:2012, a.k.a. “ACES” 
    
    Use: base encoding, used for exchange of full fidelity images, archiving 
    
    ACES 1.0 name: “ACES2065-1”
    
2. Pre-release nomenclature: SMPTE 2065-1:2012 with Rec.2020+ primaries, log encoding, floating point encoding, a.k.a. “ACES working space”

    Use: working space for color correctors using a pure logarithmic encoding, fully compatible with ACESproxy
    
    ACES 1.0 name: “ACEScc”

3. Pre-release nomenclature: N/A

    Use: alternate working space for color correctors using a logarithmic encoding with a toe, not fully compatible with ACESproxy
    
    ACES 1.0 name: “ACEScct”

4. Pre-release nomenclature: VFX-friendly encoding, i.e., linear ACES working space with Rec.2020+ primaries
    
    Use: working space for rendering and compositor applications
    
    ACES 1.0 name: “ACEScg”

5. Pre-release nomenclature: “ACES wire format”, a.k.a. “ACESproxy,” “ACESproxy10,” “ACESproxy12”

    Use: lightweight encoding for transmission over HD-SDI (or other production transmission schemes), on-set look management. Not intended to be stored or used in production imagery or for final color grading/master- ing.

    ACES 1.0 name: “ACESproxy”
    
<br>
<div align="center" markdown>
|          **Pre-release nomenclature**             | **ACES 1.0 Name** | 
|:-------------------------------------------------:|:-----------------:|
| SMPTE 2065-1:2012<br>a.k.a. “ACES”  |  ACES2065-1 |
| SMPTE 2065-1:2012 with Rec.2020+ primaries, log encoding, floating point encoding<br>a.k.a. “ACES working space”  |  ACEScc |
| N/A  |  ACEScct |
| VFX-friendly encoding, i.e., linear ACES working space with Rec.2020+ primaries  |  ACEScg |
| “ACES wire format”<br>a.k.a. “ACESproxy,” “ACESproxy10,” “ACESproxy12”  |  ACESproxy10<br>ACESproxy12 |
</div>

<figcaption align="center" markdown=1>
  <b>Table 3.</b> Encodings
</figcaption><br>

### Transforms 

There are three basic ACES transforms that end users work with. Although the “pioneers” seem comfortable with the three letter acronyms, ACES 1.0 transitions to simpler terms that describe what these transforms do.

1. Pre-release nomenclature: Input Device Transform, a.k.a. “IDT”

    Use: converts digital camera native data to ACES2065
    
    ACES 1.0 name: “ACES Input Transform”; Shorthand: “Input Transform”

2. Pre-release nomenclature: Look Modification Transform, a.k.a. “LMT” 

    Use: applies a global, pre-RRT look to an ACES project

    ACES 1.0 name: “ACES Look Transform”; Shorthand: “Look Transform”
    
3. Pre-release nomenclature: “ACES Viewing Transform” a.k.a "RRT+ODT"
    
    Use: converts ACES2065 data to display code values
        
    ACES 1.0 name: “ACES Output Transform”; Shorthand: “Output Transform”

<br>
<div align="center" markdown>
|             **Pre-release nomenclature**             | **ACES 1.0 Name** | **Shorthand** |
|:----------------------------------------------------:|:-----------------:|:-------------:|
| Input Device Transform<br>IDT |  ACES Input Transform |     Input Transform      |
| Look Modification Transform<br>LMT |  ACES Look Transform |     Look Transform      |
| ACES Viewing Transform<br>RRT + ODT |  ACES Output Transform |     Output Transform      |
</div>

<figcaption align="center" markdown=1>
  <b>Table 4.</b> Transforms
</figcaption><br>

### Containers

Containers hold ACES image data, clip-level metadata and LUTs.

1. Pre-release nomenclature: SMPTE ST2065-4:2013, a.k.a. “ACES container,” “exrs”
    
    Use: container file format for ACES2065 image data

    ACES 1.0 name: “ACES container” or “ACES OpenEXR”; Shorthand: "ACES EXR"
    
2. Pre-release nomenclature: Clip-level Metadata File

    Use: container for ACES clip-level metadata container

    ACES 1.0 name: “ACES Metadata File”; Alternate: “AMF”
    
3. Pre-release nomenclature: Academy-ASC Common LUT Format file, a.k.a. “CLF file”

    Use: container for Academy-ASC Common LUT format data

    ACES 1.0 name: “Academy-ASC Common LUT Format”; Alternates: “Common LUT Format,” “CLF file”

<br>
<div align="center" markdown>
|             **Pre-release nomenclature**             | **ACES 1.0 Name** | **Shorthand** |
|:----------------------------------------------------:|:-----------------:|:-------------:|
| SMPTE ST2065-4:2013<br>a.k.a "ACES Container" |  ACES Container<br>ACES OpenEXR |     ACES EXR      |
| Clip=level Metadata File |  ACES Metadata File |     AMF      |
| Academy-ASC Common LUT Format file<br>a.k.a. “CLF file” |  Academy-ASC Common LUT Format |     Common LUT Format<br>CLF     |
</div>

<figcaption align="center" markdown=1>
  <b>Table 4.</b> Containers
</figcaption><br>





<!-- Include section numbering -->
<style>
    @import "../../stylesheets/sections.css"
</style>
