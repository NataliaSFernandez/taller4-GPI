data <- read.csv("data/processed/vivienda_clean.csv", stringsAsFactors = FALSE)
# Ver estructura
str(data)

summary(data[, c("m", "habitaciones", "estrato", "antiguedad", "precio")])

descriptivas <- data.frame(
  variable = c("m2", "habitaciones", "estrato", "antiguedad", "precio"),
  media = sapply(data[, -1], mean),
  mediana = sapply(data[, -1], median),
  sd = sapply(data[, -1], sd),
  min = sapply(data[, -1], min),
  max = sapply(data[, -1], max)
)

descriptivas