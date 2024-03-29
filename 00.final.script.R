#Final script incuding all the script during lecture
#SUMMARY
#01 BEGINNING
#02.1 DENSITY POPULATION
#02.2 DENSITY DISTRIBUTION
#03.1  COMMUNITY MULTIVARIATE ANALYSIS
#03.2 COMMUNITY OVERLAP
#04 REMOTE SENSING DATA
#05 SPECTRAL INDICIES
#06 TIME SERIES
#07 EXTERNAL DATA CODE
#08 COPERNICUS DATA
#09 CLASSIFICATION
#10 VARIABILITY
#11 PRINCIPAL COMPONENT ANALYSIS

#---------------------------------

# 01 Beginning
#INTRODUCTION TO R
# Here under hasghtag you can write anything you wwant and the software will not detect it. it's just a comment you can put. 
# let's use R as calculator
2 + 3

# Assign a value to an object thus we rename the object
# we created a variable with an assigned value
zima <- 2 + 3
zima


duccio <- 5 + 3 
duccio


#we rename the final operation
final <- duccio + zima
final

final^2 # results multiply for itself

# array a series of info coded all together
#we concatenate all the data by using "c" Function
sophi <- c(10, 20, 30, 50, 70) # grams of microplasics in different spots of a lake
#the function in R has parentesis and the symbols inside the parentesis are called ARGUMENTS

paula <- c(100, 500, 600, 1000, 2000) 
#different amount of people in that spots as second variable


#LET'S CREATE A PLOT between the two variable
#thus we can observe the correlation between the two variable
plot(paula, sophi)
plot


#if i want to modify the plotting labels, i have to assign new name
#use xlab for the x axis and ylab for the y one
plot(paula, sophi, xlab= "number of people", ylab= "microplastics")
#there is another manner to do that, i can assign the object sophi an paula to new object
people <- paula
microplastics <- sophi

plot(people, microplastics)
 
#we want to use another point symbol in the plot using "pch"
#to know which one we want to use we google point symbols in R"
plot(people, microplastics, pch=19)
https://www.google.com/search?q=point+symbols+in+r&oq=point+symbols+in+r&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIHCAEQIRigATIHCAIQIRigATIHCAMQIRigATIHCAQQIRigATIKCAUQIRgWGB0YHjIKCAYQIRgWGB0YHjIKCAcQIRgWGB0YHjIKCAgQIRgWGB0YHjIKCAkQIRgWGB0YHtIBCTUwOTlqMGoxNagCALACAA&sourceid=chrome&ie=UTF-8#vhid=J2JAWpPtTvK7JM&vssid=l

#let's change the SIZE OF THE PLOT POINTS
plot(people, microplastics, pch=19, cex=5)
#with argument "col" we can also change points' color
plot(people, microplastics, pch=19, cex=5, col= "blue")


#download packages here
'/tmp/RtmpcxM85y/downloaded_packages'
#HOW TO INSTAL PACKAGES IN R:
#"install.packages("nakìme of the package")
#we quote the name since we are importing external data in R

#-----------------------------------------------------
 
#02 Density population
#Codes related to population ecology

#we are going to deal with density and dispersion
## density = individuals per unit area
## first package is spatstat, we download it thus we can point pattern analysis
install.packages("spatstat")
library(spatstat)
#the dataset inside spatstat is called bei, composed by huge amount of data.
plot(bei) 
#we can creat a density map

# HOW TO CHANGE THE DOTS SIZE AND STYLE?
# We use the "cex" and "pch" functions
plot(bei, cex=0.5, pch=19)


#let's bild the density map, from thousands of points
#there's a function in spatstat, which allows us to go from points to a continuous surface
#the function will consider a group of dots as a single unit
#each unit is going to be more or less dense according to the number of dots


#PASSING FROM POINTS TO CONTINUOUS SURFACE:
#the function  we use is called density. 
#let's rename the function
densitymap <- density(bei)
#Now on the console we don't have dots but pixels
#pixels are representing the landscape and what compose the image


#if we use the plot function it will simply erase the previous map
#the funtion which is adding the new map without erasing the previous one is called points
points(bei, cex=.2)
#now we just  put the points on the density map ("points" f.) 

#CHANGE COLORS
#avoid maps with blue green and red since daltonic peolple cannot see the difference
#so let's change the color using ColorRampPalette function
#and use quots when you write colors
cl <- colorRampPalette(c("black", "red", "orange", "yelow"))(100)
#otuside of the functionswe use (100) as gradient, indicating the number of diferent colors 
plot(densitymap, col=cl)

