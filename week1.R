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

data("arbuthnot") # load some data
head(arbuthnot)
str(arbuthnot)

dim(arbuthnot) # 82 rows and 3 columns 
names(arbuthnot)

# pivot! #
library(pivottabler)
pt <- PivotTable$new()
pt$addData(arbuthnot)
pt$addRowDataGroups("year")
pt$renderPivot()
pt$defineCalculation(calculationName="year", summariseExpression="n()")
pt$renderPivot()

str(arbuthnot$year)

# What command would you use to extract just the counts of girls born?
arbuthnot$girls

ggplot(arbuthnot) +
  geom_point(aes(x= year, y=girls))

# calculation 
arbuthnot$boys + arbuthnot$girls

# adding a new variable to df
arbuthnot <- arbuthnot %>%
  mutate(total = boys + girls)

str(arbuthnot)

ggplot(arbuthnot, aes(x=year, y = total)) +
  geom_line() +
  geom_point()

arbuthnot <- arbuthnot %>%
  mutate(more_boys = boys - girls)

data(present)
head(present)
range(present$year)
