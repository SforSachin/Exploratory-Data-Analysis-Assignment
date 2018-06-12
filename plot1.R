# Read the rds file
NEI <- readRDS("summarySCC_PM25.rds")
#look for few records
head(NEI)
#Group the recods based on year
TotalPM2.5<-aggregate(NEI$Emissions,by=list(year=NEI$year), FUN=sum,rm.na=TRUE)
#look for data
head(TotalPM2.5)
png(filename = "plot1.png")
#plot the chart
plot(TotalPM2.5$year,TotalPM2.5$x,pch = 3, cex = 2, col = "blue", main = "Total PM2.5 emission from all sources by Year", xlab = "Year",ylab="Total PM2.5 Emission")
dev.off()