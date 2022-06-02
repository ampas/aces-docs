Derivation of the ACES White Point CIE Chromaticity Coordinates
================


Scope
----------------


This document describes the derivation of the ACES white point CIE chromaticity coordinates and details of why the chromaticity coordinates were chosen. This document includes links to an example Python implementation of the derivation and an iPython notebook intended to help readers reproduce the referenced values.


This document is primarily intended for those interested in understanding the details of the technical specification of ACES and the history of its development. The definition of a color space encoding’s white point chromaticity coordinates is one important factor in the definition of a color managed system. The white point used in various ACES encodings does not dictate the creative white point of images created or mastered using the ACES system. It exists to enable accurate conversion to and from the other color encodings such as CIE XYZ. The proper usage of the ACES white point in conversion, mastering, or reproduction are beyond the scope of this document. For example, the proper usage of the ACES white point in encoding scene colorimetry in ACES2065-1 is detailed in P-2013-001 [7].



References
----------------


[1] “Smpte st 2065-1:2012 – academy color encoding specification (aces),” Society of Motion Picture and Television Engineers, New York, US, Standard, 2012.

[2] E. J. Giorgianni and T. E. Madden, Digital Color Management: Encoding Solutions, Second Edition. Addison-Wesley Longman Publishing Co., Inc., 2008, ISBN: 978-0-470-51244-9.


[3] “Smpte rp 177-1993 – derivation of basic television color equations,” Society of Motion Picture and Television Engineers, New York, US, Recommended Procedure, 1993.

[4] “S-2014-004 – acescg – a working space for cgi render and compositing,” Academy of Motion Picture Arts and Sciences, Beverly Hills, CA, Academy Standard, Mar. 2016.

[5] “S-2014-003 – acescc – a logarithmic encoding of aces data for use within color grading systems,” Academy of Motion Picture Arts and Sciences, Beverly Hills, CA, Academy Standard, Jul. 2016.

[6] “S-2016-001 – acescct – a quasi-logarithmic encoding of aces data for use within color grading sys- tems,” Academy of Motion Picture Arts and Sciences, Beverly Hills, CA, Academy Standard, Sep. 2016.

[7] “P-2013-001 – recommended procedures for the creation and use of digital camera system input de- vice transforms (idts),” Academy of Motion Picture Arts and Sciences, Beverly Hills, CA, Academy Procedure, Mar. 2016.

[8]: “Cie 015:2004 – colorimetry, 3rd edition,” International Commission on Illumination (CIE), Vienna, Austria, Technical Report, 2004.

[9] AutoDesk. (2016). The aces workflow, [Online]. Available: https://knowledge.autodesk.com/support/maya/learn-explore/caas/CloudHelp/cloudhelp/2016/ENU/Maya/files/GUID-24E4143D-6FD1-4210-B677-3D5EEF3D3F29-htm.html (visited on 04/30/2018).

[10] BlackMagic Forum. (2014). Aces and color space transform white point shift problem, [Online]. Avail- able: https://forum.blackmagicdesign.com/viewtopic.php?f=21&t=66681 (visited on 04/30/2018).

[11] ACEScentral Forum. (2017). D60 issue - dci white gamut violated by projectors with “use white clip” feature, [Online]. Available: http://acescentral.com/t/d60-issue-dci-white-gamut-violated-by-projectors-with-use-white-clip-feature/1306 (visited on 04/30/2018).

[12] Thomas Mansencal. (2018). ‘‘d60” chromaticity coordinates and spectral power distribution are incor- rect., [Online]. Available: https://github.com/colour-science/colour/issues/394 (visited on 04/30/2018).
Page 6 June 15, 2018
TB-2018-001 Derivation of the ACES White Point CIE Chromaticity Coordinates

[13] G. Wyszecki and W. Stiles, Color Science: Concepts and Methods, Quantitative Data and Formulae, 2nd Edition. Wiley New York, 2000.

