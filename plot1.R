# Function to load the data frame
load <- function()
{
  # Read the file
  df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", stringsAsFactors=FALSE)

  # Filter by 2 dates
  df <- subset(df, Date=="1/2/2007" | Date=="2/2/2007")
  
  # Return the adapted data frame
  df
}

# Plot function, independent from the device
plot1 <- function(df)
{
  hist(df$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
}

# Plot to the png file
plot1png <- function(df)
{
  png("plot1.png")
  plot1(df)
  dev.off()
}

# Bring it all together: load and plot to the png file
plot1png(load())
