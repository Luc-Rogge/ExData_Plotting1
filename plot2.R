load <- function()
{
  df<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?",stringsAsFactors = FALSE)
  df<-subset(df, Date=="1/2/2007" | Date=="2/2/2007")
  df$datetime<-strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
  df
}

plot2 <- function(df)
{
  plot(df$datetime, df$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
  lines(df$datetime, df$Global_active_power)
}

plot2png <- function(df)
{
  png("plot2.png")
  plot2(df)
  dev.off()
}

plot2png(load())
