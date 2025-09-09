Overview of the ACES Encodings
==============================

ACES2065-1 
----------
ACES2065-1 is photometrically linear and encoded relative to the the ACES (or "AP0") primaries. It is the core ACES encoding colorspace, also sometimes also referred to as “linear ACES”, "ACES2065", "SMPTE2065-1", or sometimes simply “ACES". ACES2065-1 is the defined color space for any file write-outs for interchange between facilities or for archival purposes. 

ACEScg
------
ACEScg is photometrically linear like ACES2065-1, but is encoded relative to the "AP1" primaries. This space is preferred by VFX as it works better with existing CG rendering, compositing, painting and other VFX processes. Tools used to synthetically render imagery (CGI) have long used certain optimizations that are different than in typical color management scenarios and sometimes do not work well with such wide-gamut primaries as AP0.

ACEScct
-------
ACEScct has a quasi-logarithmic transfer characteristic, and is encoded relative to the "AP1" primaries. It has a “toe” that makes it similar to traditional “camera log” curves that generate a distinct “milking” or “fogging” of shadows under a lift operation. 

!!! note
    The earliest versions of ACES used a "pure log" (ACEScc) that did not have a "toe". ACEScct was introduced as a replacement after requests from colorists who found the behavior of a pure log function  unfamiliar to their established expectations of how a "lift" operator should behave.

----

Legacy Encodings
----------------

### ACEScc
ACEScc has a logarithmic transfer characteristic, and is encoded relative to the "AP1" primaries. It is a "pure log" encoding, and was developed for use in color grading applications. 

!!! warning
    While not officially deprecated, ACEScc has largely been replaced by ACEScct, and is not recommended.

### ACESproxy
ACESproxy is identical to ACEScc, except encoded with integer code values. It was developed for use within design constraints introduced by certain video transport systems, like the SDI infrastructure, which were commonly used in output off of a camera to an on-set system. ACESproxy is defined for 10-bit and 12-bit applications.

!!! warning
    ACESproxy is a video-legal signal to be correctly displayed by compliant broadcast equipment. ACESproxy is defined as an ephemeral encoding, and is intended only for transport "down-the-wire" of camera feeds to on-set LUT-boxes or similar.

    The need for ACESproxy has mostly been eliminated as hardware and cabling has improved since ACES 1 was released.