library(dplyr)
library(lubridate)

setwd('R_programming/Exploratory_Data_Analysis/')
data <- read.csv2('household_power_consumption.txt',sep = ';', header = TRUE)
data <- tbl_df(data)
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)
data$Global_active_power = as.numeric(as.character(data$Global_active_power))
Date_Time = ymd_hms(data$Date + data$Time)
data = cbind(data,Date_Time)
filt_data <- data %>%
        select(Date,Global_active_power,Date_Time) %>%
        subset(Date == ymd('2007/02/01') | Date == ymd('2007-02-02'))%>%
        tbl_df
with(filt_data,plot(Date_Time,Global_active_power,ylab = "Global Active Power (Kilowatts)",type = 'o',pch = '.'))
dev.copy(png,'Plot2.png')
dev.off()     

