
# library(ggplot2)
# library(dplyr)


# data = read.csv('./shellfish_data.csv')


# data$total <- data$north + data$south + data$east + data$west

# print(data)



# jpeg(file=paste(c("ocean_total", ".jpeg"), collapse = ""))
# boxplot(total~torwards_ocean, data = data, xlab= 'Meters Into The Ocean', ylab = 'Total Number of Barnicles Counted')

# dev.off()






# names <- list('north', 'south', 'east', 'west')

# data_sets <- list(data$north, data$south, data$east, data$west)


# for (i in seq(length(names)))
# {
#   name = toString(names[i])
#   print(name)
#   jpeg(file=paste(c("torwards_sea_" , name , ".jpeg"), collapse = ""))
#   boxplot(data[[name]]~data$torwards_ocean, xlab='Meters Into The Ocean', ylab= paste(c(name,' Side Barnicles Counted')))
#   dev.off()
# }

# res.aov <- aov(total~torwards_ocean, data=data)
# summary(res.aov)

# # Towards beach analysis


# jpeg(file=paste(c("beach_total" ,  ".jpeg"), collapse = ""))
# boxplot(total~along_beach, data = data, xlab= 'Meters Along the Beach', ylab = 'Total Number of Barnicles Counted' )

# dev.off()


# for (i in seq(length(names)))
# {
#   name = toString(names[i])
#   print(name)
#   jpeg(file=paste(c("along_beach_" , name , ".jpeg"), collapse = ""))
#   boxplot(data[[name]]~data$along_beach, xlab='Meters Along the Beach', ylab= paste(c(name,' Side Barnicles Counted')))
#   dev.off()
# }





# res.aov <- aov(total~along_beach, data=data)
# summary(res.aov)

#---------------------------------------------------------------
#n/s/e/w

data = read.csv('./shellfish_data.csv')

names <- list('north', 'south', 'east', 'west')
data$total <- data$north + data$south + data$east + data$west



library(tidyr)

data_long <- gather(data, condition, measurement)


data_wide <- data_long[data_long$condition %in% names, ]


jpeg(file='rock_direction_total.jpeg')
boxplot(data_wide$measurement~data_wide$condition, xlab = 'Side of Rock', ylab='Total Barnicles Counted')
dev.off()

data_wide

##----------------------------------------------------------------------------------------------------------------------------
# heatmap
# # Load the lattice package
# library("lattice")


# library('ggplot2')
# library(ggplot2)
# library(dplyr)
# library(hrbrthemes)
# library(viridis)
# library(dplyr)

# # Dummy data

# data_new <- expand.grid(X=data$along_beach, Y=data$torwards_ocean, data=data)
# data_new$Z <-data$total

# ## Try it out
# levelplot(data_new$Z ~ data_new$X*data_new$Y, data=data_new  ,xlab="X",)



# grouped_data = data %>% group_by(along_beach,torwards_ocean)  %>%
#   summarise(total_count = sum(total))

# grouped_data

# jpeg(file=paste(c("heatmap.jpeg"), collapse = ""))
# ggplot(grouped_data, aes(x=along_beach, y=torwards_ocean, size = total_count)) +
#   geom_point(alpha=0.75) +
#   scale_size(range = c(.1, 14)) + scale_y_continuous(breaks=seq(0,10,1))+ xlab('Meters Along the Beach') + ylab('Meters Into the Ocean')
# dev.off()






# data_new

## Directional Anovas
##---------------------------------------------------------------


# names <- list('north', 'south', 'east', 'west')

# data_sets <- list(data$north, data$south, data$east, data$west)


# for (i in seq(length(names)))
# {
#   name = toString(names[i])
#   res.aov <- aov(data[[name]]~torwards_ocean, data=data)
#   print(summary(res.aov))

# }




## Half informed
#---------------------------------------

# subset data to 0, 2, 4, 8, 9, 10


# data = read.csv('./shellfish_data.csv')


# data$total <- data$north + data$south + data$east + data$west

# transects <- list(0, 2, 4, 8, 9, 10)

# half_data = data[data$torwards_ocean %in% transects,]

# res.aov <- aov(total~torwards_ocean, data=half_data)
# print(summary(res.aov))

# names <- list('north', 'south', 'east', 'west')

# data_sets <- list(half_data$north, half_data$south, half_data$east, half_data$west)


# for (i in seq(length(names)))
# {
#   name = toString(names[i])
#   res.aov <- aov(half_data[[name]]~torwards_ocean, data=half_data)
#   print(summary(res.aov))

# }



## third informed
##---------------------------------------

# subset data to 0, 2, 4, 8, 10


# data = read.csv('./shellfish_data.csv')


# data$total <- data$north + data$south + data$east + data$west

# transects <- list(0, 4, 10)

# half_data = data[data$torwards_ocean %in% transects,]

# res.aov <- aov(total~torwards_ocean, data=half_data)
# print(summary(res.aov))

# names <- list('north', 'south', 'east', 'west')

# data_sets <- list(half_data$north, half_data$south, half_data$east, half_data$west)


# for (i in seq(length(names)))
# {
#   name = toString(names[i])
#   res.aov <- aov(half_data[[name]]~torwards_ocean, data=half_data)
#   print(summary(res.aov))

# }


#--------------------------------------------------------

# #pvalues change

# library('ggplot2')
# library(ggplot2)
# library(dplyr)


# data = read.csv('./shellfish_data.csv')


# data$total <- data$north + data$south + data$east + data$west

# total_p <- c(0.524, 0.434, 0.601)

# north_p <- c(0.928, 0.785, 0.583)

# south_p <- c(0.573, 0.584,  0.801)

# east_p <- c( 0.758, 0.497, 0.385)

# west_p <- c(0.478, 0.548, 0.397)

# x_data = c(9, 6, 3)

# test <- data.frame(matrix(ncol = 0, nrow = 3))
# test$total <- total_p
# test$north <- north_p
# test$south <- south_p
# test$east <- east_p
# test$west <- west_p
# test$group <- x_data
# # install.packages("reshape")
# library(reshape)
# mdata <- melt(test, id=c("group"))

# print(mdata)

# jpeg(file=paste(c("pchange.jpeg"), collapse = ""))
# ggplot( data=mdata, aes(x=group, y=value, group=variable, color=variable)) +
#   geom_line()+
#   xlab('Number of Transects') + ylab('ANOVA P Value') + 
#   scale_x_continuous(breaks=c(9, 6, 3))
# dev.off()



##-----------------------------------------------------------


# library('ggplot2')
# library(ggplot2)
# library(dplyr)

# # Total / south
# data = read.csv('./shellfish_data.csv')


# data$total <- data$north + data$south + data$east + data$west

# jpeg(file=paste(c("total_south.jpeg"), collapse = ""))
# ggplot(data, aes(x=south, y=total)) +
#   geom_point() + 
#   geom_smooth(method='lm')
#   # scale_size(range = c(.1, 14)) + scale_y_continuous(breaks=seq(0,10,1))+ xlab('Meters Along the Beach') + ylab('Meters Into the Ocean')
# dev.off()



# grouped_data = data %>% group_by(torwards_ocean, north, south, east, west)  %>%
#   summarise(total_count = sum(total))


# cone <- cor(grouped_data)

# install.packages("corrplot")
# library(corrplot)
# corrplot(cone, method="circle")

# jpeg(file=paste(c("cor.jpeg"), collapse = ""))
# corrplot(cone, method="circle")
# dev.off()


# -------------------------------------------------------------------------
# n/s/e/w