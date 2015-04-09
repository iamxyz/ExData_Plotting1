# plot3.R #
# R script for outputing the plot3 figure to both screen and png file"plot3.png"


################### STEP 1 : Make the data ready for making the figures ########################

#set the local coding for correct output in OS with different language set.

Sys.setlocale("LC_TIME", "en_US.UTF-8") 

# raw text file -> mytable

mytable <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?",stringsAsFactors = FALSE)

# mytable -> remove the first col names row -> mytable1

mytable1 <- mytable[c(2:2075260), ]

# mytable1 -> selected the data with required date "1/2/2007" and  "2/2/2007" -> mytable2

mytable2 <- mytable1[mytable1$V1 == "1/2/2007" | mytable1$V1 == "2/2/2007",]

# mytable2 -> convert date and time to R type,convert other data to numeric type -> mytable3

datetimestr <- paste(mytable2$V1, mytable2$V2)

datetime <- strptime(datetimestr, "%d/%m/%Y %H:%M:%S")

nv3 <- as.numeric(mytable2$V3)

nv4 <- as.numeric(mytable2$V4)
nv5 <- as.numeric(mytable2$V5)
nv6 <- as.numeric(mytable2$V6)
nv7 <- as.numeric(mytable2$V7)
nv8 <- as.numeric(mytable2$V8)
nv9 <- as.numeric(mytable2$V9)

mytable3 <- data.frame(datetime, nv3, nv4, nv5, nv6, nv7, nv8, nv9)

# The cols in table3 goes below
#datetime: POSIXlt "datetime"
#nv3: num "Global_active_power" 
#nv4: num "Global_reactive_power" 
#nv5: num "Voltage" 
#nv6: num "Global_intensity" 
#nv7: num "Sub_metering_1" 
#nv8: num "Sub_metering_2" 
#nv9: num "Sub_metering_3" 


################### STEP 2 : Make the figure plot3 to screen ########################


with(mytable3, plot(datetime, nv7, type = "n",xlab="",ylab="Energy sub metering"))
with(mytable3, points(datetime, nv7, type = "l",col="black"))
with(mytable3, points(datetime, nv8, type = "l",col="red"))
with(mytable3, points(datetime, nv9, type = "l",col="blue"))
legend("topright", pch = "_", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))




################### STEP 3 : Make the figure plot3 to png file "plot3.png" (480x480) #######################

png(filename = "plot3.png", width = 480, height = 480)

with(mytable3, plot(datetime, nv7, type = "n",xlab="",ylab="Energy sub metering"))
with(mytable3, points(datetime, nv7, type = "l",col="black"))
with(mytable3, points(datetime, nv8, type = "l",col="red"))
with(mytable3, points(datetime, nv9, type = "l",col="blue"))
legend("topright", pch = "_", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