#EXERCISE
#how to buid a new color palette
cl.ex <- colorRampPalette(c("beige", "aquamarine3", "blueviolet", "darkorange"))(100)
plot(densitymap, col=cl.ex)



#there are ADDITIONAL VARIABLES inside the spatstat package 
#we now use "bei.extra" dataset 
plot(bei.extra)
#we now have density map and additional value 
#we have two variant, one is the elevation the other one is gradiant
#we want to select the first element
elev <- bei.extra[[1]]
#two quadratic parentesis since we are using image
plot(elev)
#so we use the first variable which is the elevation

#the symbol $ 
#bei.extra$lev is another manner to select one, in this way we link the variable

#what we learnt : how to pass from point to cotinuous map, how to use color, how to plot different things together


#PLOT SEVERAL THINGS TOGETHERE
#multiframe is the totality of the map
#use "par" as function and "multiframe" as argument
#we're going to state how many rows and coloumns. 

#let's make a multiframe
par(mfrow=c(1,2))
plot(densitymap)
plot(elev) #run the elements together
#what i did was opening mfrow 1.2 and than plot inside the densitymap and the elevation

#if we do one coloumn and two rows
par(mfrow=c(2,1))
plot(densitymap)
plot(elev) #run all the elemets togethere


#exercise
par(mfrow=c(1,3))
plot(bei)
plot(densitymap)
plot(elev)


#first point, second density, third elevation
#the higher elevation of area corrispond to the less density o tree as we can see from the map
#next lecture deal with population with package called "sdm", install plantnet into your phone

#----------------------------------------------------------------------------

#02.2 Population Distribution

## install.packages("terra", "sdm")
#Terra is doing everything dealing with spatial in R 
#we're going to use some function of terra packages

## sdm = species distribution model
library (sdm) #species distribution modeling
library (terra) ##not using quotes because we use packages that are installed thus we dont need quotes
#"library" function ensure us that the download completed successfully

#use data provided by the package 
system.file #general function that is going to catch a name of a file in R system
#inside the package there is a folder and inside the folder "external" there's a file called species.shp

system.file("external/species.shp", package="sdm") #use parentesis
file <- system.file("external/species.shp", package="sdm")
## vectors are series of coordinations. we're dealing with point in spaces thus with vectors.

#HOW TO USE VECTOR FILE
##there's a function in terra to pass from the name to the vector
#example
rana <- vect(file)
# you can see the structure of the file

##how to see the data in the environment
plot(rana)
plot(rana, cex=0.5) 

# HOW TO LINK TWO ELEMENTS TOGETHER?
# We use the $ symbol.
rana$Occurrence
# These codes are called PRESENCES and ABSENCES data
#0 means absence, 1 means presence
#the 0 can be a problem because is an uncertain data. but let's take the 0 as a real absence

##we want to select only presence from our data set
#double equal means equal
## quadratic parentesis is used to select elements
rana[rana$Occurrence == 1,]
# In this manner we selected all the points in the plot that are equal to 1.
#rename
pres <- (rana[rana$Occurrence == 1,])
pres

#exercise: select absence and call them abse


abse <- (rana[rana$Occurrence == 0,])
 #the coma close the query
abse$Occurrence
plot(abse, cex=2)

#"PAR" TO PLOT TOGETHERE
#see the two graphs in one row and two colons
#exercise plot presences and absences one beside the other

par(mfrow=c(1,2))
plot(pres, cex=1)
plot(abse, cex=1)

#everytime you need graph nulling use dev.off

#exercise: plot abse and pres together with two different colors
cl.pres <- colorRampPalette(c("yellow", "coral", "brown"))(3)
cl.pres
 
cl.abse <- colorRampPalette(c("blue", "aquamarine","navy", "lightgreen"))(4)
#we use "col" inside function "par" to change the coors of the two plots
#then we plot abs and pres together usig "plot" and "points"

plot(pres, cex=1, col= cl.pres)
points(abs, cex=1, col=cl.abse)

#with just two colors
plot(pres, cex=1, col="darkgreen")
points(abse, cex=1, col="lightgreen")

#UNDESTRAND THE GAPS IN SOME AREAS
# There are some variables to explain and understand why, in these specific areas, the frog is not present.
#predictors: environmental variables

# HOW TO IMPORT AN IMAGE AS A FILE FROM OUTSIDE R?
#using system.files function and selecting a file inside the folder 
#elevation is the name of the file we import

elev <- system.file("external/elevation.asc", package="sdm")
#asc is a type of file like jpag
#we call it elev

