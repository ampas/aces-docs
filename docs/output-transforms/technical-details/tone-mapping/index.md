Tone Mapping
==================

``` mermaid
flowchart LR
  A("ACES 
  RGB 
  Input") --> 
  B[ACES 
  to 
  JMh] --> 
  C["Tonescale 
  (J Only)"] --> 
  D["Chroma 
  Compression 
  (M Only)"] --> 
  E["Gamut 
  Compression 
  (J & M)"] --> 
  F[Display 
  Encoding] --> 
  G(Display 
  RGB 
  Output);
  style C stroke-width:4px
```

### Tone-mapping

After the data is in JMh space, the J channel is sent through the tone scale function.

### Tone-mapping Function
The tone mapping function is based off a Michaelis-Mentin curve, with a flare and parameterized so that certain values can be determined. 

### Values