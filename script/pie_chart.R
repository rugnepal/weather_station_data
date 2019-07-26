### Pie chart Creator

### required Library
source('script/package.R')

create_pie <- function(df_address = "data/processed/population/pop_distri.csv")
{
  main_df<- read_csv(df_address)
  main_df$percent <- round(main_df$percent,4)
  cols <- c("#ff6361","#6aaa96","#0088cc","#ffa600","#bc5090")
  
  hchart(main_df,"pie",hcaes(name=type,y=percent),name = "Population Distribution:") %>%
    hc_colors(cols) %>% hc_exporting(enabled = TRUE)%>%
    hc_subtitle(text="Population distribution of Nepal on Basis of adminstrative region")
}