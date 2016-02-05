#Load dadta if required variable doesn't exist
if(!exists("subData"))
{
    source("loadData.R")
}
sub_metering_1<-as.numeric(subData$Sub_metering_1)
sub_metering_2<-as.numeric(subData$Sub_metering_2)
sub_metering_3<-as.numeric(subData$Sub_metering_3)

#Open plotting device and start plotting over that
png("plot3.png",width = 480,height = 480)

with(subData,
     plot(Time,sub_metering_1,
          xlab = "",
          ylab="Energy sub metering",
          type="l")
)
lines(subData$Time,sub_metering_2,type="l",col="red")
lines(subData$Time,sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1)
#Close graphics device, png
dev.off()