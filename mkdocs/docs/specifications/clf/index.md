<!-- Include acronyms-->
--8<-- "mkdocs/includes/acronyms.md"

<!-- Include section numbering -->
<style>
    @import "../../stylesheets/sections.css"
</style>



Common LUT Format (CLF) - A Common File Format for Look-Up Tables
================


Introduction 
----------------
Look-Up Tables (LUTs) are a common implementation for transformations from one set of color values to another. With a large number of product developers providing software and hardware solutions for LUTs, there is an explosion of unique vendor-specific LUT file formats, which are often only trivially different from each other. This can create workflow problems when a LUT being used on a production is not supported by one or more of the applications being used. Furthermore, many LUT formats are designed for a particular use case only and lack the quality, flexibility, and metadata needed to meet modern requirements.

The Common LUT Format (CLF) can communicate an arbitrary chain of color operators (also called pro- cessing nodes) which are sequentially processed to achieve an end result. The set of available operator types includes matrices, 1D LUTs, 3D LUTs, ASC-CDL, log and exponential shaper functions, and more. Even when 1D or 3D LUTs are not present, CLF can be used to encapsulate any supported color transforms as a text file conforming to the XML schema.


Scope
-----

This document introduces a human-readable text file format for the interchange of color transformations using an XML schema. The XML format supports Look-Up Tables of several types: 1D LUTs, 3D LUTs, and 3×1D LUTs, as well as additional transformation needs such as matrices, range rescaling, and “shaper LUTs.”
The document defines what is a valid CLF file. Though it is not intended as a tutorial for users to create their own files, LUT creators will find it useful to understand the elements and attributes available for use in a CLF file. The document is also not intended to provide guidance to implementors on how to optimize their implementations, but does provide a few notes on the subject.
This document assumes the reader has knowledge of basic color transformation operators and XML.


References
----------
The following standards, specifications, articles, presentations, and texts are referenced in this text:

