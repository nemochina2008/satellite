## satellite 1.0.0

New features:

  * Inverse squared relative earth-sun distance from calcEarthSunDist(). 
  * calcTopoCorr,Raster*() methods accept additional arguments (via '...') passed to writeRaster(). 
  * crop,Satellite-method takes a new argument 'snap' similar to raster::crop().
  * extend,Satellite-method takes a new argument 'value' which is assigned to new cells similar to raster::extend().
  * satellite is compatible with pre-collection Level-1 and Collection 1 Level-1 file naming.
  * sortFilesLandsat() to automatically sort Landsat band files in ascending order.

Bugfixes:

  * plot,Satellite-method ignored band codes to be visualized if 'bcde = ' assignment was not explicitly included.
  * Solved 'Error in .local(.Object, ...) :' when trying to retrieve values from built-in data sets l7, l8.

Changes:

  * calcHistMatch() and panSharp() moved to satelliteTools (https://github.com/environmentalinformatics-marburg/satelliteTools).
  * Mandatory use of Rcpp functionality in calcPathRadDOS().
  * Added helper functions in R/pck_data.R and R/pck_lut.R to .Rbuildignore.
  * Revised sensor IDs for Landsat 4 (LT4 for 'Landsat Thematic Mapper') and 5 (LT5).
  * Updated ESun values (https://landsat.usgs.gov/esun) for Landsat 4, 5 and 7.
  * Updated spectral range of Landsat 7 band 7 (https://landsat.usgs.gov/landsat-7-history).
  * Moved Rcpp from Depends to Imports.
  * Built-in data sets l7, l8 now originate from Landsat Collection 1 Level-1 instead of previous Pre-Collection 1 Level-1.
  * Removed deprecated convDN2RU(), users must switch to convSC2Rad(), convSC2Ref() and convRad2BT() instead.


## satellite 0.2.0

* n/a


## satellite 0.1.0

* Initial release
