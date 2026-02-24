
# Funciones reutilizables (NO escribir archivos aquí)

simulate_vivienda_raw <- function(n = 1200, seed = 123) {
  stopifnot(n > 10)

  set.seed(seed)

  id <- sprintf("V%04d", 1:n)

  m2_true <- round(runif(n, 25, 220), 1)  # área (m²)
  habitaciones <- pmax(1, pmin(6, round(m2_true / 35 + rnorm(n, 0, 0.7))))
  estrato <- sample(2:6, n, replace = TRUE, prob = c(0.18, 0.25, 0.26, 0.19, 0.12))
  antiguedad <- pmax(0, round(rlnorm(n, meanlog = log(12), sdlog = 0.6)))  # años

  precio_true <- round(
    4.5 * m2_true +        # efecto principal m2
      15 * estrato -       # efecto estrato
      0.8 * antiguedad +   # depreciación por antigüedad
      rnorm(n, 0, 30),     # ruido
    1
  )
  precio_true <- pmax(precio_true, 70) # Evitar precios negativos

  # m2 como texto con unidades
  m2_raw <- as.character(m2_true)
  idx_m2_txt <- sample(1:n, size = round(0.3 * n))
  m2_raw[idx_m2_txt] <- paste0(m2_raw[idx_m2_txt], " m2")

  # NA en m2
  idx_m2_na <- sample(1:n, size = round(0.03 * n))
  m2_raw[idx_m2_na] <- NA

  # precio como texto con $
  precio_raw <- as.character(precio_true)
  idx_price_txt <- sample(1:n, size = round(0.6 * n))
  precio_raw[idx_price_txt] <- paste0("$", precio_raw[idx_price_txt], " millones")

  # algunos NA en precio
  idx_price_na <- sample(1:n, size = round(0.02 * n))
  precio_raw[idx_price_na] <- NA

  raw_data <- data.frame(
    id = id,
    m2 = m2_raw,
    habitaciones = habitaciones,
    estrato = estrato,
    antiguedad = antiguedad,
    precio = precio_raw,
    stringsAsFactors = FALSE
  )

  return(raw_data)
}

validate_vivienda_raw <- function(df) {
  required <- c("id", "m2", "habitaciones", "estrato", "antiguedad", "precio")
  missing <- setdiff(required, names(df))
  if (length(missing) > 0) stop("Faltan columnas requeridas: ", paste(missing, collapse = ", "))

  invisible(TRUE)
}
