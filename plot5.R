library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
df <- tbl_df(NEI)
vehicle_ids <- grep("motor vehicle", SCC$Short.Name, ignore.case=TRUE)
vehicle_ids <- SCC[vehicle_ids, "SCC"]
vehicle_rows <- filter(df, SCC %in% vehicle_ids)
byYear <- group_by(vehicle_rows, year)
total <- summarize(byYear, Emissions = sum(Emissions))
png("plot5.png")
barplot(total$Emissions, names.arg=total$year,
        main="Total emissions per year from motor vehicles",
        xlab="Year", ylab="Emissions")
dev.off()