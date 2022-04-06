data = read.csv('/home/travis/repos/marine_bio_2022/shellfish_data.csv')

data$total <- data$north + data$south + data$east + data$west


boxplot(total~torwards_ocean, data = data)

boxplot(total~along_beach, data = data)

names <- list('north', 'south', 'east', 'west')

data_sets <- list(data$north, data$south, data$east, data$west)


for (i in seq(length(names)))
{
  name = toString(names[i])
  print(name)
  jpeg(file=paste(c("torwards_sea_" , name , ".jpeg"), collapse = ""))
  boxplot(data[[name]]~data$torwards_ocean)
  dev.off()
}



for (i in seq(length(names)))
{
  name = toString(names[i])
  print(name)
  jpeg(file=paste(c("along_beach_" , name , ".jpeg"), collapse = ""))
  boxplot(data[[name]]~data$along_beach)
  dev.off()
}

# along beach and out from water totals
jpeg(file=paste(c("towards_ocean_" , "total" , ".jpeg"), collapse = ""))
boxplot(data$total~data$torwards_ocean)
dev.off()

jpeg(file=paste(c("along_beach_" , "total" , ".jpeg"), collapse = ""))
boxplot(data$total~data$along_beach)
dev.off()



res.aov <- aov(total~along_beach, data=data)
summary(res.aov)



res.aov <- aov(total~torwards_ocean, data=data)
summary(res.aov)

install.packages("tidyr")
library(tidyr)

data_long <- gather(data, condition, measurement)


data_wide <- data_long[data_long$condition %in% names, ]

boxplot(data_wide$measurement~data_wide$condition)

data_wide


# heatmap

install.packages("lattice")


# Load the lattice package
library("lattice")

# Dummy data

data_new <- expand.grid(X=data$along_beach, Y=data$torwards_ocean)
data_new$Z <-data$total

## Try it out
levelplot(data_new$Z ~ data_new$X*data_new$Y, data=data_new  ,xlab="X",
          main="")


data_new