[14] M. Durieux, “The international practical temperature scale of 1968,” Progress in Low Temperature Physics, vol. 6, no. C, pp. 405–425, 1970.

[15] (2018). Jupyter (ipython) notebook to reproduce the table values in tb-2018-001, [Online]. Available:
https://github.com/ampas/aces-dev/tree/master/documents/python/TB-2018-001/TB-2018-001_table_vals.ipynb.

[16] A. R. Robertson, “Computation of correlated color temperature and distribution temperature,” Journal of the Optical Society of America, vol. 58, no. 11, pp. 1528–1535, 1968.

[17] C. S. McCamy, “Correlated color temperature as an explicit function of chromaticity coordinates,” Color Research & Application, vol. 17, no. 2, pp. 142–144, 1992.

[18] J. Hernandez-Andres, R. L. Lee, and J. Romero, “Calculating correlated color temperatures across the entire gamut of daylight and skylight chromaticities,” Applied Optics, vol. 38, no. 27, pp. 5703–5709, 1999.

[19] Y. Ohno, “Practical use and calculation of cct and duv,” LEUKOS - Journal of the Illuminating Engi- neering Society of North America, vol. 10, no. 1, pp. 47–55, 2014, ISSN: 15502716. DOI: 10.1080/ 15502724.2014.839020.

[20] J. P. Pytlak and A. W. Fleischer, “A simplified motion-picture laboratory control method for improved color duplication,” SMPTE Journal, vol. 85, no. 10, pp. 781–786, 1976, ISSN: 0036-1682. DOI: 10. 5594/J07544.

[21] Eastman Kodak Company. (2018). Laboratory aim density, [Online]. Available: https://www.kodak.com/US/en/motion/support/technical_information/lab_tools_and_techniques/laboratory_aim_density_lad/default.htm (visited on 04/30/2018).



Derivation of CIE chromaticity coordinates 
----------------


The CIE xy chromaticity coordinates of the ACES white point are specified in SMPTE ST 2065-1:2012 as x = 0.32168 y = 0.33767 [1]. The ACES white point chromaticity coordinates are derived using the following procedure:

1. Calculate the CIE Daylight spectral power distribution for a Correlated Color Temperature (CCT) of 6000 K over the wavelength intervals 300 nm to 830 nm in 1 nm increments as specified in CIE 15:2004 Section 3.1 [8]

2. Calculate the CIE 1931 XYZ tristimulus values of the spectral power distribution as specified in CIE 15:2004 Section 7.1 [8]

3. ConverttheCIEXYZvaluestoCIExychromaticitycoordinatesasspecifiedinCIE15:2004Section7.3 [8]

4. Round the CIE xy chromaticity coordinates to 5 decimal places


An implementation of the procedure described above can be found at:
https://github.com/ampas/aces-dev/tree/master/documents/python/TB-2018-001/aces_wp.py



Discussion
----------------


### Comparison of the ACES white point and CIE D<sub>60</sub>


Frequently, the white point associated with various ACES encodings is said to be ‘D60’ [9]–[11]. This short- hand notation has sometimes led to confusion for those familiar with the details of how the chromaticity coordinates of the CIE D series illuminants are calculated [12]. The chromaticity coordinates of any CIE D series illuminant can be calculated using the equations found in Section 3 of CIE 15:2004 and reproduced in Equation 1 [8].

$$
y_{D} = −3.000x^{2}_{D} + 2.870x_{D} − 0.275 
$$

$$
x_D=\begin{cases}
0.244063 + 0.09911 \frac{10^3}{T} + 2.9678 \frac{10^6}{T^2}  - 4.6070 \frac{10^9}{T^3} & 4,000 K \le T \le 7,000 K \\ 
0.237040 + 0.24748 \frac{10^3}{T} + 1.9018 \frac{10^6}{T^2}  - 2.0064 \frac{10^9}{T^3} & 7,000 K \lt T \le 25,000 K 
\end{cases}
$$


