load <- function()
{
  df<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?",stringsAsFactors = FALSE)
  df<-subset(df, Date=="1/2/2007" | Date=="2/2/2007")
  df
}

plot1 <- function(df)
{
  hist(df$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
}

plot1png <- function(df)
{
  png("plot1.png")
  plot1(df)
  dev.off()
}

plot1png(load())
