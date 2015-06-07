plot4 <- function(file){
  #Creates the dataset and charges its values
  dataSet<-read.table(file = file,header = TRUE,sep = ";",colClasses = c("character","character","character","character","character","character","character","character","character"))
  dataSet <- dataSet[dataSet$Date %in% c("1/2/2007","2/2/2007"),]
  
  #Converts the date and time variables in a date format for R
  time <- strptime(paste(dataSet$Date,dataSet$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
  
  #Open a PNG device and creates plot1.png in working directory
  png(filename = "plot4.png",width = 480,height = 480)
  
  #Creates the multiple plot 
  par(mfrow = c(2,2))
  
  with(dataSet,{
      plot(x = time, y = as.numeric(Global_active_power), type = "l",ylab = "Global Active Power", xlab = "")
      plot(x = time, y = as.numeric(Voltage), type = "l", ylab = "Voltage", xlab = "datetime")
      plot(x = time, y = as.numeric(Sub_metering_1),type = "l",ylab = "Energy sub metering",xlab = "")
      lines(x = time,y = as.numeric(Sub_metering_2), type = "l", col = "red")
      lines(x = time, y = as.numeric(Sub_metering_3), type = "l", col = "blue")
      legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1, lwd = 2, box.lwd = 0)
      plot(x = time, y = as.numeric(Global_reactive_power), type = "l", ylab = "Global_reactive_power", xlab = "datetime")
  })
  
  #Closes the device
  dev.off()
}