# plot1.R - Histogram (Global Active Power)

# Veriyi yükle
data <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep = ";", na.strings = "?", 
                   stringsAsFactors = FALSE)

# Tarih formatını dönüştür
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# 2007-02-01 ve 2007-02-02 tarihlerini filtrele
filtered_data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# PNG cihazını aç
png("plot1.png", width = 480, height = 480)

# Histogramı çiz
hist(filtered_data$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency")

# PNG cihazını kapat
dev.off()
