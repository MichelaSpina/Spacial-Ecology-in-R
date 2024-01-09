#Final script incuding all the script during lecture
#SUMMARY
#01 BEGINNING
#02.1 DENSITY POPULATION
#02.2 DENSITY DISTRIBUTION
#0.3.1  COMMUNITIES MULTIVARIATE ANALYSIS




# 01 Beginning
#INTRODUCTION TO R
# Here under hasghtag you can write anything you wwant and the software will not report it. it's a comment you can put. 
# let's use R as calculator
2 + 3

# Assign to an object 
zima <- 2 + 3
zima


duccio <- 5 + 3 
duccio



final <- duccio + zima
final
final^2 # results multiply for itself

# array a series of info coded together
sophi <- c(10, 20, 30, 50, 70) # microplasics
#the function in R has parentesis and the symbols inside the parentesis are called arguments

paula <- c(100, 500, 600, 1000, 2000) #people
#paula as indipendent value
#we concatenate with c

plot(paula, sophi)

plot(paula, sophi, xlab= "number of people", ylab= "microplastics")
#there is another manner to do that, i can assign the object sophi an paula to new object
people <- paula
microplastics <- sophi

plot(people, microplastics)

#we want to use another point symbol
plot(people, microplastics, pch=19)
https://www.google.com/search?q=point+symbols+in+r&oq=point+symbols+in+r&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIHCAEQIRigATIHCAIQIRigATIHCAMQIRigATIHCAQQIRigATIKCAUQIRgWGB0YHjIKCAYQIRgWGB0YHjIKCAcQIRgWGB0YHjIKCAgQIRgWGB0YHjIKCAkQIRgWGB0YHtIBCTUwOTlqMGoxNagCALACAA&sourceid=chrome&ie=UTF-8#vhid=J2JAWpPtTvK7JM&vssid=l

plot(people, microplastics, pch=19, cex=5)
plot(people, microplastics, pch=19, cex=5, col= "blue")

#next lesson exemple how the amount of zinc can be related to the amount of another element in the soil

# you can add package in R for example CRAN vedi meglio

'/tmp/RtmpcxM85y/downloaded_packages'

#-----------------------------------------------------

#02 Density population
# 0.3 population ecology 10/10/23
#we are going to deal with density and dispersion
## density = individuals per unit area
## first package is spatstat, we introdue it in R with quotes
library(spatstat)
#the dataset is called bei, composed by huge amount of data.
plot(bei) 
##we can creat a density map
#let's bild the density map, from the point to a density map
#there's a function in spatstat, passing from point to a continuous surface

#the function is called density. we want to assing the function to an object
densitymap <- density(bei)
#i change from points to pixel. pixel are representing the landscape and what compose the image
#if we use the plot function it will simply erase the previous map
#the funtion which s adding and not erasing the previous map is called points
points(bei, cex=.2)
#the maps are overlapped
#avoid maps with blue green and red since daltonic peolple cannot see the difference
#so let's change the color using one function
use quots when you write colors
cl <- colorRampPalette(c("black", "red", "orange", "yelow"))(100)
#otuside of the functions we are using gradient 100 are the number of diferent coors pasing from black to orange to reed to yellow
#now we can plot the density map
plot(densitymap, col=cl)

#EXERCISE
#To built a new color palette
cl.ex <- colorRampPalette(c("beige", "aquamarine3", "blueviolet", "darkorange"))(100)
plot(densitymap, col=cl.ex)

#there were additional data inside the spatstat package ex: 
plot(bei.extra)
#we now have density map and additional value 
#we have to variant, one is the elevation the other one is gradiant
#we want to select the first element
elev <- bei.extra[[1]]
#two quadratic parentesis since we are using image
plot(elev)
#so we use the forst variable which is the elevation

#the symbol $ 
#bei.extra$lev is another manner to select one, in this way we link the variable


##what we learnt : how to pass from point to cotinuous map, how to use color, how to plot different things together

#multiframe is the totality of the map
#we're going to state that raw=1,2 (one rope two color). 


##let's make a multiframe
par(mfrow=c(1,2))
plot(densitymap)
plot(elev)
#what i did was opening mfrow 1.2 and than plot inside the densitymap and the elevation

#if we do one colon and two rows
par(mfrow=c(2,1))
plot(densitymap)
plot(elev)


#exercise
par(mfrow=c(1,3))
plot(bei)
plot(densitymap)
plot(elev)


#first point, second density, third elevation
#the higher elevation of area corrispond to the less density o tree as we can see from the map
#bye <3
#next lecture deal with population with package called "sdm", install plantnet into your phone

#----------------------------------------------------------------------------

#02.2 Population Distribution

