# scripts/02_process.R
# Lee datos RAW, los procesa y guarda datos PROCESSED
#01_CLEAN_DATA.R contiene la función clean_vivienda_data() que hace el procesamiento
source("src/01_clean_data.R")

# Leer datos raw
raw_data <- read.csv(
  "data/raw/vivienda_raw.csv",
  stringsAsFactors = FALSE
)

cat("Observaciones cargadas:", nrow(raw_data), "\n")

# Procesamiento
data_clean <- clean_vivienda_data(raw_data)

cat("Datos limpiados:", nrow(data_clean), "\n")

validate_vivienda_clean(data_clean)

# Asegurar carpeta destino
dir.create("data/processed", recursive = TRUE, showWarnings = FALSE)

# Guardar datos procesados
write.csv(
  data_clean,
  "data/processed/vivienda_clean.csv",
  row.names = FALSE
)

message("Datos procesados guardados en data/processed/vivienda_clean.csv")
