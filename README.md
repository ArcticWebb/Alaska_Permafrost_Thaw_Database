# The Alaska Permafrost Thaw Database


The Alaska Permafrost Thaw Database is an open-access, georeferenced database of abrupt and non-abrupt permafrost thaw locations across Alaska. 
The most recent version, version 2.0.0, of the database includes 19,540 points compiled from published literature, geospatial databases, field campaigns, and photo-interpreted sites of landscape change.


## This repository hosts:
- **Most current version of the main dataset:** `Main_Dataset/Alaska_Permafrost_Thaw_Database.csv` — the main tabular dataset.
- **Geospatial Files** `Main_Dataset/Alaska_Permafrost_Thaw_Database.geojson` and `Main_Dataset/Alaska_Permafrost_Thaw_Database.gpkg`
- **R Scripts**
     - `Scripts/Convert_to_GeoJSON_GeoPackage.R` - R script for converting the database from a CSV file to GeoJSON and GeoPackage.
     - `Scripts/GEE_TopographicVariableExtractionScript.js` - Google Earth Engine Script for extracting topographic variables at each thaw feature.
- **README.md & LICENSE** — usage instructions and license information.
- **CONTRIBUTING.md** - instructions for how to contribute to the database. 
---


## Data Structure and Metadata Formatting Summary Example:

| Field Name                 | Format                                               | Description                                                                                                               | Examples
|----------------------------|-----------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------
| `Authors`                  | Author last name et al. (Year published)           | Author list from source publication                                                                                        | Webb et al. (2025);<br>Webb (2025);<br>Webb & Turetsky (2025) 
| `DOI`                      | `https://doi.org/XXXX/XXXX`                        | Unique identifier from source publication. Put N/A if unpublished                                                        | http://dx.doi.org/10.1007/s10533-013-9862-0
| `DataSourceType`            | Field/Remote Sensing/Photo-interpretation & publication status                          | Type of source data                                                                                                       | Field - unpublished; Remote Sensing - published
 `FeatureName`              | Name of feature or site                              | The name of the feature. This can include known lakes, monitoring stations, or established field sites.                  | Alaska Peatland Experiment; Eight Mile Lake
 | `UniqueID`               |     Unique identifier                | Unique identifier for each feature  | 487
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
- Download the Alaska Permafrost Thaw Database as a CSV file. Example: `Main_Dataset/Alaska_Permafrost_Thaw_Database.csv`.
- If you want to look at older versions of the database, please see the Releases history. 
- See citation information below
---

## How to Contribute

We welcome contributions of new abrupt or non-abrupt permafrost thaw locations across Alaska. At this time, contributions are **only accepted via pull requests**.

1. **Fork this repository** and create a new branch in your fork.
2. **Add new data** to your own copy of:  
   `Main_Dataset/Alaska_Permafrost_Thaw_Database.csv`  
   - Follow the column structure exactly as outlined in this README.  
   - If you remove or edit existing rows, make a note of that in your pull request.
3. **Submit a pull request** from your branch to the `main` branch of this repository.
4. Once approved, your data will be merged into the main database.

See the [`CONTRIBUTING.md`](CONTRIBUTING.md) file for more detailed instructions.

---

## Citation

Webb, H., Pierce, E., Abbott, B. A., Bowden, W. B., Chen, Y., Chen, Y., Douglas, T. A., Eklof, J. F., Euskirchen, E., Langer, M., Myers-Smith, I. H., Overeem, I., Strauss, J., Walter Anthony, K., Wang, K., Whitley, M. A., & Turetsky, M. (2025). The Alaska Permafrost Thaw Database [insert version]. Zenodo. https://doi.org/10.5281/ZENODO.16996415

---



