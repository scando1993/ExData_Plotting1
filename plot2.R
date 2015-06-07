plot2 <- function(file){
  #Creates the dataset and charges its values
  dataSet<-read.table(file = file,header = TRUE,sep = ";",colClasses = c("character"),dec = ".")
  dataSet <- dataSet[dataSet$Date %in% c("1/2/2007","2/2/2007"),]
  
  time <- strptime(paste(dataSet$Date, dataSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  
  #Open a PNG device and creates plot1.png in working directory
  png(filename = "plot2.png",width = 480,height = 480)
  
  #Creates the plot 
  plot(time, as.numeric(dataSet$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  #Closes the device
  dev.off()
}