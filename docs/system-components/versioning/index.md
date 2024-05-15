Versioning
===

# ACES System Version
An increment to the ACES System Version indicates that some critical new feature or change has been implemented. The system version number is not incremented when new Colorspace, Input, Output, or Look transforms are added.
 
The ACES System shall use the following versioning string to identify the overall version for the bundle of components supplied with a particular release:
ReleaseMajorVersionNumber.ReleaseMinorVersionNumber.ReleasePatchVersionNumber
 
The 'patch' version number shall be incremented when backward compatible bug fixes are made. New patch versions shall not require an update to all transforms.
 
The 'minor' version number shall be incremented with new functionality added in a backward compatible manner. Minor versions shall not require an update to all ACES core and vendor/user-supplied components but may be used to indicate that a new feature has been added.
 
The 'major' version number shall be incremented if substantive changes are made to the ACES core components in a backward incompatible way. An increment of the major version number indicates that all core and vendor/user-supplied components should be checked and updated to confirm compatibility with the new ACES major version.
  
ACES implementations shall report the version of the ACES System to at least the minor version number. Reporting of the patch version is optional.

The ACES System version reflects Academy-supplied transforms included in the ACES-hosted Github repositories (or derivative transforms) and shall not require incrementation when custom-created or ACES vendor/user-supplied components are updated. 

