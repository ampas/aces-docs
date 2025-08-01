ACES 2 Rendering Transform
==========================

The core architectural change in ACES 2 is a complete overhaul of the rendering transform.

Unlike ACES v1, where features were introduced incrementally, ACES 2 was designed as a unified system. This ensures greater alignment across different output targets and provides a user-driven approach for configuring custom display pipelines. Out-of-the-box rendering is now less prone to undesirable artifacts, reducing the need for corrective grading and allowing more time for creative intent.

## Key design goals
The ACES 2 rendering transforms are designed to:

- Provide tone mapping with a slightly lower mid-slope contrast and gentler highlight rolloff than ACES v1 (See [Figure 1](#figure-1))
- Minimize hue shifts across exposure levels within regions of uniform hue
- Include robust gamut mapping to eliminate harsh clipping and preserve perceptual continuity (See [Figure 2](#figure-2))
- Fully utilize output encoding ranges, where appropriate
- Maintain round-trip consistency (Output → Inverse ACES → Output)
- Use a unified algorithmic structure across all display-targeted transforms
- Offer simple parameterization for unsupported or custom display configurations
- Deliver a predictable, high-quality default rendering

<a name="figure-1"></a>
<div class="grid" markdown>

<figure markdown="span">    
    ![ACES v1](./images/SampleFrames086447_ACESv1.jpg)
    <figcaption>ACES 1</figcaption>
</figure>

<figure markdown="span">    
    ![ACES v2](./images/SampleFrames086447_ACESv2.jpg)
    <figcaption>ACES 2</figcaption>
</figure>

</div>
<figcaption markdown>**Figure 1:** The softer tone scale combined with gamut mapping tends to keep colorfulness in highlights longer.</figcaption>


<a name="figure-2"></a>
<figure markdown="span">    
    ![ACES v1](./images/color_samples_minus8_to_plus10_v1_light.png#only-light)
    ![ACES v1](./images/color_samples_minus8_to_plus10_v1_dark.png#only-dark)
    ![ACES v1 RGC](./images/color_samples_minus8_to_plus10_v1rgc_light.png#only-light)
    ![ACES v1 RGC](./images/color_samples_minus8_to_plus10_v1rgc_dark.png#only-dark)
    ![ACES v2](./images/color_samples_minus8_to_plus10_v2_light.png#only-light)
    ![ACES v2](./images/color_samples_minus8_to_plus10_v2_dark.png#only-dark)
    <figcaption>ACES 1 (top); <br> RGC+ACES 1 (middle); <br> ACES 2 (bottom)</figcaption>
</figure>

<figcaption markdown>**Figure 2:** ACES v2 (bottom) does not exhibit the clipping artifacts that could often appear when using ACES v1. Even ACES v1 is used with the Reference Gamut Compression enabled, which was developed to help with the clipping artifacts, ACES v2 still behaves better. <br> ACES v2 also preserves hue and maintains a well-behaved desaturation as exposure is increased.</figcaption>


