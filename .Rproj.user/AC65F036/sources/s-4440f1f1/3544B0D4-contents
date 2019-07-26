nepalmap <- get_data_from_map(download_map_data("countries/np/np-all"))


data_fake <- nepalmap %>% 
  select(code = `hc-a2`) %>% 
  mutate(value = 1e5 * abs(rt(nrow(.), df = 10)))

glimpse(data_fake)


hcmap("countries/np/np-all", data = data_fake, value = "value",
      joinBy = c("hc-a2", "code"), name = "Fake data",
      dataLabels = list(enabled = TRUE, format = '{point.name}'),
      borderColor = "#FAFAFA", borderWidth = 0.1,
      tooltip = list(valueDecimals = 2, valuePrefix = "$", valueSuffix = " USD")) 

places <- c("Bagmati", "Arun", "Saptokoshi")
lon <- c("27.632222", "26.9233", "26.86666")
lat <- c("85.293333", "87.1552", "87.15833")



place_point <- data.frame(places, lon, lat)

nepal_geojson <- geojson_json(place_point, lat = "latitude", lon = "longitude")
nepal_geojson

library(geojsonio)
highchart(type = "map") %>%
  hc_add_series(mapData = nepalmap, showInLegend = FALSE) 
# name = "Place", tooltip = list(pointFormat = "{point.name}"))