#we are going to use a function: rast
#rasters are images, since we are dealing with images we dont use vect like before with points


elevmap <- rast(elev)
#rast is a function from terra package
elevmap

plot(elevmap)
#now we put on the elevation the points of the presence
points(pres, cex=.5)
#we obtained a map in which individuals are distributed more in an area than another

#we can do the same with temperature

temp <- system.file("external/temperature.asc", package="sdm")
temp
tempmap <- rast(temp)
plot(tempmap)


points(pres, cex=.5)
#places with very low temperature which we dont find rana temporaria

 #exercise: do the same with vegetation with vegetation.asc
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

#final multiframe: plot everything together
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

#lesson: 
#how to use raster data, 
#how to put points on raster data, 
#multiframe and how to explain distribution of the population based on predictors

#------------------------------------------------------------------------

#0.3.1 Community multivariet analysis


## multivariate analysis
#vegan: vegetation analysis, but can be applied also to animals
#vegan package from Pierre Legendre , is a community ecology package
#Oridation methods is synonimous of mutivariate analysis
# Overlap package is perfect to see how species are interacting during time.
#the dataset is called "dune" : data()
install.packages("overlap")
library(overlap) 
install.packages("vegan")
library(vegan)

data(dune)
dune #we have the all data in the console
#a matrix of several plots where in the colons we have all the species and several rows with the number of that species
#if we use the function "head", that is going to show us just the first six rows
head(dune)
#with the function "tail" you can see the end of the matrix


#function decorana in the vegan package (detreded corresponence analysis) 
#name it
ord <- decorana(dune)
#we can have summary of what happened
ord
#we have lot of number and data. See the first two axis 
#if we make a sum of all axis we can see the percentage of all the axis each

#axes lenght
ldc1 = 3.7004
ldc2 = 3.1166
ldc3 = 1.30055
ldc4 =  1.47888
#calcuate the total
total = ldc1 + ldc2 + ldc3 + ldc4

#now the percentage
pldc1 = ldc1 * 100 / total
pldc2 = ldc2 * 100 / total
plcd3 = ldc3 * 100 / total
pldc4 = ldc4 * 100 / total

#we stay focus just on the first two variables 
#cumulative percentage
pldc1 + pldc2 
#71% of the whole vaiability

#final plot
plot (ord)
#the names are the species thus we can see that there are species which love to stay each other
#show the data in a graph help us to understand the correlation between species 
#in graph we can see just two dimension
# The multivariate space is defined by two axes, DCA1 and DCA2
#species are also related in time
#some of the time is overlapping
#how much different species are overlapping each other? 
#so we can understand better how to monitoring and conservate this species

#next lesson we are going to use another package that is overlap
install.packages("overlap")
#new file is coming

#---------------------------------------------------------------------------
#03.2 COMMUNITY OVERLAP
#overlap in space and time


#we're going to build a graph
#in time we should use kernel density (amount of times we've seen that species)
#kerinici seblat national park in Indonesia
#inside library overlap thre is kerinci with different species and time 
#e.i. a specie which lives a lot during the night nor the day

#data
data(kerinci)
head(kerinci) #and we can see the first six variable in zone, space and time
#the first six lines are related to the tiger

#summary
summary(kerinci)
#we have the count of the different individuals seen by the cameratraps

#moves of an animal in a day
#tiger
#we will use a language called Sps, using the [] which will collect info inside the data set
#the dollar is linking
tiger <- kerinci[kerinci$Sps=="tiger",]
tiger #now i only have tiger in my dataset

#one important step: the time we are using is linear but this package is working in circular time
#we should pass from line to radiant (circular time)
kerinci$time * 2 * pi

timeRad <- kerinci$time * 2 * pi

#HOW TO ASSIGN A CALCULATION TO A NEW OBJECT WHICH IS INSIDE THE DATA SET?
#"Timerad" is the function and it will be the name of the new coloums
#This will measure time in radiants
kerinci$TimeRad <- kerinci$Time * 2 * pi
tiger <- kerinci[kerinci$Sps=="tiger",]
tiger

timetig <- tiger$Timerad

#we can make plot to see what are the peaks in time to see the tiger
plot(tiger$timeRad)
timetig <- tiger$timeRad
densityPlot(timetig, rug=TRUE)



#let's do it with another species
#exercise: select only, the data on the macaque individuals
summary(kerinci)
macaque <- kerinci[kerinci$Sps=="macaque",]
macaque
head(macaque)

