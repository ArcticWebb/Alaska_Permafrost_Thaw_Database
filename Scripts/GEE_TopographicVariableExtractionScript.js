// ============================================================================
// Title: Topographic Variable Extraction for Alaska Permafrost Thaw Database
// Author: Hailey Webb (hailey.webb@colorado.edu)
// Year Published: 2025
//
// Description:
//   This Google Earth Engine (GEE) script extracts topographic variables 
//   from the ArcticDEM at each thaw database point. 
//   Variables include elevation, slope, aspect, relative elevation, 
//   and solar radiation index (SRI).
//
// Inputs:
//   - Thaw database points (shapefile)
//   - ArcticDEM V4, 2m mosaic
//
// Output:
//   - CSV file exported to Google Drive with topographic variables 
//     appended to each thaw point
// ============================================================================


// -------------------------------------------------------------------------------------
// Load data
// -------------------------------------------------------------------------------------

var thawPoints = ee.FeatureCollection(""); // Import thaw database shapefile

var arcticDEM = ee.Image("UMN/PGC/ArcticDEM/V4/2m_mosaic").select(0).rename("elevation");
print(arcticDEM.bandNames()); 

// -------------------------------------------------------------------------------------
// Terrain variables: elevation, slope, aspect
// -------------------------------------------------------------------------------------

var terrain = ee.Terrain.products(arcticDEM);  // Computes elevation, slope, aspect

var terrainStack = terrain.select(['elevation', 'slope', 'aspect']); // Stack variables

// Sample elevation, slope, and aspect at each thaw database point
var sampledPoints = terrainStack.sampleRegions({
  collection: thawPoints,
  scale: 2,  // ArcticDEM is 2m resolution
  geometries: true  
});

// -------------------------------------------------------------------------------------
// Relative elevation (point elevation - mean elevation in 100m buffer)
// -------------------------------------------------------------------------------------

// Step 1: Compute mean elevation in 100m radius at each thaw database point
var sampledWithMean100m = sampledPoints.map(function(point) {
  var buffer = point.geometry().buffer(100);  // 100m buffer
  var meanDict = arcticDEM.reduceRegion({
    reducer: ee.Reducer.mean(),
    geometry: buffer,
    scale: 2,  // ArcticDEM is 2m resolution
    maxPixels: 1e6  // chosen because of small buffer size
  });
  var meanElev = meanDict.get('elevation'); 
  return point.set('mean_elev_100m', meanElev);
});

// Step 2: Calculate relative elevation at each thaw database point

// This formula takes the average slope within a 100m area and subtracts it from the slope at the thaw 
// point. Negative values indicate that the point is in a depression, while positive values indicate 
// that the point is on a slope or ridge

var withRelativeElev = sampledWithMean100m.map(function(feature) {
  var elevation = ee.Number(feature.get('elevation'));
  var meanElev = ee.Number(feature.get('mean_elev_100m'));

  var relativeElev = elevation.subtract(meanElev);

  return feature.set('relative_elev', relativeElev);
});

// -------------------------------------------------------------------------------------
// Solar Radiation Index (SRI)
// -------------------------------------------------------------------------------------

// Step 1: Define your constants
// Values are from the NOAA solar calculator for the geographic center of Alaska (64.73°N, 152.47°W)
// at noon on the summer solistice (June 21)
var solarDeclination = 23.44 * Math.PI / 180;   // radians
var solarAzimuth = 136.52 * Math.PI / 180;      // radians

// Step 2: Calculate SRI index based on latitude 
var withSRI = withRelativeElev.map(function(feature) {
  
  // Make sure slope and aspect are numbers and convert to radians
  var slopeRad = ee.Number(feature.get('slope')).multiply(Math.PI).divide(180);
  var aspectRad = ee.Number(feature.get('aspect')).multiply(Math.PI).divide(180);

  // Get latitude at each thaw database point and convert to radians
  var lat = feature.geometry().coordinates().get(1); 
  var latRad = ee.Number(lat).multiply(Math.PI).divide(180);

  // Compute solar zenith at solstice noon: |latitude - declination|
  var solarZenith = latRad.subtract(solarDeclination).abs();

  // Solar Radiation Index formula
  var sri = solarZenith.cos().multiply(slopeRad.cos())
              .add(
                solarZenith.sin()
                  .multiply(slopeRad.sin())
                  .multiply(aspectRad.subtract(solarAzimuth).cos())
              );

  return feature.set({
    'solar_radiation_index': sri
  });
});

// -------------------------------------------------------------------------------------
// Export results
// -------------------------------------------------------------------------------------

// Export as CSV
Export.table.toDrive({
  collection: withSRI,
  description: 'ThawDatabase_TopographicVariables',
  fileFormat: 'CSV'
});

