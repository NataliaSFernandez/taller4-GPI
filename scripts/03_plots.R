# Lee datos procesados, ajusta modelo, predice y guarda figuras

source("src/02_model_vivienda.R")   
source("src/03_plots.R")

# Leer datos procesados
data_clean <- read.csv("data/processed/vivienda_clean.csv", stringsAsFactors = FALSE)

# Re-estimar modelo (reutilizando tu función)
modelo <- fit_vivienda_model(data_clean)

# Predicciones
data_clean <- add_predictions(data_clean, modelo)

# Asegurar carpeta de figuras
dir.create("results/figures", recursive = TRUE, showWarnings = FALSE)

# Gráfico 1: Precio vs m2
png("results/figures/grafico_precio_vs_m2_modelo.png", width = 800, height = 600)
plot_precio_vs_m2(data_clean)
dev.off()
message("Gráfico precio vs m2 guardado")

# Gráfico 2: Predicho vs real
png("results/figures/grafico_predicho_vs_real.png", width = 800, height = 600)
plot_predicho_vs_real(data_clean)
dev.off()
message("Gráfico predicho vs real guardado")
