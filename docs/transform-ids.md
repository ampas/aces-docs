# Transform IDs and User Names

ACES transforms, which are provided as CTL files in the reference implementation, shall be assigned both a Transform Identifier (TransformID) and a user-facing name (ACESuserName).

## Transform Identifiers (TransformIDs)
ACES transforms shall be assigned a Transform Identifier (written as "TransformID") contained in an XML tag of <ACEStransformID> in the file header. The TransformID describes the transform and includes versioning information specific to that transform file. 

A TransformID is required metadata in AMF files. TransformIDs can also be used for tracking in software implementations that are intended to match the reference ACES transforms, where appropriate, such as in code comments implementing a specific ACES Transform.
 
Transform implementations that may be intended to combine a sequence of ACES CTL transforms (e.g. a Color Space Conversion (CSC) + Look Transform (LMT) + Output Transform) should reference each of the relevant ACES TransformIDs in the implementation transform.

## String format for Transform Identifiers¶
The TransformID serves as a unique identifier for a particular release version of an ACES component. It includes versioning information relevant to three different attributes:

* the version of the TransformID specification to which it conforms, 
* the version of the ACES system release with which the transform is compatible, and 
* the version of the individual transform itself. 
 
TransformIDs are constructed using a set of specified tokens such that it will be more human-readable than a typical Universally Unique Identifier (UUID) but maintain enough structure that intelligent parsing can still be performed.
 
In the following definitions, _italics_ represent a changeable placeholder and **boldface** represents a required character or string. The allowed substrings for each of the changeable placeholders are described in the following subclauses. The substrings shall not contain spaces or periods and shall be limited to the ASCII character set. 
 
All ACES system components, whether Academy-supplied or vendor/user-supplied, shall use the generic versioning string format:

`URN` : `TransformType` . `Namespace` . `Name` . `aACESReleaseMajorVersionNumber` . `vTransformVersionNumber`
 
Where:

### URN¶
`URN` is a unique reference number to identify the version of the TransformID specification used. For new implementations, it shall conform to the first data row in Table 1. 
 
<div align="center" markdown="1">
<figcaption> <b>Table 1</b> - String specification for TransformID URN </figcaption>
| |TransformID URN|
|----:|----|
| Current Version String: | **`urn:ampas:aces:transformId:v2.0:`** |
| Previous values: | `urn:ampas:aces:transformId:v1.5:` |
</div>

 
!!! note
    Throughout the remainder of this document, `urn:ampas:aces:transformId:v2.0` will be shortened to `URN` for brevity.

### TransformType¶
`TransformType` indicates the type, or category, of transform, and shall be equal to one of the values defined in Table 2.

<div align="center" markdown="1">
<figcaption> <b>Table 2</b> - Options for TransformType</figcaption>
| Value | Description |
|:----|:----|
| `CSC` | "Color Space Conversion" <br> For converting between specified sets of color primary encodings and/or non-linear functions; original camera native data to ACES2065-1; also for converting between common color space representations such as Hellwig JMh.|
| `Output` | “Output Transform” <br> For converting an ACES scene-referred image to a display-referred output; applies the combined Reference Rendering Transform and Output Device Transform |
| `InvOutput` | “Inverse direction of an Output Transform” <br> Used to convert display-referred image into equivalent ACES values that will, upon application of the equivalent forward Output Transform, produce an output that is equal to the original input; useful for titles, pre-rendered logos/graphics, or incorporating archival video into an ACES project |
| `Look` | “Look Transform”, a.k.a. Look Modification Transform (LMT) <br> For applying preset creative or technical grades that modify ACES data so that the starting look is different than the default rendering associated with an Output Transform. |
| `InvLook` | “Inverse direction of a Look Transform” <br> For VFX to “undo” a modification of ACES data, if the Look has an analytical inverse. |
| `Lib` | “Library Transform” <br> For “under-the-hood” transforms that are called and re-used by core transforms.|
| `Util` | “Utility Transform” <br> For miscellaneous associated transforms that do not implement core ACES Transforms but may be helpful when testing and or constructing pipelines. Examples: Adjust_Exposure, Unity, etc. |
</div>
 
