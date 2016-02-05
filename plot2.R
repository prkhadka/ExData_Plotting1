#Load dadta if required variable doesn't exist

if(!exists("subData"))
{
    source("loadData.R")
}
png("plot2.png",height = 480, width = 480)
with(subData,plot(
    subData$Time,subData$Global_active_power,
    xlab = "",ylab="Global Active Power (kilowatts)",
    type="l")
    
)
dev.off()