## install.packages("terra", "sdm")
#Terra is doing everything dealing with spatial in R 
#we're going to use some function of terra packages

## sdm = species distribution model
library (sdm) #species distribution modeling
library (terra) ##not using quotes because we use packages that are installed thus we dont need quotes

#use data provided by the package 
system.file #general function that is going to catch a name of file in R system
#inside the package there is a folder and inside the folder "external" there's a file called species.shp

system.file("external/species.shp", package="sdm")
file <- system.file("external/species.shp", package="sdm")
## vectors are series of coordinations. we're dealing with point in spaces thus with vectors.
##there's a function in terra to pass from the name to the vector
#example
rana <- vect(file)
# you can see the structure of the file
rana$Occurrence

#the 0 can be a probem because is an uncertain data. but let's take the zero as a real absence

##how to see the data
plot(rana)
plot(rana, cex=0.5) 

##we want to select only presence from our data set
#double equal means equal
## quadratic parentesis is used to select elements
# 

pres <- (rana[rana$Occurrence == 1,])
pres
#0 is absence, 1 is presence
#exercise: select absence and call them abse

abse$Occurrence
abse <- (rana[ranaOccurrence == 0,])
 #the coma close the query
plot(abse)

#use par to see the two graphics in one row and two colons

#exercise plot presences and absences one beside the other

par(mfrow=c(1,2))
plot(pres)
plot(abse)

#everytime you have graph nulling use dev.off

#exercise: plot abse and pres together with two different colors
plot(pres, col="red")
plot(abse, col="black")

#predictors: environmental variables
#elevation is the name of the file we import

elev <- system.file("external/elevation.asc", package="sdm")

#rasters are images
plot(elev)

points(pres)

elevmap <- rast(elev)
#rast is a function from terra package

elevmap
plot(elevmap)
points(pres, cex=.5)
#most individuals are distributed in the middle elevation

#we can do the same with temperature
#asc is like jpag
temp <- system.file("external/temperature.asc", package="sdm")
temp
tempmap <- rast(temp)
plot(tempmap)


points(pres, cex=.5)
#places with very low temperature which we dont find rana temporaria

 #exercise do the same with vegetation with vegetation.asc
vege <- system.file("external/vegetation.asc", package="sdm")
vege
vegemap <- rast(vege)
plot(vegemap)
points(pres, cex=.5)
#rast function import as a raster (image)
#high vegetation cover is preferred as habit for rana temporaria

 #same with precipitation
 precip <- system.file("external/precipitation.asc", package="sdm")
precip
precipmap <- rast(precip)
plot(precipmap)
points(pres, cex=.5)

#final multiframe
par(mfrow=c(2,2))

#elev
plot <- (elevmap)
points(pres, cex=.5)
#temp
plot(tempmap)
points(pres, cex=.5)

#vege
plot(vegemap)
points(pres, cex=.5)

#precip
plot(precipmap)
points(pres, cex=.5)

#how to use raster data, 
#how to put points on raster data, 
#multiframe and how to explain distribution of the population based on predictors

#------------------------------------------------------------------------

#0.3.1 Community multivariet analysis


## multivariate analysis
#vegan: vegetation analysis but can be applied also to animals
#vegan package from Pierre Legendre , is a community ecology package
#oridation methods is synonimous of mutivariate analysis

#let's work in R with this package
#the dataset is called "dune" : data()

data(dune)
dune #we have the all data in the console
#a matrix of several plots where in the colons we have all the species and several rows with the number of that species
#another manner is concern with function that is called "head" that is going to show the first six rows
head(dune)
#there's the function "tail" with which you can see the end of the matrix


##
#function decorana in the vegan package (detreded corresponence analysis) 
#assig a name
#function: detrended correspondence analysis
ord <- decorana(dune)
#we can have summary of what happened
ord
#we have lot of numb and data. see the first two axis 
#if we make a sum of al axis we can see the percentage of all the axis each

ldc1 = 3.7004
ldc2 = 3.1166
ldc3 = 1.30055
ldc4 =  1.47888
total = ldc1 + ldc2 + ldc3 + ldc4

#we wanna know the percentage of the rain
pldc1 = ldc1 * 100 / total
pldc2 = ldc2 * 100 / total
plcd3 = ldc3 * 100 / total
pldc4 = ldc4 * 100 / total

pldc1 + pldc2

#final plot
plot (ord)
#the names are the species thus we can see that there are species which love to stay each other
#show the data in a graph help us to understand the correlation between species 
#in graph we can see just two dimension

#species are also related in time
#some of the time is overlapping
#how much different species are overlapping ach other? 
#so we can undertand better how to monitoring and conservate this species

#now we are going to use another package that is overlap
install.packages("overlap")
#new file is coming

#---------------------------------------------------------------------------

