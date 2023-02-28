library(robotstxt)
library(dplyr)
library(rvest)
url <- "https://www.icc-cricket.com/rankings/mens/player-rankings/t20i/bowling"
path = paths_allowed(url)
#html from website
web = read_html(url)
View(web)

Name <- web %>% html_nodes(".name a")%>% html_text()
View(Name)

Team <- web %>%html_nodes(".table-body__logo-text") %>% html_text()
View(Team)

Rating<- web%>%html_nodes(".rating") %>% html_text()
View(Rating)

#creating dataframe
Test_Ranking <- data.frame(Name,Team,Rating)
View(Test_Ranking)
#save
write.csv(Test_Ranking,"Test_Ranking.csv")