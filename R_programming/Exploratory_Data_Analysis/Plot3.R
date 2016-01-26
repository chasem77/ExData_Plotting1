library(dplyr)
library(lubridate)

setwd('R_programming/Exploratory_Data_Analysis/')
data <- read.csv2('household_power_consumption.txt',sep = ';', header = TRUE)
data <- tbl_df(data)
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)
data$Sub_metering_1 = as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 = as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 = as.numeric(as.character(data$Sub_metering_3))
Date_Time = ymd_hms(data$Date + data$Time)
data = cbind(data,Date_Time)
filt_data <- data %>%
        select(Date,Sub_metering_1:Sub_metering_3,Date_Time) %>%
        subset(Date == ymd('2007/02/01') | Date == ymd('2007-02-02'))%>%
        tbl_df
with(filt_data,plot(Date_Time,Sub_metering_1,type = 'o',pch = '.',xlab = '',ylab = 'Energy Sub Metering'))
with(filt_data,points(Date_Time,Sub_metering_2, col = 'red',type = 'o' ,pch = '.'))
with(filt_data,points(Date_Time,Sub_metering_3, col = 'blue',type = 'o' ,pch = '.'))
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col = c('black','red','blue'),lwd = 2)
dev.copy(png,'Plot3.png')
dev.off()
