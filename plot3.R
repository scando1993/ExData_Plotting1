plot3 <- function(file){
  #Creates the dataset and charges its values
  dataSet <- read.table(file = file,header = TRUE,sep = ";",colClasses = c("character","character","character","character","character","character","character","character","character"))
  dataSet <- dataSet[dataSet$Date %in% c("1/2/2007","2/2/2007"),]
  
  #Converts the date and time variables in a date format for R
  time <- strptime(paste(dataSet$Date,dataSet$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
  
  #Open a PNG device and creates plot1.png in working directory
  png(filename = "plot3.png",width = 480,height = 480)
  
  #Creates the plot
  with(data = dataSet,plot(x = time, y = as.numeric(Sub_metering_1),type = "l",ylab = "Energy sub metering",xlab = ""))
  with(dataSet, lines(x = time, y = Sub_metering_2, type = "l",col = "red"))
  with(dataSet, lines(x = time, y = Sub_metering_3, type = "l",col = "blue"))
  legend("topright",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1, lwd = 2)
  
  #Closes the device
  dev.off()
}