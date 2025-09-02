# Convert_to_GeoJSON.R
# Converts Alaska Permafrost Thaw Database from CSV to GeoJSON file

# Load required package
if(!require(sf)) install.packages("sf")
library(sf)

# Define file paths
input_csv <- "ArcticWebb/Main_Dataset/Alaska_Permafrost_Thaw_Database.csv"
output_geojson <- "ArcticWebb/Main_Dataset/Alaska_Permafrost_Thaw_Database.geojson"

# Read the CSV
thaw_data <- read.csv(input_csv, stringsAsFactors = FALSE)

# Convert to sf object using Latitude and Longitude
thaw_sf <- st_as_sf(thaw_data, coords = c("Longitude", "Latitude"), crs = 4326)

# Write to GeoJSON
st_write(thaw_sf, output_geojson, driver = "GeoJSON", delete_dsn = TRUE)

cat("GeoJSON file created at:", output_geojson, "\n")