#now we will make a time variable with macaque
timemac <- macaque$Timerad
plot(macaque$Timerad)
par(mfrow=c(1,2))
densityPlot(timetig, rug=TRUE)
densityPlot(timemac, rug=TRUE)

#take data from tiger and macaque and see together
#to see when they will be at the same time in the same place
overlapPlot(timetig, timemac)

#-----------------------------------------------------
#monitor changes within communities with a tool which is called:

#0.4 Remote Sensing Data
# RSdata

install.packages("devtools") # from CRAN (network with packages for R)
library(devtools) 
#Devtools is used to install packages directly from other repository, such as github
# github is also a packages comprehensory,
# install the imageRy package from GitHub
install_github("ducciorocchini/imageRy")  # from devtools
#with imagery we have another manner to install pacakges which are in github but not in CRAN
#devtools is the package we need to have the possibility of installing packages from gitHiub
#install_github(name of the github account and name of the package)
devtools::install_github("ducciorocchini/imageRy", force=TRUE) #we install it from github, through devtools
library(imageRy)

install.packages("terra")
library(terra)

# list the data, im is the prefix for each function
im.list()
#

b2 <- im.import("sentinel.dolomites.b2.tif") 
b2

# Overlapping= translation of a reference system in front of another.
# HOW TO OVERLAP TWO ELEMENTS?
# By using a six parameters transformation= translation in x,y,z and rotation in x,y,z.

#let's change color of the b2
cl2 <- colorRampPalette(c("black", "grey", "white")) (100)
plot(b2, col=cl2)
# The more the blue is reflected, the closer to the minimum value (black) 2000 we are

#Exercise
# import the green band from Sentinel-2 (band 3)
b3 <- im.import("sentinel.dolomites.b3.tif") 
cl3 <- colorRampPalette(c("black", "grey", "white")) (100)
plot(b3, col=cl3)

# import the red band from Sentinel-2 (band 4)
b4 <- im.import("sentinel.dolomites.b4.tif") 
cl4 <- colorRampPalette(c("black", "grey", "white")) (100)
plot(b4, col=cl4)


# import the NIR band from Sentinel-2 (band 8)
b8 <- im.import("sentinel.dolomites.b8.tif") 
cl8 <- colorRampPalette(c("black", "grey", "white")) (100)
plot(b8, col=cl8)

#we plotted all the layers

library(imageRy)


b2 <- im.import("sentinel.dolomites.b2.tif") 
b3 <- im.import("sentinel.dolomites.b3.tif") 
b4 <- im.import("sentinel.dolomites.b4.tif") 
b8 <- im.import("sentinel.dolomites.b8.tif") 

# HOW TO STACK LAYERS OF IMAGE ALL TOGETHER INSIDE THE SAME OBJECT?  
# We simply create a concatenation between our objects of interest and we name it
stack_sent <- c(b2,b3,b4,b8)
stack_sent

dev.off()
#plot the new project 
plot(stack_sent)


# HOW TO PLOT ONLY ONE LAYER OF OUR STACK?
# We use the function: (name.of.our.object [[number of the lyrs of interest]], col= )
#(name.of.our.object [[number of the layers of interest]], col= )
plot(stack_sent[[4]], col=cl2)

#plot in multiframe 
par(mfrow=c(2,2))

cl2 <- colorRampPalette(c("darkblue", "cyan", "white")) (100)
plot(b2, col=cl2) 
cl3 <- colorRampPalette(c("darkgreen", "green", "white")) (100)
plot(b3, col=cl3)   
cl4 <- colorRampPalette(c("darkred", "red", "coral")) (100)
plot(b4, col=cl4) 
cl8 <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot(b8, col=cl8)


# HOW DO WE PLOT THE THREE LAYERS ONE ON THE TOP OF THE OTHERS?
# We use the function "im.plotRGB()", this allow R to create an image fully colored.
# RGB space, it stays for RedGreenBlue
im.plotRGB(stack_sent, 3, 2, 1)
im.plotRGB(stack_sent, 4, 3, 2)



pairs(stack_sent)
# correlation coefficient on the right (from 0 to 1)
#Pearson correlation coefficient
#hyper correlation of 0.99 and 1.00
#if you use the near infrared you can see that the correlation is still present but it is lower
#with values netween 0.70 and 0.75
#first and second band goes together
#frequency level of reflectance 
# WHAT IS REFLECTANCE?
# it is a ratio between reflected radiant flux (energy) and the incident radiant flux (energy)
# if the reflected energy is the same as the incident, you're reflecting all the possible energy
# if the reflectance energy is zero, it means you're absorbing all the reflecting energy

