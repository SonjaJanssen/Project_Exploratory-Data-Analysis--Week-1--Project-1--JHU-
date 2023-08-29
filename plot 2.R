##  Exploratory Data Analysis-Week 1- Project 1 (JHU)
##  plot2.R and plot2.png

#   Lectures: By Professors PhD Jeffrey Leek, PhD Roger D. Peng, PhD Brian Caffo
#   University: John Hopkins University Bloomberg School of Public Health 
#   Codes: @Sonja Janssen-Sahebzad (@SonjaJS)
#   Date:  16 April 2023

##  Grade: 100 %
##  Graded peers assignment: by 4 peers review
##  Review: by SJ and Peers

##  Script: All Codes are tested, assignment completed: codes all ok!
##  This script was created with:
#               - RStudio     Version  0.97.124  for windows
#               - R           Version  4.2.3     for windows
#               - dtplyr      Version  1.3.1
#               - dplyr       Version  1.1.1
#               - data.table  Version  1.14.8
#               - plyr        Version  1.8.8
#               - knitr       Version  1.42
#               - ggplot2     Version  3.4.1
#               - ggraph      Version  2.1.0
#               - ggforce     Version  0.4.1
#               - ggmap       Version  3.0.2
#               - ggrepel     Version  0.9.3
#               - rstudioapi  version  0.14
#               - readr       version  2.1.4 
#               - data was downloaded at date: 'Fri April 15 20:00:10 2023'


#******************************************************************************* 
## Command rm(list=ls()) removes all objects from the current workspace (R memory)
rm(list=ls()) 
## Check if there are any objects 
ls()
#*******************************************************************************
## 0.1.1. vector.package
vector.packages <- c("readr", "ggplot2", "dtplyr", "dplyr", "ggplot2", "ggforce","ggmap", "ggrepel", "knitr", "rstudioapi", "data.table", "ggraph", "renv")        

## 0.1.2. load libraries
FuntionExample <- function(vector.packages){
  for (i in vector.packages){  #Installs packages if not yet installed
    if(!require(i, character.only = T)) install.packages(i)
    suppressPackageStartupMessages(library(i, character.only = T))
    print(i)
  }
}      
FuntionExample(vector.packages) 

## Explanation
## dtplyr     version 1.3.1   Combines dplyr and data.table
## dplyr      version 1.1.1   Grammar of data manipulation
## data.table version 1.14.8  Extension of dataframe
## ggplot2    version 3.4.1   Create elegant data visual graphics
## ggraph     version 2.1.0   Graphics for graphs & network
## ggforce    version 0.4.1   Accelerating ggplot2
## ggmap      version 3.0.2   Spatial visualization with ggplot2
## ggrepel    version 0.9.3   Positions Non-overlapping Text labels with ggplot2 

## Codes tested = ok!


#*******************************************************************************
## 1.1.1. - Find working directory
getwd()
## [1] "C:/Users/../OneDrive/Documents"

## 1.1.2. Set you working dir in R studio
#         - You can change your working directory setwd()
#         - Go to file menu:
#                           - Click on Session
#                           - Click on Choose Working Directory
#                           - Click on Choose Directory
#                           - Pop up screen appears: click on documents, than choose your folder you named Github
#                           - In Github make a new folder where your current file will be stored
#                           - You can choose to store all your  files or objects in your Github folder

## 1.1.3. Set your working dir: example
setwd("C:/Users/../../Documents/Github/Exploratory Data Analysis-Project 1 (JHU)")

## 1.1.4. Check:  
getwd()
## [1] "C:/Users/../../Documents/Github/Exploratory Data Analysis-Project 1 (JHU)"

## Codes tested = ok!


#*******************************************************************************
## Assignment: Plot2.R and plot2.png
#*******************************************************************************
## 1. Get the data 
## 2. Convert the Date & Date+Time variables to Date and Date/Time classes 
## 3. Subset the data for Date and Time for 2007-02-01 and 2007-02-02
## 4. Make and save Plot 2 

#*******************************************************************************
## 1. Load your data: 
## I used  fread  "data.table" package because it loads large data files faster than read.table
householdpowerData <- data.table::fread(input = "household_power_consumption.txt", header = T, 
                                        sep = ";", na.strings="?"
                                        )

## 2. Convert the Date & Date+Time variables to Date and Date/Time classes  
householdpowerData[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
householdpowerData[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

## 3. Subset the data for Date and Time for 2007-02-01 and 2007-02-02
householdpowerData <- subset(householdpowerData, subset(dateTime >= "2007-02-01" & dateTime <= "2007-02-02"))


## 4. make Plot 2                           
                           
plot(x = householdpowerData[, dateTime] , y = householdpowerData[, Global_active_power], 
     type = "l",  ylab = "Global Active Power (kilowatts)", xlab = "")                   
                             
png(filename ="plot2.png", width=480, height=480)                         
                             
dev.off()                         
                             
                             
#*******************************************************************************
