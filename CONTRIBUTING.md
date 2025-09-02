## How to Contribute:
1. **Fork** this repository (makes your own copy so you can edit).
2. **Create a new branch** in your fork for your contribution.
3. **Open the CSV template** and add your thaw locations following the data structure below.
4. **Commit** your changes with a clear message stating the source of the new thaw locations.
5. **Open a Pull Request** back to this repo.
6. Our checks run automatically; a maintainer will review 

## Data Structure and Metadata Formatting Summary Example:

| Field Name          |  Required?     | Format                                               | Description                                                                                                               | Examples
|---------------------|-------|-----------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------
| `Authors`           |   Yes    | Author last name et al. (Year published)           | Author list from source publication                                                                                        | Webb et al. (2025);<br>Webb (2025);<br>Webb & Turetsky (2025) 
| `DOI`               |    Yes, Put N/A if not published   | `https://doi.org/XXXX/XXXX`                        | Unique identifier from source publication. Put N/A if unpublished                                                        | http://dx.doi.org/10.1007/s10533-013-9862-0
| `DataSourceType`    |     Yes   | Field/Remote Sensing/Photo-interpretation & publication status                          | Type of source data                                                                                                       | Field - unpublished; Remote Sensing - published
 `FeatureName`        |   No   | Name of feature or site                              | The name of the feature. This can include known lakes, monitoring stations, or established field sites.                  | Alaska Peatland Experiment; Eight Mile Lake
| `Latitude`          |    Yes   | Decimal Degrees (EPSG:4326)                         | Point location (y coordinate) of thaw event in EPSG:4326                                                                                              | 64.5789232
| `Longitude`         |     Yes  | Decimal Degrees (EPSG:4326)                         |  Point location (x coordinate) of thaw event in EPSG:4326                                                                                               | -147.5239058
| `FeatureType`       |    Yes   | As reported by source                               | Types include retrogressive thaw slumps, thermokarst lakes, collapse-scar bog, etc.                                      | Collapse-scar bog; Thermokarst water track
| `FeatureCategory`   |     Yes  | Generalized category                                | Categorize `Feature Type` as one of the following: Active layer detachment, Retrogressive thaw slump, Thaw pond, Thermoerosional gully, Thermokarst, Thermokarst lake, Wildfire-induced thaw, or Thermokarst wetland | Thermokarst wetland; Thaw pond, Thermokarst
| `ThawType`          |    Yes   | Abrupt / Non-abrupt                                  | The type of thaw. The features are classified as either abrupt or non-abrupt thaw according to the framework outlined in [Webb et al. (2025)](https://doi.org/10.1007/s40641-025-00204-3)                  | Abrupt; Non-abrupt
| `Imagery`           |   Yes, if remotely sensed data    | Satellite or sensor name                            | Remote sensing instrument used, if applicable                    | Landsat; Planet                      
| `ImageryDate`       |    Yes, if remotely sensed data    | Year(s) of imagery                                  | Years of imagery used                                                                                                     | 1995 to 2005; 2025
| `ImageryResolution_meters`| Yes, if remotely sensed data | Spatial resolution in meters                        | Resolution of imagery used                                                                                                 | 2; 30
