library(dplyr)
library(lubridate)

setwd('R_programming/Exploratory_Data_Analysis/')
data <- read.csv2('household_power_consumption.txt',sep = ';', header = TRUE)
data <- tbl_df(data)
data$Date <- dmy(data$Date)
data$Global_active_power = as.numeric(as.character(data$Global_active_power))
filt_data <- data %>%
                select(Date,Global_active_power) %>%
                filter(Date == ymd('2007/02/01') | Date == ymd('2007-02-02'))
                
with(filt_data,hist(Global_active_power,col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (Kilowatts)'))
dev.copy(png,'Plot1.png')
dev.off()
