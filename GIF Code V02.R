
library(ggplot2)
library(gganimate)
library(gifski)
library(dplyr)
library(magick)

rm(list=ls())
set.seed(100)

n=sort(sample(1:150,size=100,replace=F))
c3=kmeans(iris[n,-5],centers=3)
summary3=table(iris[n,]$Species,c3$cluster)

c2=kmeans(iris[n,-5],centers=2)
summary2=table(iris[n,]$Species,c2$cluster)

c4=kmeans(iris[n,-5],centers=4)
summary4=table(iris[n,]$Species,c4$cluster)

colours3 <- c("#00AFBB", "#E7B800", "#FC4E07")
colours2 <- c("#00AFBB", "#E7B800")
colours4 <- c("#00AFBB", "#E7B800", "#FC4E07", "#8B008B")


# Step 5: Create a list of plots, one for each angle
plot_image <- magick::image_graph(width = 800, height = 800, res = 96)
plot(iris$Petal.Width*iris$Sepal.Width,iris$Petal.Length*iris$Sepal.Length, 
col = colours4[c4$cluster], main = "Scatterplots by Kmeans Clustering",
xlab = "Sepal Width*Petal Width",ylab = "Sepal Length*Petal Length", pch=16)
legend("bottomright", legend = paste("Cluster", 1:4), fill = colours4, cex=0.6, 
bg = "white")

plot(iris$Petal.Width*iris$Sepal.Width,iris$Petal.Length*iris$Sepal.Length, 
col = colours3[c3$cluster], main = "Scatterplots by Kmeans Clustering",
xlab = "Sepal Width*Petal Width",ylab = "Sepal Length*Petal Length", pch=16)
legend("bottomright", legend = paste("Cluster", 1:3), fill = colours3, cex=0.6, 
bg = "white")

plot(iris$Petal.Width*iris$Sepal.Width,iris$Petal.Length*iris$Sepal.Length, 
col = colours2[c2$cluster], main = "Scatterplots by Kmeans Clustering",
xlab = "Sepal Width*Petal Width",ylab = "Sepal Length*Petal Length", pch=16)
legend("bottomright", legend = paste("Cluster", 1:2), fill = colours2, cex=0.6, 
bg = "white")
dev.off()

# Step 7: Combine the images into a GIF
gif <- image_animate(image_join(plot_image), fps = 5)
image_write(gif, "C:/Users/DELL/Documents/LinkedIn Coding/Experiment 2.gif")

