#Modelo estadistico para predecir el precio de una vivienda en función de sus características

fit_vivienda_model <- function(data_clean) {
  modelo <- lm(precio ~ m2 + estrato + antiguedad, data = data_clean)
  return(modelo)
}

extract_model_table <- function(modelo) {
  summary_modelo <- summary(modelo)

  tabla_modelo <- data.frame(
    Variable = rownames(summary_modelo$coefficients),
    Coeficiente = summary_modelo$coefficients[, 1],
    Error_Estandar = summary_modelo$coefficients[, 2],
    Estadistico_t = summary_modelo$coefficients[, 3],
    P_value = summary_modelo$coefficients[, 4],
    row.names = NULL
  )

  return(tabla_modelo)
}