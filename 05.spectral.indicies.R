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

#import the recent image
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
