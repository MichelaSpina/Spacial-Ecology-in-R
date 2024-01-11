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