* [IETF RFC 3066: IETF (Internet Engineering Task Force). RFC 3066: Tags for the Identification of Lan- guages, ed. H. Alvestrand. 2001 IEEE DRAFT Standard P123](https://www.ietf.org/rfc/rfc3066.txt)
* [Academy S-2014-002, Academy Color Encoding System – Versioning System](http://j.mp/S-2014-002)
* [Academy TB-2014-002, Academy Color Encoding System Version 1.0 User Experience Guidelines](http://j.mp/TB-2014-002)
* ASC Color Decision List (ASC CDL) Transfer Functions and Interchange Syntax. ASC-CDL Release1.2. Joshua Pines and David Reisner. 2009-05-04.


Specification
-------------

### General
A Common LUT Format (CLF) file shall be written using Extensible Markup Language (XML) and adhere to a defined XML structure. A CLF file shall have the file extension '`.clf`'.

The top level element in a CLF file defines a `ProcessList` which represents a sequential set of color trans- formations. The result of each individual color transformation feeds into the next transform in the list to create a daisy chain of transforms.

An application reads a CLF file and initializes a transform engine to perform the operations in the list. The transform engine reads as input a stream of code values of pixels, performs the calculations and/or interpola- tions, and writes an output stream representing a new set of code values for the pixels.

In the sequence of transformations described by a `ProcessList`, each `ProcessNode` performs a trans- form on a stream of pixel data, and only one input line (input pixel values) may enter a node and only one output line (output pixel values) may exit a node. A `ProcessList` may be defined to work on either 1- component or 3-component pixel data, however all transforms in the list must be appropriate, especially in the 1-component case (black-and-white) where only 1D LUT operations are allowed. Implementation may process 1-component transforms by applying the same processing to R, G, and B.


<figure markdown>
  ![ProcessList](./images/processList-dark.png#only-dark){ width="350" }
  ![ProcessList](./images/processList-light.png#only-light){ width="350" }
  <figcaption><br>Figure 1. Example of a ProcessList containing a sequence of multiple ProcessNodes</figcaption>
</figure>

The file format does not provide a mechanism to assign color transforms to either image sequences or image regions. However, the XML structure defining the LUT transform, a ProcessList, may be encapsulated in a larger XML structure potentially providing that mechanism. This mechanism is beyond the scope of this document.

Each CLF file shall be completely self-contained requiring no external information or metadata. The full content of a color transform must be included in each file and a color transform may not be incorporated by reference to another CLF file. This restriction ensures that each CLF file can be an independent archival element.

Each ProcessList shall be given a unique ID for reference.

The data for LUTs shall be an ordered array that is either all floats or all integers. When three RGB color components are present, it is assumed that these are red, green, and blue in that order. There is only one order for how the data array elements are specified in a LUT, which is in general from black to white (from the minimum input value position to the maximum input value position). Arbitrary ordering of list elements is not supported in the format (see **[XML Elements]**(#xml-elements) for details).

!!! note
    For 3D LUTs, the indexes to the cube are assumed to have regular spacing across the range of input values. To accommodate irregular spacing, a "`halfDomain`" 1D LUT or Log node should be used as a shaper function prior to the 3D LUT.

### XML Structure 

#### General
A CLF file shall contain a single occurrence of the XML root element known as the ProcessList. The ProcessList element shall contain one or more elements known as ProcessNodes. The order and number of process nodes is determined by the designer of the CLF file.

An example of the overall structure of a simple CLF file is thus:

```xml
<ProcessList id="123">
    <Matrix id="1">
        data & metadata
    </Matrix>
    <LUT1D id="2">
        data & metadata
    </LUT1D> 
    <Matrix id="3">
        data & metadata
    </Matrix>
</ProcessList>
```

#### XML Version and Encoding
A CLF file shall include a starting line that declares XML version number and character encoding. This line is mandatory once in a file and looks like this:

```xml
<?xml version="1.0" encoding="UTF-8"?>
```

#### Comments
The file may also contain XML comments that may be used to describe the structure of the file or save information that would not normally be exposed to a database or to a user. XML comments are enclosed in brackets like so:

```xml
<!--  This is a comment  -->
```

#### Language
It is often useful to identify the natural or formal language in which text strings of XML documents are written. The special attribute named xml:lang may be inserted in XML documents to specify the language used in the contents and attribute values of any element in an XML document. The values of the attribute are language identifiers as defined by IETF RFC 3066. In addition, the empty string may be specified.
The language specified by xml:lang applies to the element where it is specified (including the values of its attributes), and to all elements in its content unless overridden with another instance of xml:lang. In particular, the empty value of xml:lang can be used to override a specification of xml:lang on an enclosing element, without specifying another language.

#### White Space
Particularly when creating CLF files containing certain elements (such as `Array`, `LUT1D`, or `LUT3D`) it is desirable that single lines per entry are maintained so that file contents can be scanned more easily by a human reader. There exist some difficulties with maintaining this behavior as XML has some non-specific methods for handling white-space. Especially if files are re-written from an XML parser, white space will not necessarily be maintained. To maintain line layout, XML style sheets may be used for reviewing and checking the CLF file’s entries.

#### Newline Control Characters
Different end of line conventions, including `<CR>`, `<LF>`, and `<CRLF>`, are utilized between Mac, Unix, and Windows systems. Different newline characters may result in the collapse of values into one long line of text. To maintain intended linebreaks, CLF specifies that the ‘newline’ string (i.e. the byte(s) to be interpreted as ending each line of text) shall be the single code value $10_{10} = 0\textrm{A}_{16}$ (ASCII ‘Line Feed’ character), also indicated `<LF>`.

!!! note
    Parsers of CLF files may choose to interpret Microsoft’s `<CR><LF>` or older-MacOS’ `<CR>` newline conventions, but CLF files should only be generated with the `<LF>` encoding.

!!! note
    `<LF>` is the newline convention native to all *nix operating systems (including Linux and modern macOS).



XML Elements {#xml-elements}
----------------------------

<figure markdown>
  ![ProcessList](./images/clf-diagram-light.png#only-light)
  ![ProcessList](./images/clf-diagram-dark.png#only-dark)
    <figcaption><br>Figure 2. Object Model of XML Elements</figcaption>
</figure>



### ProcessList

*Description:* <br>
The `ProcessList` is the root element for any CLF file and is composed of one or more ProcessNodes. A `ProcessList` is required even if only one `ProcessNode` will be present.

!!! note
    The last node of the `ProcessList` is expected to be the final output of the LUT. A LUT designer can allow floating-point values to be interpreted by applications and thus delay control of the final encoding through user selections.

!!! note
    If needed, a `Range` node can be placed at the end of a `ProcessList` to control minimum and maximum output values and clamping.


*Attributes:*
`id` (required) 
: a string to serve as a unique identifier of the `ProcessList`

`compCLFversion` (required)
: a string indicating the minimum compatible CLF specification version required to read this file <br> 
The `compCLFversion` corresponding to this version of the specification is be `"3.0"`.

`name` (optional)
: a concise string used as a text name of the `ProcessList` for display or selection from an applica- tion’s user interface

`inverseOf` (optional)
: a string for linking to another ProcessList `id` (unique) which is the inverse of this one


*Elements:*
`Description` (optional)
: a string for comments describing the function, usage, or any notes about the `ProcessList`. A `ProcessList` can contain zero or more `Description` elements.

`InputDescriptor` (optional)
: an arbitrary string used to describe the intended source code values of the `ProcessList`

`OutputDescriptor` (optional)
: an arbitrary string used to describe the intended output target of the `ProcessList` (e.g. target display)

`ProcessNode` (required)
: a generic XML element that in practice is substituted with a particular color operator. The `ProcessList` must contain at least one `ProcessNode`. The `ProcessNode` is described in [ProcessNode](#processNode).

`Info` (optional)
: optional element for including additional custom metadata not needed to interpret the transforms. The `Info` element includes:

<div style="padding-left: 30px;" markdown="1">
`AppRelease` (optional) 
: a string used for indicating application software release level

`Copyright` (optional)
: a string containing a copyright notice for authorship of the CLF file

`Revision` (optional)
: a string used to track the version of the LUT itself (e.g. an increased resolution from a previous version of the LUT)

`ACEStransformID` (optional)
: a string containing an ACES transform identifier as described in Academy S-2014-002. If the transform described by the `ProcessList` is the concatenation of several ACES transforms, this element may contain several ACES Transform IDs, separated by white space or line separators. This element is mandatory for ACES transforms and may be referenced from ACES Metadata Files.

`ACESuserName` (optional)
: a string containing the user-friendly name recommended for use in product user interfaces as described in [Academy TB-2014-002](http://j.mp/TB-2014-002)

`CalibrationInfo` (optional)
: container element for calibration metadata used when making a LUT for a specific device. <br> `CalibrationInfo` can contain the following child elements: <ul>
        `DisplayDeviceSerialNum`<br>
        `DisplayDeviceHostName`<br>
        `OperatorName`<br>
        `CalibrationDateTime`<br>
        `MeasurementProbe`<br>
        `CalibrationSoftwareName`<br>
        `CalibrationSoftwareVersion`
    </ul>
</div>



### ProcessNode {#processNode}

*Description:* <br>
A `ProcessNode` element represents an operation to be applied to the image data. At least one `ProcessNode` element must be included in a `ProcessList`. The generic `ProcessNode` element contains attributes and elements that are common to and inherited by the specific sub-types of the `ProcessNode` element that can substitute for `ProcessNode`. All `ProcessNode` substitutes shall inherit the following attributes.

*Attributes:*
`id` (optional)
: a unique identifier for the `ProcessNode`

`name` (optional)
: a concise string defining a name for the `ProcessNode` that can be used by an application for display in a user interface

`inBitDepth` (required)
: a string that is used by some ProcessNodes to indicate how array or parameter values have been scaled

`outBitDepth` (required)
: a string that is used by some ProcessNodes to indicate how array or parameter values have been scaled The supported values for both `inBitDepth` and `outBitDepth` are the same:

- `"8i"`: 8-bit unsigned integer
- `"10i"`: 10-bit unsigned integer
- `"12i"`: 12-bit unsigned integer
- `"16i"`: 16-bit unsigned integer
- `"16f"`: 16-bit floating point (half-float)
- `"32f"`: 32-bit floating point (single precision)


*Elements:*
`Description` (optional)
: an arbitrary string for describing the function, usage, or notes about the ProcessNode. A ProcessNode can contain one or more Descriptions.

### Array {#array}

*Description:* <br>
The `Array` element contains a table of entries with a single line for each grouping of values. This element is used in the `LUT1D`, `LUT3D`, and `Matrix` ProcessNodes. The `dim` attribute specifies the dimensions of the array and, depending on context, defines the size of a matrix or the length of a LUT table. The specific formatting of the `dim` attribute must match with the type of node in which it is being used. The usages are summarized below but specific requirements for each application of `Array` are described when it appears as a child element for a particular `ProcessNode`.

*Attributes:*
`dim` (required)

:   Specifies the dimension of the LUT or the matrix and the number of color components. The `dim` attribute provides the dimensionality of the indexes, where:

: * 4 entries represent the dimensions of a 3D cube and the number of components per entry.<br>    e.g. `dim = 17 17 17 3` indicates a 17-cubed 3D LUT with 3 color components 

: * 2 entries represent the dimensions of a matrix.<br>
e.g. `dim = 3 3` indicates a 3×3 matrix<br>
e.g. `dim = 3 4` indicates a 3×4 matrix

: * 2 entries represent the length of the LUT and the component value (1 or 3).<br>
e.g. `dim = 256 3` indicates a 256 element 1D LUT with 3 components (a 3×1D LUT)<br>
e.g. `dim = 256 1` indicates a 256 element 1D LUT with 1 component (1D LUT)


## Substititues for `ProcessNode`

### General
The attributes and elements defined for `ProcessNode` are inherited by the substitutes for `ProcessNode`. This section defines the available substitutes for the generalized `ProcessNode` element.

The `inBitDepth` of a `ProcessNode` must match the `outBitDepth` of the preceding `ProcessNode` (if any).


### `LUT1D`

*Description:*<br>
A 1D LUT transform uses an input pixel value, finds the two nearest index positions in the LUT, and then interpolates the output value using the entries associated with those positions.

This node shall contain either a 1D LUT or a 3x1D LUT in the form of an `Array`. If the input to a `LUT1D` is an RGB value, the same LUT shall be applied to all three color components.

A 3x1D LUT transform looks up each color component in a separate `LUT1D` of the same length. In a 3x1D LUT, by convention, the `LUT1D` for the first component goes in the first column of `Array`.

The scaling of the array values is based on the `outBitDepth` (the `inBitDepth` is not considered).

The length of a 1D LUT should be limited to at most 65536 entries, and implementations are not required to support `LUT1D`s longer than 65536 entries.

Linear interpolation shall be used for `LUT1D`. More information about linear interpolation can be found in [Appendix B](link).

*Elements:*
`Array` (required)
: an array of numeric values that are the output values of the 1D LUT. `Array` shall contain the table entries of a LUT in order from minimum value to maximum value.
: For a 1D LUT, one value per entry is used for all color channels. For a 3x1D LUT, each line should contain 3 values, creating a table where each column defines a 1D LUT for each color component. 
: For RGB, the first column shall correspond to R’s 1D LUT, the second column shall correspond to G’s 1D LUT, and the third column shall correspond to B’s 1D LUT.

<div style="padding-left: 30px;" markdown="1">
*Attributes:*
`dim` (required)
: two integers that represent the dimensions of the array. The first value defines the length of the array and shall equal the number of entries (lines) in the LUT. The second value indicates the number of components per entry and shall equal 1 for a 1D LUT or 3 for a 3x1D LUT.

    !!! example
        `dim = "1024 3"` indicates a 1024 element 1D LUT with 3 component color (a 3x1D LUT)

    !!! example
        `dim = "256 1"` indicates a 256 element 1D LUT with 1 component color (a 1D LUT)

!!! note
    `Array` is formatted differently when it is contained in a `LUT3D` or `Matrix` element (see [Array](#array)).
</div>

*Attributes:*
`interpolation` (optional)
: a string indicating the preferred algorithm used to interpolate values in the `1DLUT`. This attribute is optional but, if present, shall be set to `"linear"`.

    !!! note
        Previous versions of this specification allowed for implementations to utilize different types of interpolation but did not define what those interpolation types were or how they should be labeled. For simplicity and to ensure similarity across implementations, 1D LUT interpolation has been limited to `"linear"` in this version of the specification. Support for additional interpolation types could be added in future version.

`halfDomain` (optional)
: If this attribute is present, its value must equal `“true”`. When true, the input domain to the node is considered to be all possible 16-bit floating-point values, and there must be exactly 65536 entries in the `Array` element.

    !!! note
        For example, the unsigned integer 15360 has the same bit-pattern (0011110000000000) as the half-float value 1.0, so the 15360th entry (zero-indexed) in the `Array` element is the output value corresponding to an input value of 1.0.

`rawHalfs` (optional)
: If this attribute is present, its value must equal `“true”`. When true, the `rawHalfs` attribute indicates that the output array values in the form of unsigned 16-bit integers are interpreted as the equivalent bit pattern, half floating-point values.

    !!! note
        For example, to represent the value 1.0, one would use the integer 15360 in the `Array` element because it has the same bit-pattern. This allows the specification of exact half-float values without relying on conversion from decimal text strings.


*Examples:*
```xml
<LUT1D id="lut-23" name="4 Value Lut" inBitDepth="12i" outBitDepth="12i"> 
    <Description>1D LUT - Turn 4 grey levels into 4 inverted codes</Description>
    <Array dim="4 1">
        3
        2
        1
        0
    </Array>
</LUT1D>
```
<figure markdown="1">
  <figcaption>Example 1 - Example of a very simple LUT1D </figcaption>
</figure>



### `LUT3D`

*Description:*<br>
This node shall contain a 3D LUT in the form of an Array. In a LUT3D, the 3 color components of the input value are used to find the nearest indexed values along each axis of the 3D cube. The 3-component output value is calculated by interpolating within the volume defined by the nearest corresponding positions in the LUT.
LUT3Ds have the same dimension on all axes (i.e. Array dimensions are of the form “n n n 3”). A LUT3D with axial dimensions greater than 128x128x128 should be avoided.
The scaling of the array values is based on the outBitDepth (the inBitDepth is not considered). 

*Attributes:*
`interpolation` (optional)
: a string indicating the preferred algorithm used to interpolate values in the 3DLUT. This attribute is optional with a default of `"trilinear"` if the attribute is not present. <br>
Supported values are:

    - `"trilinear"`: perform trilinear interpolation
    - `"tetrahedral"`: perform tetrahedral interpolation 
    
    !!! note
        Interpolation methods are specified in [Appendix B](#appendixB).

*Elements:*
`Array` (required)
: an array of numeric values that are the output values of the 3D LUT. The `Array` shall contain the table entries for the `LUT3D` from the minimum to the maximum input values, with the third component index changing fastest.

<div style="padding-left: 30px;" markdown="1">
*Attributes:*
`dim` (required)
: four integers that reperesent the dimensions of the 3D LUT and the number of color com-
ponents. The first three values define the dimensions of the LUT and if multiplied shall equal the number of entries actually present in the array. The fourth value indicates the number of components per entry. <br>
4 entries have the dimensions of a 3D cube plus the number of components per entry.

    !!! example
        `dim = "17 17 17 3"` indicates a 17-cubed 3D lookup table with 3 component color

!!! note 
    `Array` is formatted differently when it is contained in a `LUT1D` or `Matrix` element (see [Array](#array)).
</div>

*Examples:*
```xml
<LUT3D id="lut-24" name="green look" interpolation="trilinear" inBitDepth="12i" outBitDepth="16f">
    <Description>3D LUT</Description>
    <Array dim="2 2 2 3">
        0.0 0.0 0.0
        0.0 0.0 1.0
        0.0 1.0 0.0
        0.0 1.0 1.0
        1.0 0.0 0.0
        1.0 0.0 1.0
        1.0 1.0 0.0
        1.0 1.0 1.0
    </Array>
</LUT3D>
```
<figure markdown="1">
  <figcaption>Example 2 – Example of a simple LUT3D</figcaption>
</figure>



### Matrix {#matrix}

*Description:*<br>
This node specifies a matrix transformation to be applied to the input values. The input and output of a `Matrix` are always 3-component values.

All matrix calculations should be performed in floating point, and input bit depths of integer type should be treated as scaled floats. If the input bit depth and output bit depth do not match, the coefficients in the matrix must incorporate the results of the ‘scale’ factor that will convert the input bit depth to the output bit depth (e.g. input of `10i` with an output of `12i` requires the matrix coefficients already have a factor of $4095/1023$ applied). Changing the input or output bit depth requires creation of a new set of coefficients for the matrix.

The output values are calculated using row-order convention: 

$$
    \begin{bmatrix}
        a_{11} & a_{12} & a_{13} \\
        a_{21} & a_{22} & a_{23} \\
        a_{31} & a_{32} & a_{33} \\
    \end{bmatrix}
    \begin{bmatrix}
        r_1\\
        g_1\\
        b_1
    \end{bmatrix}
    =
    \begin{bmatrix}
        r_2\\
        g_2\\
        b_2
    \end{bmatrix}
$$

which is equivalent in functionality to the following:

$$
    \begin{aligned}
        r_2 = (r_1 \cdot a_{11}) + (g_1 \cdot a_{12}) + (b_1 \cdot a_{13}) \\
        g_2 = (r_1 \cdot a_{21}) + (g_1 \cdot a_{22}) + (b_1 \cdot a_{23}) \\
        b_2 = (r_1 \cdot a_{31}) + (g_1 \cdot a_{32}) + (b_1 \cdot a_{33})
    \end{aligned}    
$$

Matrices using an offset calculation will have one more column than rows. An offset matrix may be defined using a 3x4 `Array`, wherein the fourth column is used to specify offset terms, $k_1$, $k_2$, $k_3$: 

$$
    \begin{bmatrix}
        a_{11} & a_{12} & a_{13} & k_1\\
        a_{21} & a_{22} & a_{23} & k_2\\
        a_{31} & a_{32} & a_{33} & k_3\\
    \end{bmatrix}
    \begin{bmatrix}
        r_1\\
        g_1\\
        b_1\\
        1.0
    \end{bmatrix}
    =
    \begin{bmatrix}
        r_2\\
        g_2\\
        b_2
    \end{bmatrix}
$$

Expanded out, this means that the offset terms $k_1$, $k_2$, and $k_3$ are added to each of the normal matrix calculations:

$$
    \begin{aligned}
    r_2 = (r_1 \cdot a_{11}) + (g_1 \cdot a_{12}) + (b_1 \cdot a_{13}) + k_1\\
    g_2 = (r_1 \cdot a_{21}) + (g_1 \cdot a_{22}) + (b_1 \cdot a_{23}) + k_2\\
    b_2 = (r_1 \cdot a_{31}) + (g_1 \cdot a_{32}) + (b_1 \cdot a_{33}) + k_3
    \end{aligned}    
$$

 
*Elements:*
`Array` (required)
: a table that provides the coefficients of the transformation matrix. The matrix dimensions are either 3x3 or 3x4. The matrix is serialized row by row from top to bottom and from left to right, <br>i.e., "$a_{11}\ a_{12}\ a_{13}\ a_{21}\ a_{22}\ a_{23}\ \ldots$" for a 3x3 matrix.

$$
    \begin{bmatrix}
        a_{11} & a_{12} & a_{13} \\
        a_{21} & a_{22} & a_{23} \\
        a_{31} & a_{32} & a_{33} \\
    \end{bmatrix}
$$

<div style="padding-left: 30px;" markdown="1">
*Attributes:*
`dim` (required)
: two integers that describe the dimensions of the matrix array. The first value define the number of rows and the second is the number of columns. <br>
2 entries have the dimensions of a matrix

    !!! example
        `dim = "3 3"` indicates a 3x3 matrix

    !!! example
        `dim = "3 4"` indicates a 3x4 matrix

!!! note
    Previous versions of this specification used three integers for the `dim` attribute, rather than the current two. In order to facilitate backwards compatibility, implementations should allow a third value for the `dim` attribute and may simply ignore it.

!!! note
    `Array` is formatted differently when nit is contained in a LUT1D or LUT3D element (see [Array](#array))
</div>

*Examples:*
```xml
<Matrix id="lut-28" name="AP0 to AP1" inBitDepth="16f" outBitDepth="16f" >
    <Description>3x3 color space conversion from AP0 to AP1</Description>
    <Array dim="3 3">
         1.45143931614567     -0.236510746893740    -0.214928569251925
        -0.0765537733960204    1.17622969983357     -0.0996759264375522
         0.00831614842569772  -0.00603244979102103   0.997716301365324
    </Array>
</Matrix>
```
<figure markdown="1">
  <figcaption>Example 3 – Example of a `Matrix` node with `dim="3 3 3"`</figcaption>
</figure>

```xml
<Matrix id="lut-25" name="colorspace conversion" inBitDepth="10i" outBitDepth="10i" >
    <Description> 3x4 Matrix , 4th column is offset </Description>
    <Array dim="3 4">
        1.2     0.0     0.0     0.002
        0.0     1.03    0.001   -0.005
        0.004   -0.007  1.004   0.0
    </Array>
</Matrix>
```
<figure markdown="1">
  <figcaption>Example 4 – Example of a `Matrix` node</figcaption>
</figure>



### Range {#range}

*Description:*<br>
This node maps the input domain to the output range by scaling and offsetting values. The `Range` element can also be used to clamp values.

Unless otherwise specified, the node’s default behavior is to scale and offset with clamping. If clamping is not desired, the `style` attribute can be set to `"noClamp"`.

To achieve scale and/or offset of values, all of `minInValue`, `minOutValue`, `maxInValue`, and `maxOutValue` must be present. In this explicit case, the formula for `Range` shall be: 

$$
    out = in \times scale + \texttt{minOutValue} - \texttt{minInValue} \times scale
$$

where:
$$
    scale = \dfrac{(\texttt{maxOutValue} - \texttt{minOutValue})}{(\texttt{maxInValue} - \texttt{minInValue})}
$$

The scaling of `minInValue` and `maxInValue` depends on the input bit-depth, and the scaling of `minOutValue` and `maxOutValue` depends on the output bit-depth.

If `style="Clamp"`, the output value of $out$ from the above equation is furthur modified as follows:

$$
    out_{clamped} = \mathrm{MIN}(\texttt{maxOutValue}, \mathrm{MAX}( \texttt{minOutValue}, out))
$$

where: <br>
<div style="padding-left: 50px;" markdown="1">
$\mathrm{MAX}(a,b)$ returns $a$ if $a > b$ and $b$ if $b \geq a$ <br>
$\mathrm{MIN}(a,b)$ returns $a$ if $a < b$ and $b$ if $b \leq a$
</div>

The `Range` element can also be used to clamp values on only the top or bottom end. In such instances, no offset is applied, and the formula simplifies because only one pair of min or max values are required. (The `style` shall not be `"noClamp"` for this use-case.)

If only the minimum value pair is provided, then the result shall be clamping at the low end, according to:

$$
    out = \mathrm{MAX}( \texttt{minOutValue}, in \times bitDepthScale)
$$

If only the maximum values pairs are provided, the result shall be clamping at the high end, according to:

$$
    out = \mathrm{MIN}( \texttt{maxOutValue}, in \times bitDepthScale)
$$

where:
$$
bitDepthScale = \dfrac{\mathrm{SIZE}(\texttt{outBitDepth})}{\mathrm{SIZE}(\texttt{inBitDepth})}
$$

$$
\mathrm{SIZE}(a) =
\begin{cases}
    2^{bitDepth}-1 & \text{when }a \in \{\texttt{"8i"},\texttt{"10i"},\texttt{"12i"},\texttt{"16i"}\} \\
    1.0 & \text{when }a \in \{\texttt{"16f"},\texttt{"32f"}\}
\end{cases}
$$

In both instances, values must be set such that $\texttt{maxOutValue} = \texttt{maxInValue} \times bitDepthScale$.

!!! note
    The bit depth scale factor intentionally uses $2^{bitDepth}−1$ and not $2^{bitDepth}$. This means that the scale factor created for scaling between different bit depths is "non-integer" and is slightly different depending on the bit depths being scaled between. While instinct might be that this scale should be a clean bit-shift factor (i.e. 2x or 4x scale), testing with a few example values plugged into the formula will show that the resulting non-integer scale is the correct and intended behavior.

At least one pair of either minimum or maximum values, or all four values, must be provided.

*Elements:*
`minInValue` (optional) 
: The minimum input value. Required if `minOutValue` is present.

`maxInValue` (optional)
: The maximum input value. Required if `maxOutValue` is present.<br>
The `maxInValue` shall be greater than the `minInValue`.

`minOutValue` (optional)
: The minimum output value. Required if `minInValue` is present.

`maxOutValue` (optional)
:The maximum output value. Required if `maxInValue` is present. <br>
The `maxOutValue` shall be greater than or equal to the `minOutValue`.

*Attributes:*
`style` (optional)
: Describes the preferred handling of the scaling calculation of the `Range` node. If the style attribute is not present, clamping is performed.<br>
The options for `style` are:

<div style="padding-left: 30px;" markdown="1">
`"noClamp"`
: If present, scale and offset is applied without clamping, as in Eq. 4.6. (i.e. values below `minOutValue` or above `maxOutValue` are preserved)

`"Clamp"`
: If present, clamping is applied according to Eq. 4.7 upon the result of the scale and offset expressed in Eq. 4.6
</div>

*Examples:*
```xml
<Range inBitDepth="10i" outBitDepth="10i">
<Description>10-bit full range to SMPTE range</Description> <minInValue>0</minInValue>
<maxInValue>1023</minInValue>
<minOutValue>64</minInValue>
<maxOutValue>940</minInValue>
</Range>
```
<figure markdown="1">
  <figcaption>Example 5 – Using "Range" for scaling 10-bit full range to 10-bit SMPTE (legal) range.</figcaption>
</figure>


### Log
