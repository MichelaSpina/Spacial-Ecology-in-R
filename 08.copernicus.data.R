# Data available at:
# https://land.copernicus.vgt.vito.be/PDF/portal/Application.html
#cick on the blue arrow ->
#data file related to the image
#metadata file there is the decription of the data
#available quicklock not the real image but the outlook

library(ncdf4)
#for reading the ncd files
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





