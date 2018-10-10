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
#Question 3.
dat_caliFocus <- filter(us_contagious_diseases, state == "California")
dat_caliFocus$yearBlock[between(dat_caliFocus$year, 1950, 1959)] <- "1950's"
dat_caliFocus$yearBlock[between(dat_caliFocus$year, 1960, 1969)] <- "1960's"
dat_caliFocus$yearBlock[between(dat_caliFocus$year, 1970, 1979)] <- "1970's"
ggplot(data = dat_caliFocus ) + geom_bar(mapping = aes(x = state, y = count, fill = yearBlock), position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=-0.01)) #Without square root
ggplot(data = dat_caliFocus ) + geom_bar(mapping = aes(x = state, y = sqrt(count), fill = yearBlock), position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=-0.01))
#Question 4.

#Question 5.

#Question 6.