#--------------------------------------------------------
#05 Spectral indicies


#VEGETATION INDEX or DVI INDEX
#index of vegetation's health
#if plants are suffering, the index will increase, it decrease if they're not


library(imageRy)
library(terra)
install.packages("ggplot2")
library(ggplot2)
install.packages("viridis")
library(viridis)


#list 
im.list()
#information about description in repository imagery, go on ducciorocchini repository
#now we are going to use images from observatory of NASA (matogrosso)

im.import #we have the plot of the image
im.import("matogrosso_l5_1992219_lrg.jpg")
#assign 1992 to matogrosso
#processed image ##bands: 1=NIR, 2=RED, 3=GREE

#im.plotRGB()
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
im.plotRGB(m1992, r=1, g=2, b=3)
im.plotRGB(m1992, 1, 2, 3)
im.plotRGB(m1992, r=3, g=1, b=3)
im.plotRGB(m1992, r=2, g=3, b=1)

#import the recent image of deforestation from 2006
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")
#see how different pixel changes in time
im.plotRGB(m2006, r=2, g=3, b=1)


#build a multiframe (several plots all togethere in this case images 1992 and 2006)

par(mfrow= c(1,2))
im.plotRGB(m1992, r=2, g=3, b=1)
im.plotRGB(m2006, r=2, g=3, b=1)

#let's create vegetation indicies to visualize the health of that place

#digit the name the image and you have some infomation
plot(m1992[[1]])
plot(m2006[[1]])

dev.off()
#reflectance has a range from 0 to 250. reflectance is the ratio between incident flux and the reflected flux
#usually the ratio is the opposite but the result would have been decimal, thus we want to avoid decimal we rescale the ratio
#the code is binary. with 2bits we have 4 possible combination (information)
#what with thee bits?? 8 informations
#to know how possible informations we have we have to elevate 2 for the number of th bits.
#most image are store in 8 bits cause it decrease the rate of the image
# 2^8 is 256, so that's the reason why our eflectance range is 250. nasa use 8 bits.


# DVI
# different between the first and the second bands (between NIR and RED)
#bands 1=NIR 2=RED 3=GREEN

dvi1992 = m1992[[1]] - m1992[[2]]
plot(dvi1992)
#for each pixel the difference between NIR and RED
#green part is the healthy foest, all the rest is suffering forest 
cl <- colorRampPalette(c("darkblue", "yellow", "red", "black")) (100)
plot(dvi1992, col=cl)

#do the same for 2006
dvi2006 = m2006[[1]] - m2006[[2]]
plot(dvi2006)
cl <- colorRampPalette(c("darkblue", "yellow", "red", "black")) (100)
plot(dvi2006, col=cl) #forest is really suffering D:< 

#calculation of multitemporal dimension of fortest
#radiometric resolution: how many values you have in the range
#in 1992 image at 8 bits 
#imagine to have an image from 2006 with only 2 bits (2^2=4)
#calculation of dvi = the two images cannot be compared 
#STANDARDIZE THE DVI= NORMALIZATION
#normalize on top of the rang you have
#dvi: difference INFRARED and RED example: (230-10)/(230+10)=0.91 
# the range is from -1 to 1  NDVI (normalized)
#Nir=0 Red=255 we make (0-255)/(0+255) = -1
#dvi is rangengin depending on the bits we have, ndvi is always -1<ndvi<1

#let's calculate thje ndvi
ndvi1992 = (m1992[[1]] - m1992[[2]]) / (m1992[[1]] + m1992[[2]])
ndvi1992 = dvi1992 / (m1992[[1]] + m1992[[2]])
plot(ndvi1992, col=cl)
#in the im.ndvi NIR Band is the first, RED is the second
nvdi 2006:
ndvi2006 = (m2006[[1]] - m2006[[2]]) / (m2006[[1]] + m2006[[2]])
ndvi2006 = dvi2006 / (m2006[[1]] + m2006[[2]])
plot(ndvi2006, col=cl)



dev.off()
par(mfrow=c(1,2))
plot(ndvi1992, col=clvir)
plot(ndvi2006, col=clvir)


#speeding the calculation
ndvi2006a <- im.ndvi(m2006, 1, 2)
plot(ndvi2006a, col=cl)


#------------------------------------------------
#06 Time Series Data

#time series analysis
install.packages("terra")
library(terra)
install.packages
install.packages("devtools")
library(devtools)
devtools::install_github("ducciorocchini/imageRy", force=TRUE)
library(terra)

