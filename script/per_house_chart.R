### Per House Hold

### required Library
source('script/package.R')

create_per_house <- function(df_address)
  {
  
  main_df<- read_csv(df_address)
  per_house_df <- main_df %>% 
    mutate(people_per_house = population/household,male_per_house = male/household,female_per_house = female/household)%>%
    gather(key = "type",value = "per_house",-state,-male,-female,-population,-household)
  per_house_df$per_house <- round(per_house_df$per_house,4)
  per_house_df <- arrange(per_house_df,type,per_house)
  
  cols <- c("#1E88E5","#FFC107","#D81B60")
  hchart(per_house_df,"column", hcaes(x= state, y = per_house, group = type)) %>% 
    hc_colors(cols) %>% hc_exporting(enabled = TRUE)
    
}