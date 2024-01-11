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
#0.3.2 COMMUNITY OVERLAP
#overlap in space and time


#we're going to build a graph
#we have installed 
#in time we should use kernel density (amount of times we've seen that species)
#kerinici seblat national park
#inside library overlap thre is kerinci with different species and time e.i. a specie which lives a lot during the night nor the day

#data
data(kerinci)
head(kerinci) #and we can see the first six variable in xone, space and time
the first six lines are related to the tiger

#summary
summary(kerinci)
#we have the count of the different individuals seen by the cameratraps

#moves of an animal in a day
#tiger
#put the name of the dataset kerinci and put the square parentesis
#the coon containing the species should be equal to tiger
#the dollr is linkink
tiger <- kerinci[kerinci$Sps=="tiger",]
tiger

#one important step: the time we are using is linear but this package is working not in linear but in circular time
#we should pass from line to radiant (circular time)
kerinci$time * 2 * pi
#assing the calculation to an object
timeRed <- kerinci$time * 2 * pi

 #we can make plot to see what are the pix in time to see the tiger
plot(tiger$timeRed)
timetig <- tiger$timeRed
densityPlot(timetig, rug=TRUE)



#let's do it with another species
#exercise: select oonly, the data on the macaque individuals

macaque <- kerinci[kerinci$Sps=="macaque",]
#make variable in time with macaque
timemac <- macaque$timeRed
densityplot(timemac, rug =TRUE)

#take data from tiger and macaque and see together
overlapPlot(timetig, timemac)

#-----------------------------------------------------
#next level: not organism anymore but ECOSYSTEM
#monitor changes within communities with a tool which is called remote sensing data


#0.4 remote sensing data

# RS data

library(devtools) # packages in R are also called libraries

# install the imageRy package from GitHub
install_github("ducciorocchini/imageRy")  # from devtools
#with imagery we have another manner to install pacakges which are in github but not in CRAN
#devtools is the package we need to have the possibility of installing packages from gitHiub
#install_github(name of the github account and name of the package)

# list the data
im.list()
#

b2 <- im.import("sentinel.dolomites.b2.tif") 

cl <- colorRampPalette(c("black", "grey", "light grey")) (100)
plot(b2, col=cl)

# import the green band from Sentinel-2 (band 3)
b3 <- im.import("sentinel.dolomites.b3.tif") 
plot(b3, col=cl)

# import the red band from Sentinel-2 (band 4)
b4 <- im.import("sentinel.dolomites.b4.tif") 
plot(b4, col=cl)

# import the NIR band from Sentinel-2 (band 8)
b8 <- im.import("sentinel.dolomites.b8.tif") 
plot(b8, col=cl)
library(imageRy)


b2 <- im.import("sentinel.dolomites.b2.tif") 
b3 <- im.import("sentinel.dolomites.b3.tif") 
b4 <- im.import("sentinel.dolomites.b4.tif") 
b8 <- im.import("sentinel.dolomites.b8.tif") 

stack_sent <- c(b2,b3,b4,b8)
plot(stack_sent)

#to include infared im.plot()
im.plotRGB(stack_sent, 3, 2, 1)

im.plotRGB(stack_sent, 4, 3, 2)


pairs(stack_sent)
## correlation coefficient on the right (from 0 to 1)
#frequency level of reflectance 

#--------------------------------------------------------
#05 Spectral indicies


#vegetation indicies

 #spectral indicies temp
library(imageRy)
library(terra)

#list 
im.list()
#information about description in repository imagery, go check
#images from observatory of NASA

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

#import the recent image of deforestation
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")
#see how different pixel changes in time
im.plotRGB(m2006, r=2, g=3, b=1)
#import the 2006 image
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")
im.plotRGB(m2006, r=2, g=3, b=1)

#build a multiframe (several plots all togethere in this case image 1992 and 2006)

par(mfrow= c(1,2))
im.plotRGB(m1992, r=2, g=3, b=1)
im.plotRGB(m2006, r=2, g=3, b=1)

#let's create vegetation indicies to visualize the health of that place

 #digit the name the image and you have some infomation
plot(m1992[[1]])
dev.off()
#reflectance has a range from 0 to 250. reflectance is the ratio between incident flux and the reflected flux
#usually the ratio is the opposite but the result would have been decimal, thus we want to avoid decimal we rescale the ratio
#the code is binary. with 2bits we have 4 possible combination (information)
#what with thee bits?? 8 informations
#to know how possible informations we have we have to elevate 2 for the number of th bits.
#most image are store in 8 bits cause it decease the rate of the image
# 2^8 is 256, so that's the reason why our eflectance range is 250. nasa use 8 bits.


# 3
# 1  3
# 1 1 1 3
# 3 1 1 3 
# 1 3 2 1 1 3 
# what is the next number??? xD

# DVI
# different between the first and the second bands (between NIR and RED)
#bands 1=NIR 2=RED 3=GREEN

dvi1992 = m1992[[1]] - m1992[[2]]]
plotdvi(dv11992)
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

#let's calculate di ndvi
ndvi1992 = (m1992[[1]] - m1992[[2]]) / m(2006[[1]] + m1992[[2]])
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


