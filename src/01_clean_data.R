# src/process_vivienda.R
# Funciones de limpieza y procesamiento (NO I/O)

clean_vivienda_data <- function(raw_data) {

  # m2: quitar unidades y convertir a numérico
  raw_data$m2 <- gsub(" m2", "", raw_data$m2)
  raw_data$m2 <- as.numeric(raw_data$m2)

  # precio: quitar símbolos y texto
  raw_data$precio <- gsub("\\$", "", raw_data$precio)
  raw_data$precio <- gsub(" millones", "", raw_data$precio)
  raw_data$precio <- as.numeric(raw_data$precio)

  # eliminar observaciones incompletas
  data_clean <- raw_data[complete.cases(
    raw_data$m2,
    raw_data$precio,
    raw_data$estrato
  ), ]

  return(data_clean)
}


validate_vivienda_clean <- function(df) {
  if (any(is.na(df$m2))) stop("m2 contiene NA después de limpieza")
  if (any(is.na(df$precio))) stop("precio contiene NA después de limpieza")
  if (any(df$m2 <= 0)) stop("m2 contiene valores no positivos")
  if (any(df$precio <= 0)) stop("precio contiene valores no positivos")

  invisible(TRUE)
}
