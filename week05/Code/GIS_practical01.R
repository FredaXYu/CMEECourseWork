
# GIS
# https://davidorme.github.io/Masters_GIS/practical_1/practical_1.html

library(terra)     # core raster GIS package
library(sf)        # core vector GIS package
library(units)     # used for precise unit conversion

library(geodata)   # Download and load functions for core datasets
library(openxlsx)  # Reading data from Excel files

sf_use_s2(FALSE)



pop_dens <- data.frame(
  n_km2 = c(260, 67,151, 4500, 133), 
  country = c('England','Scotland', 'Wales', 'London', 'Northern Ireland')
)
print(pop_dens)

# Create coordinates  for each country 
# - this creates a matrix of pairs of coordinates forming the edge of the polygon. 
# - note that they have to _close_: the first and last coordinate must be the same.
scotland <- rbind(c(-5, 58.6), c(-3, 58.6), c(-4, 57.6), 
                  c(-1.5, 57.6), c(-2, 55.8), c(-3, 55), 
                  c(-5, 55), c(-6, 56), c(-5, 58.6))
england <- rbind(c(-2,55.8),c(0.5, 52.8), c(1.6, 52.8), 
                 c(0.7, 50.7), c(-5.7,50), c(-2.7, 51.5), 
                 c(-3, 53.4),c(-3, 55), c(-2,55.8))
wales <- rbind(c(-2.5, 51.3), c(-5.3,51.8), c(-4.5, 53.4),
               c(-2.8, 53.4),  c(-2.5, 51.3))
ireland <- rbind(c(-10,51.5), c(-10, 54.2), c(-7.5, 55.3),
                 c(-5.9, 55.3), c(-5.9, 52.2), c(-10,51.5))

# Convert these coordinates into feature geometries
# - these are simple coordinate sets with no projection information
scotland <- st_polygon(list(scotland))
england <- st_polygon(list(england))
wales <- st_polygon(list(wales))
ireland <- st_polygon(list(ireland))

# Combine geometries into a simple feature column
uk_eire_sfc <- st_sfc(wales, england, scotland, ireland, crs=4326)
plot(uk_eire_sfc, asp=1)

#-----------------------------
# Making vector points from a dataframe

uk_eire_capitals <- data.frame(
  long= c(-0.1, -3.2, -3.2, -6.0, -6.25),
  lat=c(51.5, 51.5, 55.8, 54.6, 53.30),
  name=c('London', 'Cardiff', 'Edinburgh', 'Belfast', 'Dublin')
)

# Indicate which fields in the data frame contain the coordinates
uk_eire_capitals <- st_as_sf(uk_eire_capitals, coords=c('long','lat'), crs=4326)
print(uk_eire_capitals)

# Vector geometry operations

st_pauls <- st_point(x=c(-0.098056, 51.513611))
london <- st_buffer(st_pauls, 0.25)

england_no_london <- st_difference(england, london)

lengths(scotland)

lengths(england_no_london)

#-----------------------------
wales <- st_difference(wales, england)

# A rough polygon that includes Northern Ireland and surrounding sea.
# - not the alternative way of providing the coordinates
ni_area <- st_polygon(list(cbind(x=c(-8.1, -6, -5, -6, -8.1), y=c(54.4, 56, 55, 54, 54.4))))

northern_ireland <- st_intersection(ireland, ni_area)
eire <- st_difference(ireland, ni_area)

# Combine the final geometries
uk_eire_sfc <- st_sfc(wales, england_no_london, scotland, london, northern_ireland, eire, crs=4326)

# compare six Polygon features with one Multipolygon feature
print(uk_eire_sfc)

# IMPORTANT: buffer

st_pauls <- st_point(x=c(-0.098056, 51.513611))
london <- st_buffer(st_pauls, 0.25)

# difference
# We also need to remove London from the England polygon so that we can set different 
# population densities for the two regions. This uses the difference operation. 

england_no_london <- st_difference(england, london)

lengths(scotland)

lengths(england_no_london)

wales <- st_difference(wales, england)

# A rough polygon that includes Northern Ireland and surrounding sea.
# - not the alternative way of providing the coordinates
ni_area <- st_polygon(list(cbind(x=c(-8.1, -6, -5, -6, -8.1), y=c(54.4, 56, 55, 54, 54.4))))

northern_ireland <- st_intersection(ireland, ni_area)
eire <- st_difference(ireland, ni_area)

# Combine the final geometries
uk_eire_sfc <- st_sfc(wales, england_no_london, scotland, london, northern_ireland, eire, crs=4326)

# compare six Polygon features with one Multipolygon feature
print(uk_eire_sfc)

# make the UK into a single feature
uk_country <- st_union(uk_eire_sfc[-6])
print(uk_country)

