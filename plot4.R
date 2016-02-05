#Load dadta if required variable doesn't exist
if(!exists("subData"))
{
    source("loadData.R")
}
#Workings
sub_metering_1<-as.numeric(subData$Sub_metering_1)
sub_metering_2<-as.numeric(subData$Sub_metering_2)
sub_metering_3<-as.numeric(subData$Sub_metering_3)


#Open plotting device and start plotting over that
png("plot4.png",width = 480,height = 480)

#Specify area for 4 plots
par(mfrow=c(2,2))

#1st Plot
with(subData,plot(Time,Global_active_power,ylab="Global Active Power",type="l",xlab=""))
#Endof 1st plot

#2ndplot
with(subData,plot(Time,Voltage,type="l",xlab="datetime",ylab="Voltage"))
#Endof 2nd plot

#3rd Plot
with(subData,
     plot(Time,sub_metering_1,
          xlab = "",
          ylab="Energy sub metering",
          type="l")
)
lines(subData$Time,sub_metering_2,type="l",col="red")
lines(subData$Time,sub_metering_3,type="l",col="blue")
legend("topright",bty = "n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1)
#End of 3rd Plot

#4th plot
with(subData,plot(Time,Global_reactive_power,xlab="datetime",type="l"))
#endof 4th plot

#Close graphics device, png
dev.off()