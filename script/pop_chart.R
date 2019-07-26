### Household + Population Barchart Module
### required Library
source('script/package.R')

create_pop_chart <- function(df_address){
  
  main_df<- read_csv(df_address)
  pop_house_df <- main_df %>% gather(key = "type",value = "population_household",-state,-male,-female)
  pop_house_df <- arrange(pop_house_df,desc(type),female)
  cols <- brewer.pal(n = 2, name = "Dark2")
  hchart(pop_house_df,"column", hcaes(x= state, y = population_household, group = type)) %>% 
    hc_colors(cols) %>% hc_exporting(enabled = TRUE)
}