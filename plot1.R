# plot1.R #
# R script for outputing the plot1 figure to both screen and png file"plot1.png"


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


################### STEP 2 : Make the figure plot1 to screen ########################

hist(nv3, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")



################### STEP 3 : Make the figure plot1 to png file "plot1.png" (480x480) #######################

png(filename = "plot1.png", width = 480, height = 480)

hist(nv3,xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

dev.off()


