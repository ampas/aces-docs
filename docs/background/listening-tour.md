Feedback on ACES v1
-------------------

A slew of feedback was collected on ACES v1. 

## ACES Retrospective and Enhancements Paper
On March 9, 2017, a paper titled "ACES Retrospective and Enhancements" was shared publicly by key users of ACES v1 as an open letter to the ACES leadership team and the larger community of ACES users and contributors. This paper presented a series of talking points which summarized the experiences of several image quality experts
within the visual effects and interactive entertainment industries. These points highlighted issues encountered with the ACES 1 system in both production and research environments. The central themes of these points were:
1. to make the ACES system more open to peer-review and academic discourse
2. more flexible for a wider variety of users, and 
3. more robust to current and future implementations of the specification. 

A summary of the points made in the paper:

* The past, current and future of ACES development will be more open to peer-review and academic discourse.
* A public record of any experimentation, analysis, and implementations, along with useful data (image datasets, viewing conditions, display attributes and observer physiological characteristics) will be initiated.
* The CTL codebase documentation, especially the unexplained constants will be revised.
* A document on ODT creation akin to P-2013-001 [Amp15] will be written.
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



## Listening Tour
The "listening tour" included 42 interviews by ACES leadership with individuals or groups. 
Those interviewed included users from all different industry view points, including:
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

Also 80 other individuals

Nearly 450 comments to parse through, reduced down to 48 main points of feedback. Here were the Top Ten

1. RRT needs to be invertible and separate the "look" from the RRT (put look in LMT)
2. ACESclip needs to be defined and implemented in tools
3. Need a way to exchange and archive LMTs; re-look at CLF and implement in all tools
4. Need to fix negative values issue (not just through an LMT)
5. CTL is good for prototyping and to define the intention, but because it's not realtime, it isn't viable in production; need to look at other implementations
6. Allow for custom IDTs, including camera color gamut matching
7. Should be able to customize ODTs (including parametric) and publish them
8. Allow for color grading in non-ACES spaces (like the Original Camera Color Gamut and tonal curve). Must be able to document for archive.
9. Should take a look at the AP0/AP1 gamuts including why AP1 red is outside of AP0, why AP1 does not equal 2020 and other issues.
10. Remove modifiers fromm ODTs; make ODTs more like standard 709 and P3

ACES Community, 

For reference below is the full list of ACES points of feedback from the Listening Tour.

| Rank | Topic |
|---| --- |
|1| RRT needs to be invertible and separate the “look” from the RRT (put look in LMT)|
|2| ACESclip needs to be defined and implemented in tools|
|3| Need a way to exchange and archive LMTs; re-look at CLF and implement in all tools|
|4| Need to fix negative values issue (not just through an LMT)|
|5| CTL is good for prototyping and to define the intention, but because it’s not realtime, it isn’t viable in production; need to look other implementations|
|6| Allow for custom IDTs, including camera color gamut matching|
|7| Should be able to customize ODTs (including parametric) and publish them|
|8| Allow for color grading in non-ACES spaces (like the Original Camera Color Gamut and tonal curve). Must be able to document for archive|
|9| Should take a look at the AP0/AP1 gamuts including why AP1 red is outside of AP0, why AP1 does not equal 2020 and other issues|
|10| Remove modifiers from ODTs; make ODTs more like standard 709 and P3|
|11| OpenColor IO implementation for ACES is extremely important and needs to have a tighter integration with ACES (see RAE responses for specfic items as well)|
|12| A robust solution will be found for integer based applications such as Adobe Photoshop.|
|13| Documentation to make ACES easier to implement for laypeople|
|14| ADX/Film workflow needs to be re-visited (need ASAP rolls, etc.)|
|15| Need best practices for what should be in an ACES archive|
|16| Need clarification of what an ACES workflow is and consists of at a minimum|
|17| The CTL codebase documentation, especially the unexplained constants will be revised.|
|18| A document on ODT creation akin to P-2013-001 will be written.|
|19| The CTL codebase and the official ACES OpenColorIO configurations, along with relevant documents, e.g. technical bulletins, will be stamped with DOIs.|
|20| Need to include compression for EXRs as part of the SMPTE standard|
|21| The past, current, and future of ACES development will be more open to peer-review and academic discourse.|
|22| A public record of any experimentation, analysis, and implementations, along with useful data (image datasets, viewing conditions, display attributes and observer physiological char- acteristics) will be initiated.|
|23| The Academy website will be the host for best practice guides for usage of ACES and ACES OpenColorIO configurations within DCC applications.|
|24| The broadened scope of ACES beyond its original context will be accounted for with Video Games being a strong adoption driver to be reckoned with.|
|25| Discussions regarding potential changes to the reference environment will be held.|
|26| P3 and 709 ODTs need to match|
|27| 18% gray under the same lighting conditions with the cameras set to the same settings should result in .18 in linear. (note that several suggestions are made for testing under Camera section)|
|28| ODTs should be simpler|
|29| Need to work with display referred spaces like sRGB|
|30| Re-look and possibly deprecate ACESproxy (possibly in favor of ACEScct)|
|31| If you are going to have the logo, there needs to be a vetting process for the logo|
|32| Need IDTs for other cameras and generic cameras|
|33| Need to look at legal/full range issues in output transforms|
|34| Need to factor in mattes in EXRs and how they are processed in AP0 and AP1|
|35| Need support for D65 white point in addition to D60|
|36| Re-look at LMTs working in linear light|
|37| Need documentation on how camera image processing gets into ACES EXR|
|38| Need documentation that can go to Mastering and Marketing teams for "Why go ACES?"|
|39| Would like to grade before and after LMT and ODTs|
|40| Need to make sure color works the same from system to system|
|41| LMTs are band limiting|
|42| De-bayering technique should be factored in when creating ACES EXRs|
|43| There needs to be a way to achieve (1,1,1) in a BT.709 file.|
|44| Github is hard to navigate|
|45| Need to look at "camera blacks" in IDTs|
|46| Need testing suites and images to confirm systems work properly|
|47| Can you give guidance on using external grading products also? Like here’s what you’ll be seeing with ACES_CCT.|
|48| Should consider creating an Implementation Group to help bridge the gap between development and tools and discuss issues|


## So, how did ACES 2.0 address the items on the Top Ten list?

1. New Output Transforms are (mostly) invertible. It is a tough problem to solve, but is pretty effective, especially at normal SDR range.
2. AMF was defined with a schema released.
3. CLF Specification was updated to v3 and has been in the standardization process at SMPTE. As of early 2025, it is in a Public Committee Draft.
4. 
5.
6.
7.
8. AMF documents the entire color pipeline, including allowing for selecting a non-ACES working space
9. 
