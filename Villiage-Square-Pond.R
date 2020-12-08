#To open excel in R
library(openxlsx)
# To plot using ggplot2
library(ggplot2)
#To plot side by side or on top of each other
library(gridExtra)
#To use date_break functinoallity
library(scales)
library(lubridate)
library(rkt)
library(EnvStats)
library(zoo)
library(dplyr)
library(Kendall)
library(boot)
library(magrittr)
library(ggpubr)
library(ggthemes)
library(plotly)
library(psych)
library(shiny)
library(plot3D)
library(plyr)
library(Cairo)
library(tidyverse)
library(dplyr)
library(plotrix)

#path of spreadsheet
#OLD = dbPath1 <- "TMDL_Stream_2010-2019_V3.xlsx"
dbPath1 <- "G:/PW_UtilityEng/STORM/Programs/Monitoring/R Stats/Projects/Stormwater/Villiage Square Pond/Villiage Square Pond.xlsx"

# load the workbook

wb <- loadWorkbook(dbPath1)

#load the worksheets Soil Data
CB <-  read.xlsx(dbPath1, "Catch Basin", detectDates = T)
Inlet_Pipe <-  read.xlsx(dbPath1, "Inlet Pipe", detectDates = T)
Ground <-  read.xlsx(dbPath1, "Ground", detectDates = T)
Water_Level <-  read.xlsx(dbPath1, "Water Level", detectDates = T)
Outlet_Pipe <-  read.xlsx(dbPath1, "Outlet Pipe", detectDates = T)



# Combine Worksheets Ground Water
AllCounts <- rbind(CB, Inlet_Pipe, Ground, Water_Level, Outlet_Pipe)



#GGPLOT



#Cross Section Graph

VilliageSquare = ggplot() + 
  geom_line(data = Ground, aes(x = Distance, y = Elevation_Corrected), color = "black") +
  geom_line(data = Water_Level, aes(x = Distance, y = Elevation_Corrected), color = "blue") +
  geom_line(data = Inlet_Pipe, aes(x = Distance, y = Elevation_Corrected), color = "grey", size =2) +
  geom_line(data = Outlet_Pipe, aes(x = Distance, y = Elevation_Corrected), color = "grey", size =2) +
  geom_point(data=Water_Level, aes(x = Distance, y =Elevation_Corrected, shape = 25), color = "blue", fill="blue" ) +
  geom_point(data=CB, aes(x = Distance, y =Elevation_Corrected, shape = 12), color = "grey", fill="grey", size = 3 ) +
  geom_point(data = Inlet_Pipe, aes(x = Distance, y = Elevation_Corrected, shape = 1), color = "grey", size =2) +
  geom_point(data = Outlet_Pipe, aes(x = Distance, y = Elevation_Corrected, shape = 1), color = "grey", size =2) +
  ylim(77,88) + scale_shape_identity() + xlim(0,575) +
  theme_bw() + labs(title = NULL, subtitle=NULL, caption = "Villiage Square Pond Relative Elevations", y="Elevation (Feet)", x="Distance (Feet)") +
  theme(axis.title.y = element_text(size=16), title = element_text(size = 18), axis.text.x = element_text(size = 12, angle = 65, vjust = 0.6),
        axis.text.y = element_text(size = 15), legend.title = element_text(size=15), legend.text = element_text(size=15))

VilliageSquare


