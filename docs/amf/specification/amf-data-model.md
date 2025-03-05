Specification
==========

This section describes the data intended for use within the ACES Metadata file.

## Namespace

All top level structures shall be tagged as being within the `aces` namespace with urn `urn:ampas:aces:amf:v2.0`

## UML Diagram
The following UML diagrams are segments of the complete UML diagram which is not included in this document due to space constraints.  To view the entire UML diagram in SVG format visit [https://aces.mp/amf\_uml](https://aces.mp/amf\_uml).

### acesMetadataFile
<figure align="center" markdown>
  ![diagram](./uml_diagrams/uml_amf.svg)
</figure> 

### amfInfo
<figure align="center" markdown>
  ![amfDiagram ](./uml_diagrams/uml_amfInfo.svg)
</figure>

### clipId
<figure align="center" markdown>
  ![amfDiagram ](./uml_diagrams/uml_clipId.svg)
</figure>

### pipeline
<figure align="center" markdown>
  ![amfDiagram ](./uml_diagrams/uml_pipeline.svg)
</figure>

### pipelineInfo
<figure align="center" markdown>
  ![amfDiagram ](./uml_diagrams/uml_piplineInfo.svg)
</figure>

### inputTransform
<figure align="center" markdown>
  ![amfDiagram ](./uml_diagrams/uml_inputTransform.svg)
</figure>

### lookTransform
<figure align="center" markdown>
  ![amfDiagram ](./uml_diagrams/uml_lookTransform.svg)
</figure>

### outputTransform
<figure align="center" markdown>
  ![amfDiagram ](./uml_diagrams/uml_outputTransform.svg)
</figure>


<!-- Include section numbering -->
<style>
    /* @import "../../stylesheets/sections.css" */
body {
    counter-reset : h2 3;
}
h2 {
    counter-reset : h3;
}
h3 {
    counter-reset : h4;
}
h4 {
    counter-reset : h5;
}
h5 {
    counter-reset : h6;
}
article h2:before {
    content : counter(h2,decimal) ". ";
    counter-increment : h2;
}
article h3:before {
    content : counter(h2,decimal) "." counter(h3,decimal) ". ";
    counter-increment : h3;
}
article h4:before {
    content : counter(h2,decimal) "." counter(h3,decimal) "." counter(h4,decimal) ". ";
    counter-increment : h4;
}
article h5:before {
    content : counter(h2,decimal) "." counter(h3,decimal) "." counter(h4,decimal) "." counter(h5,decimal) ". ";
    counter-increment : h5;
}
article h6:before {
    content : counter(h2,decimal) "." counter(h3,decimal) "." counter(h4,decimal) "." counter(h5,decimal) "." counter(h6,decimal) ". ";
    counter-increment : h6;
}
h2.nocount:before, h3.nocount:before, h4.nocount:before, h5.nocount:before, h6.nocount:before {
    content : "";
    counter-increment : none;
}
</style>