# Plot them
par(mfrow=c(1, 2), mar=c(3,3,1,1))
plot(uk_eire_sfc, asp=1, col=rainbow(6))
plot(st_geometry(uk_eire_capitals), add=TRUE)
plot(uk_country, asp=1, col='lightblue')

# vector data and attributes

uk_eire_sf <- st_sf(name=c('Wales', 'England','Scotland', 'London', 
                           'Northern Ireland', 'Eire'),
                    geometry=uk_eire_sfc)

print(uk_eire_sf)

plot(uk_eire_sf['name'], asp=1)

uk_eire_sf$capital <- c('Cardiff', 'London', 'Edinburgh', 
                        NA, 'Belfast','Dublin')
print(uk_eire_sf)

uk_eire_sf <- merge(uk_eire_sf, pop_dens, by.x='name', by.y='country', all.x=TRUE)
print(uk_eire_sf)

# Spatial attributes

uk_eire_centroids <- st_centroid(uk_eire_sf)
st_coordinates(uk_eire_centroids)


uk_eire_sf$area <- st_area(uk_eire_sf)

# To calculate a 'length' of a polygon, you have to convert it to a LINESTRING or a 
# MULTILINESTRING. Using MULTILINESTRING will automatically include all perimeter of a 
# polygon (including holes).
uk_eire_sf$length <- st_length(st_cast(uk_eire_sf, 'MULTILINESTRING'))

# Look at the result
print(uk_eire_sf)

# You can change units in a neat way
uk_eire_sf$area <- set_units(uk_eire_sf$area, 'km^2')
uk_eire_sf$length <- set_units(uk_eire_sf$length, 'km')
print(uk_eire_sf)


# And it won't let you make silly error like turning a length into weight
# uk_eire_sf$area <- set_units(uk_eire_sf$area, 'kg')


# Or you can simply convert the `units` version to simple numbers
uk_eire_sf$length <- as.numeric(uk_eire_sf$length)


st_distance(uk_eire_sf)

st_distance(uk_eire_centroids)


# Plotting sf objects

plot(uk_eire_sf['n_km2'], asp=1)  

# Reprojecting vector data   reprojection 
#------------------------------------------

# British National Grid (EPSG:27700)
uk_eire_BNG <- st_transform(uk_eire_sf, 27700)
# UTM50N (EPSG:32650)
uk_eire_UTM50N <- st_transform(uk_eire_sf, 32650)
# The bounding boxes of the data shows the change in units
st_bbox(uk_eire_sf)

st_bbox(uk_eire_BNG)

# Plot the results
par(mfrow=c(1, 3), mar=c(3,3,1,1))
plot(st_geometry(uk_eire_sf), asp=1, axes=TRUE, main='WGS 84')
plot(st_geometry(uk_eire_BNG), axes=TRUE, main='OSGB 1936 / BNG')
plot(st_geometry(uk_eire_UTM50N), axes=TRUE, main='UTM 50N')

# Set up some points separated by 1 degree latitude and longitude from St. Pauls
st_pauls <- st_sfc(st_pauls, crs=4326)
one_deg_west_pt <- st_sfc(st_pauls - c(1, 0), crs=4326) # near Goring
one_deg_north_pt <-  st_sfc(st_pauls + c(0, 1), crs=4326) # near Peterborough
# Calculate the distance between St Pauls and each point
st_distance(st_pauls, one_deg_west_pt)

st_distance(st_pauls, one_deg_north_pt)

st_distance(st_transform(st_pauls, 27700), 
            st_transform(one_deg_west_pt, 27700))

# transform St Pauls to BNG and buffer using 25 km
london_bng <- st_buffer(st_transform(st_pauls, 27700), 25000)
# In one line, transform england to BNG and cut out London
england_not_london_bng <- st_difference(st_transform(st_sfc(england, crs=4326), 27700), london_bng)
# project the other features and combine everything together
others_bng <- st_transform(st_sfc(eire, northern_ireland, scotland, wales, crs=4326), 27700)
corrected <- c(others_bng, london_bng, england_not_london_bng)
# Plot that and marvel at the nice circular feature around London
par(mar=c(3,3,1,1))
plot(corrected, main='25km radius London', axes=TRUE)

#========================================

# Rasters

# Create an empty raster object covering UK and Eire
uk_raster_WGS84 <- rast(xmin=-11,  xmax=2,  ymin=49.5, ymax=59, 
                        res=0.5, crs="EPSG:4326")
hasValues(uk_raster_WGS84)

# Add data to the raster - just use the cell numbers
values(uk_raster_WGS84) <- cells(uk_raster_WGS84)
print(uk_raster_WGS84)

plot(uk_raster_WGS84)
plot(st_geometry(uk_eire_sf), add=TRUE, border='black', lwd=2, col='#FFFFFF44')

# changing raster resolution

