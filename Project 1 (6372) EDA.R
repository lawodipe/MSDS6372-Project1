
#Data Import and Manupulation
Cars <- read.csv(file.choose(), header= TRUE)
head(Cars)

##Missing data
library(naniar)
miss_var_summary(Cars)
gg_miss_var(Cars, show_pct = TRUE)

##Cleaning up variable names

names(Cars) <- c("Model","Make","Year","Engine_Fuel_type","Engine_HP","Engine_Cylinders","Transmission_Type",
                 "Driven_Wheels","Number_Of_Doors","Market_Category","Vehicle_Size","Vehicle_Style",
                 "Highway_MPG","City_MPG","Popularity","MSRP")

## Changing data types 

Cars$Make<-as.factor(Cars$Make)
Cars$Model<-as.factor(Cars$Model)
Cars$Engine_Fuel_type<-as.factor(Cars$Engine_Fuel_type)
Cars$Transmission_Type<-as.factor(Cars$Transmission_Type)
Cars$Market_Category<-as.factor(Cars$Market_Category)
Cars$Vehicle_Size<-as.factor(Cars$Vehicle_Size)
Cars$Vehicle_Style<-as.factor(Cars$Vehicle_Style)

attach(Cars)

## Summary of data

summary(Cars)

## Summary statistics

t(aggregate(Popularity~Make,data=Cars,summary))
t(aggregate(Popularity~Make,data=Cars,mean)) 

library(ggplot2)
library(dplyr)
library (ggthemes)
library(GGally)
library(tidyverse)
library(plotly)
library(plyr)

#Histogram of Popularity
Cars %>% ggplot(aes(x = Popularity)) + geom_histogram(fill="blue") + ggtitle("Histogram of Popularity")

#Histogram of Year
Cars %>% ggplot(aes(x = Year)) + geom_histogram(color="blue") + ggtitle("Histogram of Year")


#Check assumptions with histograms 

Cars %>% ggplot(aes(x = Popularity, color = Model, fill = Model)) + geom_histogram(bins = 9) + facet_wrap(~Model)

#Plot matrix of only variables of interests for Poularity, Make and Transmission Type
Cars %>% select(Popularity, Year, Transmission_Type) %>% ggpairs(aes(color = Transmission_Type))

#Scatterplot of City_MPG vs Highwway_MPG
                                                            
Cars %>% ggplot(aes(x = City_MPG,y = Highway_MPG)) + geom_point(color ="blue") + ggtitle("City MPG v. Highway MPG")