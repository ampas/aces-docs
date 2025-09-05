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

----

## Figure 1: ACES 2 (left) vs ACES 1 (right)

<a name="figure-1"></a>
<figure markdown="span">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <div class="img-comp-container">
        <div class="img-comp-img img-comp-overlay">
            <img src="../images/SampleFrames086447_ACESv2.jpg">
        </div>
        <div class="img-comp-img">
            <img src="../images/SampleFrames086447_ACESv1.jpg">
        </div> 
    </div>
</figure>
<figcaption>In ACES 2, the softer tone scale combined with gamut mapping tends to keep colorfulness in highlights longer.
</figcaption>

----

## Figure 2: ACES v2 (left) vs RGC + ACES 1 (right) 

<a name="figure-2"></a>
<figure markdown="span">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <div class="img-comp-container">
        <div class="img-comp-img img-comp-overlay">
            <img src="../images/color_samples_minus8_to_plus10_v2_light.png#only-light">
            <img src="../images/color_samples_minus8_to_plus10_v2_dark.png#only-dark">
        </div> 
        <div class="img-comp-img">
            <img src="../images/color_samples_minus8_to_plus10_v1rgc_light.png#only-light">
            <img src="../images/color_samples_minus8_to_plus10_v1rgc_dark.png#only-dark">
        </div>
    </div>
</figure>

<figcaption markdown><br>
ACES 2 does not exhibit the clipping artifacts that could often appear when using ACES 1, even when ACES 1 is using the Reference Gamut Compression which was developed to help with the clipping artifacts. <br>
ACES v2 also preserves hue and maintains a well-behaved desaturation as exposure is increased.
</figcaption>





<script>
    /*Execute a function that will execute an image compare function for each element with the img-comp-overlay class:*/
    initComparisons();
</script>


