#######ExData_Plotting1###########################################################################
#######Download & Unzip Data######################################################################
#######Clean & Tidy Data##########################################################################
#######Make Plots out of Clean Data###############################################################

################ Unzip data file #################################################################  

unzip("./data/exdata-data-household_power_consumption.zip", exdir = "./data")

#################Fast Read data into file dt######################################################
File_Size_MB <- round(file.info("./data/household_power_consumption.txt")$size/1024^2)

data <- fread("./data/household_power_consumption.txt", header = TRUE, na.strings= "?", stringsAsFactors = FALSE)

####Convert data - Date column to Date format & Time column to Time format from character format###
##Convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions.##
########Convert all numeric varaibles having character values to numeric###########################

data$Date <- as.Date(data$Date,"%d/%m/%Y")

data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage  <- as.numeric(data$Voltage)
data$Global_intensity  <- as.numeric(data$Global_intensity)
data$Sub_metering_1  <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2  <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3  <- as.numeric(data$Sub_metering_3)

############ Subset the data from the dates 2007-02-01 and 2007-02-02###############################

data1 <- subset(data,Date >= "2007-02-01" & Date <= "2007-02-02")

####################################################################################################
####### Start png device driver to save output to file.png##########################################
#######Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels##########

png(file = "./data/Plot1.png", width = 480, height = 480)
with(data1, hist(Global_active_power,col = "Red", main ="Global Active Power",xlab="Global Active Power(kilowatts)"))

######### Turn off device driver#####################################################################
dev.off()
#####################################################################################################




