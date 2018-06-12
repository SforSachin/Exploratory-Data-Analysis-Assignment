# Read the rds file
NEI <- readRDS("summarySCC_PM25.rds")
#look for few records
head(NEI)
Baltimore_Data<-subset(NEI,NEI$fips == "24510")
head(Baltimore_Data)
#Group the recods based on year
Baltimore_Type_PM2.5<-aggregate(Baltimore_Data$Emissions,by=list(type=Baltimore_Data$type,year=Baltimore_Data$year), FUN=sum,rm.na=TRUE)
#look for data
head(Baltimore_Type_PM2.5)
library(ggplot2)
png(filename = "plot3.png")
#plot the chart
qplot(year,x,data=Baltimore_Type_PM2.5,color=type,geom = "line") +
ggtitle("Total Emissions of PM2.5 in Baltimore City By type") +
xlab("year") + 
ylab("Batlimore PM2.5 Emission") 
dev.off()