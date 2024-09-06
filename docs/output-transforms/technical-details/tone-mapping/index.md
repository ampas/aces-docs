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
  H["White
  Limiting"] --> 
  F["Display 
  Encoding"] --> 
  G(Display 
  RGB 
  Output);
  style C stroke-width:4px
```

### Tone-mapping

After the data is in a JMh representation, the J channel is sent through the tone scale function. 

### Tone-mapping Function
The tone mapping function is based off a Michaelis-Mentin curve, and parameterized so that certain values can be calculated automatically based on the peak luminance value. 





### Values

<table>
    <tr>
        <th></th>
        <th colspan="4" style="text-align:center">ACES value</th>
    </tr>
    <tr>
        <th style="text-align:center">Peak Luminance<br>(nits)</th>
        <th style="text-align:center">0</th>
        <th style="text-align:center">0.18</th>
        <th style="text-align:center">1.0</th>
        <th style="text-align:center">2.0</th>
    </tr>
    <tr>
      <td>100</td>
      <td>0.000</td>
      <td>10.000</td>
      <td>45.757</td>
      <td>63.988</td>
    </tr>
    <tr>
      <td>500</td>
      <td>0.000</td>
      <td>13.193</td>
      <td>89.098</td>
      <td>158.949</td>
    </tr>
    <tr>
      <td>1000</td>
      <td>0.000</td>
      <td>14.512</td>
      <td>106.564</td>
      <td>205.783</td>
    </tr>
    <tr>
      <td>2000</td>
      <td>0.000</td>
      <td>15.747</td>
      <td>121.664</td>
      <td>248.779</td>
    </tr>
    <tr>
      <td>4000</td>
      <td>0.000</td>
      <td>16.824</td>
      <td>133.883</td>
      <td>284.433</td>
    </tr>
</table>