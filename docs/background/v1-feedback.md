Feedback on ACES 1
==================

In the several years since the release of ACES 1, a variety of feedback was collected through personal conversations, comments in the ACESCentral discussion community, other internet forums, and formalized feedback mechanisms. There were two primary organized feedback efforts:

1. [**ACES Retrospective and Enhancements Paper**](#rae-paper) - a well-organized community driven effort to share personal experiences in real-world production. 
2. [**Listening Tour**](#listening-tour) - a concerted effort by ACES Leadership to interview all kinds of different members of the filmmaking community to actively collect their experiences with ACES.

---

## ACES Retrospective and Enhancements Paper {#rae-paper}
On March 9, 2017, a paper titled ["ACES Retrospective and Enhancements"](https://zenodo.org/records/345624) was shared publicly by key users of ACES v1 as an open letter to the ACES leadership team and the larger community of ACES users and contributors. 

The paper presented a series of talking points which summarized the experiences of several image quality experts within the visual effects and interactive entertainment industries. These paper highlighted issues encountered with the ACES 1 system in both production and research environments. 

### Central Themes
The central themes of these points were:

1. to make the ACES system more open to peer-review and academic discourse
2. more flexible for a wider variety of users, and 
3. more robust to current and future implementations of the specification. 

### Summary of key points
A summary of key points or requests made in the paper:

* The past, current and future of ACES development will be more open to peer-review and academic discourse.
* A public record of any experimentation, analysis, and implementations, along with useful data (image datasets, viewing conditions, display attributes and observer physiological characteristics) will be initiated.
* The CTL codebase documentation, especially the unexplained constants will be revised.
* A document on ODT creation akin to P-2013-001 ( Use of Digital Camera System Input Device Transforms (IDTs)) will be written.
* The CTL codebase and the official ACES OpenColorIO configurations, along with relevant documents, e.g. technical bulletins, will be stamped with DOIs.
* The CTL codebase reference implementation will adopt a solid unit tests suite while checking the ACES OpenColorIO configuration state against it.
* The Academy will promote a system for vetting and integrating IDTs with user feedback.
* The Academy will strongly promote CLF adoption by its partners and the community.
* The Academy website will be the host for best practice guides for usage of ACES and ACES OpenColorIO configurations within DCC applications.
* The RRT will adopt a more neutral look and a faster parameterized mathematical implementation that will allow better control over the tonescale, thus contributing to spread of RRT usage and enabling true archival of creative intent.
* The RRT will be made fully invertible, and that the various sweeteners will be moved to a default LMT.
* The ODT will be parameterized to adapt to a wider range of displays and viewing conditions while reassessing usage of CAMs to account for induced changes of the perceptual correlates by the luminance increase of the HDR displays and different viewing conditions.
* An officially publicized and documented workaround for highly saturated emitters artifacts will be available in the CTL codebase until a long-term solution is developed.
* The ACESclip file format will be simplified and advertised, as the archival promise is currently broken without proper metadata. XMP would be useful to consider along storage of the ACESclip file within the ACES container.
* Remaining issues in the ACES OpenColorIO configuration such a visual mismatch and ICC profiles clipping will be addressed.
* The ACES OpenColorIO configuration repository will be taken under the Academy wing and its development will be more directly supported by the Academy team.
* The ACES OpenColorIO configuration builds, i.e. the config file, LUTs and ICC profiles, along the CTL transforms will be hosted as first class products on the [oscars.org](http://oscars.org) website.
* A robust solution will be found for integer based applications such as Adobe Photoshop.
* The broadened scope of ACES beyond its original context will be accounted for with Video Games being a strong adoption driver to be reckoned with.
* Discussions regarding potential changes to the reference environment will be held.

----

## Listening Tour {#listening-tour}
The "listening tour" included 42 interviews by ACES leadership with individuals or groups. 
Those interviewed included users from all different industry perspectives, including:

* color/image scientists
* colorists
* content owners
* DITs
* cinematographers
* manufacturers (cameras, software)
* VFX companies
* authors of the RAE paper
* other general users
* prior ACES leadership

There were nearly 450 comments collected, which were reduced down to 48 main points of feedback. The most frequently mentioned items were highlighted in a "Top 10" list.


### Top 10 List
These were the Top 10 items from the Listening Tour:

1. RRT needs to be invertible and separate the "look" from the RRT (put look in LMT)
2. ACESclip needs to be defined and implemented in tools
3. Need a way to exchange and archive LMTs; re-look at CLF and implement in all tools
4. Need to fix negative values issue (not just through an LMT)
5. CTL is good for prototyping and to define the intention, but because it's not realtime, it isn't viable in production; need to look at other implementations
6. Allow for custom IDTs, including camera color gamut matching
7. Should be able to customize ODTs (including parametric) and publish them
8. Allow for color grading in non-ACES spaces (like the Original Camera Color Gamut and tonal curve). Must be able to document for archive.
9. Should take a look at the AP0/AP1 gamuts including why AP1 red is outside of AP0, why AP1 does not equal 2020 and other issues.
10. Remove modifiers from ODTs; make ODTs more like standard 709 and P3


## How does ACES 2.0 address the items on the Top 10 list?

1. **RRT needs to be invertible and separate the "look" from the RRT (put look in LMT)**
    
    The Output Transforms in ACES 2 are (mostly) invertible. It is a tough problem to solve, as invertibility is in conflict with other requirements to maintain "smooth" visual results. To be invertible, the rendering must extend all the way to the edges of the output gamut, but the rendering simultaneously needs to  avoid letting gamut boundaries manifest as abrupt transitions in rendered images that appear as clipping artifacts. 
    
    ACES v2 is but is more accurate than v1 and has negligible error for outputs up to 1000-nit peak luminance and up to P3 gamut.

2. **ACESclip needs to be defined and implemented in tools**

    The ACES Metadata File (AMF) has been defined.

3. **Need a way to exchange and archive LMTs; re-look at CLF and implement in all tools**

    CLF Specification was updated to v3 and has been in the standardization process at SMPTE. As of early 2025, it is in a Public Committee Draft.

4. **Need to fix negative values issue (not just through an LMT)**

    Gamut mapping included with ACES 2 rendering transform reduces frequency of artifacts. 

5. **CTL is good for prototyping and to define the intention, but because it's not realtime, it isn't viable in production; need to look at other implementations**

    CTL is still the reference implementation, but there are reliable implementations made by others for DCTL, Blink, and OCIO.

6. **Allow for custom IDTs, including camera color gamut matching**

    Custom IDTs have always been allowed. An IDT calculator has been made available to help create new IDTs.

7. **Should be able to customize ODTs (including parametric) and publish them**

    While it was always "allowed" for users to create custom ODTs, an official guide detailing *how* to make them was never published. Modifying ACES 1 ODTs (especially SDR transforms) was very unintuitive. The Single Stage Tonescale-based ("SSTS") was a step toward more "parameterized" customizability.

    The ACES 2 Output Transform algorithm is parameter-driven, meaning that each supplied Output Transforms is simply calling the core algorithm with different preset values that match common or standard display configurations.

8. **Allow for color grading in non-ACES spaces (like the Original Camera Color Gamut and tonal curve). Must be able to document for archive.**

    While ACEScct is provided as a recommended working space, there is no restriction for people who want to work in a different space. AMF documents the entire color pipeline, and can allow for using and tracking a working space other than ACEScct.

9. **Should take a look at the AP0/AP1 gamuts including why AP1 red is outside of AP0, why AP1 does not equal 2020 and other issues.**

    AP0 and AP1 still exist as they are heavily in use in many workflows and product or facility pipelines. But if one wants to use Rec.2020 for rendering or other, there is nothing specific about ACES precluding one from doing so.

10. **Remove modifiers fromm ODTs; make ODTs more like standard 709 and P3**

    Inconsistencies between ODTs have effectively been eliminated by all ACES 2 transforms calling the same unified Output Transform algorithm.


### Future/Ongoing Tasks
1. Build better unit tests to help implementations verify modules of the CTL reference code are working as intended.