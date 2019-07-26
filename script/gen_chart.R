### Gender BarChart module

### required Library
source('script/package.R')

create_gen_chart <- function(df_address)
  {
  
  main_df <- read_csv(df_address)
  gender_df <- main_df %>% gather(key = "gender",value = "population","male","female")
  gender_df <- arrange(gender_df,population)
  cols <- brewer.pal(n = 2, name = "Set1")
  hchart(gender_df, "column", hcaes(x = state, y = population, group = gender)) %>% 
    hc_colors(cols)%>% 
    hc_exporting(enabled = TRUE)

  }

