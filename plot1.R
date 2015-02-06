#============== CodeBook =======================================================
# 1 : Date: Date in format dd/mm/yyyy

# 2 : Time: time in format hh:mm:ss

# 3 : Global_active_power: household global minute-averaged active power (in kilowatt)

# 4 : Global_reactive_power: household global minute-averaged reactive power (in kilowatt)

# 5 : Voltage: minute-averaged voltage (in volt)

# 6 : Global_intensity: household global minute-averaged current intensity (in ampere)

# 7 : Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy).
#    It corresponds to the kitchen, containing mainly a dishwasher, an oven and
#     a microwave (hot plates are not electric but gas powered).

# 8 : Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy).
#    It corresponds to the laundry room, containing a washing-machine, a tumble-drier,
#    a refrigerator and a light.

# 9 : Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy).
#    It corresponds to an electric water-heater and an air-conditioner.

#============== END CodeBook ===================================================


library(data.table)

file<-"./household_power_consumption.txt"
#system.time(fread(file,select=c(1,3),verbose=T))
data<-fread(file,select=c(1,3),colClasses=c(Date="character",Global_active_power="character"))

#We will only be using data from the dates 2007-02-01 and 2007-02-02. 

epc<-data[Date=="2/2/2007" | Date=="1/2/2007"]
#remove data from memory
rm(data)
#converting Date column values as Date
epc$Date<-as.Date(epc$Date,"%d/%m/%Y")
#converting Global_active_power column values as numeric
epc$Global_active_power<-as.numeric(epc$Global_active_power)
#set background color transparent
par("bg"="NA")
png("plot1.png")
with(epc,
{hist(Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")}
)
dev.off()



