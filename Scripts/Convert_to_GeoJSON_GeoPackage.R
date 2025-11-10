#---------------------------------------------------------------------------------------------
# This R script converts the Alaska Permafrost Thaw Database from a CSV file to 
# a GeoJSON file that can be used for spatial analyses
#---------------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------------
# Step 1: Download the Alaska_Permafrost_Thaw_Database_v1.0.0-alpha.csv file (or other version)
# to your local computer. Make note of which version you've downloaded.
#---------------------------------------------------------------------------------------------


#---------------------------------------------------------------------------------------------
# Step 2: Load required package
if(!require(sf)) install.packages("sf")
library(sf)
#---------------------------------------------------------------------------------------------


#---------------------------------------------------------------------------------------------
# Step 3: Define file paths
input_csv <- ".../Alaska_Permafrost_Thaw_Database_v1.0.0-alpha.csv" ## Set file path and change file name to correct version
output_geojson <- ".../Alaska_Permafrost_Thaw_Database_v1.0.0-alpha.geojson"
output_geopackage <- "Alaska_Permafrost_Thaw_Database_v2.0.0.gpkg"
#---------------------------------------------------------------------------------------------


#---------------------------------------------------------------------------------------------
# Step 4: Read the CSV
thaw_data <- read.csv(input_csv, stringsAsFactors = FALSE)
#---------------------------------------------------------------------------------------------


#---------------------------------------------------------------------------------------------
# Step 5: Convert to sf object using Latitude and Longitude in WGS84
thaw_sf <- st_as_sf(thaw_data, coords = c("Longitude", "Latitude"), crs = 4326)
#---------------------------------------------------------------------------------------------


#---------------------------------------------------------------------------------------------
# Step 5: Write to GeoJSON
st_write(thaw_sf, output_geojson, driver = "GeoJSON", delete_dsn = TRUE)
#---------------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------------
# Step 6: Write to GeoPackage
st_write(thaw_sf, output_geopackage, layer = "thaw_points", delete_dsn = TRUE)
#---------------------------------------------------------------------------------------------

