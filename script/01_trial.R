### load library
library(leaflet)
library(dplyr)
library(geojsonio)
library(tigris)
library(readr)
library(RColorBrewer)
### load data
province_map <- topojson_read("data/map/gis-data/province.topojson", verbose = FALSE)


###
total_df <- read_csv("data/processed/population/00_totaldf.csv")


new_data <- geo_join(province_map,total_df,'Title','state')
#popup_00 <- paste0("<strong>",new_data$state,"</strong>","</br>", "Household: ",new_data$household)
bins <- c(200000, 400000, 600000, 800000,1000000,1200000,1400000, Inf)
pal <- colorBin("Reds", domain = new_data$household, bins = bins)

#labels <- sprintf("<strong>%s</strong><br/> House: %g",new_data$state,new_data$household
#) %>% lapply(htmltools::HTML)

label2 <- as.list(paste0("<strong>",new_data$state,"</strong>","<br/>Household: ",new_data$household,"<br/>Total:",new_data$total) %>% lapply(htmltools::HTML))
### new cloropeth map
new_map <- leaflet(new_data) %>%
  setView(84.1240,28.3949,6) %>%
  addProviderTiles("Esri.WorldGrayCanvas", options = leafletOptions(minZoom = 6,maxZoom = 9))
  
new_map %>% addPolygons(data = new_data,
                        fillColor = ~pal(new_data$household) ,
                        fillOpacity = 0.7,
                        opacity = 1,
                        weight = 2,
                        color = "white",
                        dashArray = "0.5",
                        smoothFactor = 0.5,
                        label  = label2,
                        labelOptions = labelOptions(
                          style = list("font-weight" = "normal", padding = "3px 8px"),
                          textsize = "15px",
                          direction = "auto")
                  )