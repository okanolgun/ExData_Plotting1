# plot4.R - 4 Grafik Tek Görsel

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
png("plot4.png", width = 480, height = 480)

# 2x2 grafik düzeni oluştur
par(mfrow = c(2,2))

# 1. Grafik: Global Active Power
plot(filtered
     