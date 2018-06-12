# Read the rds file
NEI <- readRDS("summarySCC_PM25.rds")
#look for few records
head(NEI)
Baltimore_LA_Car_Data<-subset(NEI,(NEI$fips == "24510" | NEI$fips == "06037") & NEI$type =="ON-ROAD")
head(Baltimore_LA_Car_Data)
#Group the recods based on year
Baltimore_LA_Car_PM2.5<-aggregate(Baltimore_LA_Car_Data$Emissions,by=list(city=Baltimore_LA_Car_Data$fips,year=Baltimore_LA_Car_Data$year), FUN=sum,rm.na=TRUE)
#look for data
head(Baltimore_LA_Car_PM2.5)
library(ggplot2)

png(filename = "plot6.png")
#plot the chart

qplot(year,x,data=Baltimore_LA_Car_PM2.5,color=city,geom = "line") +
  ggtitle("Emissions of PM2.5 in Baltimore City(24510) and LA(06037) County By type") +
  xlab("year") + 
  ylab("Total PM2.5 Emission") 
dev.off()