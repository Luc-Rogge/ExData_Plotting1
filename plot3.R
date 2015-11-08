load <- function()
{
  df<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?",stringsAsFactors = FALSE)
  df<-subset(df, Date=="1/2/2007" | Date=="2/2/2007")
  df$datetime<-strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
  df
}

plot3 <- function(df)
{
  plot(df$datetime, df$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
  lines(df$datetime,df$Sub_metering_1, col="black")
  lines(df$datetime,df$Sub_metering_2, col="red")
  lines(df$datetime,df$Sub_metering_3, col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black","red","blue"))
}

plot3png <- function(df)
{
  png("plot3.png")
  plot3(df)
  dev.off()
}

plot3png(load())
