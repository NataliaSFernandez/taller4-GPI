# scripts/02_model.R 
# src 02_model_vivienda.R
# Ajusta modelo y exporta tabla de resultados

source("src/02_model_vivienda.R")

# Leer datos procesados
data_clean <- read.csv(
  "data/processed/vivienda_clean.csv",
  stringsAsFactors = FALSE
)

# Ajustar modelo
modelo <- fit_vivienda_model(data_clean)

# Mostrar resumen en consola (opcional, útil para debug)
print(summary(modelo))

# Extraer tabla de coeficientes
tabla_modelo <- extract_model_table(modelo)

# Asegurar carpeta destino
dir.create("results/tables", recursive = TRUE, showWarnings = FALSE)

# Guardar resultados
write.csv(
  tabla_modelo,
  "results/tables/tabla_modelo.csv",
  row.names = FALSE
)

message("Tabla del modelo guardada en results/tables/tabla_modelo.csv")
