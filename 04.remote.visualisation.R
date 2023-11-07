# RS data

library(devtools) # packages in R are also called libraries

# install the imageRy package from GitHub
install_github("ducciorocchini/imageRy")  # from devtools

# list the data
im.list()

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





