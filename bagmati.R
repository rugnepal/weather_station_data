library("tidyverse")
library("highcharter")


bagmati <- read_csv("bagmati_sundarijal.csv")

ggplot(bagmati, aes(x = datetime_UTC, y = waterLevel)) +
  geom_line()

ggplot(bagmati, aes(x = datetime_UTC, y = waterLevel)) +
  geom_bar(stat='identity')













bagmati


hchart(bagmati, "line", hcaes(x = localDateTime, y = waterLevel))

hchart(mpg, "scatter", hcaes(x = displ, y = hwy, group = class))


highchart(type = "stock") %>% 
  hc_add_series(asset_returns_xts$SPY, 
                type = "line",
                color = "green")

turkeghat <- read_csv("/home/bjungbogati/Desktop/Arun at Turkeghat.csv")

simle <- read_csv("")


/home/bjungbogati/Desktop/Arun at Turkeghat.csv
/home/bjungbogati/Desktop/Arun River at Simle.csv
/home/bjungbogati/Desktop/_Bagmati River at Bhorleni.csv













