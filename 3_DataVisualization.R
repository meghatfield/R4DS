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

#3.3 Aesthetic Mappings
#Map the class of the vehicles to colors on the plot above
ggplot(data=mpg) +
  geom_point(mapping=aes(x=displ, y=hwy, color=class))

#Map the class of the vehicles to the size aesthetic
ggplot(data=mpg) +
  geom_point(mapping=aes(x=displ, y=hwy, size=class))

#Map the class of the vehicles to the alpha aesthetic
ggplot(data=mpg) +
  geom_point(mapping=aes(x=displ, y=hwy, alpha=class))

#Map the class of the vehicles to the shape aesthetic
ggplot(data=mpg) +
  geom_point(mapping=aes(x=displ, y=hwy, shape=class))
#*This can only use 6 shapes at a time

#Set the aesthetic of the graph manually to blue
ggplot(data=mpg) +
  geom_point(mapping=aes(x=displ, y=hwy), color="blue")

#3.3.1 Exercises
#Q1. What’s gone wrong with this code? Why are the points not blue?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))
#A1. This is telling R that there is a variable called 'color' which has the value of 'blue'
#The aesthetic should be on the right side of the aes() statement parentheses to make the points blue

#Q2. Which variables in mpg are categorical? 
#Which variables are continuous? (Hint: type ?mpg to read the documentation for the dataset). 
#How can you see this information when you run mpg?
?mpg
mpg
#A2. Categorical variables are manufacturer, model, trans, drv, fl, and class
#Continuous variables are displ, year, cyl, cty, hwy
#Categorical variables will say 'chr', while continuous variables will say 'int' or 'dbl'

#Q3. Map a continuous variable to color, size, and shape. 
#How do these aesthetics behave differently for categorical vs. continuous variables?
ggplot(data=mpg) +
  geom_point(aes(x = displ, y = hwy, color=cty))
#A3. For continuous variables, a grandient color scheme is created

#Q4. What happens if you map the same variable to multiple aesthetics?
ggplot(data=mpg) +
  geom_point(aes(x = displ, y = hwy, color=displ, alpha=displ))
#A4. Two different legends are created

#Q5. What does the stroke aesthetic do? What shapes does it work with? (Hint: use ?geom_point)
ggplot(data=mpg) +
  geom_point(aes(x = displ, y = hwy), shape=21, stroke=1)
?geom_point
#A5. The stroke aesthetic modifies the width of the border. It works only for shapes with a border

#Q6. What happens if you map an aesthetic to something other than a variable name, 
#like aes(colour = displ < 5)? Note, you’ll also need to specify x and y.
ggplot(data=mpg) +
  geom_point(aes(x = displ, y = hwy,color=displ<5))
#A6. ggplot creates a boolean for whether or not those points have the characteristic 
#specified in the color aesthetic

#3.5 Facets
#To facet plot by single variable (categorical) use facet wrap
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
#To facet on combination of two vars, use facet grid
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(.~ cyl)