# Define a simple 4 x 4 square raster
m <- matrix(c(1, 1, 3, 3,
              1, 2, 4, 3,
              5, 5, 7, 8,
              6, 6, 7, 7), ncol=4, byrow=TRUE)
square <- rast(m)

plot(square, legend=NULL)
text(square, digits=2) 

# Aggregating rasters

# Average values
square_agg_mean <- aggregate(square, fact=2, fun=mean)
plot(square_agg_mean, legend=NULL)
text(square_agg_mean, digits=2)

# Maximum values
square_agg_max <- aggregate(square, fact=2, fun=max)
plot(square_agg_max, legend=NULL)
text(square_agg_max, digits=2)

# Modal values for categories
square_agg_modal <- aggregate(square, fact=2, fun='modal')
plot(square_agg_modal, legend=NULL)
text(square_agg_modal, digits=2)

# Disaggregating rasters

# Simply duplicate the nearest parent value
square_disagg <- disagg(square, fact=2, method='near')
plot(square_disagg, legend=NULL)
text(square_disagg, digits=2)

# Use bilinear interpolation
square_interp <- disagg(square, fact=2, method='bilinear')
plot(square_interp, legend=NULL)
text(square_interp, digits=1)

# Resampling

# Reprojecting a raster

# make two simple `sfc` objects containing points in  the
# lower left and top right of the two grids
uk_pts_WGS84 <- st_sfc(st_point(c(-11, 49.5)), st_point(c(2, 59)), crs=4326)
uk_pts_BNG <- st_sfc(st_point(c(-2e5, 0)), st_point(c(7e5, 1e6)), crs=27700)

#  Use st_make_grid to quickly create a polygon grid with the right cellsize
uk_grid_WGS84 <- st_make_grid(uk_pts_WGS84, cellsize=0.5)
uk_grid_BNG <- st_make_grid(uk_pts_BNG, cellsize=1e5)

# Reproject BNG grid into WGS84
uk_grid_BNG_as_WGS84 <- st_transform(uk_grid_BNG, 4326)

# Plot the features
par(mar=c(0,0,0,0))
plot(uk_grid_WGS84, asp=1, border='grey', xlim=c(-13,4))
plot(st_geometry(uk_eire_sf), add=TRUE, border='darkgreen', lwd=2)
plot(uk_grid_BNG_as_WGS84, border='red', add=TRUE)

# Create the target raster
uk_raster_BNG <- rast(xmin=-200000, xmax=700000, ymin=0, ymax=1000000,
                      res=100000, crs='+init=EPSG:27700')
uk_raster_BNG_interp <- project(uk_raster_WGS84, uk_raster_BNG, method='bilinear')
uk_raster_BNG_near <- project(uk_raster_WGS84, uk_raster_BNG, method='near')

par(mfrow=c(1,2), mar=c(0,0,0,0))
plot(uk_raster_BNG_interp, main='Interpolated', axes=FALSE, legend=FALSE)
text(uk_raster_BNG_interp, digit=1)
plot(uk_raster_BNG_near, main='Nearest Neighbour',axes=FALSE, legend=FALSE)
text(uk_raster_BNG_near)

#========================================

# Converting between vector and raster data types

# Create the target raster 
uk_20km <- rast(xmin=-200000, xmax=650000, ymin=0, ymax=1000000, 
                res=20000, crs='+init=EPSG:27700')

# Rasterizing polygons
uk_eire_poly_20km  <- rasterize(uk_eire_BNG, uk_20km, field='name')

plot(uk_eire_poly_20km)

uk_eire_BNG$name <- as.factor(uk_eire_BNG$name)
st_agr(uk_eire_BNG) <- 'constant'

# Rasterizing lines.
uk_eire_BNG_line <- st_cast(uk_eire_BNG, 'LINESTRING')
uk_eire_line_20km <- rasterize(uk_eire_BNG_line, uk_20km, field='name')

# Rasterizing points 
# - This isn't quite as neat as there are two steps in the casting process:
#   Polygon -> Multipoint -> Point
uk_eire_BNG_point <- st_cast(st_cast(uk_eire_BNG, 'MULTIPOINT'), 'POINT')
uk_eire_point_20km <- rasterize(uk_eire_BNG_point, uk_20km, field='name')

# Plotting those different outcomes
# - Use the hcl.colors function to create a nice plotting palette
color_palette <- hcl.colors(6, palette='viridis', alpha=0.5)

# - Plot each raster
par(mfrow=c(1,3), mar=c(1,1,1,1))
plot(uk_eire_poly_20km, col=color_palette, legend=FALSE, axes=FALSE)
plot(st_geometry(uk_eire_BNG), add=TRUE, border='red')

plot(uk_eire_line_20km, col=color_palette, legend=FALSE, axes=FALSE)
plot(st_geometry(uk_eire_BNG), add=TRUE, border='red')

