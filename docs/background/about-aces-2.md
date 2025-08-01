About ACES 2
============

ACES Version 2 is the second major release of the ACES (Academy Color Encoding System) framework. This release focuses on refining the default rendering behavior, completing unfinished system components, and delivering a more robust and consistent end-to-end color management solution.

The most significant change in ACES 2 is the introduction of a completely redesigned suite of rendering transforms, which were developed in direct response to feedback from ACES 1 users.


What’s New in ACES 2
--------------------
ACES 2 introduces several important improvements and additions:

- New **Output Transforms** for rendering ACES images to displays, featuring:
    - A less aggressive tone scale with reduced mid-tone contrast and a gentler highlight rolloff
    - More intuitive parameter controls for supporting custom or uncommon display configurations
    - Robust gamut mapping for improved perceptual uniformity and reduced clipping artifacts
    - Optimized performance for inverse transforms
    - Additional transforms with preset parameters targeting common display calibration standards
- Enhanced **AMF (ACES Metadata File) Specification**
- Updated specification of **ACES Transform IDs**
- **OpenEXR Compression Recommendations**
- New **Tools and Guidelines** for generating Input Transforms, especially for prosumer-level cameras
- **Look Transform Library** for creative color grading workflows
- **Expanded Documentation** across all components

These key features aimed to address the top feature requests extracted from [user feedback on ACES v1](./listening-tour.md). 