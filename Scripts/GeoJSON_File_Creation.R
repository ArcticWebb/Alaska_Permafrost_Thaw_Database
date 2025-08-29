# scripts/make_geo.R
# Converts data/database.csv -> outputs/database.geojson + outputs/database.gpkg

library(readr)
library(dplyr)
library(sf)
library(janitor)

csv_path <- "Main_Dataset/Alaska_Permafrost_Thaw_Database.csv"
out_dir <- "outputs"
geojson_path <- file.path(out_dir, "Alaska_Permafrost_Thaw_Datbase.geojson")
gpkg_path <- file.path(out_dir, "Alaska_Permafrost_Thaw_Database.gpkg")
layer_name <- "database_points"

# Read and clean names
df <- readr::read_csv(csv_path, show_col_types = FALSE) |> janitor::clean_names()

# Define coordinates
lon_candidates <- c("Longitude")
lat_candidates <- c("Latitude")

find_col <- function(cands, label) {
  i <- which(names(df) %in% cands)
  if (length(i) == 0) stop(paste("Couldn't find", label, "column. Looked for:", paste(cands, collapse=", ")))
  names(df)[i[1]]
}
lon_col <- find_col(lon_candidates, "Longitude")
lat_col <- find_col(lat_candidates, "Latitude")

# Coerce to numeric
df <- df |>
  mutate(
    !!lon_col := as.numeric(.data[[lon_col]]),
    !!lat_col := as.numeric(.data[[lat_col]])
  )

# Basic QC: drop rows with missing/invalid coords (and save a report)
bad <- df |> filter(
  is.na(.data[[lon_col]]) | is.na(.data[[lat_col]]) |
    .data[[lon_col]] < -180 | .data[[lon_col]] > 180 |
    .data[[lat_col]] < -90  | .data[[lat_col]] > 90
)
dir.create(out_dir, showWarnings = FALSE, recursive = TRUE)
if (nrow(bad) > 0) readr::write_csv(bad, file.path(out_dir, "rows_dropped_for_bad_coords.csv"))
good <- dplyr::anti_join(df, bad, by = names(df))

# Make sf (WGS84 / EPSG:4326) and write outputs
gdf <- st_as_sf(good, coords = c(lon_col, lat_col), crs = 4326, remove = FALSE)

if (file.exists(geojson_path)) file.remove(geojson_path)
if (file.exists(gpkg_path)) file.remove(gpkg_path)

st_write(gdf, geojson_path, delete_dsn = TRUE, quiet = TRUE)
st_write(gdf, gpkg_path, layer = layer_name, delete_dsn = TRUE, quiet = TRUE)