!!! note "Interchangeability of Input and ColorSpace Transforms"
    In effect, all Input transforms are also ColorSpace transforms, but all ColorSpace transforms are not necessarily Input Transforms.. Specifically, ColorSpace Transforms that convert from a camera manufacturer’s encoding space to ACES can be considered “Input” transforms. Technically speaking, an Input Transforms might at times include an extra step or steps that differs from the a “nominal” camera encoding transform. However, if they are identical, Input and ColorSpace tokens can be used interchangeably.

    Similarly, ColorSpace transforms that convert from ACES to a camera manufacturer’s encoding space can also be considered “InverseInput” transforms.

    If the content of Input and ColorSpace transforms is identical, it is not required to provide duplicate transforms with simply the filename and transformID different. A ColorSpace  transform only is sufficient.

### Namespace¶
`Namespace` shall identify the creator of the transform. This is usually the name of a manufacturer, facility, or, in some instances, could be the name of an individual. 

The namespace `Academy` is reserved for Academy-supplied transforms.
 
Transforms provided by users or vendors to ACES Github repositories shall maintain the namespace of the user or vendor that created it.
 
### Name¶
`Name` shall describe the transform. The level of detail is left up to the user but it should be adequate to uniquely describe the transform and its intended usage. It does not need to try to include the setting for every possible parameter. 
 
For example, if there is a standard that describes an output display type, such as Rec. 2100, that can be used in the filename and transform ID to imply the primaries as Rec. 2020 and transfer function of SMPTE ST 2084. If a transform imposes some sort of variant or limitation making it different from a standard display type, then those differences should be included in the filename and TransformID to clue the user in that different behavior should be expected. 
 
Academy supplied transforms will provide more details in header comments about the specific intended usage of or any caveats pertaining to a particular Output Transform. [In addition, a full list of specific parameters associated with a particular TransformID can be found in a registry of TransformIDs.]
 
For Output Transforms, the Name shall describe the device and/or output data encoding in as much detail as necessary. Items to consider include the encoding color primaries and white point, transfer function, the peak luminance of the display, and any limiting color primaries, white point and/or luminance. The name may also indicate a "simulation" (sim) of another display encoding contained within a standard encoding, e.g. using “Rec.709sim” to show Rec.709 100-nit content on a display set to 1000-nit peak luminance with Rec.2020 primaries and PQ transfer function.
 
Examples:
    URN:Output.Academy.Rec709.a2.v1
    URN:Output.Academy.P3D65.a2.v1
    URN:Output.Academy.P3D65_Rec709sim.a2.v1
    URN:Output.Academy.Rec2100_P3D65limited_540nit.a2.v1
    URN:Output.Academy.Rec2100_P3D65limited_1000nit.a2.v1
    URN:Output.Academy.Rec2020_ST2084_Rec709sim.a2.v1
    URN:Output.Dolby.P3D65_ST2084_Rec709limited_600nit.a2.v1
For Color Space Conversion (CSC) Transforms, the Name shall describe the device. If the creator of the transforms is the same as the camera manufacturer, then the Name need not repeat the manufacturer name because it should already be in the Namespace. If the Input Transform creator is not the camera manufacturer, then the manufacturer name shall be prepended to the device name in the Name field. 
For transforms from one color space to another, the Name shall describe the source color space to the destination color space, using the general form of “from”_to_"to”.
 
Example Input Transform names: - 
URN:CSC.Academy.ACES_to_ACEScg.a2.v1
URN:CSC.Blackmagic.ACES_to_BMDFilm_WideGamut_Gen5.a2.v2
URN:CSC.Red.Log3G10_RWG_to_ACES.a2.v1
 
ACES Major Version Number¶
This piece of the Transform ID shall be a string consisting of the letter ‘a’ followed by the major version number of the current ACES system release. This indicates the ACES system version with which a particular transform is compatible. For new implementations, it shall be equal to the first data row in Table 2. 
 
Table 2 – String specification for ACES Major Version Number
Current Version String:
a2
Previous values:
a1

 
 
Transform Version Number¶
The Transform ID shall conclude with the TransformVersionNumber, a string consisting of the letter ‘v’ followed by the version number of the transform which it identifies. This corresponds to the version of that specific transform itself.
 
Output, Input, and Look Transforms may import sub-functions or constants that are included in separate Library-type CTL files. Library files usually contain more than one sub-function or constant. If a change is made to a Library file that will change the resulting output from a transform that uses that Library function, then the version number of the calling transform’s TransformID shall also be incremented. However, modifications to a Library file that do not affect the numerical output of a calling function (e.g. adding new subfunctions used by other importing files) do not require the TransformID of a file importing it to be incremented.
 
Any updates to a Transform file that do not change the output of that transform (e.g. whitespace changes, modifications to code comments, etc.) shall also not require the transform version number to be incremented, although it can be if the editor decides it is warranted or otherwise more useful to do so.