#for the next lecture: stay focus ahhahaha 

#------------------------------------------------
#06 time series

#time series analysis
library(imageRy)
library(terra)

im.list()
#let's use the first one
#import the data
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
plot(dif, col=cldif)
#differences between the two images, everything with the blue is highe in march, in jenuary is red

#now see how T changes from 2000 to 2015 in Greenland with an example


#what are the data?
im.list()
#data on T, what is the amount  of T in that area
#let's import

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

#stack the images all together
stackg <- c(g2000, g2005, g2010, g2015)
#plot the all stack
plot(stackg, col=clg)
#what we did is stack things all togeter and plot the stacks
#in 2003 was one of the worst for the temperature so we can see this huge amount of decrease
#exercise
#make the differences between them (first and final)

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
#in the middle the temperature in higher in the final period, if that center was red means that T was higher in the first period since we put red the first period

#------------------------------------------------------------------------------

#07 External data code
#set the working directory


#How can we download our own data and use it??

# https://earthobservatory.nasa.gov/ <- what we're going to use today, less heavy.

## https://www.youtube.com/watch?v=KA2L4bDmo98 <- follow the video and download data (frome esa, 10m resolution)

#We downloaded the image and put inside the folder:  https://eoimages.gsfc.nasa.gov/images/imagerecords/152000/152086/najafiraq_etm_2003140_lrg.jpg
#let's upload the image inside R
#using packages

library(terra)

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
najadif= naja[[1]] - najaeug[[1]]
cl <- colorRampPalette(c("brown", "grey", "orange")) (100)
plot(najadif, col=cl)

dev.off()

#our own image
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

library(ncdf4)
#for reading the ncd files
#we assumed to use another library, this allows us to read most of the data from copernicus and the extension
library(terra)
#needed for reporting data from outside
#we should set the working directory
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

#i can download another iamge and then we can crop this image based on the previous extend so we will have two different images on the same extend
#big images require times to take data, crop images are easier to study
#so we deal with "how to upload data inside R" 
#next lecture on next thursday IMPORTANT we will quantificate the change in time of two different image

#-------------------------------------------------------------------------

#09 Classification of remote sensing data


#lets classify satellite images from NASA

library(terra)
library(imageRy)

im.list()

sun <- im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
sunc <- im.classify(sun, num_clusters=3)
plot(sunc)

#state the class with higher energy
plot(sun) 
#and see the correlation with 
plot(sunc)

#classify satellite data

im.list()
#"matogrosso_ast_2006209_lrg.jpg"             
#"matogrosso_l5_1992219_lrg.jpg" 
m1992 <- im.import("matogrosso_ast_2006209_lrg.jpg")
m2006 <- im.import("matogrosso_l5_1992219_lrg.jpg")
#difficult to discriminate
#ggplot: allow us to add other graphs
plotRGB(m1992)

# c for classify
m1992c <- im.classify(m1992, num_clusters=2)

plot(m1992c)
#classes: forest=1; human=2

##we're going to classify the image from 2006
m2006c <- im.classify(m2006c, num_clusters=2)
plot(m2006c)

#let's compare the images
par(mfrow=c(1,2))
plot(m1992c)
plot(m2006c)

#i have now three images but i i install again the imagery package i could par the two images
#we can par them in this way
par(mfrow=c(1,2))
plot(m1992c[[1]])
plot(m2006c[[1]])


#how many pixel
f1992 <- freq(m1992c)
f1992
#     layer value   count
#1     1     1 3262004
#2     1     2 3937996
#calculate the percentage dividing by the total num of pixels
#extract the total num of the pixels

> tot1992 <- ncell(m1992c)
> tot1992
[1] 7200000
#percentage
p1992 <- f1992 *100 / tot1992
 p1992
         layer        value    count
1 1.388889e-05 1.388889e-05 45.30561
2 1.388889e-05 2.777778e-05 54.69439
# forest:45% human:54% 
#i have actually inverted the two images :'D so this percentage is from the 2006 image 
#all the data are inverted xD

#building the final table
class <- c("forest", "human)
y1992 <- c(45, 54)
#do it for real y2006 <- (45, 54) , in 1992 the percentage should be 83 and 17
#this percentage are always from 2006 
#fix at home

tabout <- data.frame(class, y1992, y2006)
tabout



#finalgraph
libray(ggplot)
class <- c("forest", "human")
y1992 <- c(83, 17)
y2006 <- c(45, 55)
#we're going to plot the table
p1 <- ggplot(tabout, aes(x=class, y=y1992, color=class)) + geom_bar(stat="identify", fill="white")
#aes=aestethic
#geometry can be related to any statistics but actually we are now using the real value

#rather than using contonuous data we put it in graph

#vedi da duccio's github
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

nir <- sent[[1]]
plot(nir)

# moving window
# focal
sd3 <- focal(nir, matrix(1/9, 3, 3), fun=sd)
plot(sd3)
#nir: objective menner to select the layer on which one we should calculate certain variability

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

#11 Principal COmponent Analysis



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

