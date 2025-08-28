# The Alaska Permafrost Thaw Database


The Alaska Permafrost Thaw Database is an open-access, georeferenced database of abrupt and non-abrupt permafrost thaw locations across Alaska. 
The database includes 19,536 points compiled from published literature, geospatial databases, field campaigns, and photo-interpreted sites of landscape change.
Each record contains source information, remote sensing instruments used (if applicable), latitude and longitude coordinates in WGS84, feature name 
when applicable, feature type as reported by the source, feature category (feature type simplified into a broader category), and type of thaw (abrupt or non-abrupt). 


## This repository hosts:
**CSV file**: Tabular dataset of the Alaska permafrost thaw database

**Shapefile**: Geospatial dataset with necessary files (.dbf, .prj, .shp, .shx)

**Template CSV**: Example file for contributing new thaw points

**README**: File detailing how to use the database and how to contribute

---


## Data Structure and Metadata Formatting Summary Example:

| Field Name                 | Format                                               | Description                                                                                                               | Examples
|---------------------------|------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------
| `Authors`                 | Author last name et al. (Year published)             | Author list from source publication                                                                                        |  Webb et al. (2025);<br>Webb (2025);<br>Webb & Turetsky (2025) 
| `DOI`                     | `https:://doi.org/XXXX/XXXX`                         | Unique identifier from source publication. Put N/A if not published                                                        | http://dx.doi.org/10.1007/s10533-013-9862-0
| `Remote Sensor(s) Used`   | Satellite name, imagery years used, resolution (m)   | For remotely sensed data, this specifies the sensing instrument(s) and relevant methods for mapping                        | Landsat, 1995-2005, 30m;<br>Planet, 2025, 2m             
| `Latitude`                | Decimal Degrees in EPSG:4326                         | Point location (y coordinate) of thaw event in EPSG:4326                                                                   | 64.57892320
| `Longitude`               | Decimal Degrees in EPSG:4326                         | Point location (x coordinate) of thaw event in EPSG:4326                                                                   | -147.523905823
| `Feature Name`            | Name of feature or site                              | The name of the feature. This can include known lakes, monitoring stations, or established field sites.                    | Alaska Peatland Experiment; Eight Mile Lake
| `Feature Type`            | Name of type of feature as reported by source data   | The type of feature. This can include things like retrogressive thaw slumps, thermokarst lakes, collapse-scar bog, etc.    | Collapse-scar bog; Collapsed pingo pond; Thermokarst water track
| `Feature Category`        | `Feature Type` generalized into broader category       | Categorize `Feature Type` as one of the following: Active layer detachment, Retrogressive thaw slump, Thaw pond, Thermoerosional gully, Thermokarst, Thermokarst lake, Wildfire-induced thaw, or Thermokarst wetland | Thermokarst wetland; Thaw pond, Thermokarst
| `Thaw Type`               | Abrupt or Non-abrupt                                 | The type of thaw. The features are classified as either abrupt or non-abrupt thaw according to the framework outlined in [Webb et al. (2025)](https://doi.org/10.1007/s40641-025-00204-3) | Abrupt; Non-abrupt

---
## Instructions for Use
Use the DOI link: 

---

## How to Contribute


---

## Citation

Webb, H. et al. (2025). *A Comprehensive Database of Thawing and Stable Permafrost Locations Across Alaska*. Zenodo. https://doi.org/XXXX/zenodo.XXXXX


---