#We need to use the im-list function because we will import images
im.list()
#let's use the first one
# "EN_01.png"
im.import("EN_01.png")
EN01 <- im.import("EN_01.png")
EN13 <- im.import("EN_13.png")

#multiframe where we can put images in two rows and one colon
par(mfrow=c(2,1))
im.plotRGB.auto(EN01)
im.plotRGB.auto(EN13)

#useing the first element (band) of images
diff = EN01[[1]] - EN13[[1]]
#you can see the difference

dev.off()
plot(diff)

#palette
cldif <- colorRampPalette(c("blue", "white", "red")) (100)
plot(diff, col=cldif)
#differences between the two images, everything with the blue is highe in march, in jenuary is red
#This difference shows how, during COVID time, the NO concentration in atmosphere low down in all the European area 



#now see how T changes from 2000 to 2015 in Greenland with an example
im.list()
#data on T, what is the amount  of T in that area
#let's import images from Copernicus Global Land Service
im.import("greenland.2000.tif")
g2000 <- im.import("greenland.2000.tif")
clg <- colorRampPalette(c("blue", "white", "red")) (100)
plot(g2000, col=clg)
#temperature of the surface, huge amount of blu so low temperature

g2005 <- im.import("greenland.2005.tif")
g2010 <- im.import("greenland.2010.tif")
g2015 <- im.import("greenland.2015.tif")


clg <- colorRampPalette(c("black", "blue", "white", "red")) (100)
plot(g2005, col=clg)
par(mfrow=c(1,2))
plot(g2000, col=clg)
plot(g2015, col=clg)

dev.off()
##we can now concatenate them as a stack 
stackg <- c(g2000, g2005, g2010, g2015)
#plot the all stack
plot(stackg, col=clg)
#what we did is stack things all togeter and plot the stacks
#in 2003 was one of the worst for the temperature so we can see this huge amount of decrease

#exercise: make the differences between them (first and final)

g2000 <- im.import("greenland.2000.tif")
g2015 <- im.import("greenland.2015.tif")

#stack the images all together
stackg <- c(g2000, g2005, g2010, g2015)
#plot the all stack
plot(stackg, col=clg)

dev.off()

difg <- stackg[[1]] - stackg[[4]]
#difg <- g2000-g2015
plot(difg, col=cldif)


#high values in 
#final image = red means high T in the first moment, blue means high T is the final period
#exercise: make RGB plot in using different years
#with im.plotRGB
im.plotRGB(stackg, r=1, g=2, b=3)
clg <- colorRampPalette(c("black", "blue", "white", "red")) (100)
#in the middle the temperature in higher in the final period, 
#if that center is red means that T was higher in the first period since we put red the first period

#------------------------------------------------------------------------------

#07 External data code
#set the working directory

install.packages("terra")
library(terra)

#How can we download our own data and use it??

# https://earthobservatory.nasa.gov/ <- what we're going to use today, less heavy.
## https://www.youtube.com/watch?v=KA2L4bDmo98 <- follow the video and download data (frome esa, 10m resolution)

#We downloaded the image and put inside the folder:  https://eoimages.gsfc.nasa.gov/images/imagerecords/152000/152086/najafiraq_etm_2003140_lrg.jpg
#let's upload the image inside R

#working directory. set the working directory with the function setwd()
#explain to r what is te wd we're going to work with
#setwd()
# qith windows : setwd("C:// not \\
#directory in which you will put the data
setwd("C:/Users/Utente/OneDrive - Università di Napoli Federico II/Desktop/SPATIAL ECOLOGY")
#why Napoli federico II ?! XD
#function rast
#rast() the same thing as im.import, since the image is not in a package we use rast()
rast("najafiraq_etm_2003140_lrg.JPG")
naja <- rast("najafiraq_etm_2003140_lrg.JPG")
#We have to add .JPG to read it in windows

plotRGB(naja, r=1, g=2, b=3) #im-plotRGB #to show how to imput some data from outside


#exercise : download the second image
setwd("C:/Users/Utente/OneDrive - Università di Napoli Federico II/Desktop/SPATIAL ECOLOGY")
najaeug <- rast("najafiraq_oli_2023219_lrg.JPG")
plotRGB(najaeug, r=1, g=2, b=3) 

#multitemporal analysis change detection
#important: put it in the same folder
#et's make the difference between 2003 and 2023
najadif= naja[[1]] - najaeug[[1]]
cl <- colorRampPalette(c("brown", "grey", "orange")) (100)
plot(najadif, col=cl)

dev.off()

