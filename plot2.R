# Function to load the data frame
load <- function()
{
  # Read the file
  df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", stringsAsFactors=FALSE)
  
  # Filter by 2 dates
  df <- subset(df, Date=="1/2/2007" | Date=="2/2/2007")
  
  # Parse the date and time
  df$datetime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
  
  # Return the adapted data frame
  df
}

# Plot function, independent from the device
plot2 <- function(df)
{
  plot(df$datetime, df$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
  lines(df$datetime, df$Global_active_power)
}

# Plot to the png file
plot2png <- function(df)
{
  png("plot2.png")
  plot2(df)
  dev.off()
}

# Bring it all together: load and plot to the png file
plot2png(load())