plot(uk_eire_point_20km, col=color_palette, legend=FALSE, axes=FALSE)
plot(st_geometry(uk_eire_BNG), add=TRUE, border='red')

# Raster to vector

# Get a set of dissolved polygons (the default) including NA cells
poly_from_rast <- as.polygons(uk_eire_poly_20km, na.rm=FALSE)

# Get individual cells (no dissolving)
cells_from_rast <- as.polygons(uk_eire_poly_20km, dissolve=FALSE)

# Get individual points
points_from_rast <- as.points(uk_eire_poly_20km)

print(st_as_sf(poly_from_rast))

print(st_as_sf(cells_from_rast))

print(st_as_sf(points_from_rast))

# Plot the outputs - using key.pos=NULL to suppress the key
par(mfrow=c(1,3), mar=c(1,1,1,1))
plot(poly_from_rast, key.pos = NULL)
plot(cells_from_rast, key.pos = NULL)
plot(points_from_rast, key.pos = NULL, pch=4)

#==============================================

# Using data in files

# Saving vector data

# st_write(uk_eire_sf, 'data/uk/uk_eire_WGS84.shp')
# st_write(uk_eire_BNG, 'data/uk/uk_eire_BNG.shp') 
st_write(uk_eire_sf, '../Data/uk/uk_eire_WGS84.shp', append=FALSE) ### need to add append=FALSE ##
st_write(uk_eire_BNG, '../Data/uk/uk_eire_BNG.shp', append=FALSE)  ### need to add append=FALSE ##

st_write(uk_eire_sf, '../Data/uk/uk_eire_WGS84.geojson', append=FALSE)
st_write(uk_eire_sf, '../Data/uk/uk_eire_WGS84.gpkg', append=FALSE)

st_write(uk_eire_sf, '../Data/uk/uk_eire_WGS84.json', driver='GeoJSON', append=FALSE)


# Saving raster data
# Save a GeoTiff
writeRaster(uk_raster_BNG_interp, '../Data/uk/uk_raster_BNG_interp.tif', overwrite=TRUE)
# Save an ASCII format file: human readable text. 
# Note that this format also creates an aux.xml and .prj file!
writeRaster(uk_raster_BNG_near, '../Data/uk/uk_raster_BNG_ngb.asc', filetype='AAIGrid', overwrite=TRUE)

#------------------------------------------
# Loading Vector data

# Load a vector shapefile
ne_110 <- st_read('../Data/ne_110m_admin_0_countries/ne_110m_admin_0_countries.shp')
# Also load some WHO data on 2016 life expectancy
# see: http://apps.who.int/gho/athena/api/GHO/WHOSIS_000001?filter=YEAR:2016;SEX:BTSX&format=csv
life_exp <- read.csv(file = "../Data/WHOSIS_000001.csv")


# The first plot is easy
plot(ne_110['GDP_MD'],  asp=1, main='Global GDP', logz=TRUE, key.pos=4)

# Then for the second we need to maerge the data
ne_110 <- merge(ne_110, life_exp, by.x='ISO_A3_EH', by.y='COUNTRY', all.x=TRUE)
# Create a sequence of break values to use for display
bks <- seq(50, 85, by=0.25)
# Plot the data
plot(ne_110['Numeric'], asp=1, main='Global 2016 Life Expectancy (Both sexes)',
     breaks=bks, pal=hcl.colors, key.pos=4)


# Loding XY data

# Read in Southern Ocean example data
so_data <- read.csv('data/Southern_Ocean.csv', header=TRUE)

# Convert the data frame to an sf object
so_data <- st_as_sf(so_data, coords=c('long', 'lat'), crs=4326)
print(so_data)

# Loading raster data

etopo_25 <- rast('data/etopo_25.tif')
# Look at the data content
print(etopo_25)
# Plot it 
plot(etopo_25, plg=list(ext=c(190, 210, -90, 90)))


# Define a sequence of 65 breakpoints along an elevation gradient from -10 km to 6 km.
# There are 64 intervals between these breaks and each interval will be assigned a 
# colour
breaks <- seq(-10000, 6000, by=250)

# Define 24 land colours for use above sea level (0m)
land_cols  <- terrain.colors(24)

# Generate a colour palette function for sea colours
sea_pal <- colorRampPalette(c('darkslateblue', 'steelblue', 'paleturquoise'))

# Create 40 sea colours for use below sea level
sea_cols <- sea_pal(40)

# Plot the raster providing the breaks and combining the two colour sequences to give 
# 64 colours that switch from sea to land colour schems at 0m.
plot(etopo_25, axes=FALSE, breaks=breaks,
     col=c(sea_cols, land_cols), type='continuous',
     plg=list(ext=c(190, 200, -90, 90))
)

# raster stacks

