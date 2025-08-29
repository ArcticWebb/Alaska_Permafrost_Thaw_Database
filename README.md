# The Alaska Permafrost Thaw Database


The Alaska Permafrost Thaw Database is an open-access, georeferenced database of abrupt and non-abrupt permafrost thaw locations across Alaska. 
The database includes 19,536 points compiled from published literature, geospatial databases, field campaigns, and photo-interpreted sites of landscape change.


## This repository hosts:
- **CSV file:** `Main_Dataset/Alaska_Permafrost_Thaw_Database.csv` — the main tabular dataset.
- - **Template CSV:** `Main_Dataset/Template_Alaska_Permafrost_Thaw_Database.csv` — example file for contributing new points.  
- **GeoJSON:** `outputs/Alaska_Permafrost_Thaw_Database.geojson` — viewable directly on GitHub.  
- **GeoPackage (.gpkg):** `outputs/Alaska_Permafrost_Thaw_Database.gpkg` — for GIS software (ArcGIS/QGIS).  
- **Scripts:** `Scripts/GeoJSON_File_Creation.R` — script that generates the GeoJSON and GPKG from the CSV.  
- **README.md & LICENSE** — usage instructions and license information.  
---


## Data Structure and Metadata Formatting Summary Example:

| Field Name                 | Format                                               | Description                                                                                                               | Examples
|----------------------------|-----------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------
| `Authors`                  | Author last name et al. (Year published)           | Author list from source publication                                                                                        | Webb et al. (2025);<br>Webb (2025);<br>Webb & Turetsky (2025) 
| `DOI`                      | `https://doi.org/XXXX/XXXX`                        | Unique identifier from source publication. Put N/A if unpublished                                                        | http://dx.doi.org/10.1007/s10533-013-9862-0
| `DataSourceType`            | Field/Remote Sensing/Photo-interpretation & publication status                          | Type of source data                                                                                                       | Field - unpublished; Remote Sensing - published
 `FeatureName`              | Name of feature or site                              | The name of the feature. This can include known lakes, monitoring stations, or established field sites.                  | Alaska Peatland Experiment; Eight Mile Lake
| `Latitude`                 | Decimal Degrees (EPSG:4326)                         | Point location (y coordinate) of thaw event in EPSG:4326                                                                                              | 64.5789232
| `Longitude`                | Decimal Degrees (EPSG:4326)                         |  Point location (x coordinate) of thaw event in EPSG:4326                                                                                               | -147.5239058
| `FeatureType`              | As reported by source                               | Types include retrogressive thaw slumps, thermokarst lakes, collapse-scar bog, etc.                                      | Collapse-scar bog; Thermokarst water track
| `FeatureCategory`          | Generalized category                                | Categorize `Feature Type` as one of the following: Active layer detachment, Retrogressive thaw slump, Thaw pond, Thermoerosional gully, Thermokarst, Thermokarst lake, Wildfire-induced thaw, or Thermokarst wetland | Thermokarst wetland; Thaw pond, Thermokarst
| `ThawType`                 | Abrupt / Non-abrupt                                  | The type of thaw. The features are classified as either abrupt or non-abrupt thaw according to the framework outlined in [Webb et al. (2025)](https://doi.org/10.1007/s40641-025-00204-3)                  | Abrupt; Non-abrupt
| `Imagery`                  | Satellite or sensor name                            | Remote sensing instrument used, if applicable                    | Landsat; Planet                      
| `ImageryDate`              | Year(s) of imagery                                  | Years of imagery used                                                                                                     | 1995 to 2005; 2025
| `ImageryResolution_meters` | Spatial resolution in meters                        | Resolution of imagery used                                                                                                 | 2; 30

---
## How to Use
- Download the CSV or GeoJSON for tabular or spatial analyses.  
- View the GeoJSON directly on GitHub to quickly explore thaw locations.  
- Use the GPKG in ArcGIS/QGIS for GIS-based analyses.  
- Citation (Zenodo DOI pending):  
  Webb, H. et al. (2025). *A Comprehensive Database of Thawing and Stable Permafrost Locations Across Alaska*. Zenodo. https://doi.org/XXXX/zenodo.XXXXX


---

## How to Contribute
Contributors should **only edit the CSV file**:  
`Main_Dataset/Alaska_Permafrost_Thaw_Database.csv`

1. Add new points as rows in the CSV.  
2. Latitude/Longitude must be in decimal degrees (EPSG:4326).  
3. Check column values follow the allowed categories (see `CONTRIBUTING.md` for detailed rules).  
4. Submit a Pull Request. 

> After merging, a GitHub Actions workflow automatically regenerates the GeoJSON and GeoPackage.
---

## Citation

Webb, H. et al. (2025). *A Comprehensive Database of Thawing and Stable Permafrost Locations Across Alaska*. Zenodo. https://doi.org/XXXX/zenodo.XXXXX


---