<div align="center"><i>Equation 1 - Calculation of CIE xy from CCT for CIE Daylight </i></div><br>  


The CIE has specified four canonical daylight illuminants (D50, D55, D65 and D75) [8]. Contrary to what the names might imply, the correlated color temperature (CCT) values of these four canonical illuminants are not the nominal CCT values of 5000 K, 5500 K, 6500 K, and 7500 K. For instance, CIE D65 does not have a CCT of 6500 K but rather a CCT temperature of approximately 6504 K [13]. The exact CCT values differ from the nominal CCT values due to a 1968 revision to c2, the second radiation constant in Planck’s blackbody radiation formula [14]. When the value of c2 was changed from 0.014380 to 0.014388, it altered the CIE xy location of the Planckian locus for a blackbody. This small change to the Planckian locus’ position relative to the chromaticity coordinates of the established CIE daylight locus had the effect of changing the correlated color temperature of the CIE D series illuminants ever so slightly. The precise CCT values for the established canonical CIE D series illuminants can be determined by applying the equation in Equation 2 to the nominal CCT values implied by the illuminant name. The exact CCT values of the canonical daylight illuminants are not whole numbers after the correction factor is applied, but it is common to round their values to the nearest Kelvin. The CCT values of the CIE canonical daylight illuminants before the 1968 change to c2, after the 1968 change, and rounded to the nearest Kelvin can be found in Table 1.


$$
CCT_{new} = CCT \cdot \frac{1.4388}{1.4380}
$$


<div align="center"><i>Equation 2 – Conversion of nominal pre-1968 CCT to post-1968 CCT </i></div><br>   



| CIE D Illuminant | CCT before 1968       | CCT current (round to 3 decimal places)       | CCT current (round to 0 decimal places)                      |                        
|  :---:           |         :---:         |                     :---:                     | :---:                                                        |
|  D_{50}          | 5000 K                | 5002.782 K                                    | 5003 K                                                       |
|  D_{55}          | 5500 K                | 5503.060 K                                    | 5503 K                                                       |  
|  D_{65}          | 6500 K                | 6503.616 K                                    | 6504 K                                                       |                                                              
|  D_{75}          | 7500 K                | 7504.172 K                                    | 7504 K                                                       |                


<div align="center"><i>Table 1 – CCT of canonical CIE daylight illuminants [15] </i></div><br>


D60 is not one of the four CIE canonical daylight illuminants so the exact CCT of such a daylight illuminant could be interpreted to be either approximately 6003 K ( $6000 \cdot \frac{1.4388}{1.4380}$ ) or 6000 K. Regardless, the ACES 1.4380 white point chromaticity coordinates derived using the method specified in Section 3 differs from both the chromaticity coordinates of CIE daylight with a CCT of 6003 K and CIE daylight with a CCT of 6000 K. The chromaticity coordinates of each, rounded to 5 decimal places, can be found in Table 2. As illustrated in Figure 1, the chromaticity coordinates of the ACES white point do not fall on the daylight locus nor do they match those of any CIE daylight spectral power distribution. The positions of the chromaticity coordinates in CIE Uniform Color Space (${u^′}{v^′}$) and the differences from the ACES chromaticity coordinates in $\Delta {u^′}{v^′}$ can be found in Table 3.


<center>

|                          | CIE $x$               | CIE $y$         |                      
|  :---:                   |         :---:         |  :---:          |
| ACES White Point         | 0.32168               | 0.33767         |
|  CIE Daylight 6000K      | 0.32169               | 0.33780         |  
| CIE Daylight 6003K       | 0.32163               | 0.33774         |                                                             

</center>


<div align="center"><i>Table 2 – CIE xy chromaticity coordinates rounded to 5 decimal places [15]</i></div><br>



<center>

