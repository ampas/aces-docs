---
title: ACES Component Names
---


ACES Component Names
================


Scope
----------------


This Technical Bulletin document ACES Version 1.0 component names. These names were settled on after extensive discussions at ACES Project Committee meetings, feedback from the field, internal discussions amongst the ACES Leadership Team and the work of the ACES User Experience Working Group. The names documented herein rationalize naming approaches between diverse technical components, are technically correct, sensible for end users, acknowledge terminology that seems to have “stuck” and accommodate system evolution. Words instead of acronyms are used where possible, and the ACES prefix was liberally used to promote a system identity.



References
----------------


The following standards, specifications, articles, presentations, and texts are referenced in this text:

* ITU-R Recommendation BT.2020 Parameter values for ultra-high definition television systems for production and international programme exchange
* SMPTE ST 2065-1:2012, Academy Color Encoding Specification (ACES)
* SMPTE ST 2065-4:2013, ACES Image Container File Layout
* ASC Color Decision List (ASC CDL) Transfer Functions and Interchange Syntax, ASC-CDL Release 1.2
* Academy S-2013-001, ACESproxy – An Integer Log Encoding of ACES Image Data
* Academy S-2014-003, ACEScc – A Logarithmic Encoding of ACES Data for use within Color Grading Systems
* Academy S-2014-004, ACEScg – A Working Space for CGI Render and Compositing Academy S-2014-006, A Common File Format for Look-Up Tables
* Academy P-2013-001, Recommended Procedures for the Creation and Use of Digital Camera System Input Device Transforms (IDTs)
* Academy TB-2014-002, Academy Color Encoding System (ACES) User Experience Guidelines
* Academy TB-2014-009, Academy Color Encoding System (ACES) Clip-level Metadata File Format Defini- tion and Usage
* Academy TB-2014-010, Design, Integration and Use of ACES Look Modification Transforms


Terms and Definitions 
----------------


The following terms and definitions are used in this document.

### ACES Viewing Transform

Combined RRT and ACES Output Device Transform.

### Reference Rendering Transform(RRT)

Core ACES transform that converts scene-referred image data that conforms to SMPTE ST 2065-1:2012 to output-referred image data.


ACES Internal Components
----------------


The following component groups are components that color engineers, pipeline builders, technical directors, etc. might need to know about, but end users do not need to directly address if the applications they use follow ACES User Experience Guidelines.

### Color Primary Sets

1. Pre-release nomenclature: SMPTE 2065-1:2012 primaries, a.k.a. “ACES primaries” 

	ACES 1.0 name: “ACES Primaries 0” or “AP0”

2. Pre-release nomenclature: ACES “working space” primaries, a.k.a. “Rec.2020+” 

	ACES 1.0 name: “ACES Primaries 1” or “AP1”

### Transforms

1. Pre-release nomenclature: “Reference Rendering Transform” or “RRT”

	ACES 1.0 name: “Reference Rendering Transform” or “RRT”
	
NOTE: Deprecate use of this term in end-user documentation, although plain English explanations should be provided for why ACES images are “scene referred” (and this term should be explained) and why a conversion, or transform, is necessary for viewing.


ACES User-facing Components
----------------


### Encodings

There are four image encodings that are used in ACES projects, although all encodings are not used in all workflows. The approach taken here is to keep the ACES prefix to identify the encodings as ACES components.

1. Pre-release nomenclature: SMPTE 2065-1:2012, a.k.a. “ACES” 
	
	Use: base encoding, used for exchange of full fidelity images, archiving 
	
	ACES 1.0 name: “ACES2065-1”
	
2. Pre-release nomenclature: “ACES wire format”, a.k.a. “ACESproxy,” “ACESproxy10,” “ACESproxy12”

	Use: lightweight encoding for transmission over HD-SDI (or other production transmission schemes), on-set look management. Not intended to be stored or used in production imagery or for final color grading/master- ing.

	ACES 1.0 name: “ACESproxy”
	

3. Pre-release nomenclature: SMPTE 2065-1:2012 with Rec.2020+ primaries, log encoding, floating point encoding, a.k.a. “ACES working space”

	Use: working space for color correctors, target for ASC-CDL values created on-set 
	
	ACES 1.0 name: “ACEScc working space” or “ACEScc”

4. Pre-release nomenclature: VFX-friendly encoding, i.e., integer version of “ACES working space,” with ACESproxy transfer function
	
	Use: working space for paint/compositor applications that dont support ACES2065 or ACEScc 
	
	ACES 1.0 name: “ACEScg working space” or “ACEScg”

### Transforms 

There are three basic ACES transforms that end users work with. Although the “pioneers” seem comfortable with the three letter acronyms, ACES 1.0 transitions to simpler terms that describe what these transforms do.

1. Pre-release nomenclature: Input Device Transform, a.k.a. “IDT”

	Use: converts digital camera native data to ACES2065
	
	ACES 1.0 name: “ACES Input Transform”; Shorthand: “Input Transform”

2. Pre-release nomenclature: Look Modification Transform, a.k.a. “LMT” 

	Use: applies a global, pre-RRT look to an ACES project

	ACES 1.0 name: “ACES Look Transform”; Shorthand: “Look Transform”
	
3. Pre-release nomenclature: “RRT plus ODT” a.k.a. “ACES Viewing Transform” 
	
	Use: converts ACES2065 data to display code values
		
	ACES 1.0 name: “ACES Output Transform”; Shorthand: “Output Transform”


### Containers

Containers hold ACES image data, clip-level metadata and LUTs.

1. Pre-release nomenclature: 2065-4:2013, a.k.a. “ACES container,” “exrs” 
	
	Use: container for ACES2065 image data

	ACES 1.0 name: “ACES container” and “exr file”
	
2. Pre-release nomenclature: Clip-level Metadata File

	Use: container for ACES clip-level metadata container

	ACES 1.0 name: “ACES Metadata File”; Alternate: “amf file”
	
3. Pre-release nomenclature: Academy-ASC Common LUT Format file, a.k.a. “CLF file”

	Use: container for Academy-ASC Common LUT format data

	ACES 1.0 name: “Academy-ASC Common LUT Format”; Alternates: “Common LUT Format,” “clf file”

<!-- Include acronyms-->
--8<-- "mkdocs/includes/acronyms.md"

<!-- Include section numbering -->
<style>
    @import "../../stylesheets/sections.css"
</style>