# Download bioclim data: global maximum temperature at 10 arc minute resolution
tmax <- worldclim_global(var='tmax', res=10, path='data')
# The data has 12 layers, one for each month
print(tmax)

# Extract  January and July data and the annual maximum by location.
tmax_jan <- tmax[[1]]
tmax_jul <- tmax[[7]]
tmax_max <- max(tmax)

# Plot those maps
par(mfrow=c(2,2), mar=c(2,2,1,1))
bks <- seq(-50, 50, length=101)
pal <- colorRampPalette(c('lightblue','grey', 'firebrick'))
cols <- pal(100)
plg <- list(ext=c(190, 200, -90, 90))

plot(tmax_jan, col=cols, breaks=bks, 
     main='January maximum temperature', type='continuous', plg=plg)
plot(tmax_jul, col=cols, breaks=bks, 
     main='July maximum temperature', type='continuous', plg=plg)
plot(tmax_max, col=cols, breaks=bks, 
     main='Annual maximum temperature', type='continuous', plg=plg)

## Overlaying raster and vector data

# Cropping data

so_extent <- ext(-60, -20, -65, -45)

# The crop function for raster data...
so_topo <- crop(etopo_25, so_extent)

# ... and the st_crop function to reduce some higher resolution coastline data
ne_10 <- st_read('../Data/ne_10m_admin_0_countries/ne_10m_admin_0_countries.shp')
st_agr(ne_10) <- 'constant'
so_ne_10 <- st_crop(ne_10, so_extent)

sea_pal <- colorRampPalette(c('grey30', 'grey50', 'grey70'))

# Plot the underlying sea bathymetry
plot(so_topo, col=sea_pal(100), asp=1, legend=FALSE)
contour(so_topo, levels=c(-2000, -4000, -6000), add=TRUE, col='grey80')

# Add the land
plot(st_geometry(so_ne_10), add=TRUE, col='khaki', border='grey40')

# Show the sampling sites
plot(st_geometry(so_data), add=TRUE, pch=4, cex=2, col='white', lwd=3)

#-------------------------------------

# Spatial joins and raster data extraction

set.seed(1)
# extract Africa from the ne_110 data and keep the columns we want to use
africa <- subset(ne_110, CONTINENT=='Africa', select=c('ADMIN', 'POP_EST'))

# transform to the Robinson projection
africa <- st_transform(africa, crs='ESRI:54030')
# create a random sample of points
mosquito_points <- st_sample(africa, 1000)

# Create the plot
plot(st_geometry(africa), col='khaki')
plot(mosquito_points, col='firebrick', add=TRUE)

mosquito_points_agg <- aggregate(
  mosquito_points, 
  by=list(country=mosquito_points$ADMIN), FUN=length
)
names(mosquito_points_agg)[2] <-'n_outbreaks'
print(mosquito_points_agg)

# Merge the number of outbreaks back onto the sf data
africa <- st_join(africa, mosquito_points_agg)
africa$area <- as.numeric(st_area(africa))
print(africa)

# Plot the results
par(mfrow=c(1,2), mar=c(3,3,1,1), mgp=c(2,1, 0))
plot(n_outbreaks ~ POP_EST, data=africa, log='xy', 
     ylab='Number of outbreaks', xlab='Population size')
plot(n_outbreaks ~ area, data=africa, log='xy',
     ylab='Number of outbreaks', xlab='Area (m2)')

# Load the data and convert to a sf object
alien_xy <- read.csv('../Data/aliens.csv')
alien_xy <- st_as_sf(alien_xy, coords=c('long','lat'), crs=4326)

# Add country information and find the total number of aliens per country
alien_xy <- st_join(alien_xy, ne_110['ADMIN'])
aliens_by_country <- aggregate(n_aliens ~ ADMIN, data=alien_xy, FUN=sum)

# Add the alien counts into the country data 
ne_110 <- merge(ne_110, aliens_by_country, all.x=TRUE)
ne_110$people_per_alien <- with(ne_110,  POP_EST / n_aliens )

# Find which countries are in danger
ne_110$in_danger <- ne_110$people_per_alien < 1000

# Plot the danger map
plot(ne_110['in_danger'], pal=c('grey', 'red'), key.pos=4)

# Extracting data from Rasters

uk_eire_etopo <- rast('../Data/uk/etopo_uk.tif')


# masking elevation data

uk_eire_detail <- subset(ne_10, ADMIN %in% c('United Kingdom', "Ireland"))
uk_eire_detail_raster <- rasterize(uk_eire_detail, uk_eire_etopo)
uk_eire_elev <- mask(uk_eire_etopo, uk_eire_detail_raster)

par(mfrow=c(1,2), mar=c(3,3,1,1), mgp=c(2,1,0))
plot(uk_eire_etopo, plg=list(ext=c(3,4, 50, 59)))
plot(uk_eire_elev, plg=list(ext=c(3,4, 50, 59)))
plot(st_geometry(uk_eire_detail), add=TRUE, border='grey')

