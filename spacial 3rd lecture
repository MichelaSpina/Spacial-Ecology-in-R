# code related to population ecology

# using a package today, sp is quet ancian program so let's istall spatstat!!
# a package is eeded for point pattern analysis
# evertime we exit R to install some package in CRAN (network). the function to istall packages is calle install.packages
# arguments of functions are always inside the parentesis, siamo fuori R quindi usiamo le virgolette per proteggere la funzione
install.packages ("spatstat")

#we installed the package iside R
library(spatstat)

# in the different datasets theres one related to the tropical forests. Let's import data which are already inside this package. let's learn first how to treat data and dataset.
#let's use the bei data:
#data description:
# https://CRAN.R-project.org/package=spatstat   (standard to save package

#let's use the plot function -> plotting the data
plot(bei)

#changing dimension - cex
plot(bei, cex=.5)

plot (bei, cex=.2)

#change the symbol - pch
plot (bei, cex=.2, pch=19)

#inside this package there's dataset called bei.extra
#additional dataset
bei.extra

#we have elevation and graduation
#how to select only one parameter

#see together
plot(bei.extra)

# raster fire maps with imagine. one "elev" one "grad" and we need to use just one element of the dataset which is elevation. 
# how can we do it?? in two different manners
#the first one is to use symbols that links one part f the data to the dataset
# bei.extra$elev
# $ is a linking symbol.
plot(bei.extra$elev)
#now we can assing "plotblabla" to an object
elevation <- plot(bei.extra$elev)
plot(elevation)

#another manner is much simple, it's useing the sqare parentesis
#we are in two dimension so we use doble parentesi quadrata
#bei.extra[[1]] since we are with imagines 
elevation2 <- bei.extra[[1]]
plot(elevation2)

#next lesson is taking the elevation, building a map and make some relationship with density.
# 
#install another package which is called vegan for the next lecture
