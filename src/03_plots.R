# Funciones de visualización

add_predictions <- function(data_clean, modelo) {
  data_clean$precio_predicho <- as.numeric(predict(modelo, newdata = data_clean))
  data_clean
}

plot_precio_vs_m2 <- function(df) {
  plot(
    df$m2,
    df$precio,
    pch = 19,
    col = "darkblue",
    xlab = "Área vivienda (m2)",
    ylab = "Precio vivienda (millones COP $)",
    main = "Precio vivienda vs Área"
  )

  abline(lm(precio ~ m2, data = df), col = "black", lwd = 2)

  legend(
    "topleft",
    legend = c("Observaciones", "Tendencia"),
    col = c("darkblue", "red"),
    pch = c(19, NA),
    lwd = c(NA, 2),
    bty = "n"
  )
}

plot_predicho_vs_real <- function(df) {
  if (!"precio_predicho" %in% names(df)) {
    stop("La columna 'precio_predicho' no existe. Ejecute add_predictions() primero.")
  }

  plot(
    df$precio,
    df$precio_predicho,
    pch = 19,
    col = "darkgreen",
    xlab = "Precio real (millones COP)",
    ylab = "Precio predicho (millones COP)",
    main = "Precio real vs Precio predicho"
  )

  abline(a = 0, b = 1, col = "red", lwd = 2)

  legend(
    "topleft",
    legend = c("Predicción", "Línea perfecta"),
    col = c("darkgreen", "red"),
    pch = c(19, NA),
    lwd = c(NA, 2),
    bty = "n"
  )
}
