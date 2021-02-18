install.packages("devtools")
library(devtools)

install.packages("dplyr")
install.packages("ggplot2")
install.packages("shiny")
install_github("StatsWithR/statsr")

# lab 1 #

library(dplyr)
library(ggplot2)
library(statsr)

data("arbuthnot")
head(arbuthnot)
str(arbuthnot)
