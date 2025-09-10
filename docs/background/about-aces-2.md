What is ACES 2?
============

ACES 2 is the second major release of the ACES (Academy Color Encoding System) framework and focuses on delivering a more complete and consistent end-to-end color management solution. 

What’s New in ACES 2
--------------------
The most significant change in ACES 2 is the introduction of a completely redesigned suite of rendering transforms. However, ACES 2 introduces a number of important improvements and additions, including:

- New [**Output Transforms**](./about-rendering.md) for rendering ACES images to displays, featuring:
    - A less aggressive tone scale with reduced mid-tone contrast and a gentler highlight rolloff
    - More intuitive parameter controls for supporting custom or uncommon display configurations
    - Robust gamut mapping for improved perceptual uniformity and reduced clipping artifacts
    - Optimized performance for inverse transforms
    - Additional transforms with preset parameters targeting common display calibration standards
- Enhanced [**AMF (ACES Metadata File) Specification**](../amf/specification/index.md)
- Updated specification of [**ACES Transform IDs**](../system-components/transform-id-spec.md), plus a manifest of Transform IDs available at each ACES version tag since v1.0
- Recommendations for using compression in **ACES OpenEXRs**
- New [**Recommendations**](../system-components/input-transforms/capture-guide.md) for generating Input Transforms for prosumer-level cameras
- New [**Tools**](https://beta.devtools.acescentral.com/) for generating Input Transforms
- Expanded **Documentation** across all components, with plans for continued additions to add clarity of intended behavior, user guides, document recommended workflows, as well as a history of the discussions and reasoning for various design decisions

The ACES 2 feature set was developed in direct response to the [top feature requests and user feedback from ACES 1 users](./listening-tour.md). 