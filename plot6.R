library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
df <- tbl_df(NEI)
counties <- filter(df, fips %in% c("24510", "06037"))
byYear <- group_by(counties, year, fips)
total <- summarize(byYear, Emissions = sum(Emissions))
total$fips <- factor(total$fips, levels=c("24510", "06037"),
                     labels=c("Baltimore City", "Los Angeles County"))
png("plot6.png")
ggplot(total, aes(x=year, y=Emissions)) +
    geom_bar(stat = "identity") + 
    facet_grid(.~fips) + 
    ggtitle("Total emissions per year by county")
dev.off()