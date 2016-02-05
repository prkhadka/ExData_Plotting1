#Load dadta if required variable doesn't exist

if(!exists("subData"))
{
    source("loadData.R")
}
locale_original <- Sys.getlocale( category = "LC_TIME" )
Sys.setlocale("LC_TIME", "English")

#Open plotting device
png("plot1.png",width = 480,height = 480)
#Draw a plot
with(subData, hist(Global_active_power, col="red", 
                         breaks=15,
                         xlab="Global Active Power (kilowatts)",
                         main="Global Active Power",
                         ylim=c(0,1200)))

dev.off()

Sys.setlocale("LC_TIME",locale_original)