data = read.csv('/home/travis/repos/marine_bio_2022/shellfish_data.csv')

data$total <- data$north + data$south + data$east + data$west



jpeg(file=paste(c("ocean_total", ".jpeg"), collapse = ""))
boxplot(total~torwards_ocean, data = data, xlab= 'Meters Into The Ocean', ylab = 'Total Number of Barnicles Counted')

dev.off()




jpeg(file=paste(c("beach_total" ,  ".jpeg"), collapse = ""))
boxplot(total~along_beach, data = data, xlab= 'Meters Along the Beach', ylab = 'Total Number of Barnicles Counted' )

dev.off()



names <- list('north', 'south', 'east', 'west')

data_sets <- list(data$north, data$south, data$east, data$west)


for (i in seq(length(names)))
{
  name = toString(names[i])
  print(name)
  jpeg(file=paste(c("torwards_sea_" , name , ".jpeg"), collapse = ""))
  boxplot(data[[name]]~data$torwards_ocean, xlab='Meters Into The Ocean', ylab= paste(c(name,' Side Barnicles Counted')))
  dev.off()
}



for (i in seq(length(names)))
{
  name = toString(names[i])
  print(name)
  jpeg(file=paste(c("along_beach_" , name , ".jpeg"), collapse = ""))
  boxplot(data[[name]]~data$along_beach, xlab='Meters Along the Beach', ylab= paste(c(name,' Side Barnicles Counted')))
  dev.off()
}

## along beach and out from water totals
#jpeg(file=paste(c("towards_ocean_" , "total" , ".jpeg"), collapse = ""))
#boxplot(data$total~data$torwards_ocean)
#dev.off()

#jpeg(file=paste(c("along_beach_" , "total" , ".jpeg"), collapse = ""))
#boxplot(data$total~data$along_beach)
#dev.off()



res.aov <- aov(total~along_beach, data=data)
summary(res.aov)



res.aov <- aov(total~torwards_ocean, data=data)
summary(res.aov)

install.packages("tidyr")
library(tidyr)

data_long <- gather(data, condition, measurement)


data_wide <- data_long[data_long$condition %in% names, ]


jpeg(file='rock_direction_total.jpeg')
boxplot(data_wide$measurement~data_wide$condition, xlab = 'Side of Rock', ylab='Total Barnicles Counted')
dev.off()

data_wide


# heatmap

install.packages("lattice")


# Load the lattice package
library("lattice")

# Dummy data

data_new <- expand.grid(X=data$along_beach, Y=data$torwards_ocean)
data_new$Z <-data$total

## Try it out
levelplot(data_new$Z ~ data_new$X*data_new$Y, data=data_new  ,xlab="X",)

install.packages('ggplot2')
library('ggplot2')
library(ggplot2)
library(dplyr)
library(hrbrthemes)
library(viridis)
install.packages('dplyr')
library(dplyr)

grouped_data = data %>% group_by(along_beach,torwards_ocean)  %>%
  summarise(total_count = sum(total))

grouped_data

ggplot(grouped_data, aes(x=along_beach, y=torwards_ocean, size = total_count)) +
  geom_point(alpha=0.5) +
  scale_size(range = c(.1, 24)) + scale_y_continuous(breaks=seq(0,10,1))+ xlab('Meters Along the Beach') + ylab('Meters Into the Ocean')







data_new