# Raster cell statistics and locations
uk_eire_elev >= 1195

global(uk_eire_elev, max, na.rm=TRUE)
global(uk_eire_elev, quantile, na.rm=TRUE)

# Which is the highest cell
where.max(uk_eire_elev)

# Which cells are above 1100m
high_points <- where.max(uk_eire_elev >= 1100, value=FALSE)
xyFromCell(uk_eire_elev, high_points[,2])

max_cell <- where.max(uk_eire_elev)
max_xy <- xyFromCell(uk_eire_elev, max_cell[2])
max_sfc<- st_sfc(st_point(max_xy), crs=4326)

bsl_cell <- where.max(uk_eire_elev < 0, values=FALSE)
bsl_xy <- xyFromCell(uk_eire_elev, bsl_cell[,2])
bsl_sfc <- st_sfc(st_multipoint(bsl_xy), crs=4326)

plot(uk_eire_elev)
plot(max_sfc, add=TRUE, pch=24, bg='red')
plot(bsl_sfc, add=TRUE, pch=25, bg='lightblue', cex=0.6)

# The extract function

uk_eire_capitals$elev <- extract(uk_eire_elev, uk_eire_capitals, ID=FALSE)
print(uk_eire_capitals)

etopo_by_country <- extract(uk_eire_elev, uk_eire_sf['name'])
head(etopo_by_country)

aggregate(etopo_uk ~ ID, data=etopo_by_country, FUN='mean', na.rm=TRUE)

zones <- rasterize(st_transform(uk_eire_sf, 4326), uk_eire_elev, field='name')
etopo_by_country <- zonal(uk_eire_elev, zones, fun='mean', na.rm=TRUE)

print(etopo_by_country)

st_layers('../Data/uk/National_Trails_Pennine_Way.gpx')

# load the data, showing off the ability to use SQL queries to load subsets of the data
pennine_way <- st_read('../Data/uk/National_Trails_Pennine_Way.gpx',
                       query="select * from routes where name='Pennine Way'")

# reproject the vector data
pennine_way_BNG <- st_transform(pennine_way, crs=27700)
# create the target raster and project the elevation data into it.
bng_2km <- rast(xmin=-200000, xmax=700000, ymin=0, ymax=1000000, 
                res=2000, crs='EPSG:27700')
uk_eire_elev_BNG <- project(uk_eire_elev, bng_2km, method='cubic')

# Simplify the data
pennine_way_BNG_simple <- st_simplify(pennine_way_BNG,  dTolerance=100)

# Zoom in to the whole route and plot the data
par(mfrow=c(1,2), mar=c(1,1,1,1))

plot(uk_eire_elev_BNG, xlim=c(3e5, 5e5), ylim=c(3.8e5, 6.3e5),
     axes=FALSE, legend=FALSE)
plot(st_geometry(pennine_way_BNG), add=TRUE, col='black')
plot(st_geometry(pennine_way_BNG_simple), add=TRUE, col='darkred')

# Add a zoom box and use that to create a new plot
zoom <- ext(3.78e5, 3.84e5, 4.72e5, 4.80e5)
plot(zoom, add=TRUE, border='red')

# Zoomed in plot
plot(uk_eire_elev_BNG, ext=zoom, axes=FALSE, legend=FALSE)
plot(st_geometry(pennine_way_BNG), add=TRUE, col='black')
plot(st_geometry(pennine_way_BNG_simple), add=TRUE, col='darkred')

# Extract the data
pennine_way_trans <- extract(uk_eire_elev_BNG, pennine_way_BNG_simple, xy=TRUE)
head(pennine_way_trans)

# Now we can use Pythagoras to find the distance along the transect
pennine_way_trans$dx <- c(0, diff(pennine_way_trans$x))
pennine_way_trans$dy <- c(0, diff(pennine_way_trans$y))
pennine_way_trans$distance_from_last <- with(pennine_way_trans, sqrt(dx^2 + dy^2))
pennine_way_trans$distance <- cumsum(pennine_way_trans$distance_from_last) / 1000

plot( etopo_uk ~ distance, data=pennine_way_trans, type='l', 
      ylab='Elevation (m)', xlab='Distance (km)')


###################################
############Mini projects###############

transect_long <- c(132.3, 135.2, 146.4, 149.3)
transect_lat <- c(-1, -3.9, -7.7, -9.8)

# Get the precipitation data
ng_prec <- worldclim_tile(var='prec', res=0.5, lon=140, lat=-10, path='data')

# Reduce to the extent of New Guinea - crop early to avoid unnecessary processing!
ng_extent <- ext(130, 150, -10, 0)
ng_prec <- crop(ng_prec, ng_extent)

