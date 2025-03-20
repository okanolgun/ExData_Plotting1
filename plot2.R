# plot2.R - Zaman Serisi (Global Active Power)

# Veriyi yükle
data <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep = ";", na.strings = "?", 
                   stringsAsFactors = FALSE)

# Tarih formatını dönüştür
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# 2007-02-01 ve 2007-02-02 tarihlerini filtrele
filtered_data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# Tarih ve saatleri birleştir
filtered_data$Datetime <- strptime(paste(filtered_data$Date, filtered_data$Time), 
                                   format = "%Y-%m-%d %H:%M:%S")

# PNG cihazını aç
png("plot2.png", width = 480, height = 480)

# Zaman serisi grafiği çiz
plot(filtered_data$Datetime, filtered_data$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")

# PNG cihazını kapat
dev.off()
