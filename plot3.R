# plot3.R - Sub Metering Grafiği

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
png("plot3.png", width = 480, height = 480)

# Sub_metering_1 grafiği çiz
plot(filtered_data$Datetime, filtered_data$Sub_metering_1, 
     type = "l", col = "black", 
     xlab = "", ylab = "Energy sub metering")

# Sub_metering_2 ve Sub_metering_3 ekle
lines(filtered_data$Datetime, filtered_data$Sub_metering_2, col = "red")
lines(filtered_data$Datetime, filtered_data$Sub_metering_3, col = "blue")

# Açıklama ekleyelim
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = 1)

# PNG cihazını kapat
dev.off()
