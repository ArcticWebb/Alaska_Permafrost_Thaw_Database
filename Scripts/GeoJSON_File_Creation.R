# Scripts/GeoJSON_File_Creation.R
# Converts Main_Dataset/Alaska_Permafrost_Thaw_Database.csv 
# -> outputs/Alaska_Permafrost_Thaw_Database.geojson + .gpkg

library(readr)
library(dplyr)
library(sf)

csv_path <- "Main_Dataset/Alaska_Permafrost_Thaw_Database.csv"
out_dir <- "outputs"
geojson_path <- file.path(out_dir, "Alaska_Permafrost_Thaw_Database.geojson")
gpkg_path <- file.path(out_dir, "Alaska_Permafrost_Thaw_Database.gpkg")
layer_name <- "permafrost_thaw_points"

# Read CSV (your column names are already standardized)
df <- readr::read_csv(csv_path, show_col_types = FALSE)

# Ensure Lat/Lon are numeric
df <- df %>%
  mutate(
    Latitude = as.numeric(Latitude),
    Longitude = as.numeric(Longitude)
  )

# Basic QC: drop bad coordinates
bad <- df %>% filter(
  is.na(Longitude) | is.na(Latitude) |
    Longitude < -180 | Longitude > 180 |
    Latitude < -90 | Latitude > 90
)
dir.create(out_dir, showWarnings = FALSE, recursive = TRUE)
if (nrow(bad) > 0) {
  readr::write_csv(bad, file.path(out_dir, "rows_dropped_for_bad_coords.csv"))
}
good <- dplyr::anti_join(df, bad, by = names(df))

# Convert to sf object
gdf <- st_as_sf(good, coords = c("Longitude", "Latitude"), crs = 4326, remove = FALSE)

# Delete old files before writing
if (file.exists(geojson_path)) file.remove(geojson_path)
if (file.exists(gpkg_path)) file.remove(gpkg_path)

# Write outputs
st_write(gdf, geojson_path, delete_dsn = TRUE, quiet = TRUE)
st_write(gdf, gpkg_path, layer = layer_name, delete_dsn = TRUE, quiet = TRUE)
