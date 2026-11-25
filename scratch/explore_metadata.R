
# Load libraries
library(tidyverse)
library(sf)
library(tmap)

# Import marine regions EEZ/IHO spatial data
fp <- "/home/clorey/MEDS/eds222/fishing-effort-analysis/data/Intersect_EEZ_IHO_v5_20241010/Intersect_EEZ_IHO_v5_20241010.shp"
st_layers(fp)

# Look at columns
names(st_read(fp, query = "SELECT * FROM \"Intersect_EEZ_IHO_v5_20241010\" LIMIT 1", quiet = TRUE))

us <- st_read(fp, quiet = TRUE,
  query = "SELECT * FROM \"Intersect_EEZ_IHO_v5_20241010\" WHERE ISO_TER1 = 'USA'") |> # ISO_TER1 only includes US, AK, HI, not overseas territories
  st_make_valid()

# Check crs (should be 4326, which is what GFW uses)
st_crs(us)

# Look at marine regions
unique(us$MarRegion)
