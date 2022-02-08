############################################################
# NAME: Ramandeep Kaur Bagri ###############################
# EMAIL: rbagri@ucsc.edu or er.ramandeep.bagri@gmail.com ###
# ABOUT DATA: Wildfire GRAPH 1                             #
############################################################

#calling directory
getwd()

#calling library 
library(tidyverse)
library(readr)
library(readxl)
library(dplyr)
library(ggplot2)
library(lubridate)
library(plotrix)

list.files(getwd())

df <- read_excel("Wildfire_CA_USA_Data_Bagri.xlsx", col_names = c( "No_of_wildfire_incidents", "property_loss_in_fire", "Year", "Fatalities", "Structure_Loss"))
file.show("Wildfire_CA_USA_Data_Bagri.xlsx")
head(df)

tail(df)

str(df)

summary(df)

class(df)

df = df[-1,] #delete 1st row and column
head(df)

#as year data is not complete date, to make it date let's date using lubridate
data$Year<-as.Date(time(data))

lubridate::ymd(df$Year, truncated = 2L)
str(df)
head(df)
data <- as.data.frame(sapply(df, as.numeric))
lubridate::ymd(data$Year, truncated = 2L)

as.Date(41149, origin = "1900")
dates <- as.numeric(data$Year)
data$date = as.Date(dates, format="%Y")
str(data)
df$Year

#par(mfrow=c(4,1)) 
attach(data)
par(mfrow=c(2,2))
plot(Year,No_of_wildfire_incidents, type = "o", col = "red", ylab = "No. of wildfires incidents", xlab = "Year", main="Average number of wildfires each year")
plot(Year,Structure_Loss, type = "o", col = "red", ylab =  "Structure loss", xlab = "Year", main="Average Structure Losses in Fire")
plot(Year, property_loss_in_fire, type = "o", col = "red", ylab = "Property loss in fires", xlab = "Year", main="Property Loss in Fire")
plot(Year, Fatalities, type = "o", col = "red",ylab = "Fatalities",  xlab = "Year", main="Fatalities")


