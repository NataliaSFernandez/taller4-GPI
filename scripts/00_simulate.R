# scripts/01_simulate.R
# Ejecuta la simulación y guarda el dataset en data/raw/

# La función de simulación se encuentra en src/00_simulate_data.R
#Comentario adicional para prueba de commit


# Carga librerías usadas en ejecución.
#CAMBIOS en analisis exploratorio. 

install.packages("dplyr")
library(dplyr)

source("src/00_simulate_data.R")

params <- list(
  n = 1200,
  seed = 123
)

raw_data <- simulate_vivienda_raw(n = params$n, seed = params$seed)
validate_vivienda_raw(raw_data)

# Guardar
write.csv(raw_data, "data/raw/vivienda_raw.csv", row.names = FALSE)

message("Dataset RAW generado en data/raw/vivienda_raw.csv")
