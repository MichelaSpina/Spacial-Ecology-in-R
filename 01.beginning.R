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



