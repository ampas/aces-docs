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

### Requirements
Here were a few of the key requirements considered when designing the tone mapping curve:

* S-shaped: Tone scale shall have an "S-shaped" curve with a toe and shoulder.
* Monotonic: Tone scale shall be continuously increasing over the domain.
* Non-asymptotic: Tone scale shall not have any vertical or horizontal asymmptotes
* Continuity: Tone scale shall be defined continuously over the domain.
* Domain: Tone scale shall be defined for all float values.
* Contrast: Tone scale shall have a log-log slope (gamma) through 18% mid-gray less than 1.55, which was the mid-slope contrast in ACES 1.
* Dynamic Range: Tone scale shall provide the ability to produce consistent output for arbitrary dynamic ranges, but also provide preset values for common display setups, including:
    * 48 nit cinema
    * 100 nit video
    * 108 nit Dolby Cinema
    * 1000 nit HDR

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