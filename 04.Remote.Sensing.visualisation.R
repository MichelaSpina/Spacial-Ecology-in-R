##
install.packages("devtools")
library(devtools)

#CRAN is the network of all the packages included in R
#github is also a packages comprehensory, those packages are additional to the CRAN's ones
#next images = sentinel
#the colors are infared, each color correspond to a band value
#function im.import (name of the image of the specific layer)
devtools::install_github("ducciorocchini/imageRy", force=TRUE) 
#we install it from github trough devtools

library(imageRy)
install.packages("terra")
library(terra)

#for every function use "im" as prefix

im.list()
b2 <- im.import("sentinel.dolomites.b2.tif)
b2


##global circulation
