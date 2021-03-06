# Name: Jonathan Schaeffer
# Date: 10/12/18

# Run the below only if the library is not already installed.
# install.packages("dslabs")

library(dslabs)
library(dplyr)
library(tidyverse)

#Question 1.
dat <- filter(us_contagious_diseases, disease == "Measles", state != "Alaska", state != "Hawaii") %>% mutate(rate = count * 100000 / population * weeks_reporting / 52)
#Question 2.
ggplot(data = filter(dat, state == "California")) + geom_smooth(mapping = aes(x = year, y = rate)) + geom_vline(xintercept = 1965)
#All that needs added is the geom_vline function, the function takes in an x-intercept and you get decide where the intercept is.
#Question 3.
dat_caliFocus <- filter(us_contagious_diseases, state == "California")
dat_caliFocus$yearBlock[between(dat_caliFocus$year, 1950, 1959)] <- "1950's"
dat_caliFocus$yearBlock[between(dat_caliFocus$year, 1960, 1969)] <- "1960's"
dat_caliFocus$yearBlock[between(dat_caliFocus$year, 1970, 1979)] <- "1970's"
ggplot(data = dat_caliFocus ) + geom_bar(mapping = aes(x = state, y = count, fill = yearBlock), position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=-0.01)) #Without square root
ggplot(data = dat_caliFocus ) + geom_bar(mapping = aes(x = state, y = sqrt(count), fill = yearBlock), position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=-0.01))
#The given code was a little off. To actually mark all the dates between the 1950's you need to use the "Between" function. Otherwise
#you only mark the year 1950 with the "1950's tag". The same is relevant for the 1960's and 1970's.
#Question 4.
dat_allStates <- us_contagious_diseases
dat_allStates$yearBlock[between(dat_allStates$year, 1950, 1959)] <- "1950's"
dat_allStates$yearBlock[between(dat_allStates$year, 1960, 1969)] <- "1960's"
dat_allStates$yearBlock[between(dat_allStates$year, 1970, 1979)] <- "1970's"
ggplot(data = dat_allStates ) + geom_bar(mapping = aes(x = yearBlock, y = count, fill = state), position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=-0.01))
#So, all I had to do here was make a new dataset which included all the states and use the same function calls as before.
#Question 5.
ggplot(data = dat_allStates ) + geom_bar(mapping = aes(x = yearBlock, y = count, fill = state), position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=-0.01))
#The graph I used already had coloring, so here it is again!
#Question 6.
yearlyAutism <- read.table(file.choose(), sep = ",", header = TRUE) #Choose the yearlyAutism.csv file. I did it this way incase your working directory was different.
ggplot(data = yearlyAutism) + geom_bar(mapping = aes(x = Year, y = End.Population), stat = "identity")

#Looking at the graph, we can see a steady rise in Autism cases starting around the year 1986, but it's hard to draw a correlation
#because if you view the provided graphs in the repo you will note that the data we have for the vaccine increase/disease decrease
#ends in the 1970's. And the data I have for Yearly Autism cases starts in 1985. Also, the graph we have shows the decrease in disease
#NOT an increase in vaccines. So, you can't for sure deduce that more vaccines cause Autism. 

##Also, I got my information from this PDF https://www.dds.ca.gov/Autism/docs/AutismReport_2007.pdf





