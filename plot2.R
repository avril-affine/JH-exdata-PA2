library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
df <- tbl_df(NEI)
baltimore <- filter(df, fips == "24510")
byYear <- group_by(baltimore, year)
total <- summarize(byYear, Emissions = sum(Emissions))
png("plot2.png")
barplot(total$Emissions, names.arg=total$year,
        main="Total emissions per year for Baltimore City",
        xlab="Year", ylab="Emissions")
dev.off()