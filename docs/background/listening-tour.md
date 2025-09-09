Full Details of Listening Tour
==============================

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