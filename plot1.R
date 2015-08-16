library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
df <- tbl_df(NEI)
byYear <- group_by(df, year)
total <- summarize(byYear, Emissions = sum(Emissions))
png("plot1.png")
barplot(total$Emissions, names.arg=total$year,
        main="Total emissions per year",
        xlab="Year", ylab="Emissions")
dev.off()