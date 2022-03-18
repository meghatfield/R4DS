#3.1 install packages
library(tidyverse)

#3.2.1 Load data
mpg<-ggplot2::mpg

#3.2.2 Create plot of displ by hwy
#displ=car's engine size in litres
#hwy=car's fuel efficiency on the highway in miles per gallon

ggplot(data=mpg) +
  geom_point(mapping=aes(x=displ, y=hwy))
#There is a negative relationship between displ and hwy

#3.2.4 Exercises
#Q1. Run ggplot(data = mpg). What do you see?
ggplot(data=mpg)
#A1. Does not produce any graph

#Q2. How many rows are in mpg? How many columns?
structure(mpg)
#A2. There are 234 rows and 11 columns

#Q3. What does the drv variable describe? Read the help for ?mpg to find out.
?mpg
#A3. the type of drive train, where f = front-wheel drive, r = rear wheel drive, 4 = 4wd

#Q4. Make a scatterplot of hwy vs cyl.
ggplot(data=mpg) +
  geom_point(mapping=aes(x=hwy, y=cyl))

#Q5. What happens if you make a scatterplot of class vs drv? Why is the plot not useful?
ggplot(data=mpg) +
  geom_point(mapping=aes(x=class, y=drv))
#A4. Both of these variables are categorical, so a scatterplot will not be best here.

