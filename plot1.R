library(datasets)
plot1 <- function(file){
  #Creates the dataset and charges its values
  dataSet<-read.table(file = file,header = TRUE,sep = ";",colClasses = c("character","character","character","character","character","character","character","character","character"))
  dataSet <- dataSet[dataSet$Date %in% c("1/2/2007","2/2/2007"),]
  
  #Open a PNG device and creates plot1.png in working directory
  png(filename = "plot1.png",width = 480,height = 480)
  
  #Creates the histogram 
  hist(as.numeric(dataSet$Global_active_power), col = "red", main = "Global active Power", xlab = "Global active Power (kilowatts)")
  
  #Closes the device
  dev.off()
}