#exercise: downoad our own images and show the differences in time
Lakechad <- rast("lakechad_ms1_1973_lrg.JPG")
plotRGB(Lakechad, r=1, g=2, b=3)
plotRGB(Lakechad, r=2, g=3, b=1)

#download the image from 2017
Lakechad2017 <- rast("lakechad_oli_2017_lrg.JPG")

#Let's compare the two images
par(mfrow=c(2,1))
plotRGB(Lakechad, r=1, g=2, b=3)
plotRGB(Lakechad2017, r=1, g=2, b=3)

#for the next lecture install ncdf4
#allowing you to upload inside R the nc dataset

#---------------------------------------------------------

#08 Copernicus data
#Always external data but with copernicus

# Data available at:
# https://land.copernicus.vgt.vito.be/PDF/portal/Application.html
#site were we can download the data
#cick on the blue arrow ->
#data file related to the image
#metadata file there is the decription of the data
#available quicklock not the real image but the outlook

install.packages("ncdf4")
library(ncdf4)
#for reading the ncd files
#we assumed to use another library, this allows us to read most of the data from copernicus and the extension
library(terra)
#needed for reporting data from outside
# HOW TO CHANGE AND SET THE NEW WORKING DIRECTORY? 
# By using the "setwd" function
#setwd("")
#important to know the path of our data
#C:\Users\Utente\OneDrive - Università di Napoli Federico II\Desktop\SPATIAL ECOLOGY
#let's change with the normal slash /
#C:/Users/Utente/OneDrive - Università di Napoli Federico II/Desktop/SPATIAL ECOLOGY
setwd("C:/Users/Utente/OneDrive - Università di Napoli Federico II/Desktop/SPATIAL ECOLOGY")
#nameoftheobject <- rast("nameofthefile")
soilm2023 <- rast("c_gls_SSM1km_202311250000_CEURO_S1CSAR_V1.2.1.nc")
plot(soilm2023)
#see the first image ssm
#let's use just the first image
plot(soilm2023[[1]])
#now i have the single image, let's change the color palette
cl <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot(soilm2023[[1]], col=cl)

#function crop
#with minimum longitude and max(x), minimum latitude and max (y)
#we use the c to concatenate
#since are numbers we don't use quotes
ext <- c(20, 23, 55, 57) #minlog, maxlong, minlat, maxlat
soilm2023c <- crop(soilm2023, ext) #new name  #code to produce the new object
plot(soilm2023c[[1]], col=cl) #image in two dimension thus we use two sqare parentesis

#i can download another iamge and then we can crop this image based on the previous extend 
#so we will have two different images on the same extend
#big images require times to take data, crop images are easier to study
#so we deal with "how to upload data inside R" 


#-------------------------------------------------------------------------

#09 Classification of remote sensing data

#lets classify satellite images from NASA

library(terra)
library(imageRy)
im.list()

sun <- im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
#we can classify the image with the function im.classify
#we hav to set a number of clusters
sunc <- im.classify(sun, num_clusters=3)
plot(sunc)
# White is the class with highest energy
#sets for classification are randomly assigned everytime. this means images are always different


#state the class with higher energy
plot(sun) 
#and see the correlation with 
plot(sunc)
# That's why my images are different from professor's ones. 
# So how can I generally state the correct energy pattern?
# We should apply this to the mato grosso forest to estimate the amount of change.
#classify satellite data

im.list()
#"matogrosso_ast_2006209_lrg.jpg"             
#"matogrosso_l5_1992219_lrg.jpg" 
mato1992 <- im.import("matogrosso_l5_1992219_lrg.jpg"  )                  
mato2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")  
#difficult to discriminate
#ggplot: allow us to add other graphs

# c for classify
m1992c <- im.classify(mato1992, num_clusters= 2)
plot(m1992c)
#classes: forest=1; human=2

##we're going to classify the image from 2006
m2006c <- im.classify(mato2006, num_clusters=2)
plot(m2006c)

dev.off()

#let's plot the images together
par(mfrow=c(1,2))
plot(m1992c[[1]])
plot(m2006c[[1]])


#freq function is used to calcuate frequency of something
f1992 <- freq(m1992c)
f1992

#layer value   count
#1     1     1  304437
#2     1     2 1495563


# Lets do the same with the 2006 to see the difference
f2006 <- freq(m2006c)
f2006

#calculate the percentage dividing by the total num of pixels
#extract the total num of the pixels

tot1992 <- ncell(m1992c)
tot1992
#1800000

tot2006 <- ncell(m2006c)
tot2006
# 7200000
 p2006 <- f2006* 100 / tot2006