|                          | CIE ${u^′}$              | CIE ${v^′}$        |  $\Delta {u^′}{v^′}$    |                   
|  :---:                   |         :---:            |  :---:             | :---:                   |
| ACES White Point         | 0.20078                  | 0.47421            |  0                      |
| CIE Daylight 6000K       | 0.20074                  | 0.47427            |  0.00008                |
| CIE Daylight 6003K       | 0.20072                  | 0.47423            |  0.00007                |                                                

</center>


<center><i>Table 3 – CIE ${u^′}{v^′}$ chromaticity coordinates and  $\Delta {u^′}{v^′}$ from the ACES white point rounded to 5 decimal places [15]</i></center><br>


Although the ACES white point chromaticity is not on either the Planckian locus or the daylight locus, the CCT of its chromaticity can still be estimated. There are a number of methods for estimating the CCT of any particular set of chromaticity coordinates [16]–[19]. The results of four popular methods can be found in Table 4. Each of the methods estimates the CCT of the ACES white point to be very close to 6000 K.


<center>**Insert Image of Figure 1 HERE**</center>


<div align="center"><i>Figure 1 – CIE UCS diagram with chromaticity coordinates</i></div><br>


<center>

|         CCT Estimation Method            | ACES white point CCT          |               
|  :---:                                   |         :---:                 | 
| Robertson                                | 5998.98 K                     |
| Hernandez-Andres                         | 5997.26 K                     |
| Ohno                                     | 6000.04 K                     | 
| McCamy                                   | 6000.41 K                     | 

</center>


<div align="center"><i>Table 4 – Estimation of the CCT of the ACES white point rounded to 2 decimal places [15] </i></div>


### Reasons for the “D<sub>60</sub>-like” white point


The ACES white point was first specified by the Academy’s ACES Project Committee in 2008 in Academy Specification S-2008-001. The details in S-2008-001 were later standardized in SMPTE ST 2065-1:2012. Prior to the release of the Academy specification the Project Committee debated various aspects of the ACES2065-1 encoding, including the exact white point, for many months. The choice of the “D<sub>60</sub>-like” white point was influenced heavily by discussions centered around viewer adaptation, dark surround viewing conditions, “cinematic look”, and preference. In the end, the Committee decided to go with a white point that was close to that of a daylight illuminant but also familiar to those with a film heritage. The white point would later be adopted for use in other encodings used in the ACES system. It is important to note that the ACES white point does not dictate the chromaticity of the reproduction neutral axis. Using various techniques beyond the scope of this document the chromaticity of the equal red, green and blue (ACES2065-1 $R=G=B$ ) may match the ACES white point, the display calibration white point, or any other white point preferred for technical or aesthetic reasons.


The Committee felt that a white point with a chromaticity similar to that of daylight was appropriate for ACES2065-1. However, the exact CCT of the daylight was in question. Some felt D<sub>55</sub> was a reasonable choice given its historical use as the design illuminant for daylight color negative films. Others felt D<sub>65</sub> would be good choice given its use in television and computer graphics as a display calibration white point. Because the exact white point chromaticity would not prohibit users from achieving any reproduction white point, the Committee ultimately decided to use the less common CCT of 6000 K. This choice was based on an experiment to determine the reproduction chromaticity of projected color print film, the relative location of the white point compared to other white points commonly used in digital systems, and the general belief that imagery reproduced with the white point felt aesthetically “cinematic”.


The projected color print film experiment involved simulating the exposure of a spectrally non-selective (neutral) gray scale onto color negative film, printing that negative onto a color print film, then projecting the color film onto a motion picture screen with a xenon-based film projector and measuring the colorimetry off the screen. The result of the experiment found that the CIE xy chromaticity coordinates of a projected LAD patch [20], [21] through a film system were approximately $x = 0.32170$ $y = 0.33568$. Figure 2 shows a plot of the CIE ${u^′}{v^′}$ chromaticity coordinates of a scene neutral as reproduced by a film system compared to the CIE daylight locus and the ACES white point. The chromaticity of the film system LAD reproduction was determined to be closest to CIE daylight with the CCT of 6000 K when the differences were calculated in CIE ${u^′}{v^′}$. A summary of the CIE ${u^′}{v^′}$ differences between CIE daylight at various CCTs and the LAD patch chromaticity are summarized in Table 5.


