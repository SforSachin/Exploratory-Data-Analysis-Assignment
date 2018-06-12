# Read the rds file
NEI <- readRDS("summarySCC_PM25.rds")
#look for few records
head(NEI)
Baltimore_Data<-subset(NEI,NEI$fips == "24510")
head(Baltimore_Data)
#Group the recods based on year
Baltimore_PM2.5<-aggregate(Baltimore_Data$Emissions,by=list(year=Baltimore_Data$year), FUN=sum,rm.na=TRUE)
#look for data
head(Baltimore_PM2.5)
png(filename = "plot2.png")
#plot the chart
plot(Baltimore_PM2.5$year,Baltimore_PM2.5$x,pch = 3, cex = 2, col = "blue", main = "Baltimore PM2.5 emission from all sources by Year", xlab = "Year",ylab="Baltimore PM2.5 Emission")
dev.off()