# Calculate annual precipitation
ng_annual_prec <- sum(ng_prec)

# Now reproject to UTM 54S. The code here is using reprojecting the extent of the
# raster data to get sensible values for the UTM 54S extent. We are then picking extent 
# values here that create a neat 1000m grid with sensible cell edges
ng_extent_poly <- st_as_sfc(st_bbox(ng_extent, crs=4326))
ng_extent_utm <- ext(-732000, 1506000, 8874000, 10000000)

# Create the raster and reproject the data
ng_template_utm <- rast(ng_extent_utm, res=1000, crs="+init=EPSG:32754")
ng_annual_prec_utm <- project(ng_annual_prec, ng_template_utm)

# Create and reproject the transect and then segmentize it to 1000m
transect <-  st_linestring(cbind(x=transect_long, y=transect_lat))
transect <- st_sfc(transect, crs=4326)
transect_utm <- st_transform(transect, crs=32754)
transect_utm <- st_segmentize(transect_utm, dfMaxLength=1000)

# Extract the transect data
transect_data <- extract(ng_annual_prec_utm, st_sf(transect_utm), xy=TRUE)

# Now we can use Pythagoras to find the distance along the transect
transect_data$dx <- c(0, diff(transect_data$x))
transect_data$dy <- c(0, diff(transect_data$y))
transect_data$distance_from_last <- with(transect_data, sqrt(dx^2 + dy^2))
transect_data$distance <- cumsum(transect_data$distance_from_last) / 1000

# Get the natural earth high resolution coastline.
ne_10_ng  <- st_crop(ne_10, ng_extent_poly)
ne_10_ng_utm <-  st_transform(ne_10_ng, crs=32754)

par(mfrow=c(2,1), mar=c(3,3,1,1), mgp=c(2,1,0))
plot(ng_annual_prec_utm, plg=list(ext=c(1700000, 1800000, 8950000, 9950000)))

plot(st_geometry(ne_10_ng_utm), add=TRUE, col=NA, border='grey50')
plot(transect_utm, add=TRUE)

par(mar=c(3,3,1,1))
plot( sum ~ distance, data=transect_data, type='l', 
      ylab='Annual precipitation (mm)', xlab='Distance (km)')


# Download the GADM data for Fiji, convert to sf and then extract Kadavu
fiji <- gadm(country='FJI', level=2, path='data/fiji')
fiji <- st_as_sf(fiji)
kadavu <- subset(fiji, NAME_2 == 'Kadavu')

# Load the villages and sites and convert to sf
villages <- readWorkbook('data/fiji/FishingPressure.xlsx', 'Villages')
villages <- st_as_sf(villages, coords=c('long','lat'), crs=4326)
sites <- readWorkbook('data/fiji/FishingPressure.xlsx', 'Field sites', startRow=3)
sites <- st_as_sf(sites, coords=c('Long','Lat'), crs=4326)

# Reproject the data UTM60S
kadavu <- st_transform(kadavu, 32760)
villages <- st_transform(villages, 32760)
sites <- st_transform(sites, 32760)

# Map to check everything look right.
plot(st_geometry(sites), axes=TRUE, col='blue', pch=4)
plot(st_geometry(villages), add=TRUE, col='red')
plot(st_geometry(kadavu), add=TRUE)

# Create a template raster covering the whole study area, at a given resolution
res <- 100
r <- rast(xmin=590000, xmax=670000, ymin=7870000, ymax=7940000, crs='EPSG:32760', res=res)

# Rasterize the island as a POLYGON to get cells that cannot be traversed
kadavu_poly <- rasterize(kadavu, r, field=1, background=0)

# Rasterize the island as a MULTILINESTRING to get the coastal 
# cells that _can_ be traversed
coast <- st_cast(kadavu, 'MULTILINESTRING')
kadavu_lines <- rasterize(coast, r, field=1, background=0)

# Combine those to give cells that are in the sea (kadavu_poly=0) or 
# on the coast (kadavu_lines=1)
sea_r <- (! kadavu_poly) | kadavu_lines

# Set the costs
sea_r[sea_r == 0] <- NA
sea_r[! is.na(sea_r)] <- 1

# Plot the map and then zoom in to show that the coastal cells can
# be travelled through
par(mfrow=c(1,2), mar=c(2,2,1,1))
plot(sea_r, col='lightblue')
zoom <- ext(599000, 602000, 7884000, 7887000)
plot(zoom, add=TRUE)

plot(sea_r, ext=zoom, col='lightblue')
plot(st_geometry(kadavu), add=TRUE)

# Find the nearest points on the coast to each village
village_coast <- st_nearest_points(villages, coast)

# Extract the end point on the coast and convert from MULTIPOINT to POINT
launch_points <- st_line_sample(village_coast, sample=1)
launch_points <- st_cast(launch_points, 'POINT')

