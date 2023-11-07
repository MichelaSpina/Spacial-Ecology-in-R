#vegetation indicies

 #spectral indicies temp
library(imageRy)
library(terra)

#list 
im.list()
#information about description in repository imagery, go check
#images from observatory of NASA

im.import #we have the plot of the image
im.import(""matogrosso_l5_1992219_lrg.jpg")
#processed image ##bands: 1=NIR, 2=RED, 3=GREE
#im.plotRGB()
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
im.plotRGB(m1992, r=1, g=2, b=3)
im.plotRGB(m1992, 1, 2, 3)
im.plotRGB(m1992, r=3, g=1, b=3)
im.plotRGB(m1992, r=2, g=3, b=1)

#import the recent image
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")
im.plotRGB(m2006, r=2, g=3, b=1)

#see how different pixel changes in time
