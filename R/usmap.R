#specify the packages of interest
packages = c("gtrendsR","tidyverse","usmap")

#use this function to check if each package is on the local machine
#if a package is installed, it will be loaded
#if any are not, the missing package(s) will be installed and loaded
package.check <- lapply(packages, FUN = function(x) {
    if (!require(x, character.only = TRUE)) {
        install.packages(x, dependencies = TRUE)
        library(x, character.only = TRUE)
    }
})




orange <- "#C9592E"

thanksgiving <- gtrends("Football",geo = "US", time = "now 1-d")

thanksgivingStates <- thanksgiving$interest_by_region
thanksgivingStates$fips <-fips(thanksgivingStates$location)


plot_usmap(data = thanksgivingStates, values = "hits",  color = orange, labels=FALSE) + 
    scale_fill_continuous( low = "white", high = orange, 
                           name = "Popularity", label = scales::comma
    ) + 
    theme(legend.position = "right") + 
    theme(panel.background = element_rect(colour = "black")) + 
    labs(title = "Popularity of Thanksgiving Google Search by State", caption = "Source: @littlemissdata")


#PLOT “THANKSGIVING” INTEREST FOR SELECT STATES
plot_usmap(data = thanksgivingStates, values = "hits", include =  c(.south_atlantic, .mid_atlantic, .new_england ), color = orange, labels=TRUE) + 
    scale_fill_continuous( low = "white", high = orange, 
                           name = "Popularity", label = scales::comma
    ) + 
    theme(legend.position = "right") + 
    theme(panel.background = element_rect(colour = "black")) + 
    labs(title = "US East Coast Popularity of Thanksgiving Google Search", caption = "Source: @littlemissdata")






plot_usmap(regions = "states") + 
  labs(title = "US States",
subtitle = "This is a blank map of the states of the United States.") + 
  theme(panel.background = element_rect(color = "black", fill = "lightblue"))

plot_usmap()

plot_usmap(regions = "counties")

plot_usmap(include = c("AR", "IL", "IA", "KS", "MO", "NE", "ND", "OK", "SD")) +
  labs(title = "MidAmerica GIS Consortium ")

plot_usmap(data = statepop, values = "pop_2015")

plot_usmap(data = statepop, values = "pop_2015", labels = TRUE)

plot_usmap(data = statepop, values = "pop_2015", labels = TRUE, label_color = "white")