<center>**Insert Image of Figure 2 HERE**</center>


<div align="center"><i>Figure 2 – Film system print-through color reproduction of original scene neutral scale</i></div>


### Reasons why the ACES white point doesn’t match the CIE D<sub>60</sub> chromaticity coordinates



As discussed in Section 4.2, the ACES white point was chosen to be very close to that of CIE Daylight with a CCT of 6000 K. This raises the question why the CIE chromaticity coordinates of $x = 0.32169$ $y = 0.33780$ were not used. The reasoning is somewhat precautionary; at the time, the exact chromaticity coordinates for the ACES white point were being debated, the ACES Project Committee was concerned about the implica- tions the choice of any particular set of chromaticity coordinates could suggest.


Those new to ACES can often misinterpret the specification of a set of ACES encoding white point chromaticity coordinates as a requirement that the final reproduction neutral axis chromaticity is limited to only that white point chromaticity. However, as pointed out in Section 4.2, the ACES encoding white point does not dictate the chromaticity of the reproduction neutral axis, and regardless of the ACES white point chro- maticity, the reproduction neutral axis may match the ACES white point, the display calibration white point, or any other white point preferred for technical or aesthetic reasons. The ACES white point chromaticity coordinates serve to aid in the understanding and, if desired, conversion of the colorimetry of ACES encoded images to any other encoding including those with a different white point.


Just as the implication of the ACES encoding white point on reproduction can be misunderstood, the ACES


<center>

|      Daylight CCT         |   $\Delta {u^′}{v^′}$ from LAD chromaticity     |               
|  :---:                    |         :---:                                   | 
| 5500 K                    | 0.008183                                        |
| 5600 K                    | 0.006619                                        |
| 5700 K                    | 0.005112                                        | 
| 5800 K                    | 0.003676                                        | 
| 5900 K                    | 0.002354                                        |
| 6000 K                    | 0.001360                                        |
| 6100 K                    | 0.001448                                        | 
| 6200 K                    | 0.002442                                        | 
| 6300 K                    | 0.003627                                        | 
| 6400 K                    | 0.004836                                        | 
| 6500 K                    | 0.006035                                        | 

</center>


<center><i>Table 5 – CIE $\Delta {u^′}{v^′}$ difference between projected LAD patch and CIE Daylight CCT chromaticity coordinates round to 6 decimal places [15]</i></center><br>


Project Committee was also concerned that the ACES encoding white point might have unintended implications for image creators. Specifically, the Committee was concerned that the choice of a set of chromaticity coordinates that corresponded to a source with a defined spectral power distribution might be misunderstood to suggest that only that source could be used to illuminate the scene. For example, the Committee was concerned if the ACES white point chromaticity was chosen to match that of CIE Daylight with a CCT of 6000 K then <i>only<i> scenes photographed under CIE Daylight with a CCT of 6000 K would be compatible with the ACES system. In reality, ACES does not dictate the source under which movies or television shows can be photographed. ACES Input Transforms handle the re-encoding of camera images to ACES2065-1 and preserve all the technical and artistic intent behind on-set lighting choices.


For these reasons as well as an abundance of caution, the ACES Project Committee decided it would be best to use a set of chromaticity coordinates very near those of CIE Daylight with a CCT of 6000 K but not exactly those of any easily calculated spectral power distribution.


<!-- Include acronyms-->
--8<-- "mkdocs/includes/acronyms.md"

<!-- Include section numbering -->
<style>
    @import "../../stylesheets/sections.css"
</style>