p2006
#         layer        value    count
# 1.388889e-05 1.388889e-05 45.30561
# 1.388889e-05 2.777778e-05 54.69439
# forest:45% human:54% 

#percentage
p1992 <- f1992 *100 / tot1992
p1992
#     layer        value    count
# 5.555556e-05 5.555556e-05 16.91317
# 5.555556e-05 1.111111e-04 83.08683
# forest:83% human:17%

# Lets make a graph with the two of them together
# We will create a dataframe first and build the final table
# HOW TO CREATE A DATA FRAME?
# By using the data.frame function
class <- c("forest", "human")
y1992 <-  c(83, 17)
y2006 <- c(45, 55)
mydf <- data.frame(class, y1992, y2006)
mydf

#final plot
libray(ggplot)

p1 <- ggplot(tabout, aes(x=class, y=y1992, color=class)) + geom_bar(stat="identity", fill="white")
#aes=aestethic where x=class y= years
#the color is related to the class 
# geombar is because we'll use an histogram. It is normally related to stathistics, so you can use the function to calculate mean, median and so on
# in our case we will only use the identity so the data that we've already imported in our d
#geometry can be related to any statistics but actually we are now using the real value
#rather than using contonuous data we put it in graph


p2 <- ggplot(mydf, aes(x=class, y=y2006, color=class)) + geom_bar(stat="identity", fill="white")
p2
#see patchwork data imaginist.com 

#------------------------------------------------------

#10 VARIABILITY


# measurement of RS based variability
#Different indicies in statistics for measuring variability
#easiest way is to measure the standard deviation
#the higher the SD the higher the variability



#
library(imageRy)
library(terra)
library(viridis)

im.list()

sent <- im.import("sentinel.png")

# band 1 = NIR
# band 2 = red
# band 3 = green

im.plotRGB(sent, r=1, g=2, b=3)
im.plotRGB(sent, r=2, g=1, b=3)

#we want to understand the variability using the standard deviation
nir <- sent[[1]]
plot(nir) #since we have 256 values we're working with bits

# moving window method
#we calculate the standard deviation for a the central pixel of a few pixel with one moving window
#and then we move to calculate the others sd. at the end the moving window will pass from one pixel to the others
sd3 <- focal(nir, matrix(1/9, 3, 3), fun=sd)
plot(sd3)
#nir: objective menner to select the layer on which one we should calculate certain variability
#let's change the legend by using the function called virsid
#we use 7 colors
viridisc <- colorRampPalette(viridis(7))(255)
plot(sd3, col=viridisc)

# Exercise: calculate variability in a 7x7 pixels moving window
sd7 <- focal(nir, matrix(1/49, 7, 7), fun=sd)
plot(sd7, col=viridisc)

# Exercise 2: plot via par(mfrow()) the 3x3 and the 7x7 standard deviation
par(mfrow=c(1,2))
plot(sd3, col=viridisc)
plot(sd7, col=viridisc)

# original image plus the 7x7 sd
im.plotRGB(sent, r=2, g=1, b=3)
plot(sd7, col=viridisc)

#------------------------------------------------------------

#11 Principal Component Analysis PCA



library(imageRy)
library(terra)
library(viridis)

im.list()


sent <- im.import("sentinel.png")

pairs(sent)

# perform PCA on sent
#in order to make a calculation we should chose the single layer
#we should compact all the data in a single band with im.pca so we can compact the data set
sentpc <- im.pca(sent)
pc1 <- sentpc$PC1

viridisc <- colorRampPalette(viridis(7))(255)
plot(pc1, col=viridisc)

# calculating standard deviation ontop of pc1
pc1sd3 <- focal(pc1, matrix(1/9, 3, 3), fun=sd)
plot(pc1sd3, col=viridisc)

pc1sd7 <- focal(pc1, matrix(1/49, 7, 7), fun=sd)
plot(pc1sd7, col=viridisc)


# we basically choose all the bands that we wanted to calculate
# we plot all together
par(mfrow=c(2,3))
im.plotRGB(sent, 2, 1, 3)
# sd from the variability script:
plot(sd3, col=viridisc)
plot(sd7, col=viridisc)
plot(pc1, col=viridisc)
plot(pc1sd3, col=viridisc)
plot(pc1sd7, col=viridisc)

# stack all the standard deviation layers
sdstack <- c(sd3, sd7, pc1sd3, pc1sd7)
names(sdstack) <- c("sd3", "sd7", "pc1sd3", "pc1sd7")
plot(sdstack, col=viridisc)

#------------------------------------------

