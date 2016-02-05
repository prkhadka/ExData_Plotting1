#Author: Yauvaraj Rimal
#Web : http://www.yuvraj.com.np
#Github: http://www.github.com/yrimal
#To profile, un comment the code below and one at last
#ptm<-proc.time()
fileName="household_power_consumption.txt";
if(!file.exists(fileName))
{
    if(file.exists("exdata-data-household_power_consumption.zip"))
    {
        unzip("exdata-data-household_power_consumption.zip")
    }
}
#Because colClasses makes reading first, first identify the column classes
colulmnClass<-sapply(read.csv(fileName,sep=";",na.strings="?",header=TRUE,nrow=5), class)
#Provide colClasses when reading entire data set
houseHold<-read.table(fileName,sep=";",na.strings = "?",header = TRUE,colClasses = colulmnClass)

subData<-houseHold[(houseHold$Date=="1/2/2007" | houseHold$Date=="2/2/2007"),]
#remove the large data set from memory
rm(houseHold)
rm(colulmnClass)
#Convert to date time and date
subData$Date <- as.Date(subData$Date,format="%d/%m/%Y")
subData$Time<-strptime(paste(subData$Date,subData$Time),format="%Y-%m-%d %H:%M:%S")

#print(proc.time() -ptm)
