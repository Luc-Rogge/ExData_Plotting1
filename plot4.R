load <- function()
{
  df<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?",stringsAsFactors = FALSE)
  df<-subset(df, Date=="1/2/2007" | Date=="2/2/2007")
  df$datetime<-strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
  df
}

plot2 <- function(df)
{
  plot(df$datetime, df$Global_active_power, type="n", xlab="", ylab="Global Active Power")
  lines(df$datetime, df$Global_active_power)
}

plot3 <- function(df)
{
  plot(df$datetime, df$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
  lines(df$datetime,df$Sub_metering_1, col="black")
  lines(df$datetime,df$Sub_metering_2, col="red")
  lines(df$datetime,df$Sub_metering_3, col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black","red","blue"), bty="n")
}

plot4a <- function(df)
{
  plot(df$datetime, df$Voltage, type="n", ylab="Voltage", xlab="datetime")
  lines(df$datetime,df$Voltage)
}

plot4b <- function(df)
{
  plot(df$datetime, df$Global_reactive_power, type="n", ylab="Global_reactive_power", xlab="datetime")
  lines(df$datetime,df$Global_reactive_power)
}

plot4 <- function(df)
{
  par(mfrow=c(2,2))
  plot2(df)
  plot4a(df)
  plot3(df)
  plot4b(df)
}

plot4png <- function(df)
{
  png("plot4.png")
  plot4(df)
  dev.off()
}

plot4png(load())
