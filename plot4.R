# Read the rds file
NEI <- readRDS("summarySCC_PM25.rds")
SCC_Data <- readRDS("Source_Classification_Code.rds")
#look for few records
head(NEI)
#filter coal data
SCC_Data_Coal<-SCC_Data[grepl("Coal", SCC_Data$Short.Name), ]

#merge two data sets
NEI_SCC_Coal<-NEI[NEI$SCC %in% SCC_Data_Coal$SCC,]

#Group the data based on year

NEI_SCC_Coal_Year<-aggregate(NEI_SCC_Coal$Emissions,by=list(year=NEI_SCC_Coal$year), FUN=sum,rm.na=TRUE)

head(NEI_SCC_Coal_Year)

png(filename = "plot4.png")
#plot the chart
plot(NEI_SCC_Coal_Year$year,NEI_SCC_Coal_Year$x,pch = 3, cex = 2, col = "blue", main = "Coal Related Emissions of PM2.5 in US", xlab = "Year",ylab="Total PM2.5 Emission")
dev.off()