White Limiting
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
  H["White
  Limiting"] --> 
  F["Display 
  Encoding"] --> 
  G(Display 
  RGB 
  Output);
  style H stroke-width:4px
```
