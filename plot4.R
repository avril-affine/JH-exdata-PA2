library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
df <- tbl_df(NEI)
coal_ids <- grep("Coal", SCC$EI.Sector)
coal_ids <- SCC[coal_ids, "SCC"]
coal_rows <- filter(NEI, SCC %in% coal_ids)
byYear <- group_by(coal_rows, year)
total <- summarize(byYear, Emissions = sum(Emissions))
png("plot4.png")
barplot(total$Emissions, names.arg=total$year,
        main="Total emissions per year for coal combustion",
        xlab="Year", ylab="Emissions")
dev.off()