# Zoom in to a bay on Kadavu
par(mar=c(0,0,0,0))
plot(st_geometry(kadavu), xlim=c(616000, 618000), ylim=c(7889000, 7891000), col='khaki')
# Plot the villages, lines to the nearest coast and the launch points.
plot(st_geometry(villages), add=TRUE, col='firebrick', lwd=2)
plot(village_coast, add=TRUE, col='black')
plot(launch_points, add=TRUE, col='darkgreen', lwd=2)

villages$launch_points <- launch_points
st_geometry(villages) <- 'launch_points'

r <- rast(xmin=0, ymin=0, xmax=50, ymax=50, res=10, crs='EPSG:32760')

# Set cell values:
values(r) <- 1  # Set all cells to be non-NA
r[3,3] <- 0     # This is a target cell
r[4,4] <- NA    # Set one NA cell

# Calculate and plot distances
d <- gridDist(r)
plot(d, legend=NULL)
text(d, digits=1)


# Make a copy of the sea map
dist <- sea_r

# Find the location of a site and make that the target
site_idx <- 49
village_cell <- cellFromXY(dist, st_coordinates(villages[site_idx,]))
dist[village_cell] <- 0

# Now we can calculate the cost distance for each launch point to each site...
costs <- gridDist(dist)

plot(costs, plg=list(ext=c(672000, 674000, 7870000, 7940000)))
plot(st_geometry(villages[site_idx,]), add=TRUE, pch=4)
plot(st_geometry(sites), add=TRUE)


# And grab the costs at each fishing site
distances_to_site <- extract(costs, sites)
print(distances_to_site)

# and find the smallest distance
nearest_site <- which.min(distances_to_site$layer)

# Create fields to hold the nearest fishing site data
villages$nearest_site_index <- NA
villages$nearest_site_name <- NA

# Loop over the sites
for (site_idx in seq(nrow(villages))) {
  
  # Make a copy of the sea map
  dist <- sea_r
  
  # Find the location of a site and make that the target
  village_cell <- cellFromXY(dist, st_coordinates(villages[site_idx,]))
  dist[village_cell] <- 0
  
  # Now we can calculate the cost distance for each launch point to each site...
  costs <- gridDist(dist)
  
  # And find the nearest site
  distances_to_site <- extract(costs, sites)
  nearest_site <- which.min(distances_to_site$layer)
  
  # Find the index and name of the lowest distance in each row
  villages$nearest_site_index[site_idx] <- nearest_site
  villages$nearest_site_name[site_idx] <- sites$Name[nearest_site]
  
}

# Find the total number of buildings  per site and merge that data
# into the sites object
site_load <- aggregate(building_count ~ nearest_site_name, data=villages, FUN=sum)
sites_with_load <- merge(sites, site_load, by.x='Name', by.y='nearest_site_name', all.x=TRUE)

# Now build up a complex plot
par(mar=c(0,0,0,0))
plot(st_geometry(kadavu))

# add the villages, colouring by nearest site and showing the village 
# size using the symbol size (cex)
plot(villages['nearest_site_name'], add=TRUE, pch=20, cex=log10(villages$building_count))

# Add the sites
plot(st_geometry(sites_with_load), add=TRUE, col='red', pch=4, lwd=4)


print(sites_with_load)


##########################

# Using ggplot to make maps

library(ggplot2)
ggplot(ne_110) +
  geom_sf() +
  theme_bw()

europe <- st_crop(ne_110, ext(-10,40,35,75))
ggplot(europe) +
  geom_sf(aes(fill=GDP_MD)) +
  scale_fill_viridis_c() +
  theme_bw() + 
  geom_sf_text(aes(label = ADMIN), colour = "white")

# Calculate the extent in the LAEA projection of the cropped data
europe_crop_laea <- st_transform(europe, 3035)

# Reproject all of the country data and _then_ crop to the previous extent
europe_laea <- st_transform(ne_110, 3035)
europe_laea <- st_crop(europe_laea, europe_crop_laea)

# Plot the two maps
p1 <- ggplot(europe_crop_laea) +
  geom_sf(aes(fill=log(GDP_MD))) +
  scale_fill_viridis_c() +
  theme_bw() + 
  theme(legend.position="bottom") +
  geom_sf_text(aes(label = ADM0_A3), colour = "grey20")

p2 <- ggplot(europe_laea) +
  geom_sf(aes(fill=log(GDP_MD))) +
  coord_sf(expand=FALSE) +
  scale_fill_viridis_c() +
  theme_bw() + 
  theme(legend.position="bottom") +
  geom_sf_text(aes(label = ADM0_A3), colour = "grey20")

library(gridExtra)
grid.arrange(p1, p2, ncol=2)


####Brewer

library(RColorBrewer)
display.brewer.all()

display.brewer.all(colorblindFriendly = TRUE)

























