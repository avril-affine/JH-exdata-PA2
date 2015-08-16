library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
df <- tbl_df(NEI)
baltimore <- filter(df, fips == "24510")
byTypeYear <- group_by(baltimore, type, year)
total <- summarize(byTypeYear, Emissions = sum(Emissions))
png("plot3.png")
ggplot(total, aes(x=year, y=Emissions)) +
    geom_bar(stat="identity") +
    facet_wrap(~type, ncol=2) +
    ggtitle("Total emissions for Batimore City by type")
dev.off()